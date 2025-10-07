import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/features/library_screen/models/game.dart';

class GameService {
  final ApiClient _apiClient;

  GameService(this._apiClient);

  Future<List<Game>> getLatestGames({int limit = 15}) async {
    try {
      final response = await _apiClient.get(
        '/rest/v1/games',
        queryParameters: {
          'select': '*',
          'order': 'release_date.desc',
          'limit': limit,
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        final games = (response.data as List)
            .map((gameJson) => Game.fromJson(gameJson))
            .toList();
        return games;
      }
      return [];
    } catch (e) {
      Logger.error('Failed to fetch latest games', e);
      return [];
    }
  }

  Future<List<Game>> getPopularGames({int limit = 15}) async {
    try {
      final response = await _apiClient.get(
        '/rest/v1/games',
        queryParameters: {
          'select': '*',
          'order': 'title.asc',
          'limit': limit,
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        final games = (response.data as List)
            .map((gameJson) => Game.fromJson(gameJson))
            .toList();
        return games;
      }
      return [];
    } catch (e) {
      Logger.error('Failed to fetch popular games', e);
      return [];
    }
  }
}
