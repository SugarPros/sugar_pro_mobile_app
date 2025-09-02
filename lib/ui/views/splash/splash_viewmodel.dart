import 'package:sugar_pros/core/models/user/user.dart';
import 'package:sugar_pros/core/services/user_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  User? get user => _userService.user;

  void setup() {
    _userService.getUser();
  }

  void navaigateToOnboarding() {
    _navigationService.clearStackAndShow(Routes.onboarding);
  }

  void navigateToAuthView() {
    _navigationService.navigateTo(Routes.auth);
  }

  void navigateToProviderLogin() {
    _navigationService.navigateTo(Routes.providerLogin);
  }

  void navigateToPatientLogin() {
    _navigationService.navigateTo(Routes.providerLogin);
  }
}
