import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/models/authentication_response/pro_auth_response.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PaAiChatViewModel extends ReactiveViewModel {
  final PatientService _patientService = locator<PatientService>();
  final AuthService _authService = locator<AuthService>();

  List<ChatMessage> messages = [];

  TextEditingController messageCtrl = TextEditingController();

  final patient = ChatUser(id: 'patient');
  final sugarProAI = ChatUser(id: 'AI', firstName: 'Sugar Pro');
  final List<ChatUser> typingUsers = <ChatUser>[];

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  ProAuthResponse? get user => _authService.authResponse;

  bool isLoadingHistory = true;

  String? _aiChatId;
  String? get aiChatId => _aiChatId;
  set aiChatId(String? val) {
    _aiChatId = val;
    notifyListeners();
  }

  Future setup(String? aiChatId) async {
    this.aiChatId = aiChatId;
    fetchAIChatsById(aiChatId);
    notifyListeners();
  }

  Future fetchAIChatsById(String? id) async {
    isLoadingHistory = true;
    notifyListeners();

    final data = await _patientRemoteDataSource.getPatientAIChatsById(id);

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _patientService.aiChatMessages = r.patientAiChat?.chats;
        messages =
            r.patientAiChat?.chats?.map((msg) {
              return ChatMessage(
                text: msg.message ?? '',
                user: (msg.requestedBy ?? '') == 'AI' ? sugarProAI : patient,
                createdAt: msg.createdAt != null ? DateTime.parse(msg.createdAt!) : DateTime.now(),
                customProperties: {'createdAt': msg.createdAt},
              );
            }).toList() ??
            [];
        isLoadingHistory = false;
        notifyListeners();
      },
    );
  }

  Future fetchAiChats() async {
    final data = await _patientRemoteDataSource.getAIChats();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _patientService.patientAIChatList = r.patientAiChat?.allChats;
        notifyListeners();
      },
    );
  }

  Future sendMessage({String? message}) async {
    notifyListeners();

    final userMsg = ChatMessage(
      text: message ?? messageCtrl.text,
      user: patient,
      createdAt: DateTime.now(),
    );
    messages.add(userMsg);
    notifyListeners();

    setBusy(true);

    // Show typing indicator
    typingUsers.add(sugarProAI);
    notifyListeners();

    final data = await _patientRemoteDataSource.sendMessageAI(
      id: aiChatId,
      message: message ?? messageCtrl.text,
    );

    typingUsers.remove(sugarProAI);
    notifyListeners();

    data.fold(
      (l) {
        setBusy(false);
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        setBusy(false);
        fetchAIChatsById(aiChatId);
        fetchAiChats();
        final fullText = r.aiReplyData?.reply ?? '';

        // Add empty bot message first
        final animatedMsg = ChatMessage(
          text: '',
          user: sugarProAI,
          createdAt: DateTime.now(),
          customProperties: {'animated': true},
        );
        messages.add(animatedMsg);
        notifyListeners();

        // Animate the message one character at a time
        for (int i = 1; i <= fullText.length; i++) {
          await Future.delayed(const Duration(milliseconds: 20));
          animatedMsg.text = fullText.substring(0, i);
          notifyListeners();
        }
        fetchAiChats();
        notifyListeners();
      },
    );
  }

  Future clearChat() async {
    final data = await _patientRemoteDataSource.clearChat();

    data.fold((l) async {
      flusher(l.message, color: Colors.red);
    }, (r) async {});
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_patientService];
}
