import 'package:sugar_pros/core/models/quest_lab_response.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_patient/patient_data/patient_quest_lab/patient_quest_lab_detail.dart';

class PatientQuestLabViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PatientService _patientService = locator<PatientService>();

  List<QuestLab> get questLab => _patientService.questLab ?? [];

  void navigateToLabDetail(QuestLab questLab) {
    _navigationService.navigateToView(QuestLabDetailView(app: questLab));
  }
}
