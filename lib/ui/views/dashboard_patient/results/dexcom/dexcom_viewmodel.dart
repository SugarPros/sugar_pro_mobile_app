
import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class DexcomViewModel extends ReactiveViewModel {
  final PatientService _patientService = locator<PatientService>();
  final AuthService _authService = locator<AuthService>();

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  Future dexcom() async {
    final data = await _patientRemoteDataSource.dexcom();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        notifyListeners();
      },
    );
  }

    @override
  List<ListenableServiceMixin> get listenableServices => [_patientService, _authService];
}