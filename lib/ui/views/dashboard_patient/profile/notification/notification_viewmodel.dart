import 'package:sugar_pros/core/models/patient_notification_response.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class NotificationViewModel extends BaseViewModel {
  final PatientService _patientService = locator<PatientService>();

  List<PatNotifications>? get notifications => _patientService.patientNotifications ?? [];
}
