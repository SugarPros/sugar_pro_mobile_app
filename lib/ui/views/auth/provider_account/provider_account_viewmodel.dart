import 'package:sugar_pros/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ProviderAccountViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  final AuthRemoteDataSource _authRemoteDataSource =
      locator<AuthRemoteDataSource>();

  final PageController pageController = PageController();
  int activeIndex = 0;

  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController fullNameCtrl = TextEditingController();

  String? _email;
  String? get email => _email;
  set email(String? val) {
    _email = val;
    notifyListeners();
  }

  String? _phone;
  String? get phone => _phone;
  set phone(String? val) {
    _phone = val;
    notifyListeners();
  }

  String? _name;
  String? get name => _name;
  set name(String? val) {
    _name = val;
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

  String? _confirmPassword;
  String? get confirmPassword => _confirmPassword;
  set confirmPassword(String? val) {
    _confirmPassword = val;
    notifyListeners();
  }

  String? _password;
  String? get password => _password;
  set password(String? val) {
    _password = val;
    notifyListeners();
  }

  Future sendOtp() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.proSendOtp(
      email: email,
      username: name,
      prefixCode: 'Dr.',
      providerRole: 'doctor',
      mobile: phone,
      password: password,
      passwordConfirmation: confirmPassword,
    );

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        forward();
      },
    );
  }

  void navigateToLogin() {
    _navigationService.clearStackAndShow(Routes.providerLogin);
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
