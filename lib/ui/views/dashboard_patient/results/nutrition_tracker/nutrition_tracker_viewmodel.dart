import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/models/nutrition_tracker_response.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class NutritionTrackerViewModel extends ReactiveViewModel {
  final PatientService _patientService = locator<PatientService>();
  final AuthService _authService = locator<AuthService>();

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  List<Foods> get foods => _patientService.foods ?? [];

  Future nutritionTracker() async {
    final data = await _patientRemoteDataSource.nutritionTracker();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _patientService.foods = r.data?.foods;
        notifyListeners();
      },
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_patientService, _authService];
}
