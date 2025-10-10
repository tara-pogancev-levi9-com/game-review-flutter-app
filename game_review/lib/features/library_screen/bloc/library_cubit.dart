import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/services/game_service.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'library_state.dart';

// IMPORTANT: We can discuss later about this specific cubit implementation and its pros/cons. 
// TODO: We can still improve by caching/fetching latest/popular games separately
// Q: We have library cubit and library state but mainly use game service in it. Is the naming conventionally correct or should we rename it to GameCubit/GameState to follow the service name?

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

  Future<void> _fetchAllAndEmit() async {
    emit(const LibraryState.loading());
    try {
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

  Future<void> _fetchUserListsAndEmit({List<Game>? latest, List<Game>? popular}) async {
    try {
      final results = await Future.wait([
        _gameService.getUserLibraryGames(),
        _gameService.getUserWishlistGames(),
      ]);

      emit(LibraryState.success(
        latestGames: latest ?? const [],
        popularGames: popular ?? const [],
        userLibraryGames: results[0],
        userWishlistGames: results[1],
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
    }

    try {
      final success = await _gameService.addToWishlist(game.id);
      if (success) {
        Logger.info(t.library.gameAddedToWishlist);
        await _fetchAllAndEmit();
        // Alternative: await _fetchUserListsAndEmit();   // if you want only user lists
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
    }

    try {
      final success = await _gameService.addToLibrary(game.id);
      if (success) {
        Logger.info(t.library.gameAddedToLibrary);
        await _fetchAllAndEmit(); 
        // Alternative: await _fetchUserListsAndEmit(); // if desired
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
