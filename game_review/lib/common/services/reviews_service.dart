import 'package:dio/dio.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/models/review_model.dart';

class ReviewsService {
  final ApiClient _apiClient;

  ReviewsService(this._apiClient);

  Future<List<ReviewModel>> fetchReviewsByGame({
    required String game_id,
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await _apiClient.get(
      '/rest/v1/review',
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
      '/rest/v1/reviews',
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

    // Only include optional fields if they're not null
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
    // Note: created_at and updated_at are NOT included here
    // Supabase will set them automatically

    final response = await _apiClient.post(
      '/rest/v1/reviews',
      data: data,
    );

    return ReviewModel.fromJson(response.data);
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

    final response = await _apiClient.put(
      '/rest/v1/reviews?id=eq.$id',
      data: data,
    );

    if (response.data is List && (response.data as List).isNotEmpty) {
      return ReviewModel.fromJson((response.data as List).first);
    }
    throw Exception('Failed to update review');
  }

  Future<void> deleteReview(String reviewId) async {
    await _apiClient.delete(
      '/rest/v1/reviews?id=eq.$reviewId',
    );
  }
}
