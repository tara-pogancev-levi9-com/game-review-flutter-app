import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/features/library_screen/temporary_placeholder/models/game.dart';
import 'package:game_review/i18n/strings.g.dart';
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
      Logger.error(t.gameService.failedToFetchLatestGames, e);
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
      Logger.error(t.gameService.failedToFetchPopularGames, e);
      return [];
    }
  }

    Future<bool> addToWishlist(String gameId) async {
    try {
      final token = await SecureStorage.getToken();
      if (token == null) {
        Logger.warning(t.gameService.noTokenWishlist);
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
        Logger.info(t.gameService.gameAddedToWishlistSuccess);
        return true;
      } else {
        Logger.warning(t.library.failedToAddToWishlist);
        return false;
      }
    } catch (e) {
      Logger.error(t.library.failedToAddToWishlist, e);
      return false;
    }
  }

  Future<bool> addToLibrary(String gameId) async {
    try {
      final token = await SecureStorage.getToken();
      if (token == null) {
        Logger.warning(t.gameService.noTokenLibrary);
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
        Logger.info(t.library.gameAddedToLibrary);
        return true;
      } else {
        Logger.warning(t.library.failedToAddToLibrary);
        return false;
      }
    } catch (e) {
      Logger.error(t.library.failedToAddToLibrary, e);
      return false;
    }
  }

  Future<List<Game>> getUserWishlistGames() async {
  try {
    final token = await SecureStorage.getToken();
    if (token == null) {
      Logger.warning(t.gameService.noTokenWishlist);
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
    Logger.error(t.gameService.failedToFetchWishlistGames, e);
    return [];
  }
}

Future<List<Game>> getUserLibraryGames() async {
  try {
    final token = await SecureStorage.getToken();
    if (token == null) {
      Logger.warning(t.gameService.noTokenLibrary);
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
    Logger.error(t.gameService.failedToFetchLibraryGames, e);
    return [];
  }
}


  Future<bool> removeFromWishlist(String gameId) async {
    try {
      final token = await SecureStorage.getToken();
      if (token == null) {
        Logger.warning(t.gameService.noTokenWishlist);
        return false;
      }
      final userId = JwtDecoder.decode(token)['sub'];

      final path = 'rest/v1/user_wishlist?user_id=eq.${Uri.encodeComponent(userId)}&game_id=eq.${Uri.encodeComponent(gameId)}';

      final response = await _apiClient.delete(path);

      if (response.statusCode == 200 || response.statusCode == 204) {
        Logger.info(t.gameService.removedFromWishlist);
        return true;
      } else {
        Logger.warning(t.gameService.failedToRemoveFromWishlist);
        return false;
      }
    } catch (e) {
      Logger.error(t.gameService.failedToRemoveFromWishlist, e);
      return false;
    }
  }

  Future<bool> removeFromLibrary(String gameId) async {
    try {
      final token = await SecureStorage.getToken();
      if (token == null) {
        Logger.warning(t.gameService.noTokenLibrary);
        return false;
      }
      final userId = JwtDecoder.decode(token)['sub'];

      final path = 'rest/v1/user_library?user_id=eq.${Uri.encodeComponent(userId)}&game_id=eq.${Uri.encodeComponent(gameId)}';

      final response = await _apiClient.delete(path);

      if (response.statusCode == 200 || response.statusCode == 204) {
        Logger.info(t.gameDetails.removedFromLibrary);
        return true;
      } else {
        Logger.warning(t.gameDetails.failedToRemoveFromLibrary);
        return false;
      }
    } catch (e) {
      Logger.error(t.gameDetails.failedToRemoveFromLibrary, e);
      return false;
    }
  }


}