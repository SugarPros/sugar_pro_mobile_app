import 'package:sugar_pros/core/data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:sugar_pros/core/models/user/user.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/services/user_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientLoginViewModel extends BaseViewModel {
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

  Future getPatientAccount() async {
    final data = await _authRemoteDataSource.getPatientAccount();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _authService.patAccountDetails = r;
        _authService.accountDetail = r.accountDetails;
        notifyListeners();
      },
    );
  }

  Future login() async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _authRemoteDataSource.patLogin(
      email: email ?? user?.loginUsername,
      password: password,
    );

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _authService.patAuthResponse = r;
        _userService.addUser(
          User(token: r.accessToken, loginUsername: email ?? user?.loginUsername),
        );
        _userService.getUser();
        await Future.wait([getPatientAccount(), fetchDashboard()]);
        fetchPatientBasicDetails();
      },
    );
  }

  Future fetchDashboard() async {
    final data = await _authRemoteDataSource.patDashboard();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _authService.patDashboardData = r;
      },
    );
  }

  Future fetchPatientBasicDetails() async {
    setBusy(true);
    final data = await _authRemoteDataSource.getPatBasicDetails();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _authService.patBasicData = r.data;
        if (r.data == null) {
          setBusy(false);
          navigateToBasicDetailsFrom();
        } else {
          fetchPrivacyForm();
        }
      },
    );
  }

  Future fetchPrivacyForm() async {
    final data = await _authRemoteDataSource.getPrivacyForm();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _authService.privacy = r.privacy;
        if (r.privacy == null || (r.privacy?.isEmpty ?? false)) {
          setBusy(false);
          navigateToPrivacyFrom();
        } else {
          fetchComplianceForm();
        }
      },
    );
  }

  Future fetchComplianceForm() async {
    final data = await _authRemoteDataSource.getComplianceForm();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _authService.compliance = r.complaince;
        if (r.complaince == null || (r.complaince?.isEmpty ?? false)) {
          setBusy(false);
          navigateToComplianceFrom();
        } else {
          fetchAggrementForm();
        }
      },
    );
  }

  Future fetchAggrementForm() async {
    final data = await _authRemoteDataSource.getFinancialAgreementForm();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _authService.patientAgreement = r.patientAgreement;
        if (r.patientAgreement == null || (r.patientAgreement?.isEmpty ?? false)) {
          setBusy(false);
          navigateToAgreementFrom();
        } else {
          fetchSelfPaymentForm();
        }
      },
    );
  }

  Future fetchSelfPaymentForm() async {
    final data = await _authRemoteDataSource.getSelfPaymentForm();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        setBusy(false);
        _authService.selfPayment = r.selfPayment;
        if (r.selfPayment == null || (r.selfPayment?.isEmpty ?? false)) {
          navigateToSelfPayementForm();
        } else {
          _navigationService.clearStackAndShow(Routes.patientDashboard);
        }
      },
    );
  }

  void navigateToBasicDetailsFrom() {
    _navigationService.clearStackAndShow(Routes.basicDetails);
  }

  void navigateToPrivacyFrom() {
    _navigationService.clearStackAndShow(Routes.privacyFrom);
  }

  void navigateToComplianceFrom() {
    _navigationService.clearStackAndShow(Routes.complianceFrom);
  }

  void navigateToAgreementFrom() {
    _navigationService.clearStackAndShow(Routes.patentAgreementForm);
  }

  void navigateToSelfPayementForm() {
    _navigationService.clearStackAndShow(Routes.selfPaymentForm);
  }

  void navigateToPatientSignup() {
    _navigationService.navigateTo(Routes.patientSignup);
  }

  void navigateToProviderDashboard() {
    _navigationService.clearStackAndShow(Routes.providerDashboard);
  }

  void navigateToPatientDashboard() {
    _navigationService.clearStackAndShow(Routes.patientDashboard);
  }

  void navigateToAuthView() {
    _navigationService.navigateTo(Routes.auth);
  }
}
