import 'package:image_picker/image_picker.dart';
import 'package:sugar_pros/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/models/patient_account_response.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ProfileViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final DialogService _dialogService = locator<DialogService>();
  final UtilityService _utilityService = locator<UtilityService>();

  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();

  PatientAccountResponse? get patAccountDetails => _authService.patAccountDetails;

  PatAuthResponse? get patient => _authService.patAuthResponse;

  File? _imageFile;
  File? get imageFile => _imageFile;
  set imageFile(File? val) {
    _imageFile = val;
    notifyListeners();
  }

  final ImagePicker _picker = ImagePicker();

  Future getPatientAccount() async {
    final data = await _authRemoteDataSource.getPatientAccount();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _authService.patAccountDetails = r;
        _authService.accountDetail = r.accountDetails;
        notifyListeners();
      },
    );
  }

  Future uploadImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      imageFile = file;
    }
    await updateProfilePic();
  }

  Future updateProfilePic() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    if (imageFile == null) {
      _dialogService.completeDialog(DialogResponse());
      return;
    }

    final data = await _authRemoteDataSource.uploadProfilePic(imageFile?.path);

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        await Future.wait([getPatientAccount()]);
        _dialogService.completeDialog(DialogResponse());
        flusher('Profile picture updated successfully', color: Colors.green);
      },
    );
  }

  Future deleteAccount() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.deleteAccount();

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _dialogService.completeDialog(DialogResponse());
        _navigationService.clearStackAndShow(Routes.patientLogin);
      },
    );
  }

  void logout() {
    _utilityService.setSignedIn(false);
    _navigationService.clearStackAndShow(Routes.patientLogin);
  }

  void navigateToAccount() {
    _navigationService.navigateTo(Routes.patientAccountDetails);
  }

  void navigateToSettings() {
    _navigationService.navigateTo(Routes.patientSettings);
  }

  void navigateToNotifications() {
    _navigationService.navigateTo(Routes.notifcations);
  }

  List<ListenableServiceMixin> get listenableServices => [_authService];
}
