import 'package:intl/intl.dart';
import 'package:sugar_pros/core/data_source/provider_remote_data_source/provider_remote_data_source.dart';
import 'package:sugar_pros/core/models/provider_ai_chatlist_response.dart';
import 'package:sugar_pros/core/services/provider_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class PdAiChatHistoryViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ProviderService _providerService = locator<ProviderService>();

  final ProviderRemoteDataSource _providerRemoteDataSource = locator<ProviderRemoteDataSource>();

  List<ProviderAIChatList>? get providerAIChatList => _providerService.providerAiChatList;

  Map<String, List<ProviderAIChatList>> groupAIChatListByDate() {
    final grouped = <String, List<ProviderAIChatList>>{};
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    // Initialize empty lists for Today and Yesterday to ensure they appear in result
    // even if there are no transactions for these days
    grouped['Today'] = [];
    grouped['Yesterday'] = [];

    for (final ProviderAIChatList aiChat in providerAIChatList ?? []) {
      // Parse the transaction date
      final transactionDate = DateTime.parse(aiChat.createdAt ?? '');
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

      // Initialize the list if it doesn't exist
      grouped[dateLabel] ??= [];

      // Add the transaction to the appropriate list
      grouped[dateLabel]!.add(aiChat);
    }

    // Create a sorted map with custom ordering
    final sortedMap = <String, List<ProviderAIChatList>>{};

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

  void navigateToAIChatView(ProviderAIChatList? chatList) {
    _navigationService.navigateTo(Routes.pdAiChatView, arguments: chatList);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_providerService];
}
