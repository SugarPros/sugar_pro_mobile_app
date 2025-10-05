import 'package:sugar_pros/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ChangeEmailViewModel extends IndexTrackingViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();

  PatAuthResponse? get patient => _authService.patAuthResponse;

  final PageController pageController = PageController();
  int activeIndex = 0;

  TextEditingController otpCtrl = TextEditingController();
  TextEditingController currentPasswordCtrl = TextEditingController();
  TextEditingController newEmailCtrl = TextEditingController();

  bool _obscureCurrentPassword = true;
  bool get obscureCurrentPassword => _obscureCurrentPassword;
  set obscureCurrentPassword(bool val) {
    _obscureCurrentPassword = val;
    notifyListeners();
  }

  Future sendOtp(VoidCallback onComplete) async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.sendEmailOtp(patient?.patUser?.email);

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _dialogService.completeDialog(DialogResponse());
        onComplete();
      },
    );
  }

  Future confirmOtp() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.confirmEmailOtp(
      email: patient?.patUser?.email,
      otp: otpCtrl.text,
    );

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _dialogService.completeDialog(DialogResponse());
        forward();
      },
    );
  }

  Future changeEmail() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.changeEmail(
      email: patient?.patUser?.email,
      newEmail: newEmailCtrl.text,
      currentPassword: currentPasswordCtrl.text
    );

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _dialogService.completeDialog(DialogResponse());
        _navigationService.clearStackAndShow(Routes.patientLogin);
        flusher('Email changed succesfully', color: Colors.green);
      },
    );
  }

  void forward() {
    pageController.nextPage(duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
  }

  void backward() {
    pageController.previousPage(duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
  }

  void jumpTo(int val) {
    pageController.jumpToPage(val);
  }
}
