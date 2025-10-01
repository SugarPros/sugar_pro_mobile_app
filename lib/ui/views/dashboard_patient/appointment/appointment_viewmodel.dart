import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/models/pat_appointment_respons.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentViewModel extends BaseViewModel {
  final PatientService _patientService = locator<PatientService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  List<PatientAppointments> get appointments => _patientService.patientAppointments ?? [];

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

  void navigateToAppointmentDetails(PatientAppointments? app) {
    _navigationService.navigateTo(Routes.patAppointmentDetails, arguments: app);
  }

  void navigateToBookAppointment() {
    _navigationService.navigateTo(Routes.bookAppointment);
  }
}
