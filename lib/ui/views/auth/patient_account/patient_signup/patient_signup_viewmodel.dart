import 'package:sugar_pros/core/utils/exports.dart';

class PatientSignupViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final PageController pageController = PageController();
  int activeIndex = 0;

  TextEditingController otpCtrl = TextEditingController();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController mobileNumberCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();

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

  String? _otp;
  String? get otp => _otp;
  set otp(String? val) {
    _otp = val;
    notifyListeners();
  }

  bool isAgree = false;
  void toggleAggrement() {
    isAgree = !isAgree;
    notifyListeners();
  }

  void navigateToBasicDetails() {
    _navigationService.navigateTo(Routes.basicDetails);
  }

  void navigateToPatientLogin() {
    _navigationService.navigateTo(Routes.patientLogin);
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
