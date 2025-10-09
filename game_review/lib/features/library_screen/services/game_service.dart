import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/features/auth/auth_service.dart';
import 'package:game_review/features/library_screen/models/game.dart';
import 'package:game_review/i18n/strings.g.dart';

class GameService {
  final ApiClient _apiClient;
  final AuthService _authService;

  GameService(this._apiClient, this._authService);

  Future<List<Game>> getLatestGames({int limit = Endpoints.limitPopularGames}) async {
    try {
      final response = await _apiClient.get(
        Endpoints.games,
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

  Future<List<Game>> getPopularGames({int limit = Endpoints.limitPopularGames}) async {
    try {
      final response = await _apiClient.get(
        Endpoints.games,
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
      final userId = await _authService.getUserId();
      if (userId == null) {
        Logger.warning(t.gameService.noTokenWishlist);
        return false;
      }

      final response = await _apiClient.post(
        Endpoints.userWishlist,
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
      final userId = await _authService.getUserId();
      if (userId == null) {
        Logger.warning(t.gameService.noTokenLibrary);
        return false;
      }

      final response = await _apiClient.post(
        Endpoints.userLibrary,
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
      final userId = await _authService.getUserId();
      if (userId == null) {
        Logger.warning(t.gameService.noTokenWishlist);
        return [];
      }

      final response = await _apiClient.get(
        Endpoints.userWishlist,
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
      final userId = await _authService.getUserId();
      if (userId == null) {
        Logger.warning(t.gameService.noTokenLibrary);
        return [];
      }

      final response = await _apiClient.get(
        Endpoints.userLibrary,
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
      final userId = await _authService.getUserId();
      if (userId == null) {
        Logger.warning(t.gameService.noTokenWishlist);
        return false;
      }

      final path =
          '${Endpoints.userWishlist}?user_id=eq.${Uri.encodeComponent(userId)}&game_id=eq.${Uri.encodeComponent(gameId)}';

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
      final userId = await _authService.getUserId();
      if (userId == null) {
        Logger.warning(t.gameService.noTokenLibrary);
        return false;
      }

      final path =
          '${Endpoints.userLibrary}?user_id=eq.${Uri.encodeComponent(userId)}&game_id=eq.${Uri.encodeComponent(gameId)}';

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