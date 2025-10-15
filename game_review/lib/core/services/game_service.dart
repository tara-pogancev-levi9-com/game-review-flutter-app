import 'dart:io';

import 'package:game_review/common/models/models.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/core/api/api_constants.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/features/auth/services/auth_service.dart';
import 'package:game_review/i18n/strings.g.dart';

class GameService {
  final ApiClient _apiClient;
  final AuthService _authService;

  GameService(this._apiClient, this._authService);

  Future<GameModel?> getGameById(String gameId) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.games,
        queryParameters: {
          'id': 'eq.$gameId',
          'select': '*',
        },
      );
      if (response.statusCode != HttpStatus.ok) {
        throw Exception(
          'HTTP ${response.statusCode}: ${t.library.failedToFetchGame}',
        );
      }

      if (response.data is! List || (response.data as List).isEmpty) {
        throw Exception(t.errors.gameNotFound);
      }

      return GameModel.fromJson((response.data as List).first);
    } catch (e) {
      Logger.error('Failed to fetch game details', e);
      throw Exception(t.library.failedToFetchGame);
    }
  }

  Future<List<GameModel>> getRecentGames({
    int page = 0,
    int limit = Endpoints.limitDiscoverGames,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.games,
        queryParameters: {
          'select': '*',
          'order': 'created_at.desc',
          'limit': limit.toString(),
          'offset': (page * limit).toString(),
        },
      );

      if (response.statusCode != HttpStatus.ok) {
        throw Exception(
          'HTTP ${response.statusCode}: ${t.library.failedToFetchGames}',
        );
      }

      if (response.data is! List) {
        throw Exception(
          'Invalid response format: ${t.library.failedToFetchGames}',
        );
      }

      return (response.data as List)
          .map((json) => GameModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception(t.library.failedToFetchGames);
    }
  }

  Future<List<GameModel>> getLatestGames({
    int limit = Endpoints.limitPopularGames,
  }) async {
    try {
      final response = await _apiClient.get(
        Endpoints.games,
        queryParameters: {
          'select': '*',
          'order': 'release_date.desc',
          'limit': limit,
        },
      );
      if (response.statusCode == HttpStatus.ok && response.data is List) {
        return (response.data as List)
            .map((gameJson) => GameModel.fromJson(gameJson))
            .toList();
      }
      return [];
    } catch (e) {
      Logger.error(t.gameService.failedToFetchLatestGames, e);
      return [];
    }
  }

  Future<List<GameModel>> getPopularGames({
    int limit = Endpoints.limitPopularGames,
  }) async {
    try {
      final response = await _apiClient.get(
        Endpoints.games,
        queryParameters: {
          'select': '*',
          'order': 'title.asc',
          'limit': limit,
        },
      );
      if (response.statusCode == HttpStatus.ok && response.data is List) {
        return (response.data as List)
            .map((gameJson) => GameModel.fromJson(gameJson))
            .toList();
      }
      return [];
    } catch (e) {
      Logger.error(t.gameService.failedToFetchPopularGames, e);
      return [];
    }
  }

  Future<List<GameModel>> fetchGames({
    //int limit = 10,
    int limit = Endpoints.limitGames,
    int offset = 0,
  }) async {
    try {
      final response = await _apiClient.get(
        '/rest/v1/games',
        queryParameters: {
          'select': '*',
          'limit': limit,
          'offset': offset,
          'order': 'release_date.desc',
        },
      );

      if (response.statusCode == HttpStatus.ok && response.data is List) {
        return (response.data as List)
            .map((json) => GameModel.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      Logger.error('Failed to fetch games', e);
      return [];
    }
  }

  Future<List<GameModel>> getUserWishlistGames() async {
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

      if (response.statusCode == HttpStatus.ok && response.data is List) {
        return (response.data as List)
            .map((entry) => GameModel.fromJson(entry['games']))
            .toList();
      }
      return [];
    } catch (e) {
      Logger.error(t.gameService.failedToFetchWishlistGames, e);
      return [];
    }
  }

  Future<List<GameModel>> getUserLibraryGames() async {
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

      if (response.statusCode == HttpStatus.ok && response.data is List) {
        return (response.data as List)
            .map((entry) => GameModel.fromJson(entry['games']))
            .toList();
      }
      return [];
    } catch (e) {
      Logger.error(t.gameService.failedToFetchLibraryGames, e);
      throw Exception(t.library.failedToFetchGames);
    }
  }

  Future<List<GameReviewModel>> getRecentReviews(
    String gameId, {
    int limit = Endpoints.limitRecentReviews,
  }) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.gameReviews,
        queryParameters: {
          'game_id': 'eq.$gameId',
          'select': '*,users!inner(id,username,display_name,avatar_url)',
          'order': 'created_at.desc',
          'limit': limit.toString(),
        },
      );

      if (response.statusCode != HttpStatus.ok) {
        throw Exception(
          'HTTP ${response.statusCode}: ${t.errors.failedToFetchRecentReviews}',
        );
      }

      if (response.data is! List) {
        throw Exception(
          'Invalid response format: ${t.errors.failedToFetchRecentReviews}',
        );
      }

      return (response.data as List)
          .map((json) => GameReviewModel.fromJson(json))
          .toList();
    } catch (e) {
      Logger.error('Failed to fetch recent reviews', e);
      throw Exception(t.errors.failedToFetchRecentReviews);
    }
  }

  Future<void> addToWishlist(String gameId, int priority) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      await _authService.createUserDataIfNotPresent();

      final isAlreadyInWishlist = await isInWishlist(gameId);
      if (isAlreadyInWishlist) {
        throw Exception('Game already in wishlist');
      }

      final response = await _apiClient.post(
        ApiConstants.userWishlist,
        data: {
          'user_id': userId,
          'game_id': gameId,
          'priority': priority,
        },
      );

      if (response.statusCode != HttpStatus.created) {
        throw Exception(t.library.failedToAddToWishlist);
      }
    } catch (e) {
      throw Exception(t.gameDetails.failedToAddToWishlist);
    }
  }

  Future<bool> addToWishlistSimple(String gameId) async {
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

      if (response.statusCode == HttpStatus.created ||
          response.statusCode == HttpStatus.ok) {
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

  Future<void> removeFromWishlist(String gameId) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      final response = await _apiClient.delete(
        ApiConstants.userWishlist,
        queryParameters: {
          'user_id': 'eq.$userId',
          'game_id': 'eq.$gameId',
        },
      );

      if (response.statusCode != HttpStatus.noContent) {
        throw Exception(t.library.failedToRemoveFromWishlist);
      }
    } catch (e) {
      throw Exception(t.gameDetails.failedToRemoveFromWishlist);
    }
  }

  Future<bool> removeFromWishlistSimple(String gameId) async {
    try {
      final userId = await _authService.getUserId();
      if (userId == null) {
        Logger.warning(t.gameService.noTokenWishlist);
        return false;
      }

      final path =
          '${Endpoints.userWishlist}?user_id=eq.${Uri.encodeComponent(userId)}&game_id=eq.${Uri.encodeComponent(gameId)}';

      final response = await _apiClient.delete(path);

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.noContent) {
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

  Future<bool> isInWishlist(String gameId) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        return false;
      }

      final response = await _apiClient.get(
        ApiConstants.userWishlist,
        queryParameters: {
          'user_id': 'eq.$userId',
          'game_id': 'eq.$gameId',
          'select': 'id',
        },
      );

      return response.statusCode == HttpStatus.ok &&
          (response.data as List).isNotEmpty;
    } catch (e) {
      Logger.error('Failed to check if game is in wishlist', e);
      return false;
    }
  }

  Future<String?> getPlatformIdByName(String platformName) async {
    try {
      final response = await _apiClient.get(
        ApiConstants.gamingPlatforms,
        queryParameters: {
          'name': 'eq.$platformName',
          'select': 'id',
        },
      );

      if (response.statusCode != HttpStatus.ok) {
        throw Exception(
          'HTTP ${response.statusCode}: Failed to get platform ID',
        );
      }

      if (response.data is! List || (response.data as List).isEmpty) {
        throw Exception('Platform not found: $platformName');
      }

      return (response.data as List).first['id'] as String;
    } catch (e) {
      Logger.error('Failed to get platform ID by name', e);
      throw Exception('Failed to get platform ID for: $platformName');
    }
  }

  Future<void> addToLibrary(String gameId, String? platformId) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      final isAlreadyInLibrary = await isInLibrary(gameId);
      if (isAlreadyInLibrary) {
        throw Exception('Game already in library');
      }

      String? actualPlatformId;
      if (platformId != null) {
        try {
          actualPlatformId = await getPlatformIdByName(platformId);
        } catch (e) {
          Logger.error('Failed to get platform ID for library', e);
          throw Exception('Invalid platform: $platformId');
        }
      }

      final response = await _apiClient.post(
        ApiConstants.userLibrary,
        data: {
          'user_id': userId,
          'game_id': gameId,
          'platform_id': actualPlatformId,
          'hours_played': 0,
          'completion_percentage': 0.0,
          'is_favorite': false,
        },
      );

      if (response.statusCode != HttpStatus.created) {
        throw Exception(t.library.failedToAddToLibrary);
      }
    } catch (e) {
      Logger.error('Failed to add game to library', e);

      if (e.toString().contains('duplicate key value')) {
        throw Exception(t.gameDetails.alreadyInLibrary);
      } else if (e.toString().contains('Failed to add to library')) {
        throw Exception(t.library.failedToAddToLibrary);
      } else {
        throw Exception(t.library.failedToAddToLibrary);
      }
    }
  }

  Future<bool> addToLibrarySimple(String gameId) async {
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

      if (response.statusCode == HttpStatus.created ||
          response.statusCode == HttpStatus.ok) {
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

  Future<void> updateGameProgress(
    String gameId,
    int hoursPlayed,
    double completionPercentage,
  ) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      final response = await _apiClient.put(
        ApiConstants.userLibrary,
        data: {
          'hours_played': hoursPlayed,
          'completion_percentage': completionPercentage,
          'last_played': DateTime.now().toIso8601String(),
        },
        queryParameters: {
          'user_id': 'eq.$userId',
          'game_id': 'eq.$gameId',
        },
      );

      if (response.statusCode != HttpStatus.ok) {
        throw Exception(t.library.failedToUpdateGameProgress);
      }
    } catch (e) {
      throw Exception(t.library.failedToUpdateGameProgress);
    }
  }

  Future<void> removeFromLibrary(String gameId) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      final response = await _apiClient.delete(
        ApiConstants.userLibrary,
        queryParameters: {
          'user_id': 'eq.$userId',
          'game_id': 'eq.$gameId',
        },
      );

      if (response.statusCode != HttpStatus.noContent) {
        throw Exception(t.library.failedToRemoveFromLibrary);
      }
    } catch (e) {
      throw Exception(t.gameDetails.failedToRemoveFromLibrary);
    }
  }

  Future<bool> removeFromLibrarySimple(String gameId) async {
    try {
      final userId = await _authService.getUserId();
      if (userId == null) {
        Logger.warning(t.gameService.noTokenLibrary);
        return false;
      }

      final path =
          '${Endpoints.userLibrary}?user_id=eq.${Uri.encodeComponent(userId)}&game_id=eq.${Uri.encodeComponent(gameId)}';

      final response = await _apiClient.delete(path);

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.noContent) {
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

  Future<bool> isInLibrary(String gameId) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        return false;
      }

      final response = await _apiClient.get(
        ApiConstants.userLibrary,
        queryParameters: {
          'user_id': 'eq.$userId',
          'game_id': 'eq.$gameId',
          'select': 'id',
        },
      );

      return response.statusCode == HttpStatus.ok &&
          (response.data as List).isNotEmpty;
    } catch (e) {
      Logger.error('Failed to check if game is in library', e);
      return false;
    }
  }
}
