import 'package:sugar_pros/core/models/pro_appointments_response.dart';
import 'package:sugar_pros/core/services/provider_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ProviderAppointmentViewModel extends BaseViewModel {
  final ProviderService _providerService = locator<ProviderService>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<ProAppointments>? get proAppointments => _providerService.proAppointments;

  void navigateToAppointmentDetails(ProAppointments? app) {
    _navigationService.navigateTo(Routes.pdAppointmentDetails, arguments: app);
  }
}
