import 'package:sugar_pros/core/models/chat_list_response.dart';
import 'package:sugar_pros/core/models/nutrition_tracker_response.dart';
import 'package:sugar_pros/core/models/pat_appointment_respons.dart';
import 'package:sugar_pros/core/models/patient_ai_chatlist_response.dart';
import 'package:sugar_pros/core/models/related_chat_repsonse.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientService with ListenableServiceMixin {
  PatientService() {
    listenToReactiveValues([
      _chatHistory,
      _patientAppointments,
      _chatData,
      _chatHistory,
      _chatMessages,
      _patientAiChat,
      _patientAIChatList,
      _aiChatMessages,
      _foods,
    ]);
  }

  List<PatientAppointments>? _patientAppointments;
  List<PatientAppointments>? get patientAppointments => _patientAppointments;
  set patientAppointments(List<PatientAppointments>? val) {
    _patientAppointments = val;
    notifyListeners();
  }

  List<ChatHistoryList>? _chatHistory;
  List<ChatHistoryList>? get chatHistory => _chatHistory;
  set chatHistory(List<ChatHistoryList>? val) {
    _chatHistory = val;
    notifyListeners();
  }

  ChatListResponse? _chatData;
  ChatListResponse? get chatData => _chatData;
  set chatData(ChatListResponse? val) {
    _chatData = val;
    notifyListeners();
  }

  List<RelatedChats>? _chatMessages;
  List<RelatedChats>? get chatMessages => _chatMessages;
  set chatMessages(List<RelatedChats>? val) {
    _chatMessages = val;
    notifyListeners();
  }

  PatientAiChat? _patientAiChat;
  PatientAiChat? get patientAiChat => _patientAiChat;
  set patientAiChat(PatientAiChat? val) {
    _patientAiChat = val;
    notifyListeners();
  }

  List<PatientAIChatList>? _patientAIChatList;
  List<PatientAIChatList>? get patientAIChatList => _patientAIChatList;
  set patientAIChatList(List<PatientAIChatList>? val) {
    _patientAIChatList = val;
    notifyListeners();
  }

  List<PaAiChatMessages>? _aiChatMessages;
  List<PaAiChatMessages>? get aiChatMessages => _aiChatMessages;
  set aiChatMessages(List<PaAiChatMessages>? val) {
    _aiChatMessages = val;
    notifyListeners();
  }

  List<Foods>? _foods;
  List<Foods>? get foods => _foods;
  set foods(List<Foods>? val) {
    _foods = val;
    notifyListeners();
  }
}
