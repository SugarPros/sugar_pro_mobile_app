import 'package:sugar_pros/core/models/chat_list_response.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientService with ListenableServiceMixin {
  PatientService() {
    listenToReactiveValues([_chatHistory]);
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
}
