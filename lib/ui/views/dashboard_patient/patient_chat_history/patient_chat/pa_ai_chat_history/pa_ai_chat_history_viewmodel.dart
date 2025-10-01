import 'package:intl/intl.dart';
import 'package:sugar_pros/core/data_source/patient_remote_data_source/patient_remote_data_source.dart';
import 'package:sugar_pros/core/models/patient_ai_chatlist_response.dart';
import 'package:sugar_pros/core/services/patient_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PaAiChatHistoryViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PatientService _patientService = locator<PatientService>();

  final PatientRemoteDataSource _patientRemoteDataSource = locator<PatientRemoteDataSource>();

  List<PatientAIChatList>? get patientAIChatList => _patientService.patientAIChatList;

  Map<String, List<PatientAIChatList>> groupAIChatListByDate() {
    final grouped = <String, List<PatientAIChatList>>{};
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    // Initialize empty lists for Today and Yesterday to ensure they appear in result
    // even if there are no transactions for these days
    grouped['Today'] = [];
    grouped['Yesterday'] = [];

    for (final PatientAIChatList aiChat in patientAIChatList ?? []) {
      final transactionDate = DateTime.parse(aiChat.createdAt ?? '').toLocal();
      final transactionDay = DateTime(
        transactionDate.year,
        transactionDate.month,
        transactionDate.day,
      );

      String dateLabel;

      if (transactionDay == today) {
        dateLabel = 'Today';
      } else if (transactionDay == yesterday) {
        dateLabel = 'Yesterday';
      } else {
        dateLabel = DateFormatUtil.ddMMMYYYY.format(transactionDate);
      }

      grouped[dateLabel] ??= [];
      grouped[dateLabel]!.add(aiChat);
    }

    // Create a sorted map with custom ordering
    final sortedMap = <String, List<PatientAIChatList>>{};

    // Add Today first if it has transactions
    if (grouped['Today']!.isNotEmpty) {
      sortedMap['Today'] = grouped['Today']!;
    }

    // Add Yesterday second if it has transactions
    if (grouped['Yesterday']!.isNotEmpty) {
      sortedMap['Yesterday'] = grouped['Yesterday']!;
    }

    // Sort the remaining dates in descending order (newest to oldest)
    final otherDates = grouped.keys.where((key) => key != 'Today' && key != 'Yesterday').toList();

    // Sort dates in descending order
    otherDates.sort((a, b) {
      if (a == b) return 0;

      try {
        // Try to parse using the same formatter used to create the labels
        final DateFormat formatter = DateFormatUtil.ddMMMYYYY;
        DateTime dateA = formatter.parse(a);
        DateTime dateB = formatter.parse(b);
        return dateB.compareTo(dateA); // Descending order
      } catch (e) {
        // Fallback sorting if parsing fails
        return b.compareTo(a); // Simple string comparison, descending
      }
    });

    // Add the sorted dates to the result map
    for (final date in otherDates) {
      sortedMap[date] = grouped[date]!;
    }

    return sortedMap;
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

  Future clearChat() async {
    final data = await _patientRemoteDataSource.clearChat();

    data.fold(
      (l) async {
        flusher(l.message, color: Colors.red);
      },
      (r) async {
        log('Data: ${r['data']['newChatUid']}');
        navigateToAIChatView(r['data']['newChatUid']);
      },
    );
  }

  void navigateToAIChatView(String? chatId) {
    _navigationService.navigateTo(Routes.paAiChatView, arguments: chatId);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_patientService];
}
