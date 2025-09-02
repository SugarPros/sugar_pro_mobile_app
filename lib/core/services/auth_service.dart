import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/models/authentication_response/pro_auth_response.dart';
import 'package:sugar_pros/core/models/pat_basic_details.dart';
import 'package:sugar_pros/core/models/patient_dashboard_response.dart';
import 'package:sugar_pros/core/models/pro_dashboard_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class AuthService with ListenableServiceMixin {
  ProAuthResponse? _authResponse;
  ProAuthResponse? get authResponse => _authResponse;
  set authResponse(ProAuthResponse? val) {
    _authResponse = val;
    notifyListeners();
  }

  AuthService() {
    listenToReactiveValues([_authResponse, _proBasicData]);
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
}
