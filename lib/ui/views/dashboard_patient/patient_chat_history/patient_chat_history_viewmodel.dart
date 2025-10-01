import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/models/chat_list_response.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientChatHistoryViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PatientService _patientService = locator<PatientService>();

  List<ChatHistoryList>? get chatHistoryList => _patientService.chatHistory;
  ChatListResponse? get chatData => _patientService.chatData;

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  void navigateToChatView(ChatHistoryList chatItem) {
    _navigationService.navigateTo(Routes.patientChats, arguments: chatItem);
  }

  Future fetchPatientChatHistory() async {
    final data = await _patientRemoteDataSource.getPatientChatHistory();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _patientService.chatHistory = r.chatHistoryList;
        _patientService.chatData = r;
      },
    );
  }

  void navigateToPaAiChatHistory() {
    _navigationService.navigateTo(Routes.paAiChatHstory);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_patientService];
}
