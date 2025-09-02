import 'package:intl/intl.dart';

// class DateFormatUtil {
//   DateFormatUtil._();

//   static final dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm a');
//   static final dateFormat = DateFormat('dd MMM, yyyy');
//   static final monthDateYearTimeFormat = DateFormat('MMM dd, yyyy hh:mm a');
//   static final eventDate = DateFormat('E MMM dd, yyyy');
//   static final chartFormat = DateFormat('dd-MMM-yy');
//   static final ddMMMYYYY = DateFormat('dd-MMM-yyyy');
//   static final dddashmmdashyyyy = DateFormat('dd-MM-yyyy');
//   static final timeFormat = DateFormat('hh:mm a');
//   static final dateMonthTimeFormat = DateFormat('dd MMM, hh:mm a');
//   static final dayMonthFormat = DateFormat('E MMM dd, yyyy');
//   static final dayFormat = DateFormat('E');
//   static final yyyymmddTime = DateFormat('yyyy-MM-dd hh:mm a');
//   static final yyyymmdd = DateFormat('yyyy-MM-dd');
//   static final ddmmyyyy2 = DateFormat('yyyy-MM-dd');
//   static final ddmmyyyy = DateFormat('dd/MM/yyyy');
//   static final mmmddyyy = DateFormat('dd MMM, yyyy');
//   static final mmyyyy = DateFormat('MM/yyyy');
//   static final mMMyyyy = DateFormat('MMM yyyy');
//   static final mMMMyyyy = DateFormat('MMMM yyyy');
//   static final monthDate = DateFormat('MMMM dd');
//   static final transactionDate = DateFormat('dd-MM-yyyy hh:mm a');
//   static final transactionDate2 = DateFormat('dd/MM/yyyy hh:mm a');

//   static String formatDate(String date) =>
//       DateFormat('MMM dd, yyyy. hh:mm a').format(DateTime.parse(date));

//   static String mDY(String date) => DateFormat('MMM d, y').format(DateTime.parse(date));

//   static String loanTime(String date) => DateFormat('h:mm a').format(DateTime.parse(date));

//   static String formatTransactionDate(String date) =>
//       DateFormat('yyyy-MM-dd').format(DateTime.parse(date));

//   static String formatTransactionDateTime(String date) =>
//       DateFormat('yyyy-MM-dd h:mm a').format(DateTime.parse(date));

//   static String formatTime(String? time) {
//     if (time == null || time.isEmpty) {
//       return '';
//     }
//     try {
//       return timeFormat.format(DateFormat('HH:mm:ss').parse(time));
//     } catch (e) {
//       // Handle the exception if parsing fails
//       return '';
//     }
//   }

//   static String safeDateParse(String? date) {
//     if (date == null || date.isEmpty) return '';
//     try {
//       final parsed = DateFormat('yyyy-M-d').parse(date); // handles 2025-06-9
//       return parsed.toString();
//     } catch (e) {
//       return '';
//     }
//   }
// }
class DateFormatUtil {
  DateFormatUtil._();

  // Common formats
  static final dateTimeFormat = DateFormat('dd MMM yyyy, hh:mm a');
  static final dateFormat = DateFormat('dd MMM, yyyy');
  static final monthDateYearTimeFormat = DateFormat('MMM dd, yyyy hh:mm a');
  static final eventDate = DateFormat('E MMM dd, yyyy');
  static final chartFormat = DateFormat('dd-MMM-yy');
  static final ddMMMYYYY = DateFormat('dd-MMM-yyyy');
  static final dddashmmdashyyyy = DateFormat('dd-MM-yyyy');
  static final timeFormat = DateFormat('hh:mm a');
  static final dateMonthTimeFormat = DateFormat('dd MMM, hh:mm a');
  static final dayMonthFormat = DateFormat('E MMM dd, yyyy');
  static final dayFormat = DateFormat('E');
  static final yyyymmddTime = DateFormat('yyyy-MM-dd hh:mm a');
  static final yyyymmdd = DateFormat('yyyy-MM-dd');
  static final ddmmyyyy2 = DateFormat('yyyy-MM-dd');
  static final ddmmyyyy = DateFormat('dd/MM/yyyy');
  static final mmmddyyy = DateFormat('dd MMM, yyyy');
  static final mmyyyy = DateFormat('MM/yyyy');
  static final mMMyyyy = DateFormat('MMM yyyy');
  static final mMMMyyyy = DateFormat('MMMM yyyy');
  static final monthDate = DateFormat('MMMM dd');
  static final transactionDate = DateFormat('dd-MM-yyyy hh:mm a');
  static final transactionDate2 = DateFormat('dd/MM/yyyy hh:mm a');

  /// --- Private Helpers ---
  static DateTime? _safeParse(String? date) {
    if (date == null || date.isEmpty) return null;
    try {
      // Handles both `2025-06-9` and `2025-06-09`
      return DateFormat('yyyy-M-d').parse(date);
    } catch (_) {
      return null;
    }
  }

  static String safeFormat(String? date, DateFormat format) {
    final parsed = _safeParse(date);
    if (parsed == null) return '';
    return format.format(parsed);
  }

  static DateTime? _safeParseTime(String? time) {
    if (time == null || time.isEmpty) return null;
    try {
      // Try with seconds first
      return DateFormat('HH:mm:ss').parse(time);
    } catch (_) {
      try {
        // Fallback: just hours and minutes
        return DateFormat('HH:mm').parse(time);
      } catch (_) {
        return null;
      }
    }
  }

  static int? getAge(String? dob) {
    if (dob == null || dob.isEmpty) return null;

    try {
      // Parse both padded and unpadded
      final birthDate = DateFormat('yyyy-M-d').parse(dob);
      final today = DateTime.now();

      int age = today.year - birthDate.year;

      // If birthday hasn’t occurred yet this year, subtract 1
      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }
      return age;
    } catch (_) {
      return null; // invalid date format
    }
  }

  static String formatMessageTime(String? isoDateTime) {
    if (isoDateTime == null || isoDateTime.isEmpty) return '';

    try {
      // Parse the ISO string safely
      final parsed = DateTime.parse(isoDateTime).toLocal();
      // Convert to local time before formatting

      return DateFormat('HH:mm a').format(parsed); // 24-hour format
      // Or use 'hh:mm a' for AM/PM format
    } catch (_) {
      return '';
    }
  }

  static String formatTime(String? time) {
    final parsed = _safeParseTime(time);
    if (parsed == null) return '';
    return timeFormat.format(parsed); // → '02:00 PM'
  }

  /// --- Refactored methods using safeFormat ---
  static String formatDate(String? date) => safeFormat(date, DateFormat('MMM dd, yyyy. hh:mm a'));

  static String mDY(String? date) => safeFormat(date, DateFormat('MMM d, y'));

  static String loanTime(String? date) => safeFormat(date, DateFormat('h:mm a'));

  static String formatTransactionDate(String? date) => safeFormat(date, DateFormat('yyyy-MM-dd'));

  static String formatTransactionDateTime(String? date) =>
      safeFormat(date, DateFormat('yyyy-MM-dd h:mm a'));

  // static String formatTime(String? time) {
  //   if (time == null || time.isEmpty) {
  //     return '';
  //   }
  //   try {
  //     return timeFormat.format(DateFormat('HH:mm:ss').parse(time));
  //   } catch (_) {
  //     return '';
  //   }
  // }
}
