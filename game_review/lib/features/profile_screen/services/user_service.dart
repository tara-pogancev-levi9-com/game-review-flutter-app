import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/features/profile_screen/models/user.dart';

class UserService {
  final ApiClient apiClient;

  UserService(this.apiClient);

  Future<String> getCurrentUserUid() async {
    try {
      final userData = await apiClient.get(Endpoints.authUser);
      final val = jsonDecode(userData.toString());

      return val['id'];
    } on DioException catch (e) {
      throw Exception('Failed to get authenticated user ID: ${e.message}');
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
}
