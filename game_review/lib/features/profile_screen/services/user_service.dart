import 'dart:io';

import 'package:dio/dio.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/core/api/api_image_client.dart';
import 'package:game_review/core/storage/secure_storage.dart';
import 'package:game_review/features/profile_screen/exceptions/password_same.dart';
import 'package:game_review/features/profile_screen/models/user.dart';
import 'package:jose/jose.dart';

class UserService {
  final ApiClient apiClient;
  final ApiImageClient apiImageClient;

  UserService(this.apiClient, this.apiImageClient);

  Future<String> getCurrentUserUid() async {
    String? accessToken = SecureStorage.getToken();
    try {
      final jwt = JsonWebToken.unverified(accessToken!);
      final claims = jwt.claims.toJson();
      return claims['sub'] as String;
    } on DioException catch (e) {
      throw Exception('Failed to get authenticated user ID: ${e.message}');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateUserProfile(
    String userId,
    Map<String, dynamic> updates,
  ) async {
    try {
      final Response response = await apiClient.patch(
        '/rest/v1/users',
        queryParameters: {'id': 'eq.$userId'},
        data: updates,
      );

      if (response.statusCode != HttpStatus.noContent) {
        throw Exception(
          'Failed to update profile: Status ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      Logger.error('Dio error updating profile: ${e.message}');
      throw Exception('API error: ${e.response?.data}');
    }
  }

  Future<void> changePassword(String newPassword) async {
    try {
      Response response = await apiClient.put(
        'auth/v1/user',
        data: {
          'password': newPassword,
        },
      );

      if (response.statusCode != HttpStatus.ok) {
        throw Exception(
          'Failed to change password with status: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 422) {
        throw PasswordSameAsOldException(
          "Please provide a password different from the old one!",
        );
      } else {
        throw Exception('API error: ${e.response?.data}');
      }
    }
  }

  Future<void> deleteAvatar(imagePath, userId) async {
    try {
      final Response response = await apiImageClient.delete(
        '/storage/v1/object/avatars/$imagePath',
      );
      if (response.statusCode == HttpStatus.ok) {
        await clearUserProfileImage(userId);
      } else {
        throw Exception(
          'Failed to delete image from storage: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception('API error deleting image: ${e.message}');
    }
  }

  Future<void> clearUserProfileImage(String userId) async {
    try {
      final Response response = await apiClient.patch(
        '/rest/v1/users',
        queryParameters: {'id': 'eq.$userId'},
        data: {'avatar_url': null},
      );

      if (response.statusCode != HttpStatus.noContent) {
        throw Exception(
          'Failed to clear user profile image: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception('API error clearing image field: ${e.response?.data}');
    }
  }

  Future<User> getCurrentUser() async {
    try {
      final String userUid = await getCurrentUserUid();

      final Response response = await apiClient.get(
        'rest/v1/users',
        queryParameters: {
          'id': 'eq.$userUid',
        },
      );
      final List<dynamic> userDataList = response.data;
      if (userDataList.isNotEmpty) {
        final Map<String, dynamic> userData =
            userDataList.first as Map<String, dynamic>;
        User currentUserProfile = User.fromJson(userData);
        return currentUserProfile;
      } else {
        throw Exception("User profile not found.");
      }
    } on DioException catch (e) {
      Logger.error('Dio error fetching current user profile: ${e.message}');
      rethrow;
    } catch (e) {
      Logger.error('Error fetching current user profile: $e');
      rethrow;
    }
  }

  Future<User> getUser(userId) async {
    try {
      final Response response = await apiClient.get(
        'rest/v1/users',
        queryParameters: {
          'id': 'eq.$userId',
        },
      );
      final List<dynamic> userDataList = response.data;
      if (userDataList.isNotEmpty) {
        final Map<String, dynamic> userData =
            userDataList.first as Map<String, dynamic>;
        User currentUserProfile = User.fromJson(userData);
        return currentUserProfile;
      } else {
        throw Exception("User profile not found.");
      }
    } on DioException catch (e) {
      Logger.error('Dio error fetching current user profile: ${e.message}');
      rethrow;
    } catch (e) {
      Logger.error('Error fetching current user profile: $e');
      rethrow;
    }
  }

  Future<void> addFriend(requesterId, addresseeId) async {
    try {
      await apiClient.post(
        'rest/v1/friendships',
        data: {
          'requester_id': requesterId,
          'addressee_id': addresseeId,
          'status': 'accepted',
        },
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> areFriends(String userId, String otherUserId) async {
    try {
      final response = await apiClient.get(
        '/rest/v1/friendships',
        queryParameters: {
          'or':
              '(and(requester_id.eq.$userId,addressee_id.eq.$otherUserId),and(requester_id.eq.$otherUserId,addressee_id.eq.$userId))',
          'limit': 1,
        },
      );
      final List<dynamic> friendships = response.data;
      return friendships.isNotEmpty;
    } on DioException {
      return false;
    }
  }

  Future<void> uploadAvatar(imagePath, imageBytes, imageExtensions) async {
    try {
      final Response response = await locator<ApiImageClient>().post(
        '/storage/v1/object/avatars/$imagePath',
        imageExtensions,
        data: imageBytes,
      );
      if (response.statusCode != HttpStatus.noContent &&
          response.statusCode != HttpStatus.ok &&
          response.statusCode != HttpStatus.created) {
        throw Exception(
          'Failed to update profile: Status ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      Logger.error('Dio error updating profile: ${e.message}');
      throw Exception('API error: ${e.response?.data}');
    }
  }
}
