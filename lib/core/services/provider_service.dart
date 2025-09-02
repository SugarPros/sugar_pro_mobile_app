import 'package:sugar_pros/core/models/ai_chat_message_response.dart';
import 'package:sugar_pros/core/models/chat_messages_response.dart';
import 'package:sugar_pros/core/models/patient_record_response.dart';
import 'package:sugar_pros/core/models/patients_chat_respose.dart';
import 'package:sugar_pros/core/models/pro_appointments_response.dart';
import 'package:sugar_pros/core/models/provider_ai_chatlist_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ProviderService with ListenableServiceMixin {
  ProviderService() {
    listenToReactiveValues([_proAppointments]);
  }

  List<ProAppointments>? _proAppointments;
  List<ProAppointments>? get proAppointments => _proAppointments;
  set proAppointments(List<ProAppointments>? val) {
    _proAppointments = val;
    notifyListeners();
  }

  List<PatientsList>? _patients;
  List<PatientsList>? get patients => _patients;
  set patients(List<PatientsList>? val) {
    _patients = val;
    notifyListeners();
  }

  List<UserDetails>? _userDetails;
  List<UserDetails>? get userDetails => _userDetails;
  set userDetails(List<UserDetails>? val) {
    _userDetails = val;
    notifyListeners();
  }

  List<PatientsChatItem>? _patientsChats;
  List<PatientsChatItem>? get patientsChats => _patientsChats;
  set patientsChats(List<PatientsChatItem>? val) {
    _patientsChats = val;
    notifyListeners();
  }

  List<ProviderAIChatList>? _providerAiChatList;
  List<ProviderAIChatList>? get providerAiChatList => _providerAiChatList;
  set providerAiChatList(List<ProviderAIChatList>? val) {
    _providerAiChatList = val;
    notifyListeners();
  }

  PatientsChatListData? _patientChat;
  PatientsChatListData? get patientChat => _patientChat;
  set patientChat(PatientsChatListData? val) {
    _patientChat = val;
    notifyListeners();
  }

  List<ChatMessage>? _chatMessages;
  List<ChatMessage>? get chatMessages => _chatMessages;
  set chatMessages(List<ChatMessage>? val) {
    _chatMessages = val;
    notifyListeners();
  }

  List<AIChatMessage>? _aiChatMessages;
  List<AIChatMessage>? get aiChatMessages => _aiChatMessages;
  set aiChatMessages(List<AIChatMessage>? val) {
    _aiChatMessages = val;
    notifyListeners();
  }
}
