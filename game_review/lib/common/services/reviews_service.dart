import 'package:dio/dio.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/common/utils/logger.dart';

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
    final Map<String, dynamic> data = {
      'user_id': user_id,
      'game_id': game_id,
    };

    if (title != null) data['title'] = title;
    if (content != null) data['content'] = content;
    if (overall_rating != null) data['overall_rating'] = overall_rating;
    if (gameplay_rating != null) data['gameplay_rating'] = gameplay_rating;
    if (graphics_rating != null) data['graphics_rating'] = graphics_rating;
    if (story_rating != null) data['story_rating'] = story_rating;
    if (sound_rating != null) data['sound_rating'] = sound_rating;
    if (value_rating != null) data['value_rating'] = value_rating;
    if (pros != null) data['pros'] = pros;
    if (cons != null) data['cons'] = cons;
    if (playtime_hours != null) data['playtime_hours'] = playtime_hours;
    if (completion_status != null)
      data['completion_status'] = completion_status;
    if (recommended != null) data['recommended'] = recommended;

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

    if (response.statusCode == 201 || response.statusCode == 200) {
      final data = response.data;

      // Case 1: Supabase returned a list of rows
      if (data is List &&
          data.isNotEmpty &&
          data.first is Map<String, dynamic>) {
        return ReviewModel.fromJson(data.first as Map<String, dynamic>);
      }

      // Case 2: Supabase returned a single JSON object
      if (data is Map<String, dynamic>) {
        return ReviewModel.fromJson(data);
      }
    }

    throw Exception('Failed to add review: Unexpected response type');
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
    final data = <String, dynamic>{};

    if (title != null) data['title'] = title;
    if (content != null) data['content'] = content;
    if (overall_rating != null) data['overall_rating'] = overall_rating;
    if (gameplay_rating != null) data['gameplay_rating'] = gameplay_rating;
    if (graphics_rating != null) data['graphics_rating'] = graphics_rating;
    if (story_rating != null) data['story_rating'] = story_rating;
    if (sound_rating != null) data['sound_rating'] = sound_rating;
    if (value_rating != null) data['value_rating'] = value_rating;
    if (pros != null) data['pros'] = pros;
    if (cons != null) data['cons'] = cons;
    if (playtime_hours != null) data['playtime_hours'] = playtime_hours;
    if (completion_status != null)
      data['completion_status'] = completion_status;
    if (recommended != null) data['recommended'] = recommended;

    final response = await _apiClient.patch(
      '/rest/v1/game_reviews',
      data: data,
      queryParameters: {
        'id': 'eq.$id',
        'select': '*',
      },
    );

    final List<dynamic> responseData = response.data as List<dynamic>;
    if (responseData.isNotEmpty) {
      return ReviewModel.fromJson(responseData.first);
    }
    throw Exception('Failed to update review');
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
}
