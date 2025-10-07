import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/features/library_screen/models/game.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:game_review/core/storage/secure_storage.dart';


class GameService {
  final ApiClient _apiClient;

  GameService(this._apiClient);


  Future<List<Game>> getLatestGames({int limit = 15}) async {
    try {
      final response = await _apiClient.get(
        'rest/v1/games',
        queryParameters: {
          'select': '*',
          'order': 'release_date.desc',
          'limit': limit,
        },
      );
      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((gameJson) => Game.fromJson(gameJson))
            .toList();
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
        'rest/v1/games',
        queryParameters: {
          'select': '*',
          'order': 'title.asc',
          'limit': limit,
        },
      );
      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((gameJson) => Game.fromJson(gameJson))
            .toList();
      }
      return [];
    } catch (e) {
      Logger.error('Failed to fetch popular games', e);
      return [];
    }
  }

    Future<bool> addToWishlist(String gameId) async {
    try {
      final token = await SecureStorage.getToken();
      if (token == null) {
        Logger.warning('Cannot add to wishlist – no token found');
        return false;
      }

      final userId = JwtDecoder.decode(token)['sub']; 

      final response = await _apiClient.post(
        'rest/v1/user_wishlist',
        data: {
          'user_id': userId,
          'game_id': gameId,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        Logger.info('Game added to wishlist successfully');
        return true;
      } else {
        Logger.warning('Failed to add to wishlist, status ${response.statusCode}: ${response.data}');
        return false;
      }
    } catch (e) {
      Logger.error('Failed to add game to wishlist', e);
      return false;
    }
  }

  Future<bool> addToLibrary(String gameId) async {
    try {
      final token = await SecureStorage.getToken();
      if (token == null) {
        Logger.warning('Cannot add to library – no token found');
        return false;
      }

      final userId = JwtDecoder.decode(token)['sub']; 

      final response = await _apiClient.post(
        'rest/v1/user_library',
        data: {
          'user_id': userId,
          'game_id': gameId,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        Logger.info('Game added to library successfully');
        return true;
      } else {
        Logger.warning('Failed to add to library, status ${response.statusCode}: ${response.data}');
        return false;
      }
    } catch (e) {
      Logger.error('Failed to add game to library', e);
      return false;
    }
  }

  Future<List<Game>> getUserWishlistGames() async {
  try {
    final token = await SecureStorage.getToken();
    if (token == null) {
      Logger.warning('Cannot fetch wishlist – no token found');
      return [];
    }

    final userId = JwtDecoder.decode(token)['sub'];

    final response = await _apiClient.get(
      'rest/v1/user_wishlist',
      queryParameters: {
        'select': 'games(*)', 
        'user_id': 'eq.$userId',
      },
    );

    if (response.statusCode == 200 && response.data is List) {
      return (response.data as List)
          .map((entry) => Game.fromJson(entry['games']))
          .toList();
    }
    return [];
  } catch (e) {
    Logger.error('Failed to fetch wishlist games', e);
    return [];
  }
}

Future<List<Game>> getUserLibraryGames() async {
  try {
    final token = await SecureStorage.getToken();
    if (token == null) {
      Logger.warning('Cannot fetch library – no token found');
      return [];
    }

    final userId = JwtDecoder.decode(token)['sub'];

    final response = await _apiClient.get(
      'rest/v1/user_library',
      queryParameters: {
        'select': 'games(*)', 
        'user_id': 'eq.$userId',
      },
    );

    if (response.statusCode == 200 && response.data is List) {
      return (response.data as List)
          .map((entry) => Game.fromJson(entry['games']))
          .toList();
    }
    return [];
  } catch (e) {
    Logger.error('Failed to fetch library games', e);
    return [];
  }
}


}