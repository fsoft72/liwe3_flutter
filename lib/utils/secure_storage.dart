import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:liwe3/utils/debug.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  Future<void> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
    } catch (e) {
      // Handle exceptions related to writing to secure storage
      zprint('Error writing to secure storage: $e');
    }
  }

  Future<String?> read(
    String key, {
    int retryCount = 3,
    int retryDelay = 200,
  }) async {
    int attemptCount = 0;
    String? value;

    while (attemptCount < retryCount) {
      try {
        value = await _storage.read(key: key);
        break; // Exit the loop if the read operation is successful
      } catch (e) {
        attemptCount++;
        if (attemptCount == retryCount) {
          // Handle exceptions related to reading from secure storage after all retries
          zprint('Error reading from secure storage after $retryCount attempts: $e');
        } else {
          // Wait for the specified delay before retrying
          await Future.delayed(Duration(milliseconds: retryDelay));
        }
      }
    }

    return value;
  }

  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (e) {
      // Handle exceptions related to deleting from secure storage
      zprint('Error deleting from secure storage: $e');
    }
  }

  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      // Handle exceptions related to deleting the entire secure storage
      zprint('Error deleting secure storage: $e');
    }
  }
}
