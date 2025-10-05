import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/models/chat_list_response.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientChatHistoryViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PatientService _patientService = locator<PatientService>();

  ChatListResponse? get chatData => _patientService.chatData;

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  List<ChatHistoryList> get chatHistoryList => uniqueProviderChats;

  List<ChatHistoryList> get uniqueProviderChats {
  if (_patientService.chatHistory == null) return [];

  final Map<String, ChatHistoryList> grouped = {};

  for (final chat in _patientService.chatHistory!) {
    // Skip messages you mistakenly sent to yourself
    if (chat.sentBy == chat.receivedBy) continue;

    // Identify provider ID (could be sender or receiver)
    final isProviderSender = chat.senderType == "provider";
    final providerId = isProviderSender ? chat.sentBy : chat.receivedBy;

    if (providerId == null) continue;

    // Keep the latest message for each provider
    if (!grouped.containsKey(providerId) ||
        DateTime.parse(chat.createdAt!).isAfter(
          DateTime.parse(grouped[providerId]!.createdAt!),
        )) {
      grouped[providerId] = chat;
    }
  }

  return grouped.values.toList()
    ..sort((a, b) => DateTime.parse(b.createdAt!)
        .compareTo(DateTime.parse(a.createdAt!))); // newest first
}


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
        notifyListeners();
      },
    );
  }

  void navigateToPaAiChatHistory() {
    _navigationService.navigateTo(Routes.paAiChatHstory);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_patientService];
}
