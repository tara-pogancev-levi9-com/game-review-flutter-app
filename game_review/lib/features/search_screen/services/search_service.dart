import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/core/api/api_client.dart';

class SearchService {
  final ApiClient _apiClient;

  SearchService(this._apiClient);

  Future<List<GameModel>> searchGames({
    required String query,
    int limit = 10,
  }) async {
    if (query.isEmpty) return [];

    // Pretraga po: title, developer, publisher (case-insensitive)
    final response = await _apiClient.get(
      '/rest/v1/games',
      queryParameters: {
        'select': '*',
        'or':
            '(title.ilike.*$query*,developer.ilike.*$query*,publisher.ilike.*$query*)',
        'limit': limit * 2, // Dobavi više rezultata za client-side filtering
        'order': 'title.asc',
      },
    );

    final List<dynamic> data = response.data as List<dynamic>;
    final games = data.map((json) => GameModel.fromJson(json)).toList();

    final queryLower = query.toLowerCase();
    final filtered = games.where((game) {
      final matchesTitle = game.title.toLowerCase().contains(queryLower);
      final matchesDeveloper =
          game.developer?.toLowerCase().contains(queryLower) ?? false;
      final matchesPublisher =
          game.publisher?.toLowerCase().contains(queryLower) ?? false;

      final matchesPlatforms =
          game.platforms?.any(
            (platform) => platform.toLowerCase().contains(queryLower),
          ) ??
          false;

      return matchesTitle ||
          matchesDeveloper ||
          matchesPublisher ||
          matchesPlatforms;
    }).toList();

    return filtered.take(limit).toList();
  }

  Future<List<ReviewModel>> searchReviews({
    required String query,
    int limit = 10,
  }) async {
    if (query.isEmpty) return [];

    try {
      final reviewsResponse = await _apiClient.get(
        '/rest/v1/game_reviews',
        queryParameters: {
          'select': '*',
          'or': '(title.ilike.*$query*,content.ilike.*$query*)',
          'limit': limit,
          'order': 'created_at.desc',
        },
      );

      final List<dynamic> reviewsData = reviewsResponse.data as List<dynamic>;
      final reviews = reviewsData
          .map((json) => ReviewModel.fromJson(json))
          .toList();

      final gamesResponse = await _apiClient.get(
        '/rest/v1/games',
        queryParameters: {
          'select': 'id',
          'title': 'ilike.*$query*',
          'limit': 50,
        },
      );

      final List<dynamic> gamesData = gamesResponse.data as List<dynamic>;
      final gameIds = gamesData.map((game) => game['id'] as String).toList();

      if (gameIds.isNotEmpty) {
        final gameReviewsResponse = await _apiClient.get(
          '/rest/v1/game_reviews',
          queryParameters: {
            'select': '*',
            'game_id': 'in.(${gameIds.join(',')})',
            'limit': limit,
            'order': 'created_at.desc',
          },
        );

        final List<dynamic> gameReviewsData =
            gameReviewsResponse.data as List<dynamic>;
        final gameReviews = gameReviewsData
            .map((json) => ReviewModel.fromJson(json))
            .toList();

        final allReviews = [...reviews, ...gameReviews];
        final uniqueReviews = <String, ReviewModel>{};
        for (var review in allReviews) {
          uniqueReviews[review.id] = review;
        }

        return uniqueReviews.values.take(limit).toList();
      }

      return reviews;
    } catch (e) {
      final response = await _apiClient.get(
        '/rest/v1/game_reviews',
        queryParameters: {
          'select': '*',
          'or': '(title.ilike.*$query*,content.ilike.*$query*)',
          'limit': limit,
          'order': 'created_at.desc',
        },
      );

      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => ReviewModel.fromJson(json)).toList();
    }
  }
}
