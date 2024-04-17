import 'dart:io';

import 'package:liwe3/utils/debug.dart';
import 'package:liwe3/utils/encryption.dart';
import 'package:liwe3/utils/path.dart';

class SecureStorage {
  bool isReady = false;
  String basePath = '';
  final Map<String, String> _storage = {};
  final int seeder;
  String masterPassword = '';
  String storagePath = '';

  SecureStorage(this.seeder) {
    init();
  }

  Future<void> init() async {
    basePath = await getAppDir();
    storagePath = '$basePath/.storage';

    // create basePath + ".storage" folder if not exists
    if (!Directory(storagePath).existsSync()) {
      Directory(storagePath).createSync();
    }

    // create the masterPassword
    masterPassword = toMD5(seeder.toString());

    isReady = true;
  }

  Future<bool> _saveToFile(String key, String value) async {
    try {
      final file = File('$storagePath/$key');
      // convert value to encrypted string
      final encryptedValue = encryptString(value, masterPassword);

      await file.writeAsString(encryptedValue);
      return true;
    } catch (e) {
      zprint('Error saving $key to file: $e');
      return false;
    }
  }

  Future<String?> _readFromFile(String key) async {
    try {
      final file = File('$storagePath/$key');
      final encryptedValue = await file.readAsString();
      // convert encrypted value to decrypted string
      final decryptedValue = decryptString(encryptedValue, masterPassword);

      return decryptedValue;
    } catch (e) {
      zprint('Error reading $key from file: $e');
      return null;
    }
  }

  Future<void> write(String key, String value) async {
    if (!isReady) await init();
    try {
      _storage[key] = value;

      await _saveToFile(key, value);
    } catch (e) {
      // Handle exceptions related to writing to secure storage
      zprint('Error writing to secure storage: $e');
    }
  }

  Future<String?> read(String key) async {
    if (!isReady) await init();
    try {
      if (_storage.containsKey(key)) return _storage[key];

      final value = await _readFromFile(key);
      if (value != null) _storage[key] = value;

      return value;
    } catch (e) {
      // Handle exceptions related to reading from secure storage
      zprint('Error reading from secure storage: $e');
      return null;
    }
  }

  Future<void> delete(String key) async {
    try {
      _storage.remove(key);

      final file = File('$storagePath/$key');
      await file.delete();
    } catch (e) {
      // Handle exceptions related to deleting from secure storage
      zprint('Error deleting $key from secure storage: $e');
    }
  }

  Future<void> clear() async {
    try {
      _storage.clear();

      final dir = Directory(storagePath);
      await dir.delete(recursive: true);

      // create basePath + ".storage" folder if not exists
      if (!Directory(storagePath).existsSync()) {
        Directory(storagePath).createSync();
      }
    } catch (e) {
      // Handle exceptions related to clearing secure storage
      zprint('Error clearing secure storage: $e');
    }
  }
}
