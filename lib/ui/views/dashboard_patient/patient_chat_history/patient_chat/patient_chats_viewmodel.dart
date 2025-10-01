import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PatientChatsViewModel extends ReactiveViewModel {
  final PatientService _patientService = locator<PatientService>();
  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  List<ChatMessage> messages = [];

  TextEditingController messageCtrl = TextEditingController();

  final provider = ChatUser(id: 'provider');
  final patient = ChatUser(id: 'patient');
  final List<ChatUser> typingUsers = <ChatUser>[];

  bool isLoadingHistory = true;

  String? _messageWith;
  String? get messageWith => _messageWith;
  set messageWith(String? val) {
    _messageWith = val;
    notifyListeners();
  }

  Future setup(String? messageWith) async {
    this.messageWith = messageWith;
    fetchPatientChatHistory();
    notifyListeners();
  }

  Future fetchPatientChatHistory() async {
    isLoadingHistory = true;
    notifyListeners();
    final data = await _patientRemoteDataSource.getPatientChatHistory();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        _patientService.chatHistory = r.chatHistoryList;
        messages =
            r.chatHistoryList?.map((msg) {
              final isFromPatient = msg.senderType == 'patient';
              return ChatMessage(
                text: msg.mainMessage ?? '',
                user: isFromPatient ? patient : provider,
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

  // Future fetchRelatedChats(String? id) async {
  //   isLoadingHistory = true;
  //   notifyListeners();

  //   final data = await _patientRemoteDataSource.getRelatedChats(id);

  //   data.fold(
  //     (l) async {
  //       flusher(l.message, color: Colors.red);
  //     },
  //     (r) async {
  //       _patientService.chatMessages = r.relatedChats;
  //       messages =
  //           r.relatedChats?.map((msg) {
  //             return ChatMessage(
  //               text: msg.mainMessage ?? '',
  //               user: (msg.sentBy ?? '') == 'provider' ? provider : patient,
  //               createdAt: msg.createdAt != null ? DateTime.parse(msg.createdAt!) : DateTime.now(),
  //               status: (msg.status ?? '') == 'seen' ? MessageStatus.read : MessageStatus.sent,
  //               customProperties: {'createdAt': msg.createdAt},
  //             );
  //           }).toList() ??
  //           [];
  //       isLoadingHistory = false;
  //       notifyListeners();
  //     },
  //   );
  // }

  Future sendMessage({String? message}) async {
    final userMsg = ChatMessage(
      text: message ?? messageCtrl.text,
      user: patient,
      createdAt: DateTime.now(),
    );

    messages.add(userMsg);
    notifyListeners();

    setBusy(true);

    final data = await _patientRemoteDataSource.sendMessage(
      id: messageWith,
      message: message ?? messageCtrl.text,
    );

    data.fold(
      (l) {
        setBusy(false);
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        setBusy(false);
        fetchPatientChatHistory();
      },
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_patientService];
}
