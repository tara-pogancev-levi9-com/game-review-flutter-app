import 'package:dio/dio.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/common/utils/app_exception.dart';

class ReviewsService {
  final ApiClient _apiClient;

  ReviewsService(this._apiClient);

  Future<List<ReviewModel>> fetchReviewsByGame({
    required String game_id,
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await _apiClient.get(
      '/rest/v1/game_reviews',
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
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await _apiClient.get(
      '/rest/v1/game_reviews',
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
      user_id: user_id,
      game_id: game_id,
      title: title,
      content: content,
      overall_rating: overall_rating,
      gameplay_rating: gameplay_rating,
      graphics_rating: graphics_rating,
      story_rating: story_rating,
      sound_rating: sound_rating,
      value_rating: value_rating,
      pros: pros,
      cons: cons,
      playtime_hours: playtime_hours,
      completion_status: completion_status,
      recommended: recommended,
    );

    //Convert to JSON, removing nulls
    final data = reviewData.toJsonForApi();

    Logger.info('🟣 ADD REVIEW DEBUG');
    Logger.info('user_id: $user_id');
    Logger.info('game_id: $game_id');
    Logger.info('DATA: $data');

    final response = await _apiClient.post(
      '/rest/v1/game_reviews',
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
    // Create a partial ReviewModel with only the fields we're updating
    final reviewData = ReviewModel(
      id: id,
      user_id: '', //Not being updated
      game_id: '', //Not being updated
      title: title,
      content: content,
      overall_rating: overall_rating,
      gameplay_rating: gameplay_rating,
      graphics_rating: graphics_rating,
      story_rating: story_rating,
      sound_rating: sound_rating,
      value_rating: value_rating,
      pros: pros,
      cons: cons,
      playtime_hours: playtime_hours,
      completion_status: completion_status,
      recommended: recommended,
    );

    final data = reviewData.toJsonForApi();

    final response = await _apiClient.patch(
      '/rest/v1/game_reviews',
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
      '/rest/v1/game_reviews',
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
      '/rest/v1/game_reviews',
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
