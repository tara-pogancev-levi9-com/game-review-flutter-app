import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/features/home_screen/models/review_comment.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/i18n/strings.g.dart';

class CommentService {
  final ApiClient _apiClient;
  CommentService(this._apiClient);

  Future<List<ReviewComment>> getCommentsForReview(String reviewId) async {
    try {
      final response = await _apiClient.get(
        Endpoints.reviewComments,
        queryParameters: {
          'select': '*',
          'order': 'created_at.asc',
          'review_id': 'eq.$reviewId', 
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List).map((e) {
          return ReviewComment.fromJson(Map<String, dynamic>.from(e as Map));
        }).toList();
      }
      return [];
    } catch (e) {
      Logger.error(t.errors.failedToFetchRecentReviews, e); 
      return [];
    }
  }

  // TODO: add createComment / deleteComment / likeComment as needed
}
