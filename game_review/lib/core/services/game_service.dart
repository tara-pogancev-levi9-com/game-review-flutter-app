import 'dart:io';
import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/core/api/api_constants.dart';
import 'package:game_review/common/models/models.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/features/auth/auth_service.dart';

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

      if (response.statusCode == HttpStatus.ok &&
          response.data is List &&
          (response.data as List).isNotEmpty) {
        return GameModel.fromJson((response.data as List).first);
      }
      return null;
    } catch (e) {
      Logger.error('Failed to fetch game details', e);
      throw Exception(t.errors.failedToFetchGame);
    }
  }

  Future<List<GameModel>> getRecentGames({
    int page = 0,
    int limit = 20,
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

      if (response.statusCode == HttpStatus.ok && response.data is List) {
        return (response.data as List)
            .map((json) => GameModel.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      Logger.error('Failed to fetch recent games', e);
      throw Exception(t.errors.failedToFetchGames);
    }
  }

  Future<List<GameReviewModel>> getRecentReviews(
    String gameId, {
    int limit = 5,
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

      if (response.statusCode == HttpStatus.ok && response.data is List) {
        return (response.data as List)
            .map((json) => GameReviewModel.fromJson(json))
            .toList();
      }
      return [];
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
        throw Exception(t.errors.failedToAddToWishlist);
      }
    } catch (e) {
      Logger.error('Failed to add game to wishlist', e);

      if (e.toString().contains('409') || e.toString().contains('Conflict')) {
        throw Exception('Game is already in your wishlist');
      } else if (e.toString().contains('Failed to add to wishlist')) {
        throw Exception(t.errors.failedToAddToWishlist);
      } else {
        throw Exception(t.errors.failedToAddToWishlist);
      }
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
        throw Exception(t.errors.failedToRemoveFromWishlist);
      }
    } catch (e) {
      Logger.error('Failed to remove game from wishlist', e);
      throw Exception(t.errors.failedToRemoveFromWishlist);
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

      if (response.statusCode == HttpStatus.ok &&
          response.data is List &&
          (response.data as List).isNotEmpty) {
        return (response.data as List).first['id'] as String;
      }
      return null;
    } catch (e) {
      Logger.error('Failed to get platform ID by name', e);
      return null;
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
        actualPlatformId = await getPlatformIdByName(platformId);
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
        throw Exception(t.errors.failedToAddToLibrary);
      }
    } catch (e) {
      Logger.error('Failed to add game to library', e);

      if (e.toString().contains('duplicate key value')) {
        throw Exception('Game is already in your library');
      } else if (e.toString().contains('Failed to add to library')) {
        throw Exception(t.errors.failedToAddToLibrary);
      } else {
        throw Exception(t.errors.failedToAddToLibrary);
      }
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
        throw Exception(t.errors.failedToUpdateGameProgress);
      }
    } catch (e) {
      Logger.error('Failed to update game progress', e);
      throw Exception(t.errors.failedToUpdateGameProgress);
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
        throw Exception(t.errors.failedToRemoveFromLibrary);
      }
    } catch (e) {
      Logger.error('Failed to remove game from library', e);
      throw Exception(t.errors.failedToRemoveFromLibrary);
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
