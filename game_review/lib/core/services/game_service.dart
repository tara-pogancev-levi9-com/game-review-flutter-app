import 'package:game_review/core/api/api_client.dart';
import 'package:game_review/common/models/models.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:game_review/features/auth/auth_service.dart';

class GameService {
  final ApiClient _apiClient;
  final AuthService _authService;

  GameService(this._apiClient, this._authService);

  Future<Game?> getGameById(String gameId) async {
    try {
      final response = await _apiClient.get(
        'rest/v1/games',
        queryParameters: {
          'id': 'eq.$gameId',
          'select': '*',
        },
      );

      if (response.statusCode == 200 &&
          response.data is List &&
          (response.data as List).isNotEmpty) {
        return Game.fromJson((response.data as List).first);
      }
      return null;
    } catch (e) {
      throw Exception(t.errors.failedToFetchGame);
    }
  }

  Future<List<Game>> getGames({
    int page = 0,
    int limit = 20,
  }) async {
    try {
      final response = await _apiClient.get(
        'rest/v1/games',
        queryParameters: {
          'select': '*',
          'order': 'created_at.desc',
          'limit': limit.toString(),
          'offset': (page * limit).toString(),
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((json) => Game.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      throw Exception(t.errors.failedToFetchGames);
    }
  }

  Future<Map<String, int>> getGameStatistics(String gameId) async {
    try {
      final reviewsResponse = await _apiClient.get(
        'rest/v1/game_reviews',
        queryParameters: {
          'game_id': 'eq.$gameId',
          'select': 'id',
        },
      );

      final wishlistResponse = await _apiClient.get(
        'rest/v1/user_wishlist',
        queryParameters: {
          'game_id': 'eq.$gameId',
          'select': 'id',
        },
      );

      final libraryResponse = await _apiClient.get(
        'rest/v1/user_library',
        queryParameters: {
          'game_id': 'eq.$gameId',
          'select': 'id',
        },
      );

      return {
        'reviewsCount': (reviewsResponse.data as List).length,
        'wishlistCount': (wishlistResponse.data as List).length,
        'libraryCount': (libraryResponse.data as List).length,
      };
    } catch (e) {
      throw Exception(t.errors.failedToFetchGameStatistics);
    }
  }

  Future<List<GameReview>> getRecentReviews(
    String gameId, {
    int limit = 5,
  }) async {
    try {
      final response = await _apiClient.get(
        'rest/v1/game_reviews',
        queryParameters: {
          'game_id': 'eq.$gameId',
          'select': '*,users!inner(id,username,display_name,avatar_url)',
          'order': 'created_at.desc',
          'limit': limit.toString(),
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((json) => GameReview.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      throw Exception(t.errors.failedToFetchRecentReviews);
    }
  }

  Future<void> addToWishlist(String gameId, int priority) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      await _authService.ensureUserExists();

      final isAlreadyInWishlist = await isInWishlist(gameId);
      if (isAlreadyInWishlist) {
        throw Exception('Game already in wishlist');
      }

      final response = await _apiClient.post(
        'rest/v1/user_wishlist',
        data: {
          'user_id': userId,
          'game_id': gameId,
          'priority': priority,
        },
      );

      if (response.statusCode != 201) {
        throw Exception(t.errors.failedToAddToWishlist);
      }
    } catch (e) {
      throw Exception(t.errors.failedToAddToWishlist);
    }
  }

  Future<void> removeFromWishlist(String gameId) async {
    try {
      final userId = await _authService.getCurrentUserId();
      if (userId == null) {
        throw Exception('User not authenticated');
      }

      final response = await _apiClient.delete(
        'rest/v1/user_wishlist',
        queryParameters: {
          'user_id': 'eq.$userId',
          'game_id': 'eq.$gameId',
        },
      );

      if (response.statusCode != 204) {
        throw Exception(t.errors.failedToRemoveFromWishlist);
      }
    } catch (e) {
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
        'rest/v1/user_wishlist',
        queryParameters: {
          'user_id': 'eq.$userId',
          'game_id': 'eq.$gameId',
          'select': 'id',
        },
      );

      return response.statusCode == 200 && (response.data as List).isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  Future<String?> getPlatformIdByName(String platformName) async {
    try {
      final response = await _apiClient.get(
        'rest/v1/gaming_platforms',
        queryParameters: {
          'name': 'eq.$platformName',
          'select': 'id',
        },
      );

      if (response.statusCode == 200 &&
          response.data is List &&
          (response.data as List).isNotEmpty) {
        return (response.data as List).first['id'] as String;
      }
      return null;
    } catch (e) {
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
        'rest/v1/user_library',
        data: {
          'user_id': userId,
          'game_id': gameId,
          'platform_id': actualPlatformId,
          'hours_played': 0,
          'completion_percentage': 0.0,
          'is_favorite': false,
        },
      );

      if (response.statusCode != 201) {
        throw Exception(t.errors.failedToAddToLibrary);
      }
    } catch (e) {
      if (e.toString().contains('duplicate key value')) {
        throw Exception('Game already in library');
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
        'rest/v1/user_library',
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

      if (response.statusCode != 200) {
        throw Exception(t.errors.failedToUpdateGameProgress);
      }
    } catch (e) {
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
        'rest/v1/user_library',
        queryParameters: {
          'user_id': 'eq.$userId',
          'game_id': 'eq.$gameId',
        },
      );

      if (response.statusCode != 204) {
        throw Exception(t.errors.failedToRemoveFromLibrary);
      }
    } catch (e) {
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
        'rest/v1/user_library',
        queryParameters: {
          'user_id': 'eq.$userId',
          'game_id': 'eq.$gameId',
          'select': 'id',
        },
      );

      return response.statusCode == 200 && (response.data as List).isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
