import 'package:sugar_pros/core/models/user/user.dart';
import 'package:sugar_pros/core/services/user_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class AuthViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();

  User? get user => _userService.user;

  void setup() {
    _userService.getUser();
  }

  String? _identity;
  String? get identity => _identity;
  set identity(String? val) {
    _identity = val;
    notifyListeners();
  }

  void navigateToPatientRegister() {
    if (user == null) {
      _navigationService.navigateTo(Routes.patientAccount);
    } else {
       _navigationService.navigateTo(Routes.patientLogin);
    }
  }

  void navigateToProviderRegister() {
    if (user == null) {
      _navigationService.navigateTo(Routes.providerAccount);
    } else {
      _navigationService.navigateTo(Routes.providerLogin);
    }
  }
}
