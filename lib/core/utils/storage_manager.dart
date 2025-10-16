import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageManager {
  static final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  // Save the FCM token
  static Future<void> saveToken(String key, String token) async {
    await _secureStorage.write(key: key, value: token);
  }

  // Get the FCM token
  static Future<String?> getToken(String key) async {
    return await _secureStorage.read(key: key);
  }

  // Delete the FCM token
  static Future<void> deleteToken(String key) async {
    await _secureStorage.delete(key: key);
  }
}
