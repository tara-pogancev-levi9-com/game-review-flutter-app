import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/features/home/models/review.dart';
import 'package:game_review/features/library_screen/models/game.dart';
import 'package:game_review/core/storage/secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ReviewService {
  final ApiClient _apiClient;

  ReviewService(this._apiClient);

  Future<List<Review>> getRecentReviews({int limit = 10}) async {
    try {
      final response = await _apiClient.get(
        'rest/v1/game_reviews',
        queryParameters: {
          'select': '*,games(*)',
          'order': 'created_at.desc',
          'limit': limit,
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List).map((r) {
          final map = Map<String, dynamic>.from(r as Map);
          return Review.fromJsonWithNestedGame(map);
        }).toList();
      }
      return [];
    } catch (e) {
      Logger.error('Failed to fetch recent reviews', e);
      return [];
    }
  }

  /// TODO: like a review
}
