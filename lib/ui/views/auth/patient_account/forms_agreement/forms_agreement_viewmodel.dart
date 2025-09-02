import 'package:sugar_pros/core/utils/exports.dart';

class FormsAgreementViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PageController pageController = PageController();
  int activeIndex = 0;

  void navigateToDashboard() {
    _navigationService.navigateTo(Routes.patientDashboard);
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
