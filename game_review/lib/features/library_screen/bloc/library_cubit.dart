import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/features/library_screen/models/game.dart';
import 'package:game_review/features/library_screen/services/game_service.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'library_state.dart';

// Q: Is there too much logic in cubit? Should some be moved to service?
enum AddResult { added, alreadyExists, failed }

class LibraryCubit extends Cubit<LibraryState> {
  final GameService _gameService;

  LibraryCubit(this._gameService) : super(const LibraryState.initial());

  Future<void> fetchGames() async {
    emit(const LibraryState.loading());
    try {
      // Q: Is there a better way to do this? Getting games every time is not optimal
      final results = await Future.wait([
        _gameService.getLatestGames(),
        _gameService.getPopularGames(),
        _gameService.getUserLibraryGames(),
        _gameService.getUserWishlistGames(),
      ]);

      emit(LibraryState.success(
        latestGames: results[0],
        popularGames: results[1],
        userLibraryGames: results[2],
        userWishlistGames: results[3],
      ));
    } catch (e) {
      Logger.error(t.library.failedToFetchGames, e);
      emit(LibraryState.error(e.toString()));
    }
  }

  Future<AddResult> addGameToWishlist(Game game) async {
    final currentState = state;
    if (currentState is LibrarySuccess) {
      if (currentState.userWishlistGames.any((g) => g.id == game.id)) {
        Logger.warning(t.library.gameAlreadyInWishlist);
        return AddResult.alreadyExists;
      }

      try {
        final success = await _gameService.addToWishlist(game.id);
        if (success) {
          Logger.info(t.library.gameAddedToWishlist);
          emit(currentState.copyWith(
            userWishlistGames: [...currentState.userWishlistGames, game],
          ));
          return AddResult.added;
        } else {
          Logger.warning(t.library.failedToAddToWishlist);
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error(t.library.failedToAddToWishlist, e);
        return AddResult.failed;
      }
    } else {
      try {
        final success = await _gameService.addToWishlist(game.id);
        if (success) {
          await fetchGames();
          return AddResult.added;
        } else {
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error(t.library.failedToAddToWishlist, e);
        return AddResult.failed;
      }
    }
  }

  Future<AddResult> addGameToLibrary(Game game) async {
    final currentState = state;
    if (currentState is LibrarySuccess) {
      if (currentState.userLibraryGames.any((g) => g.id == game.id)) {
        Logger.warning(t.library.gameAlreadyInLibrary);
        return AddResult.alreadyExists;
      }

      try {
        final success = await _gameService.addToLibrary(game.id);
        if (success) {
          Logger.info(t.library.gameAddedToLibrary);
          emit(currentState.copyWith(
            userLibraryGames: [...currentState.userLibraryGames, game],
          ));
          return AddResult.added;
        } else {
          Logger.warning(t.library.failedToAddToLibrary);
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error(t.library.failedToAddToLibrary, e);
        return AddResult.failed;
      }
    } else {
      try {
        final success = await _gameService.addToLibrary(game.id);
        if (success) {
          await fetchGames();
          return AddResult.added;
        } else {
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error(t.library.failedToAddToLibrary, e);
        return AddResult.failed;
      }
    }
  }

    Future<bool> removeGameFromWishlist(Game game) async {
    final currentState = state;
    if (currentState is LibrarySuccess) {
      if (!currentState.userWishlistGames.any((g) => g.id == game.id)) {
        Logger.warning(t.library.gameNotFoundInWishlist);
        return false;
      }

      final success = await _gameService.removeFromWishlist(game.id);
      if (success) {
        emit(currentState.copyWith(
          userWishlistGames: currentState.userWishlistGames.where((g) => g.id != game.id).toList(),
        ));
        return true;
      }
      return false;
    } else {
      final success = await _gameService.removeFromWishlist(game.id);
      if (success) await fetchGames();
      return success;
    }
  }

  Future<bool> removeGameFromLibrary(Game game) async {
    final currentState = state;
    if (currentState is LibrarySuccess) {
      if (!currentState.userLibraryGames.any((g) => g.id == game.id)) {
        Logger.warning(t.library.gameNotFoundInLibrary);
        return false;
      }

      final success = await _gameService.removeFromLibrary(game.id);
      if (success) {
        emit(currentState.copyWith(
          userLibraryGames: currentState.userLibraryGames.where((g) => g.id != game.id).toList(),
        ));
        return true;
      }
      return false;
    } else {
      final success = await _gameService.removeFromLibrary(game.id);
      if (success) await fetchGames();
      return success;
    }
  }

}
