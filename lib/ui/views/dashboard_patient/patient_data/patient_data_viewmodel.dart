import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientDataViewModel extends IndexTrackingViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final PatientService _patientService = locator<PatientService>();
  final AuthService _authService = locator<AuthService>();

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  Future getEprescriptions() async {
    final data = await _patientRemoteDataSource.ePrescriptions();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        notifyListeners();
      },
    );
  }

  Future questLab() async {
    final data = await _patientRemoteDataSource.questLab();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _patientService.questLab = r.questLab;
        notifyListeners();
      },
    );
  }

  Future clinicalNotes() async {
    final data = await _patientRemoteDataSource.clinicalNotes();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        notifyListeners();
      },
    );
  }

  void navigateToDexcom() {
    _navigationService.navigateTo(Routes.dexcom);
  }

  void navigateToNutritionTracker() {
    _navigationService.navigateTo(Routes.nutritionTracker);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_patientService, _authService];
}
