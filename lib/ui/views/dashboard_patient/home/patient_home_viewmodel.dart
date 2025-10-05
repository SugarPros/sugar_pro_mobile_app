import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/models/authentication_response/pat_auth_response.dart';
import 'package:sugar_pros/core/models/pat_basic_details.dart';
import 'package:sugar_pros/core/models/patient_account_response.dart';
import 'package:sugar_pros/core/models/patient_dashboard_response.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/home/dashboard_pat_appointment_view.dart';
import 'package:url_launcher/url_launcher.dart';

class PatientHomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final PatientService _patientService = locator<PatientService>();
  final DialogService _dialogService = locator<DialogService>();

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  PatAuthResponse? get user => _authService.patAuthResponse;
  PatBasicData? get details => _authService.patBasicData;
  PatientDashboardResponse? get dashboard => _authService.patDashboardData;
  PatientAccountResponse? get patAccountDetails => _authService.patAccountDetails;

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  Future joinMeeting(String? appointmentId) async {
    _dialogService.showCustomDialog(
      variant: DialogType.loader,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      title: 'Please wait...',
    );

    final data = await _patientRemoteDataSource.joinMeeting(appointmentId);

    data.fold(
      (l) async {
        _dialogService.completeDialog(DialogResponse());
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _dialogService.completeDialog(DialogResponse());
        _launchInBrowser(Uri.parse(r['meeting_url']));
      },
    );
  }

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

  Future fetchPatientAppointments() async {
    final data = await _patientRemoteDataSource.patAppointments();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _patientService.patientAppointments = r.patAppointments;
        notifyListeners();
      },
    );
  }

  Future fetchPatientNotifications() async {
    final data = await _patientRemoteDataSource.patNotifications();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _patientService.patientNotifications = r.notifications;
        notifyListeners();
      },
    );
  }

  void navigateToPdAppoitmentDetails(PatAppointments? app) {
    _navigationService.navigateToView(
      DashboardPatAppointmentDetailView(app: app ?? PatAppointments()),
    );
  }

  void navigateToNotifications() {
    _navigationService.navigateTo(Routes.notifcations);
  }
}
