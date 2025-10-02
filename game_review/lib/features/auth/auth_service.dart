import '../../core/api/api_client.dart';
import '../../core/storage/secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; 


class AuthService {
  final ApiClient apiClient;

  AuthService(this.apiClient);

  Future<bool> signup(String email, String password) async {
    final baseUrl = dotenv.env['API_URL']?.replaceAll('/rest/v1', '') ?? '';
    final signupUrl = '$baseUrl/auth/v1/signup';
    
    try {
      final response = await apiClient.dio.post(
        signupUrl,
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print('Signup successful! User created.');
        if (response.data['access_token'] != null) {
          await SecureStorage.saveToken(response.data['access_token']);
        }
        return true;
      }
    } catch (e) {
      print('Signup error: $e');
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    final baseUrl = dotenv.env['API_URL']?.replaceAll('/rest/v1', '') ?? '';
    final authUrl = '$baseUrl/auth/v1/token?grant_type=password';
    
    final response = await apiClient.dio.post(
      authUrl,
      data: {
        'email': email,
        'password': password,
      }
    );

    if (response.statusCode == 200 && response.data['access_token'] != null) {
      await SecureStorage.saveToken(response.data['access_token']);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
  try {
    final baseUrl = dotenv.env['API_URL']?.replaceAll('/rest/v1', '') ?? '';
    final logoutUrl = '$baseUrl/auth/v1/logout';
    
    await apiClient.dio.post(logoutUrl);
    print('Server session ended');
  } catch (e) {
    print('Server logout failed (but continuing): $e');
  }
  
  await SecureStorage.deleteToken();
  print('Local token deleted');
}

}