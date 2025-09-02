import 'package:intl/intl.dart';
import 'package:sugar_pros/core/enums/transaction_service_type.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Utils {
  static EdgeInsets padding = EdgeInsets.only(
    top: MediaQuery.of(StackedService.navigatorKey!.currentContext!).padding.top + 40.h,
    left: 20.w,
    right: 20.w,
    bottom: 40.h,
  );

  static double statusBarPadding =
      MediaQuery.of(StackedService.navigatorKey!.currentContext!).padding.top;

  static double get buttonVerticalPadding => Platform.isIOS ? 40.h : 10.h;

  static final normalFormatter =
      NumberFormat('#,###.##')
        ..minimumFractionDigits = 2
        ..maximumFractionDigits = 2;

  static final SystemUiOverlayStyle darkTheme =
      Platform.isIOS
          ? const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness:
                Brightness.dark, 
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light,
          )
          : const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarContrastEnforced: false,
          );

  static final SystemUiOverlayStyle lightTheme =
      Platform.isIOS
          ? const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          )
          : const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarContrastEnforced: false,
          );

  static final SystemUiOverlayStyle light =
      Platform.isIOS
          ? const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.dark,
          )
          : const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.dark,
          );

  static final SystemUiOverlayStyle transparent =
      Platform.isIOS
          ? const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
          )
          : const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
          );

  static final SystemUiOverlayStyle lightWhiteNav =
      Platform.isIOS
          ? const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          )
          : const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.light,
          );

  static final SystemUiOverlayStyle lightdarkNav =
      Platform.isIOS
          ? const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          )
          : const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
          );

  static final SystemUiOverlayStyle lightThemeNav =
      Platform.isIOS
          ? const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
          )
          : const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          );

  static SystemUiOverlayStyle darkThemeNav({Color? navColor}) {
    if (Platform.isIOS) {
      return SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: navColor ?? Color(0xFF021325),
        systemNavigationBarIconBrightness: Brightness.dark,
      );
    } else {
      return SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: navColor ?? Color(0xFF021325),
        systemNavigationBarIconBrightness: Brightness.dark,
      );
    }
  }

  static final SystemUiOverlayStyle dark =
      Platform.isIOS
          ? const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.dark,
          )
          : const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.dark,
          );

  static final SystemUiOverlayStyle lightNav =
      Platform.isIOS
          ? const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarContrastEnforced: false,
          )
          : const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarContrastEnforced: false,
          );

  static final SystemUiOverlayStyle darkThemeUi =
      Platform.isIOS
          ? const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarContrastEnforced: false,
          )
          : const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarContrastEnforced: false,
          );

  static SystemUiOverlayStyle getAdaptiveSystemUiOverlayStyle(bool isDarkMode) {
    if (Platform.isIOS) {
      return SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarContrastEnforced: false,
      );
    } else {
      return SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarContrastEnforced: false,
      );
    }
  }

  static String greetingMessage() {
    final timeNow = DateTime.now().hour;

    if (timeNow < 12) {
      return 'Good Morning';
    } else if ((timeNow >= 12) && (timeNow < 16)) {
      return 'Good Afternoon';
    } else if ((timeNow >= 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Evening';
    }
  }

  static NumberFormat currencyFormatter({String? currency, int? decimal}) {
    return NumberFormat.simpleCurrency(name: currency ?? 'NGN', decimalDigits: decimal ?? 0);
  }

  static PinTheme roundedBoxPinField(BuildContext context) => PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(10.r),
    borderWidth: 0,
    fieldHeight: 61.h,
    fieldWidth: 50.w,
    activeFillColor: Theme.of(context).colorScheme.inversePrimary,
    inactiveFillColor: Theme.of(context).colorScheme.inversePrimary,
    activeColor: Colors.transparent,
    inactiveColor: Colors.transparent,
    selectedColor: Theme.of(context).colorScheme.inversePrimary,
    selectedFillColor: Theme.of(context).colorScheme.inversePrimary,
  );

  static int getTransactionServiceType(TransactionServiceType val) {
    int type;
    switch (val) {
      case TransactionServiceType.ownAccountTransfer:
        type = 1;
        break;
      case TransactionServiceType.localTransfer:
        type = 2;
        break;
      case TransactionServiceType.interbankTransfer:
        type = 3;
        break;
      case TransactionServiceType.billPayment:
        type = 4;
        break;
      case TransactionServiceType.airtimePurchase:
        type = 5;
        break;
    }
    return type;
  }

  static TransactionServiceType getTransactionServiceTypefromIndex(int val) {
    TransactionServiceType type;
    switch (val) {
      case 1:
        type = TransactionServiceType.ownAccountTransfer;
        break;
      case 2:
        type = TransactionServiceType.localTransfer;
        break;
      case 3:
        type = TransactionServiceType.interbankTransfer;
        break;
      case 4:
        type = TransactionServiceType.billPayment;
        break;
      case 5:
        type = TransactionServiceType.airtimePurchase;
        break;
      default:
        type = TransactionServiceType.airtimePurchase;
    }
    return type;
  }

  static String generateTransactionReference() {
    final DateTime now = DateTime.now();
    final String timestamp = now.millisecondsSinceEpoch.toString();
    final String randomString = _generateRandomString(5);
    return "TXN$timestamp$randomString";
  }

  static String _generateRandomString(int length) {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random random = Random();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }

  static String generateFakeDeviceId() {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random.secure();

    return List.generate(16, (index) => chars[rand.nextInt(chars.length)]).join();
  }

  static List<DropdownMenuItem<T>> getDropdownItem<T>(List<T> items) {
    return items.map((T value) {
      return DropdownMenuItem<T>(
        value: value,
        child: Text(
          '$value',
          style: Theme.of(
            StackedService.navigatorKey!.currentContext!,
          ).textTheme.headlineMedium!.copyWith(fontSize: 14.sp, color: Colors.black),
        ),
      );
    }).toList();
  }

  static String getLogoBankName(String bank) {
    String temp = '';
    if (bank.toLowerCase().contains('fcmb')) {
      temp = 'first-city-monument-bank';
    } else if (bank.toLowerCase().contains('fidelity')) {
      temp = 'fidelity-bank';
    } else if (bank.toLowerCase().contains('ecobank')) {
      temp = 'ecobank-nigeria';
    } else if (bank.toLowerCase().contains('standard')) {
      temp = 'standard-chartered-bank';
    } else if (bank.toLowerCase().contains('stanbic')) {
      temp = 'stanbic-ibtc-bank';
    } else if (bank.toLowerCase().contains('united')) {
      temp = 'united-bank-for-africa';
    } else if (bank.toLowerCase().contains('kuda')) {
      temp = 'kuda-bank';
    } else if (bank.toLowerCase().contains('gtbank')) {
      temp = 'guaranty-trust-bank';
    } else if (bank.toLowerCase().contains('heritage')) {
      temp = 'heritage_bank';
    } else if (bank.toLowerCase().contains('access')) {
      temp = 'access-bank';
    } else {
      temp = bank.toLowerCase().replaceAll(' ', '-');
    }

    return temp;
  }
}
