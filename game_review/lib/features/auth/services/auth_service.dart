import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/features/registration_screen/exceptions/email_already_exists.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../core/api/api_client.dart';
import '../../../core/storage/secure_storage.dart';
import '../../../common/utils/logger.dart';
import '../../../i18n/strings.g.dart';

class AuthService {
  final ApiClient apiClient;

  AuthService(this.apiClient);

  Future<bool> signup(String email, String password, String username) async {
    try {
      final response = await apiClient.post(
        Endpoints.authSignup,
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == HttpStatus.ok) {
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
      if (e.response?.statusCode != null && e.response?.statusCode == HttpStatus.unprocessableEntity) {
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
        '${Endpoints.authToken}?grant_type=password',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == HttpStatus.ok && response.data['access_token'] != null) {
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
      await apiClient.post(Endpoints.authLogout);
      Logger.info('Server session ended');
    } catch (e) {
      Logger.error('Server logout failed (but continuing)', e);
    }

    await SecureStorage.deleteToken();
    Logger.info('Local token deleted');
  }

  Future<String?> getToken() => SecureStorage.getToken();

  Future<bool> isAuthenticated() async {
    final token = await getToken();
    if (token == null) return false;
    return !JwtDecoder.isExpired(token);
  }

  Future<String?> getUserId() async {
    final token = await getToken();
    if (token == null) return null;
    try {
      final decoded = JwtDecoder.decode(token);
      final sub = decoded['sub'];
      if (sub is String) return sub;
      return sub?.toString();
    } catch (e) {
      Logger.error('Failed to decode JWT to get user id', e);
      return null;
    }
  }
}
