import 'package:sugar_pros/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ChangePasswordViewModel extends IndexTrackingViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();

  PatAuthResponse? get patient => _authService.patAuthResponse;

  final PageController pageController = PageController();
  int activeIndex = 0;

  TextEditingController otpCtrl = TextEditingController();
  TextEditingController currentPasswordCtrl = TextEditingController();
  TextEditingController newPasswordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();

  bool _obscureCurrentPassword = true;
  bool get obscureCurrentPassword => _obscureCurrentPassword;
  set obscureCurrentPassword(bool val) {
    _obscureCurrentPassword = val;
    notifyListeners();
  }

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;
  set obscurePassword(bool val) {
    _obscurePassword = val;
    notifyListeners();
  }

  bool _obscureConfirmPassword = true;
  bool get obscureConfirmPassword => _obscureConfirmPassword;
  set obscureConfirmPassword(bool val) {
    _obscureConfirmPassword = val;
    notifyListeners();
  }

  Future sendOtp(VoidCallback onComplete) async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.sendOtp(patient?.patUser?.email);

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

    final data = await _authRemoteDataSource.confirmOtp(
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

  Future changePassword() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.changePassword(
      email: patient?.patUser?.email,
      currentPassword: currentPasswordCtrl.text,
      newPassword: newPasswordCtrl.text,
    );

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _dialogService.completeDialog(DialogResponse());
        _navigationService.clearStackAndShow(Routes.patientLogin);
        flusher('Password changed succesfully', color: Colors.green);
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
