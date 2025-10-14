import 'dart:io';

import 'package:dio/dio.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/common/utils/app_exception.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/i18n/strings.g.dart';

class ReviewsService {
  final ApiClient _apiClient;

  ReviewsService(this._apiClient);

  Future<List<ReviewModel>> fetchReviewsByGame({
    required String game_id,
    int limit = Endpoints.limitRecentReviews,
    int offset = 0,
  }) async {
    final response = await _apiClient.get(
      Endpoints.gameReviews,
      queryParameters: {
        'select': '*',
        'game_id': 'eq.$game_id',
        'limit': limit,
        'offset': offset,
        'order': 'created_at.desc',
      },
    );

    final List<dynamic> data = response.data as List<dynamic>;
    return data.map((json) => ReviewModel.fromJson(json)).toList();
  }

  Future<List<ReviewModel>> fetchReviewsByUser({
    required String user_id,
    int limit = Endpoints.limitRecentReviews,
    int offset = 0,
  }) async {
    final response = await _apiClient.get(
      Endpoints.gameReviews,
      queryParameters: {
        'select': '*',
        'user_id': 'eq.$user_id',
        'limit': limit,
        'offset': offset,
        'order': 'created_at.desc',
      },
    );

    final List<dynamic> data = response.data as List<dynamic>;
    return data.map((json) => ReviewModel.fromJson(json)).toList();
  }

  Future<List<ReviewModel>> getRecentReviews({
    int limit = Endpoints.limitRecentReviews,
    int offset = 0,
  }) async {
    try {
      final response = await _apiClient.get(
        Endpoints.gameReviews,
        queryParameters: {
          'select': '*,games(*),users(username)',
          'order': 'created_at.desc',
          'limit': limit,
          'offset': offset,
        },
      );

      if (response.statusCode == HttpStatus.ok && response.data is List) {
        return (response.data as List).map((r) {
          final map = Map<String, dynamic>.from(r as Map);
          return ReviewModel.fromJsonWithNestedGameAndUser(map);
        }).toList();
      }
      return [];
    } catch (e) {
      Logger.error(t.errors.failedToFetchRecentReviews, e);
      return [];
    }
  }

  Future<ReviewModel> addReview({
    required String user_id,
    required String game_id,
    String? title,
    String? content,
    double? overall_rating,
    double? gameplay_rating,
    double? graphics_rating,
    double? story_rating,
    double? sound_rating,
    double? value_rating,
    List<String>? pros,
    List<String>? cons,
    int? playtime_hours,
    String? completion_status,
    bool? recommended,
  }) async {
    final reviewData = ReviewModel(
      id: '',
      userId: user_id,
      gameId: game_id,
      title: title,
      content: content,
      overallRating: overall_rating,
      gameplayRating: gameplay_rating,
      graphicsRating: graphics_rating,
      storyRating: story_rating,
      soundRating: sound_rating,
      valueRating: value_rating,
      pros: pros,
      cons: cons,
      playtimeHours: playtime_hours,
      completionStatus: completion_status,
      recommended: recommended,
    );

    //Convert to JSON, removing nulls
    final data = reviewData.toJsonForApi();

    Logger.info('🟣 ADD REVIEW DEBUG');
    Logger.info('user_id: $user_id');
    Logger.info('game_id: $game_id');
    Logger.info('DATA: $data');

    final response = await _apiClient.post(
      Endpoints.gameReviews,
      data: data,
      queryParameters: {
        'select': '*',
      },
      options: Options(
        headers: {
          'Prefer': 'return=representation',
          'Accept': 'application/json',
        },
      ),
    );

    Logger.info('🔵 RESPONSE STATUS: ${response.statusCode}');
    Logger.info('🔵 RESPONSE DATA: ${response.data}');

    return _parseReviewFromResponse(response);
  }

  Future<ReviewModel> updateReview({
    required String id,
    String? title,
    String? content,
    double? overallRating,
    double? gameplayRating,
    double? graphicsRating,
    double? storyRating,
    double? soundRating,
    double? valueRating,
    List<String>? pros,
    List<String>? cons,
    int? playtimeHours,
    String? completionStatus,
    bool? recommended,
  }) async {
    // Create a partial ReviewModel with only the fields we're updating
    final reviewData = ReviewModel(
      id: id,
      userId: '', //Not being updated
      gameId: '', //Not being updated
      title: title,
      content: content,
      overallRating: overallRating,
      gameplayRating: gameplayRating,
      graphicsRating: graphicsRating,
      storyRating: storyRating,
      soundRating: soundRating,
      valueRating: valueRating,
      pros: pros,
      cons: cons,
      playtimeHours: playtimeHours,
      completionStatus: completionStatus,
      recommended: recommended,
    );

    final data = reviewData.toJsonForApi();

    final response = await _apiClient.patch(
      Endpoints.gameReviews,
      data: data,
      queryParameters: {
        'id': 'eq.$id',
        'select': '*',
      },
      options: Options(
        headers: {
          'Prefer': 'return=representation',
        },
      ),
    );

    return _parseReviewFromResponse(response);
  }

  Future<void> deleteReview(String reviewId) async {
    await _apiClient.delete(
      Endpoints.gameReviews,
      queryParameters: {
        'id': 'eq.$reviewId',
      },
    );
  }

  Future<bool> hasUserReviewedGame({
    required String userId,
    required String gameId,
  }) async {
    final response = await _apiClient.get(
      Endpoints.gameReviews,
      queryParameters: {
        'select': 'id',
        'user_id': 'eq.$userId',
        'game_id': 'eq.$gameId',
        'limit': 1,
      },
    );

    final List<dynamic> data = response.data as List<dynamic>;
    return data.isNotEmpty;
  }

  // reviews_service.dart
  ReviewModel _parseReviewFromResponse(Response response) {
    if (response.statusCode != 201 && response.statusCode != 200) {
      throw AppException(
        'errors.failedToProcessReview',
        fallbackMessage:
            'Failed to process review: HTTP ${response.statusCode}',
      );
    }

    final data = response.data;

    // Supabase with 'Prefer: return=representation' always returns a list
    if (data is List && data.isNotEmpty && data.first is Map<String, dynamic>) {
      return ReviewModel.fromJson(data.first as Map<String, dynamic>);
    }

    throw AppException(
      'errors.unexpectedResponseFormat',
      fallbackMessage: 'Failed to parse review: Unexpected response format',
    );
  }
}
