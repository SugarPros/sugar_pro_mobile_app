import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:sugar_pros/core/data_source/provider_remote_data_source/provider_remote_data_source.dart';
import 'package:sugar_pros/core/models/authentication_response/pro_auth_response.dart';
import 'package:sugar_pros/core/models/provider_ai_chatlist_response.dart';
import 'package:sugar_pros/core/services/auth_service.dart';
import 'package:sugar_pros/core/services/provider_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PdAiChatViewModel extends ReactiveViewModel {
  final ProviderService _providerService = locator<ProviderService>();
  final AuthService _authService = locator<AuthService>();

  List<ChatMessage> messages = [];

  TextEditingController messageCtrl = TextEditingController();

  final provider = ChatUser(id: 'provider');
  final sugarProAI = ChatUser(id: 'AI', firstName: 'Sugar Pro');
  final List<ChatUser> typingUsers = <ChatUser>[];

  final ProviderRemoteDataSource _providerRemoteDataSource = locator<ProviderRemoteDataSource>();

  List<ProviderAIChatList>? get providerAIChatList => _providerService.providerAiChatList;
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

    final data = await _providerRemoteDataSource.getProviderAIChatsById(id);

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _providerService.aiChatMessages = r.aiChatMessage;
        messages =
            r.aiChatMessage?.map((msg) {
              return ChatMessage(
                text: msg.message ?? '',
                user: (msg.requestedBy ?? '') == 'AI' ? sugarProAI : provider,
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
    final data = await _providerRemoteDataSource.getAIChats();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _providerService.providerAiChatList = r.data;
      },
    );
  }

  Future sendMessage({String? message}) async {
    notifyListeners();

    final userMsg = ChatMessage(
      text: message ?? messageCtrl.text,
      user: provider,
      createdAt: DateTime.now(),
    );
    messages.add(userMsg);
    notifyListeners();

    setBusy(true);

    // Show typing indicator
    typingUsers.add(sugarProAI);
    notifyListeners();

    final data = await _providerRemoteDataSource.sendMessageAI(
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
      },
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_providerService];
}
