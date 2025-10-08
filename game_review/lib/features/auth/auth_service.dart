import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:game_review/features/registration_screen/exceptions/email_already_exists.dart';

import '../../core/api/api_client.dart';
import '../../core/storage/secure_storage.dart';
import '../../common/utils/logger.dart';
import '../../i18n/strings.g.dart';

// TODO: Clean up endpoints

// TODO: Clean up endpoints

class AuthService {
  final ApiClient apiClient;

  AuthService(this.apiClient);

  Future<bool> signup(String email, String password, String username) async {
    try {
      final response = await apiClient.post(
        'auth/v1/signup',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        ('Signup successful! User created.');
        if (response.data['access_token'] != null) {
          await SecureStorage.saveToken(response.data['access_token']);
          final userData = await apiClient.get('auth/v1/user');
          final val = jsonDecode(userData.toString());
          await apiClient.post(
            'rest/v1/users',
            data: {'id': val['id'], 'username': username, 'email': email},
          );
        }
        return true;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode != null && e.response?.statusCode == 422) {
        throw EmailAlreadyExistsException(t.registrationEmailExistsError);
      }
    } catch (e) {
      Logger.error('Signup error', e);
      throw e;
    }
    return false;
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await apiClient.post(
        'auth/v1/token?grant_type=password',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 && response.data['access_token'] != null) {
        await SecureStorage.saveToken(response.data['access_token']);
        Logger.info('Login successful, token saved.');
        return true;
      }
      Logger.warning('Login failed with status: ${response.statusCode}. Response: ${response.data}');
      return false;

    } catch (e) {
      Logger.error('Login error', e);
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await apiClient.post('auth/v1/logout');
      Logger.info('Server session ended');
    } catch (e) {
      Logger.error('Server logout failed (but continuing)', e);
    }

    await SecureStorage.deleteToken();
    Logger.info('Local token deleted');
  }
}
