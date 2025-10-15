import 'package:encrypt_shared_preferences/provider.dart';

class SecureStorage {
  static final EncryptedSharedPreferences _prefs =
      EncryptedSharedPreferences.getInstance();
  static const _jwtKey = 'jwt_token';
  static const _refreshKey = 'refresh_token';

  static Future<void> saveToken(String token) async {
    await _prefs.setString(_jwtKey, token);
  }

  static Future<void> saveRefreshToken(String token) async {
    await _prefs.setString(_refreshKey, token);
  }

  static String? getToken() {
    return _prefs.getString(_jwtKey);
  }

  static String? getRefreshToken() {
    return _prefs.getString(_refreshKey);
  }

  static Future<void> deleteRefreshToken() async {
    await _prefs.remove(_refreshKey);
  }

  static Future<void> deleteToken() async {
    await _prefs.remove(_jwtKey);
  }
}
