import 'package:sugar_pros/core/utils/exports.dart';

class ProviderProfileViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToProfileAccount() {
    _navigationService.navigateTo(Routes.providerProfileAccountView);
  }

   void navigateToProfileAccountInfo() {
    _navigationService.navigateTo(Routes.providerProfileAccountInfoView);
  }
}
