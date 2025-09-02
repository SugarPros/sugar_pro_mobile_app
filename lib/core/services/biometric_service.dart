import 'package:sugar_pros/core/utils/exports.dart';
import 'package:local_auth/local_auth.dart';

class BiometricService with ListenableServiceMixin {
  LocalAuthentication localAuth = LocalAuthentication();

  bool _isBiometricsAvailable = false;
  bool get isBiometricsAvailable => _isBiometricsAvailable;

  bool _isDeviceSupported = false;
  bool get isDeviceSupported => _isDeviceSupported;

  List<BiometricType> _biometricType = [];
  List<BiometricType> get biometricType => _biometricType;

  BiometricService(){
    listenToReactiveValues([
      _isBiometricsAvailable,
      _isDeviceSupported,
      _biometricType
    ]);
  }

  Future setBiometricData() async{
    _isBiometricsAvailable = await localAuth.canCheckBiometrics;
    _biometricType = await localAuth.getAvailableBiometrics();
    _isDeviceSupported = await localAuth.isDeviceSupported();
    Logger.d('Biometric available: $_isBiometricsAvailable');
    Logger.d('Diometric device support: $_isDeviceSupported');
    notifyListeners();
  }
}