import 'package:encrypt_shared_preferences/provider.dart';

class SecureStorage {
  static const _jwtKey = 'jwt_token';

  static Future<void> saveToken(String token) async {
    final prefs = EncryptedSharedPreferences.getInstance();
    await prefs.setString(_jwtKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = EncryptedSharedPreferences.getInstance();
    return await prefs.getString(_jwtKey);
  }

  static Future<void> deleteToken() async {
    final prefs = EncryptedSharedPreferences.getInstance();
    await prefs.remove(_jwtKey);
  }
}