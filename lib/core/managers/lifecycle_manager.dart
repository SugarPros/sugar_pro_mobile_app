import 'dart:async';
import 'package:sugar_pros/core/models/user/user.dart';
import 'package:sugar_pros/core/services/user_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;
  const LifeCycleManager({super.key, required this.child});

  @override
  State<LifeCycleManager> createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager> with WidgetsBindingObserver {
  // final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final UtilityService _utilityService = locator<UtilityService>();
  // final SecureStorageService _secureStorageService = locator<SecureStorageService>();

  User? get user => _userService.user;
  static const String env = String.fromEnvironment('app.env');

  // Token configuration
  // static const int _tokenExpiryMinutes = 10; // Total token lifetime
  // static const int _refreshBeforeExpiryMinutes = 2; // Refresh this many minutes before expiry

  // Inactivity timeout
  static const _inactivityTimeout = Duration(minutes: env == 'dev' ? 10 : 5);

  Timer? _inactivityTimer;
  Timer? _refreshTokenTimer;
  Timer? _countdownTimer;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _resetInactivityTimer();
    // _refreshToken();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _inactivityTimer?.cancel();
    _refreshTokenTimer?.cancel();
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _countdownTimer?.cancel();

    // Set remaining seconds to total timeout duration
    _remainingSeconds = _inactivityTimeout.inSeconds;

    Logger.d('Inactivity timer reset. Countdown: $_remainingSeconds seconds remaining');

    // Start the main inactivity timer
    _inactivityTimer = Timer(_inactivityTimeout, _handleInactivityTimeout);

    // Start countdown timer that ticks every second
    _startCountdownTimer();
  }

  void _startCountdownTimer() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _remainingSeconds--;

      // Log remaining time at regular intervals (every 30 seconds and final 10 seconds)
      if (_remainingSeconds <= 10 || _remainingSeconds % 30 == 0) {
        Logger.d('Inactivity countdown: $_remainingSeconds seconds remaining');
      }

      if (_remainingSeconds <= 0) {
        _countdownTimer?.cancel();
      }
    });
  }

  void _handleInactivityTimeout() {
    if (_utilityService.signedIn) {
      Logger.w('User inactive for ${_inactivityTimeout.inMinutes} minutes. Logging out.');
      // _navigationService.clearStackAndShow(Routes.login);
      _utilityService.setSignedIn(false);
    }
  }

  // Future _refreshToken() async {
  //   final refreshDelay = Duration(minutes: _tokenExpiryMinutes - _refreshBeforeExpiryMinutes);
  //   _refreshTokenTimer = Timer.periodic(refreshDelay, (timer) async {
  //     if (_utilityService.signedIn) {
  //       final data = await _authRemoteDataSource.refreshToken(
  //         accessToken: await _secureStorageService.readToken(),
  //         refreshToken: await _secureStorageService.readRefreshToken(),
  //       );

  //       data.fold(
  //         (l) {
  //           Logger.e('Token refresh failed: ${l.message}');
  //           // Try again in 1 minute if refresh fails
  //           _refreshTokenTimer = Timer(const Duration(minutes: 1), _refreshToken);
  //         },
  //         (r) async {
  //           Logger.d('Token refreshed successfully');

  //           await _secureStorageService.writeToken(r.accessToken);
  //           await _secureStorageService.writeRefreshToken(r.refreshToken);

  //         },
  //       );
  //     }
  //   });
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    Logger.d('AppLifecycleState: $state');

    switch (state) {
      case AppLifecycleState.resumed:
        _resetInactivityTimer();
        // _refreshToken();
        break;
      case AppLifecycleState.detached:
        _inactivityTimer?.cancel();
        _refreshTokenTimer?.cancel();
        _countdownTimer?.cancel();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        break;
    }
  }

  /// --- BUILD ---
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Logger.d('Tap detected — reset inactivity');
        _resetInactivityTimer();
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      onPanDown: (_) {
        Logger.d('Pan detected — reset inactivity');
        _resetInactivityTimer();
      },
      child: widget.child,
    );
  }
}
