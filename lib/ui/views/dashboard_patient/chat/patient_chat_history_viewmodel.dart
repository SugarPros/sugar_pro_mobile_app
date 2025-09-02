import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/models/chat_list_response.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientChatHistoryViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PatientService _providerService = locator<PatientService>();

  List<ChatHistoryList>? get chatHistoryList => _providerService.chatHistory;
  ChatListResponse? get chatData => _providerService.chatData;

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_providerService];
}
