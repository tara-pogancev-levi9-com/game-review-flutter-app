import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/models/game_model.dart';

class GamesService {
  final ApiClient _apiClient;

  GamesService(this._apiClient);

  Future<List<GameModel>> fetchGames({
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await _apiClient.get(
      '/rest/v1/games',
      queryParameters: {
        'select': '*',
        'limit': limit,
        'offset': offset,
        'order': 'release_date.desc',
      },
    );

    final List<dynamic> data = response.data as List<dynamic>;
    print('📦 Response data: ${response.data}');

    return data.map((json) => GameModel.fromJson(json)).toList();
  }
}
