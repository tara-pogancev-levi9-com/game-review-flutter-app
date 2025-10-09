import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/features/home_screen/models/review.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/core/api/endpoints.dart';


class ReviewService {
  final ApiClient _apiClient;

  ReviewService(this._apiClient);

  Future<List<Review>> getRecentReviews({int limit = Endpoints.limitRecentReviews}) async {
    try {
      final response = await _apiClient.get(
        Endpoints.gameReviews,
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
      Logger.error(t.errors.failedToFetchRecentReviews, e);
      return [];
    }
  }

  /// TODO: like a review
}
