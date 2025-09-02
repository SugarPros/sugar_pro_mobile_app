import 'package:sugar_pros/core/models/patient_record_response.dart';
import 'package:sugar_pros/core/services/provider_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ProviderRecordsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ProviderService _providerService = locator<ProviderService>();

  List<PatientsList>? get patients => _providerService.patients;
  List<UserDetails>? get userDetails => _providerService.userDetails;

  void navigateToProviderRecordDetail(PatientsList? patient, UserDetails? record) {
    _navigationService.navigateTo(
      Routes.pdRecordDetails,
      arguments: {'patient': patient, 'record': record},
    );
  }
}
