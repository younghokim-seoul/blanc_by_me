import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storageProvider = Provider.autoDispose<FlutterSecureStorage>((ref) {
  ref.keepAlive();
  return const FlutterSecureStorage();
});

final secureStorageProvider = Provider.autoDispose<SecureStorage>((ref) {
  final FlutterSecureStorage storage = ref.read(storageProvider);
  ref.keepAlive();
  return SecureStorage(storage: storage);
});


class SecureStorage {
  final FlutterSecureStorage storage;

  SecureStorage({
    required this.storage,
  });


  Future<void> saveRefreshToken(String refreshToken) async {
    try {
      print('[SECURE_STORAGE] saveRefreshToken: $refreshToken');
      await storage.write(key: "REFRESH_TOKEN", value: refreshToken);
    } catch (e) {
      print("[ERR] RefreshToken 저장 실패: $e");
    }
  }

  Future<String?> readRefreshToken() async {
    try {
      final refreshToken = await storage.read(key: "REFRESH_TOKEN");
      print('[SECURE_STORAGE] readRefreshToken: $refreshToken');
      return refreshToken;
    } catch (e) {
      print("[ERR] RefreshToken 불러오기 실패: $e");
      return null;
    }
  }


  Future<void> saveClinicToken(String clinicToken) async {
    try {
      print('[SECURE_STORAGE] saveClinicToken: $clinicToken');
      await storage.write(key: "CLINIC_TOKEN", value: clinicToken);
    } catch (e) {
      print("[ERR] ClinicToken 저장 실패: $e");
    }
  }

  Future<String?> readClinicToken() async {
    try {
      final refreshToken = await storage.read(key: "CLINIC_TOKEN");
      print('[SECURE_STORAGE] CLINIC_TOKEN: $refreshToken');
      return refreshToken;
    } catch (e) {
      print("[ERR] ClinicToken 불러오기 실패: $e");
      return null;
    }
  }
}