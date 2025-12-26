import 'dart:io';

import 'package:game_review/common/models/models.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/i18n/strings.g.dart';

class ReviewCommentService {
  final ApiClient _apiClient;
  ReviewCommentService(this._apiClient);

  Future<List<ReviewCommentModel>> getCommentsForReview(String reviewId) async {
    try {
      final response = await _apiClient.get(
        Endpoints.reviewComments,
        queryParameters: {
          'select': '*',
          'order': 'created_at.asc',
          'review_id': 'eq.$reviewId',
        },
      );

      if (response.statusCode == HttpStatus.ok && response.data is List) {
        return (response.data as List).map((e) {
          return ReviewCommentModel.fromJson(
            Map<String, dynamic>.from(e as Map),
          );
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
