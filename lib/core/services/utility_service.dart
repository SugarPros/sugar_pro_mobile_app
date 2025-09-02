import 'package:sugar_pros/core/models/user/user.dart';
import 'package:sugar_pros/core/services/user_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

/// UtilityService is responsible for managing various utility operations
/// within the app, such as user authentication status, navigation visibility,
/// and the management of system data like states and local governments.
class UtilityService with ListenableServiceMixin {
  final UserService _userService = locator<UserService>();

  User? get user => _userService.user;

  bool _signedIn = false;
  bool get signedIn => _signedIn;

  bool _showNav = false;
  bool get showNav => _showNav;

  int index = 0;

  UtilityService() {
    listenToReactiveValues([_signedIn, _showNav, index]);
  }

  void setIndex(int val) {
    index = val;
    notifyListeners();
  }

  void setSignedIn(bool val) {
    _signedIn = val;
    notifyListeners();
  }

  void setShowNav(bool val) {
    _showNav = val;
    notifyListeners();
  }
}
