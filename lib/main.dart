import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:sugar_pros/firebase_options.dart';
import 'package:root_jailbreak_sniffer/rjsniffer.dart';
import 'package:sugar_pros/core/constants/setup_dialog.dart';
import 'package:sugar_pros/core/managers/lifecycle_manager.dart';
import 'package:sugar_pros/core/services/push_notification/push_notification_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/core/utils/preload_images_util.dart';
import 'package:sugar_pros/styles/theme/theme.dart' as theme;
import 'package:sugar_pros/ui/views/splash/splash_view.dart';

final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

bool get isInDebugMode {
  // Assume you're in production mode.
  bool inDebugMode = false;

  // Assert expressions are only evaluated during development. They are ignored
  // in production. Therefore, this code only sets `inDebugMode` to true
  // in a development environment.
  assert(inDebugMode = true);

  return inDebugMode;
}

Future<void> reportError(dynamic error, dynamic stackTrace) async {
  // Print the exception to the console.
  log('Caught error: $error');
  if (isInDebugMode) {
    // Print the full stacktrace in com.app.tatum_bank_mobiledebug mode.
    log(stackTrace);
  } else {
    // Send the Exception and Stacktrace to Crashlytics in Production mode.
    _crashlytics.recordError(error, stackTrace, fatal: true);
  }
}

Future deviceStatusCheck() async {
  const platform = MethodChannel('device_check');

  final bool isJailBroken = await Rjsniffer.amICompromised() ?? false;
  final bool isEmulator = await Rjsniffer.amIEmulator() ?? false;
  bool isFridaDetected = false;

  if (Platform.isAndroid) {
    isFridaDetected =
        await platform.invokeMethod<bool>('isFridaDetected') ?? false;
  }

  if (isJailBroken || isEmulator || isFridaDetected) {
    exit(0);
  }
}

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    /// Init Firebase setup
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    /// Log all creashlytics errors
    setupLogger(firebaseClient: _crashlytics);

    /// Configure Device Theme
    SystemChrome.setSystemUIOverlayStyle(Utils.lightdarkNav);

    /// Configure all dependencies
    await setupLocator();

    await PreloadImageUtil.loadCacheImages();
    await PushNotificationService.initialize();

    if (kReleaseMode) {
      deviceStatusCheck();
    }

    /// Only collect Crashlytics once the app is in release mode
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
      kReleaseMode,
    );

    /// Setup dialogs for loaders and all kinds of dialog screens
    setupDialog();

    runApp(App());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class App extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder:
          (c, _) => LifeCycleManager(
            child: MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: MaterialApp(
                title: 'Sugar Pros',
                debugShowCheckedModeBanner: false,
                onGenerateRoute: Routers().onGenerateRoute,
                navigatorKey: StackedService.navigatorKey,
                theme: theme.lightTheme,
                home: const SplashView(),
                navigatorObservers: [
                  StackedService.routeObserver,
                  FirebaseAnalyticsObserver(analytics: analytics),
                ],
              ),
            ),
          ),
    );
  }
}
