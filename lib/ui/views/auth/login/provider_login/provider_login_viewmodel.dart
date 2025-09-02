import 'package:sugar_pros/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:sugar_pros/core/models/user/user.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/services/user_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ProviderLoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final UserService _userService = locator<UserService>();
  final AuthService _authService = locator<AuthService>();
  final UtilityService _utilityService = locator<UtilityService>();

  final AuthRemoteDataSource _authRemoteDataSource = locator<AuthRemoteDataSource>();

  User? get user => _userService.user;

  TextEditingController passwordCtrl = TextEditingController();

  Future setup() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _utilityService.setSignedIn(false);
      _userService.getUser();
    });
  }

  String? _email;
  String? get email => _email;
  set email(String? val) {
    _email = val;
    notifyListeners();
  }

  String? _password;
  String? get password => _password;
  set password(String? val) {
    _password = val;
    notifyListeners();
  }

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;
  set obscurePassword(bool val) {
    _obscurePassword = val;
    notifyListeners();
  }

  Future login() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.proLogin(
      email: email ?? user?.loginUsername,
      password: password,
    );

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _authService.authResponse = r;
        _userService.addUser(
          User(token: r.authData?.token, loginUsername: email ?? user?.loginUsername),
        );
        _userService.getUser();

        fetchDashboard();
      },
    );
  }

  Future fetchDashboard() async {
    final data = await _authRemoteDataSource.proDashboard();

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _dialogService.completeDialog(DialogResponse());
        _authService.proDashboardData = r.data;
        navigateToProviderDashboard();
      },
    );
  }

  void navigateToProviderAccount() {
    _navigationService.navigateTo(Routes.providerAccount);
  }

  void navigateToProviderDashboard() {
    _navigationService.clearStackAndShow(Routes.providerDashboard);
  }

  void navigateToAuthView() {
    _navigationService.navigateTo(Routes.auth);
  }
}
