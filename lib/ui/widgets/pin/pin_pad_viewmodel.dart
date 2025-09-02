import 'package:sugar_pros/core/services/biometric_service.dart';
import 'package:sugar_pros/core/services/secure_storage_service.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/core/utils/store_id.dart';
import 'package:local_auth/local_auth.dart';

class PinPadViewModel extends BaseViewModel {
  final BiometricService _biometricService = locator<BiometricService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final StorageService _storageService = locator<StorageService>();
  final SecureStorageService _secureStorageService = locator<SecureStorageService>();

  bool get useBiometricTransaction =>
      _storageService.getBool(StoreId.useBiometricTransaction) ?? false;
  String? storedPin;
  LocalAuthentication localAuth = LocalAuthentication();
  bool? isBiometricsAvailable;
  bool? isDeviceSupported;

  Future setup() async {
    _biometricService.setBiometricData();
    storedPin = await _secureStorageService.readPIN();
    isBiometricsAvailable = _biometricService.isBiometricsAvailable;
    isDeviceSupported = _biometricService.isDeviceSupported;

    log('Use biometric: $useBiometricTransaction');
    log('isBiometricsAvailable: $isBiometricsAvailable');
    log('isDeviceSupported: $isDeviceSupported');
    log('Stored Pin: $storedPin');
    notifyListeners();
  }

  String _pin = '';
  String get pin => _pin;
  set pin(String? val) {
    if ((_pin.length) < 4) {
      _pin = '$pin$val';
      log('Pin: $pin');
    }
    notifyListeners();
  }

  void deletePin() {
    _pin = pin.substring(0, (pin.length) - 1);
    notifyListeners();
  }

  Future authenticateWithBiometrics({required ValueChanged<String> onDone}) async {
    if ((isBiometricsAvailable ?? false) && (isDeviceSupported ?? false)) {
      try {
        final bool didAuthenticate = await localAuth.authenticate(
          localizedReason: 'Authenticate with biometrics',
          options: const AuthenticationOptions(stickyAuth: true),
        );

        if (didAuthenticate) {
          _navigationService.back();
          onDone(storedPin ?? '');
        }
      } catch (e) {
        flusher(
          'An error occured with biometrics.\nPlease ensure biometrics is enabled on this device',
          color: Colors.red,
        );
      }
    } else {
      flusher(
        'An error occured with biometrics.\nPlease ensure biometrics is enabled on this device',
        color: Colors.red,
      );
    }
  }
}
