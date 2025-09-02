import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sugar_pros/core/utils/exports.dart';
import 'package:sugar_pros/core/utils/store_id.dart';

class SecureStorageService with ListenableServiceMixin {
  final _secureStorage = const FlutterSecureStorage();

  Future writeToken(String? token) async {
    await _secureStorage.write(key: StoreId.accessToken, value: token);
  }

  Future<String?> readToken() async {
    return await _secureStorage.read(key: StoreId.accessToken);
  }

  Future deleteToken() async {
    await _secureStorage.delete(key: StoreId.accessToken);
  }

  Future writeRefreshToken(String? refreshToken) async {
    await _secureStorage.write(key: StoreId.refreshToken, value: refreshToken);
  }

  Future<String?> readRefreshToken() async {
    return await _secureStorage.read(key: StoreId.refreshToken);
  }

  Future writePIN(String? pin) async {
    await _secureStorage.write(key: StoreId.pin, value: pin);
  }

  Future<String?> readPIN() async {
    return await _secureStorage.read(key: StoreId.pin);
  }

  Future writePassword(String? password) async {
    await _secureStorage.write(key: StoreId.password, value: password);
  }

  Future<String?> readPassword() async {
    return await _secureStorage.read(key: StoreId.password);
  }

  Future storeCredentials({
    required String? accessToken,
    required String? refreshToken,
    required String? password,
  }) async {
    await _secureStorage.write(key: StoreId.accessToken, value: accessToken ?? '');
    await _secureStorage.write(key: StoreId.refreshToken, value: refreshToken ?? '');
    await _secureStorage.write(key: StoreId.password, value: password ?? '');
  }

  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
