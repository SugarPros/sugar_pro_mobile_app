import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/models/authentication_response/pro_auth_response.dart';
import 'package:sugar_pros/core/models/complaince_response.dart';
import 'package:sugar_pros/core/models/pat_basic_details.dart';
import 'package:sugar_pros/core/models/patient_account_response.dart';
import 'package:sugar_pros/core/models/patient_agreement_response.dart';
import 'package:sugar_pros/core/models/patient_dashboard_response.dart';
import 'package:sugar_pros/core/models/privacy_response.dart';
import 'package:sugar_pros/core/models/pro_dashboard_response.dart';
import 'package:sugar_pros/core/models/self_payment_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class AuthService with ListenableServiceMixin {
  ProAuthResponse? _authResponse;
  ProAuthResponse? get authResponse => _authResponse;
  
  set authResponse(ProAuthResponse? val) {
    _authResponse = val;
    notifyListeners();
  }

  AuthService() {
    listenToReactiveValues([
      _authResponse,
      _proBasicData,
      _patAccountDetails,
      _patAuthResponse,
      _patBasicData,
      _patDashboardData,
      _patientAgreement,
      _privacy,
      _compliance,
      _selfPayment,
    ]);
  }

  List<PatientAgreement>? _patientAgreement;
  List<PatientAgreement>? get patientAgreement => _patientAgreement;
  set patientAgreement(List<PatientAgreement>? val) {
    _patientAgreement = val;
    notifyListeners();
  }

  List<Privacy>? _privacy;
  List<Privacy>? get privacy => _privacy;
  set privacy(List<Privacy>? val) {
    _privacy = val;
    notifyListeners();
  }

  List<Compliance>? _compliance;
  List<Compliance>? get compliance => _compliance;
  set compliance(List<Compliance>? val) {
    _compliance = val;
    notifyListeners();
  }

  List<SelfPayment>? _selfPayment;
  List<SelfPayment>? get selfPayment => _selfPayment;
  set selfPayment(List<SelfPayment>? val) {
    _selfPayment = val;
    notifyListeners();
  }

  ProDashboardData? _proBasicData;
  ProDashboardData? get proDashboardData => _proBasicData;
  set proDashboardData(ProDashboardData? val) {
    _proBasicData = val;
    notifyListeners();
  }

  PatientDashboardResponse? _patDashboardData;
  PatientDashboardResponse? get patDashboardData => _patDashboardData;
  set patDashboardData(PatientDashboardResponse? val) {
    _patDashboardData = val;
    notifyListeners();
  }

  PatAuthResponse? _patAuthResponse;
  PatAuthResponse? get patAuthResponse => _patAuthResponse;
  set patAuthResponse(PatAuthResponse? val) {
    _patAuthResponse = val;
    notifyListeners();
  }

  PatBasicData? _patBasicData;
  PatBasicData? get patBasicData => _patBasicData;
  set patBasicData(PatBasicData? val) {
    _patBasicData = val;
    notifyListeners();
  }

  List<AccountDetail>? _accountDetail;
  List<AccountDetail>? get accountDetail => _accountDetail;
  set accountDetail(List<AccountDetail>? val) {
    _accountDetail = val;
    notifyListeners();
  }

  PatientAccountResponse? _patAccountDetails;
  PatientAccountResponse? get patAccountDetails => _patAccountDetails;
  set patAccountDetails(PatientAccountResponse? val) {
    _patAccountDetails = val;
    notifyListeners();
  }
}
