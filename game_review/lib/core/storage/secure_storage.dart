import 'package:encrypt_shared_preferences/provider.dart';

class SecureStorage {
  static final EncryptedSharedPreferences _prefs =
      EncryptedSharedPreferences.getInstance();
  static const _jwtKey = 'jwt_token';

  static Future<void> saveToken(String token) async {
    await _prefs.setString(_jwtKey, token);
  }

  static String? getToken() {
    return _prefs.getString(_jwtKey);
  }

  static Future<void> deleteToken() async {
    await _prefs.remove(_jwtKey);
  }
}
