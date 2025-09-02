import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/models/pat_basic_details.dart';
import 'package:sugar_pros/core/models/patient_dashboard_response.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientHomeViewModel extends BaseViewModel {
  // final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final PatientService _patientService = locator<PatientService>();

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  PatAuthResponse? get user => _authService.patAuthResponse;
  PatBasicData? get details => _authService.patBasicData;
  PatientDashboardResponse? get dashboard => _authService.patDashboardData;

  Future fetchPatientChatHistory() async {
    final data = await _patientRemoteDataSource.getPatientChatHistory();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _patientService.chatHistory = r.chatHistoryList;
        _patientService.chatData = r;
      },
    );
  }
}
