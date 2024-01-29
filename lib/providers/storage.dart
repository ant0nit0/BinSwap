import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StorageKeys {
  static const audioBackground = 'audioBackground';
}

class StorageService {
  late FlutterSecureStorage _storage;

  StorageService() {
    _storage = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true));

    _checkInit();
  }

  _checkInit() async {
    try {
      await _storage.read(key: StorageKeys.audioBackground);
    } on PlatformException catch (_) {
      // Workaround for https://github.com/mogol/flutter_secure_storage/issues/43
      await _storage.deleteAll();
    }
  }

  FlutterSecureStorage get storage => _storage;
}

final storageServiceProvider = Provider((ref) => StorageService());
