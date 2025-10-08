import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/models/models.dart';
import 'package:game_review/i18n/strings.g.dart';

class ReviewService {
  final ApiClient _apiClient;

  ReviewService(this._apiClient);

  Future<List<GameReview>> getGameReviews(
    String gameId, {
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      final response = await _apiClient.get(
        'rest/v1/game_reviews',
        queryParameters: {
          'game_id': 'eq.$gameId',
          'select': '*,users!inner(id,username,display_name,avatar_url)',
          'order': 'created_at.desc',
          'limit': limit.toString(),
          'offset': offset.toString(),
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((json) => GameReview.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      throw Exception(t.library.failedToFetchGameReviews);
    }
  }

  Future<List<ReviewComment>> getReviewComments(String reviewId) async {
    try {
      final response = await _apiClient.get(
        'rest/v1/review_comments',
        queryParameters: {
          'review_id': 'eq.$reviewId',
          'select': '*,users!inner(id,username,display_name,avatar_url)',
          'order': 'created_at.asc',
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((json) => ReviewComment.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      throw Exception(t.library.failedToFetchReviewComments);
    }
  }

  Future<GameReview> createReview({
    required String gameId,
    required String title,
    required String content,
    required double overallRating,
    required double gameplayRating,
    required double graphicsRating,
    required double storyRating,
    required double soundRating,
    required double valueRating,
    List<String>? pros,
    List<String>? cons,
    int? playtimeHours,
    String? completionStatus,
    bool? recommended,
  }) async {
    try {
      final response = await _apiClient.post(
        'rest/v1/game_reviews',
        data: {
          'game_id': gameId,
          'title': title,
          'content': content,
          'overall_rating': overallRating,
          'gameplay_rating': gameplayRating,
          'graphics_rating': graphicsRating,
          'story_rating': storyRating,
          'sound_rating': soundRating,
          'value_rating': valueRating,
          if (pros != null) 'pros': pros,
          if (cons != null) 'cons': cons,
          if (playtimeHours != null) 'playtime_hours': playtimeHours,
          if (completionStatus != null) 'completion_status': completionStatus,
          if (recommended != null) 'recommended': recommended,
        },
      );

      if (response.statusCode == 201) {
        return GameReview.fromJson(response.data);
      }
      throw Exception(t.library.failedToCreateReview);
    } catch (e) {
      throw Exception(t.library.failedToCreateReview);
    }
  }

  Future<ReviewComment> addComment({
    required String reviewId,
    required String content,
    String? parentCommentId,
  }) async {
    try {
      final response = await _apiClient.post(
        'rest/v1/review_comments',
        data: {
          'review_id': reviewId,
          'content': content,
          if (parentCommentId != null) 'parent_comment_id': parentCommentId,
        },
      );

      if (response.statusCode == 201) {
        return ReviewComment.fromJson(response.data);
      }
      throw Exception(t.library.failedToAddComment);
    } catch (e) {
      throw Exception(t.library.failedToAddComment);
    }
  }

  Future<void> likeReview(String reviewId) async {
    try {
      final response = await _apiClient.post(
        'rest/v1/review_likes',
        data: {
          'review_id': reviewId,
        },
      );

      if (response.statusCode != 201) {
        throw Exception(t.library.failedToLikeReview);
      }
    } catch (e) {
      throw Exception(t.library.failedToLikeReview);
    }
  }

  Future<void> unlikeReview(String reviewId) async {
    try {
      final response = await _apiClient.delete(
        'rest/v1/review_likes',
        data: {
          'review_id': 'eq.$reviewId',
        },
      );

      if (response.statusCode != 204) {
        throw Exception(t.library.failedToUnlikeReview);
      }
    } catch (e) {
      throw Exception(t.library.failedToUnlikeReview);
    }
  }

  Future<bool> hasLikedReview(String reviewId) async {
    try {
      final response = await _apiClient.get(
        'rest/v1/review_likes',
        queryParameters: {
          'review_id': 'eq.$reviewId',
          'select': 'id',
        },
      );

      return response.statusCode == 200 && (response.data as List).isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<int> getReviewLikesCount(String reviewId) async {
    try {
      final response = await _apiClient.get(
        'rest/v1/review_likes',
        queryParameters: {
          'review_id': 'eq.$reviewId',
          'select': 'id',
        },
      );

      return (response.data as List).length;
    } catch (e) {
      return 0;
    }
  }
}
