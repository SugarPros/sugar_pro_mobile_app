import 'package:sugar_pros/core/utils/exports.dart';

class PatientAccountViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final PageController pageController = PageController();
  int activeIndex = 0;

  String? _otp;
  String? get otp => _otp;
  set otp(String? val) {
    _otp = val;
    notifyListeners();
  }

  void navigateToFormsAgreement() {
    _navigationService.navigateTo(Routes.formsAgreement);
  }

  void forward() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }

  void backward() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  void jumpTo(int val) {
    pageController.jumpToPage(val);
  }
}
