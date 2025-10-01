import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:url_launcher/url_launcher.dart';

class PatAppointmentDetailViewModel extends ReactiveViewModel {
  final DialogService _dialogService = locator<DialogService>();

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

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
}
