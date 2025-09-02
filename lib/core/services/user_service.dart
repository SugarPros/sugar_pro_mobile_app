import 'package:hive/hive.dart';
import 'package:sugar_pros/core/models/user/user.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/core/utils/hive_boxes.dart';

class UserService with ListenableServiceMixin {
  User? _user;
  User? get user => _user;

  final _hiveService = locator<HiveInterface>();

  bool get _isBoxOpen => _hiveService.isBoxOpen(HiveBox.user);
  Box<User> get _userBox => _hiveService.box<User>(HiveBox.user);

  bool? _hasPin;
  bool? get hasPin => _hasPin;
  set hasPin(bool? val) {
    _hasPin = val;
    notifyListeners();
  }

  DateTime? _tokenExpiry;
  DateTime? get tokenExpiry => _tokenExpiry;

  UserService() {
    listenToReactiveValues([_user, _hasPin]);
  }

  Future<void> init() async {
    _hiveService.registerAdapter(UserAdapter());

    if (!_isBoxOpen) {
      await _hiveService.openBox<User>(HiveBox.user);
    }
  }

  Future addUser(User user) async {
    getUser();
    await _userBox.put(0, user);
    getUser();
    _user = user;
    notifyListeners();
  }

  void getUser() {
    _user = _userBox.get(0);
    notifyListeners();
  }

  Future clear() async {
    log('CLEEEEARR');
    await _userBox.clear();
    _user = null;
    _tokenExpiry = null;
    notifyListeners();
    getUser();
  }
}
