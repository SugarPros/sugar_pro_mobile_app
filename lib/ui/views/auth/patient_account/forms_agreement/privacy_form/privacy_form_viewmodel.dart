import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PrivacyFormViewmodel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNameCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController serveiceDateCtrl = TextEditingController();
  TextEditingController userMessageCtrl = TextEditingController();
  TextEditingController patientNameCtrl = TextEditingController();
  TextEditingController repNameCtrl = TextEditingController();

  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) {
    _date = val;
    notifyListeners();
  }

  DateTime? _serviceDate;
  DateTime? get serviceDate => _serviceDate;
  set serviceDate(DateTime? val) {
    _serviceDate = val;
    notifyListeners();
  }
  
  bool isAgree1 = false;
  void toggleAggrement1() {
    isAgree1 = !isAgree1;
    notifyListeners();
  }

  bool isAgree2 = false;
  void toggleAggrement2() {
    isAgree2 = !isAgree2;
    notifyListeners();
  }

  void navigateToCompliance() {
    _navigationService.navigateTo(Routes.complianceFrom);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];
}
