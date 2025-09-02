import 'package:sugar_pros/core/utils/exports.dart';
import 'package:intl/intl.dart';

extension AssetName on String {
  String get svg => 'assets/svgs/$this.svg';
  String get png => 'assets/images/$this.png';
  String get jpeg => 'assets/images/$this.jpeg';
  String get jpg => 'assets/images/$this.jpg';
  String get gif => 'assets/gifs/$this.gif';
  bool get isPasswordValid =>
      RegExp(r'(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,15}$)').hasMatch(this);
  bool get passwordHasSmallLetters => RegExp(r'(?=.*[a-z])').hasMatch(this);
  bool get passwordHasCapitalLetters => RegExp(r'(?=.*[A-Z])').hasMatch(this);
  bool get passwordHasSymbols => RegExp(r'(?=.*[!@#\$%\^&\*])').hasMatch(this);
  bool get passwordHasNumber => RegExp(r'(?=.*[0-9])').hasMatch(this);
  bool get passwordIsInRange => RegExp(r'(?=.{8,15}$)').hasMatch(this);
  String capitalizeAllFirst() {
    if (length < 1) {
      return this;
    } else {
      String temp = '';
      final List<String> dusted = [];
      for (final String item in split(' ')) {
        if (item.trim() != '') {
          dusted.add(item);
        }
      }
      for (final String item in dusted) {
        temp +=
            "${item.trim()[0].toUpperCase()}${item.trim().substring(1).toLowerCase()}${split(' ').indexOf(item) == split(' ').length - 1 ? '' : ' '}";
      }
      return temp;
    }
  }

  String maskMiddle() {
    final List<String> texts = split('');
    if (texts.length < 2) {
      return this;
    } else {
      String temp = '';
      int ind = 0;
      for (final String item in texts) {
        if (ind > 2 && ind < texts.length - 3) {
          temp += '*';
        } else {
          temp += item;
        }
        ind += 1;
      }
      return temp;
    }
  }

  String firstLast4() {
    final List<String> texts = split('');
    if (texts.length < 8) {
      return this;
    } else {
      return '${substring(0, 4)}...${substring(length - 4, length)}';
    }
  }

  double toAmountDouble() {
    if (isEmpty) return 0.0;
    final cleaned = contains(',') ? replaceAll(',', '') : this;
    return double.parse(cleaned);
  }

  String last4() {
    final List<String> texts = split('');
    if (texts.length < 8) {
      return this;
    } else {
      return '*****${substring(length - 4, length)}';
    }
  }

  String toLocalPhoneNumber() {
    if (startsWith('+234')) {
      return replaceFirst('+234', '0');
    }
    return this;
  }

  String toPhoneNumber() {
    String number = trim();

    if (number.startsWith('+')) {
      // If it already starts with +, return as is (remove extra '+' if any)
      return '+${number.replaceAll('+', '').trim()}';
    } else if (number.startsWith('0')) {
      // Remove the starting 0 and add +234
      return '+234${number.substring(1)}';
    } else {
      // In case it's already a proper number without +, just add it
      return '+$number';
    }
  }

  int? get tierNumber {
    final regex = RegExp(r'Tier(\d+)');
    final match = regex.firstMatch(this);
    if (match != null && match.groupCount >= 1) {
      return int.tryParse(match.group(1)!);
    }
    return null;
  }

  String spaceCardNumber() {
    String val = '';
    List<String> items = split('');
    int id = 0;
    for (String i in items) {
      val += i;
      id++;
      if (id == 4) {
        val += ' ';
        id = 0;
      }
    }
    return val;
  }

  String addSlash() {
    String val = '';
    List<String> items = split('');
    int id = 0;
    for (String i in items) {
      val += i;
      id++;
      if (id == 2) {
        val += '/';
      }
    }
    return val;
  }

  String get walletNumber => replaceAll('+234', '');

  String withArticle() {
    if (isEmpty) return '';
    String firstLetter = this[0].toLowerCase();
    if ('aeiou'.contains(firstLetter)) {
      return 'an $this';
    } else {
      return 'a $this';
    }
  }

  String addSpaces() {
    return replaceAllMapped(RegExp(r'([a-z])([A-Z])'), (match) {
      return '${match.group(1)} ${match.group(2)}';
    });
  }
}

extension MetersToKilometers on double {
  String toKilometers() {
    double kilometers = this / 1000;
    return '${kilometers.toStringAsFixed(2)} km away';
  }
}

extension LastSeenExtension on DateTime {
  String toLastSeen() {
    final Duration difference = DateTime.now().difference(this);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      if (difference.inMinutes == 1) {
        return '${difference.inMinutes} minute ago';
      } else {
        return '${difference.inMinutes} minutes ago';
      }
    } else if (difference.inHours < 24) {
      if (difference.inHours == 1) {
        return '${difference.inMinutes} hour ago';
      } else {
        return '${difference.inHours} hours ago';
      }
    } else if (difference.inDays < 7) {
      if (difference.inDays == 1) {
        return '${difference.inDays} day ago';
      } else {
        return '${difference.inDays} days ago';
      }
    } else {
      return DateFormat('yyyy-MM-dd').format(this); // Full date if older than 7 days
    }
  }
}

extension DarkMode on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}

extension ThemeDataExtensions on ThemeData {
  Color get svgColor => brightness == Brightness.dark ? Colors.white : Colors.black;

  Color get iconColor =>
      brightness == Brightness.dark ? const Color(0xFFF5B906) : const Color(0xFF292D32);

  Color get filledColor => brightness == Brightness.dark ? Colors.white : Colors.black;

  Color get disbledFillColor =>
      brightness == Brightness.dark ? const Color(0xFF202020) : const Color(0xFFF5F5F5);

  Color get borderColor => brightness == Brightness.dark ? Colors.white : Colors.black;
}

extension RandomPhoneNumberGenerator on Random {
  static final Set<String> _generatedNumbers = {};

  String generateUniquePhoneNumber() {
    String phoneNumber;
    do {
      final randomPart = List.generate(6, (_) => nextInt(10)).join();
      phoneNumber = '+2348166$randomPart';
    } while (_generatedNumbers.contains(phoneNumber));

    _generatedNumbers.add(phoneNumber);
    return phoneNumber;
  }
}
