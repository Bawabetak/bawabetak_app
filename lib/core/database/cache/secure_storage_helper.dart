import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  SecureStorageHelper._();
  static final instance = SecureStorageHelper._();
  factory SecureStorageHelper() => instance;

  // Write (Save) Data Securely
  Future<void> set({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  // Read Data Securely
  Future<String?> get({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  // Delete Specific Key
  Future<void> remove({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  // Clear All Secure Data
  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }

  // Check if Key Exists
  Future<bool> containsKey({required String key}) async {
    return await _secureStorage.containsKey(key: key);
  }
}
