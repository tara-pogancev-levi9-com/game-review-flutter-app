import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/core/api/api_constants.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/core/storage/secure_storage.dart';
import 'package:game_review/features/registration_screen/exceptions/email_already_exists.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

// TODO: Clean up endpoints

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
          final userData = await apiClient.get(ApiConstants.authUser);
          final val = jsonDecode(userData.toString());
          await apiClient.post(
            ApiConstants.users,
            data: {'id': val['id'], 'username': username, 'email': email},
          );
        }
        return true;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode != null &&
          e.response?.statusCode == HttpStatus.unprocessableEntity) {
        throw EmailAlreadyExistsException(t.registrationEmailExistsError);
      }
      if (e.response?.statusCode != null && e.response?.statusCode == HttpStatus.unprocessableEntity) {
        throw EmailAlreadyExistsException(
          t.library.registrationEmailExistsError,
        );
      }
    } catch (e) {
      Logger.error('Signup error', e);
      rethrow;
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

      if (response.statusCode == HttpStatus.ok &&
          response.data['access_token'] != null) {
        await SecureStorage.saveToken(response.data['access_token']);
        Logger.info('Login successful, token saved.');

        await createUserDataIfNotPresent();

        return true;
      }
      Logger.warning(
        'Login failed with status: ${response.statusCode}. Response: ${response.data}',
      );
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

  String? getToken() => SecureStorage.getToken();

  Future<bool> isAuthenticated() async {
    final token = getToken();
    if (token == null) return false;
    return !JwtDecoder.isExpired(token);
  }

  Future<String?> getUserId() async {
    final token = getToken();
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

  Future<String?> getCurrentUserId() async {
    try {
      final response = await apiClient.get(ApiConstants.authUser);
      if (response.statusCode == HttpStatus.ok) {
        return response.data['id'] as String?;
      }
    } catch (e) {
      Logger.error('Failed to get current user ID', e);
    }
    return null;
  }

  Future<void> createUserDataIfNotPresent() async {
    try {
      final userId = await getCurrentUserId();
      if (userId == null) return;

      final response = await apiClient.get(
        ApiConstants.users,
        queryParameters: {
          'id': 'eq.$userId',
          'select': 'id',
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> users = response.data as List<dynamic>;
        if (users.isEmpty) {
          await apiClient.post(
            ApiConstants.users,
            data: {
              'id': userId,
              'email': (await apiClient.get(
                ApiConstants.authUser,
              )).data['email'],
              'created_at': DateTime.now().toIso8601String(),
            },
          );
        }
      }
    } catch (e) {
      Logger.error('Failed to create user data', e);
      rethrow;
    }
  }
}
