import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/services/game_service.dart';
import 'package:game_review/features/profile_screen/services/user_service.dart';
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
      final user = await locator<UserService>().getCurrentUser();

      emit(
        LibraryState.success(
          latestGames: results[0],
          popularGames: results[1],
          userLibraryGames: results[2],
          userWishlistGames: results[3],
          user: user,
        ),
      );
    } catch (e) {
      Logger.error(t.library.failedToFetchGames, e);
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
      Logger.error(t.library.failedToFetchGames, e);
      emit(LibraryState.error(e.toString()));
    }
  }

  Future<AddResult> addGameToWishlist(GameModel game) async {
    final currentState = state;

    if (currentState is LibrarySuccess) {
      if (currentState.userWishlistGames.any((g) => g.id == game.id)) {
        Logger.warning(t.library.gameAlreadyInWishlist);
        return AddResult.alreadyExists;
      }

      try {
        final success = await _gameService.addToWishlistSimple(game.id);
        if (success) {
          Logger.info(t.library.gameAddedToWishlist);
          emit(
            currentState.copyWith(
              userWishlistGames: [...currentState.userWishlistGames, game],
            ),
          );
          return AddResult.added;
        } else {
          Logger.warning(t.library.failedToAddToWishlist);
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error(t.library.failedToAddToWishlist, e);
        return AddResult.failed;
      }
    }

    try {
      final success = await _gameService.addToWishlistSimple(game.id);
      if (success) {
        Logger.info(t.library.gameAddedToWishlist);
        await _fetchAll();
        // Alternative: await _fetchUserLists();   // if you want only user lists
        return AddResult.added;
      } else {
        Logger.warning(t.library.failedToAddToWishlist);
        return AddResult.failed;
      }
    } catch (e) {
      Logger.error(t.library.failedToAddToWishlist, e);
      return AddResult.failed;
    }
  }

  Future<AddResult> addGameToLibrary(GameModel game) async {
    final currentState = state;

    if (currentState is LibrarySuccess) {
      if (currentState.userLibraryGames.any((g) => g.id == game.id)) {
        Logger.warning(t.library.gameAlreadyInLibrary);
        return AddResult.alreadyExists;
      }

      try {
        final success = await _gameService.addToLibrarySimple(game.id);
        if (success) {
          Logger.info(t.library.gameAddedToLibrary);
          emit(
            currentState.copyWith(
              userLibraryGames: [...currentState.userLibraryGames, game],
            ),
          );
          return AddResult.added;
        } else {
          Logger.warning(t.library.failedToAddToLibrary);
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error(t.library.failedToAddToLibrary, e);
        return AddResult.failed;
      }
    }

    try {
      final success = await _gameService.addToLibrarySimple(game.id);
      if (success) {
        Logger.info(t.library.gameAddedToLibrary);
        await _fetchAll();
        // Alternative: await _fetchUserLists(); // if desired
        return AddResult.added;
      } else {
        Logger.warning(t.library.failedToAddToLibrary);
        return AddResult.failed;
      }
    } catch (e) {
      Logger.error(t.library.failedToAddToLibrary, e);
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
