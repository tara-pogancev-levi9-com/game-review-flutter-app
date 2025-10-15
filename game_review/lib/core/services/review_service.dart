import 'dart:io';

import 'package:game_review/common/models/models.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/core/api/api_constants.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/features/auth/services/auth_service.dart';
import 'package:game_review/i18n/strings.g.dart';

class ReviewService {
  final ApiClient _apiClient;
  final AuthService _authService;

  ReviewService(this._apiClient, this._authService);

  Future<List<GameReviewModel>> getGameReviews(
    String gameId, {
    int limit = Endpoints.limitRecentReviews,
    int offset = 0,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.gameReviews,
        queryParameters: {
          'game_id': 'eq.$gameId',
          'select': '*,users!inner(id,username,display_name,avatar_url)',
          'order': 'created_at.desc',
          'limit': limit.toString(),
          'offset': offset.toString(),
        },
      );

      if (response.statusCode == HttpStatus.ok && response.data is List) {
        final reviews = (response.data as List)
            .map((json) => GameReviewModel.fromJson(json))
            .toList();

        final reviewsWithLikes = await Future.wait(
          reviews.map((review) async {
            final likesCount = await getReviewLikesCount(review.id);
            final isLiked = await hasLikedReview(review.id);
            return review.copyWith(
              likesCount: likesCount,
              isLiked: isLiked,
            );
          }),
        );

        return reviewsWithLikes;
      }
      return [];
    } catch (e) {
      throw Exception(t.library.failedToFetchGameReviews);
    }
  }

  Future<List<ReviewCommentModel>> getReviewComments(String reviewId) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.reviewComments,
        queryParameters: {
          'review_id': 'eq.$reviewId',
          'select': '*,users!inner(id,username,display_name,avatar_url)',
          'order': 'created_at.asc',
        },
      );

      if (response.statusCode == HttpStatus.ok && response.data is List) {
        return (response.data as List)
            .map((json) => ReviewCommentModel.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      throw Exception(t.library.failedToFetchReviewComments);
    }
  }

  Future<GameReviewModel> createReview({
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
        ApiConstants.gameReviews,
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

      if (response.statusCode == HttpStatus.created) {
        return GameReviewModel.fromJson(response.data);
      }
      throw Exception(t.library.failedToCreateReview);
    } catch (e) {
      throw Exception(t.library.failedToCreateReview);
    }
  }

  Future<ReviewCommentModel> addComment({
    required String reviewId,
    required String content,
    String? parentCommentId,
  }) async {
    try {
      final response = await _apiClient.post(
        ApiConstants.reviewComments,
        data: {
          'review_id': reviewId,
          'content': content,
          if (parentCommentId != null) 'parent_comment_id': parentCommentId,
        },
      );

      if (response.statusCode == HttpStatus.created) {
        return ReviewCommentModel.fromJson(response.data);
      }
      throw Exception(t.library.failedToAddComment);
    } catch (e) {
      throw Exception(t.library.failedToAddComment);
    }
  }

  Future<void> likeReview(String reviewId) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        throw Exception(t.library.userNotAuthenticated);
      }

      final response = await _apiClient.post(
        ApiConstants.reviewLikes,
        data: {
          'review_id': reviewId,
          'user_id': userId,
        },
      );

      if (response.statusCode != HttpStatus.created) {
        throw Exception(t.library.failedToLikeReview);
      }
    } catch (e) {
      throw Exception(t.library.failedToLikeReview);
    }
  }

  Future<void> unlikeReview(String reviewId) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        throw Exception(t.library.userNotAuthenticated);
      }

      final response = await _apiClient.delete(
        ApiConstants.reviewLikes,
        queryParameters: {
          'review_id': 'eq.$reviewId',
          'user_id': 'eq.$userId',
        },
      );

      if (response.statusCode != HttpStatus.noContent) {
        throw Exception(t.library.failedToUnlikeReview);
      }
    } catch (e) {
      throw Exception(t.library.failedToUnlikeReview);
    }
  }

  Future<bool> hasLikedReview(String reviewId) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        return false;
      }

      final response = await _apiClient.get(
        ApiConstants.reviewLikes,
        queryParameters: {
          'review_id': 'eq.$reviewId',
          'user_id': 'eq.$userId',
          'select': 'id',
        },
      );

      return response.statusCode == HttpStatus.ok && (response.data as List).isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<int> getReviewLikesCount(String reviewId) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.reviewLikes,
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
