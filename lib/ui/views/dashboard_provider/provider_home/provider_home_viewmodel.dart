import 'package:sugar_pros/core/data_source/provider_remote_data_source/provider_remote_data_source.dart';
import 'package:sugar_pros/core/models/authentication_response/pro_auth_response.dart';
import 'package:sugar_pros/core/models/pro_dashboard_response.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/services/provider_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/ui/views/dashboard_provider/provider_home/dashboard_pd_appointment_view.dart';

class ProviderHomeViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final ProviderService _providerService = locator<ProviderService>();

  final ProviderRemoteDataSource _providerRemoteDataSource = locator<ProviderRemoteDataSource>();

  ProAuthResponse? get user => _authService.authResponse;
  ProDashboardData? get dashboard => _authService.proDashboardData;

  Future setup() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchAppointments();
      fetchPatientRecords();
      fetchProviderChatHistory();
    });
  }

  Future fetchAppointments() async {
    final data = await _providerRemoteDataSource.proAppointments();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _providerService.proAppointments = r.proAppointments;
      },
    );
  }

  Future fetchPatientRecords() async {
    final data = await _providerRemoteDataSource.patientRecords();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _providerService.patients = r.data?.patientsList;
        _providerService.userDetails = r.data?.userDetails;
      },
    );
  }

  Future fetchProviderChatHistory() async {
    final data = await _providerRemoteDataSource.getProviderChatHistory();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _providerService.patientsChats = r.data?.chats;
        _providerService.patientChat = r.data;
      },
    );
  }

  void navigateToPdAppoitmentDetails(Appointments? app) async {
    _navigationService.navigateToView(DashboardPdAppointmentDetailView(app: app ?? Appointments()));
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService, _providerService];
}
