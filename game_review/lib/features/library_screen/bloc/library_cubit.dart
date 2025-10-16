import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/services/game_service.dart';
import 'package:game_review/i18n/strings.g.dart';

import 'library_state.dart';

enum AddResult { added, alreadyExists, failed }

class LibraryCubit extends Cubit<LibraryState> {
  final GameService _gameService;

  LibraryCubit(this._gameService) : super(const LibraryState.initial());

  Future<void> fetchGames() async {
    emit(const LibraryState.loading());
    try {
      final results = await Future.wait([
        _gameService.getLatestGames(),
        _gameService.getPopularGames(),
        _gameService.getUserLibraryGames(),
        _gameService.getUserWishlistGames(),
      ]);

      emit(
        LibraryState.success(
          latestGames: results[0],
          popularGames: results[1],
          userLibraryGames: results[2],
          userWishlistGames: results[3],
        ),
      );
    } catch (e) {
      Logger.error(t.errors.failedToFetchGames, e);
      emit(LibraryState.error(e.toString()));
    }
  }

  Future<void> _fetchAll() async {
    emit(const LibraryState.loading());
    try {
      final results = await Future.wait([
        _gameService.getLatestGames(),
        _gameService.getPopularGames(),
        _gameService.getUserLibraryGames(),
        _gameService.getUserWishlistGames(),
      ]);

      emit(
        LibraryState.success(
          latestGames: results[0],
          popularGames: results[1],
          userLibraryGames: results[2],
          userWishlistGames: results[3],
        ),
      );
    } catch (e) {
      Logger.error(t.errors.failedToFetchGames, e);
      emit(LibraryState.error(e.toString()));
    }
  }

  Future<AddResult> addGameToWishlist(GameModel game) async {
    final currentState = state;

    if (currentState is LibrarySuccess) {
      if (currentState.userWishlistGames.any((g) => g.id == game.id)) {
        Logger.warning(t.gameDetails.gameAlreadyInWishlist);
        return AddResult.alreadyExists;
      }

      try {
        final success = await _gameService.addToWishlistSimple(game.id);
        if (success) {
          Logger.info(t.gameService.gameAddedToWishlistSuccess);
          emit(
            currentState.copyWith(
              userWishlistGames: [...currentState.userWishlistGames, game],
            ),
          );
          return AddResult.added;
        } else {
          Logger.warning(t.errors.failedToAddToWishlist);
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error(t.errors.failedToAddToWishlist, e);
        return AddResult.failed;
      }
    }

    try {
      final success = await _gameService.addToWishlistSimple(game.id);
      if (success) {
        Logger.info(t.gameService.gameAddedToWishlistSuccess);
        await _fetchAll();
        // Alternative: await _fetchUserLists();   // if you want only user lists
        return AddResult.added;
      } else {
        Logger.warning(t.errors.failedToAddToWishlist);
        return AddResult.failed;
      }
    } catch (e) {
      Logger.error(t.errors.failedToAddToWishlist, e);
      return AddResult.failed;
    }
  }

  Future<AddResult> addGameToLibrary(GameModel game) async {
    final currentState = state;

    if (currentState is LibrarySuccess) {
      if (currentState.userLibraryGames.any((g) => g.id == game.id)) {
        Logger.warning(t.gameDetails.gameAlreadyInLibrary);
        return AddResult.alreadyExists;
      }

      try {
        final success = await _gameService.addToLibrarySimple(game.id);
        if (success) {
          Logger.info(t.gameService.gameAddedToLibrarySuccess);
          emit(
            currentState.copyWith(
              userLibraryGames: [...currentState.userLibraryGames, game],
            ),
          );
          return AddResult.added;
        } else {
          Logger.warning(t.errors.failedToAddToLibrary);
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error(t.errors.failedToAddToLibrary, e);
        return AddResult.failed;
      }
    }

    try {
      final success = await _gameService.addToLibrarySimple(game.id);
      if (success) {
        Logger.info(t.gameService.gameAddedToLibrarySuccess);
        await _fetchAll();
        // Alternative: await _fetchUserLists(); // if desired
        return AddResult.added;
      } else {
        Logger.warning(t.errors.failedToAddToLibrary);
        return AddResult.failed;
      }
    } catch (e) {
      Logger.error(t.errors.failedToAddToLibrary, e);
      return AddResult.failed;
    }
  }

  Future<bool> removeGameFromWishlist(GameModel game) async {
    final currentState = state;
    if (currentState is LibrarySuccess) {
      if (!currentState.userWishlistGames.any((g) => g.id == game.id)) {
        Logger.warning(t.library.gameNotFoundInWishlist);
        return false;
      }

      final success = await _gameService.removeFromWishlistSimple(game.id);
      if (success) {
        emit(
          currentState.copyWith(
            userWishlistGames: currentState.userWishlistGames
                .where((g) => g.id != game.id)
                .toList(),
          ),
        );
        return true;
      }
      return false;
    } else {
      final success = await _gameService.removeFromWishlistSimple(game.id);
      if (success) await fetchGames();
      return success;
    }
  }

  Future<bool> removeGameFromLibrary(GameModel game) async {
    final currentState = state;
    if (currentState is LibrarySuccess) {
      if (!currentState.userLibraryGames.any((g) => g.id == game.id)) {
        Logger.warning(t.library.gameNotFoundInLibrary);
        return false;
      }

      final success = await _gameService.removeFromLibrarySimple(game.id);
      if (success) {
        emit(
          currentState.copyWith(
            userLibraryGames: currentState.userLibraryGames
                .where((g) => g.id != game.id)
                .toList(),
          ),
        );
        return true;
      }
      return false;
    } else {
      final success = await _gameService.removeFromLibrarySimple(game.id);
      if (success) await fetchGames();
      return success;
    }
  }
}
