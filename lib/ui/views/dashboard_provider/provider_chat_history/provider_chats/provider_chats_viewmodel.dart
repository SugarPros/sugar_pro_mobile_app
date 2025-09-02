import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:sugar_pros/core/data_source/provider_remote_data_source/provider_remote_data_source.dart';
import 'package:sugar_pros/core/services/provider_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ProviderChatsViewModel extends ReactiveViewModel {
  final ProviderService _providerService = locator<ProviderService>();
  final ProviderRemoteDataSource _providerRemoteDataSource = locator<ProviderRemoteDataSource>();

  List<ChatMessage> messages = [];

  TextEditingController messageCtrl = TextEditingController();

  final provider = ChatUser(id: 'provider');
  final patient = ChatUser(id: 'patient');
  final List<ChatUser> typingUsers = <ChatUser>[];

  bool isLoadingHistory = true;

  String? _patientId;
  String? get patientId => _patientId;
  set patientId(String? val) {
    _patientId = val;
    notifyListeners();
  }

  Future setup(String? patientId) async {
    this.patientId = patientId;
    fetchPatientChatsById(patientId);
    notifyListeners();
  }

  Future fetchPatientChatsById(String? id) async {
    isLoadingHistory = true;
    notifyListeners();

    final data = await _providerRemoteDataSource.getPatientChatsById(id);

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _providerService.chatMessages = r.chatMessage;
        messages =
            r.chatMessage?.map((msg) {
              return ChatMessage(
                text: msg.mainMessage ?? '',
                user: (msg.senderType ?? '') == 'provider' ? provider : patient,
                createdAt: msg.createdAt != null ? DateTime.parse(msg.createdAt!) : DateTime.now(),
                status: (msg.status ?? '') == 'seen' ? MessageStatus.read : MessageStatus.sent,
                customProperties: {'createdAt': msg.createdAt},
              );
            }).toList() ??
            [];
        isLoadingHistory = false;
        notifyListeners();
      },
    );
  }

  Future sendMessage({String? message}) async {
    final userMsg = ChatMessage(
      text: message ?? messageCtrl.text,
      user: provider,
      createdAt: DateTime.now(),
    );

    messages.add(userMsg);
    notifyListeners();

    setBusy(true);

    final data = await _providerRemoteDataSource.sendMessage(
      id: patientId,
      message: message ?? messageCtrl.text,
    );

    data.fold(
      (l) {
        setBusy(false);
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        setBusy(false);
        fetchPatientChatsById(patientId);
        fetchProviderChatHistory();
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

  @override
  List<ListenableServiceMixin> get listenableServices => [_providerService];
}
