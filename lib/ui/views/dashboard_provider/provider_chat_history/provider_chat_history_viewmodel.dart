import 'package:sugar_pros/core/data_source/provider_remote_data_source/provider_remote_data_source.dart';
import 'package:sugar_pros/core/models/patients_chat_respose.dart';
import 'package:sugar_pros/core/services/provider_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class ProviderChatHistoryViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ProviderService _providerService = locator<ProviderService>();

  List<PatientsChatItem>? get patientChats => _providerService.patientsChats;
  PatientsChatListData? get patientChat => _providerService.patientChat;

  final ProviderRemoteDataSource _providerRemoteDataSource = locator<ProviderRemoteDataSource>();

  void navigateToChatView(PatientsChatItem chatItem) {
    _navigationService.navigateTo(Routes.providerChats, arguments: chatItem);
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

  void navigateToPdAiChatHistory() {
    _navigationService.navigateTo(Routes.pdAiChatHstory);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_providerService];
}
