import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/features/library_screen/models/game.dart';
import 'package:game_review/features/library_screen/services/game_service.dart';
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

      emit(LibraryState.success(
        latestGames: results[0],
        popularGames: results[1],
        userLibraryGames: results[2],
        userWishlistGames: results[3],
      ));
    } catch (e) {
      Logger.error('Failed to fetch games', e);
      emit(LibraryState.error(e.toString()));
    }
  }

  /// Attempts to add [game] to wishlist.
  /// Returns AddResult.added | alreadyExists | failed
  Future<AddResult> addGameToWishlist(Game game) async {
    final currentState = state;
    // If we have the lists in state, check locally first
    if (currentState is LibrarySuccess) {
      if (currentState.userWishlistGames.any((g) => g.id == game.id)) {
        Logger.warning('Game already in wishlist');
        return AddResult.alreadyExists;
      }

      try {
        final success = await _gameService.addToWishlist(game.id);
        if (success) {
          Logger.info('Game added to wishlist');
          // optimistic local update
          emit(currentState.copyWith(
            userWishlistGames: [...currentState.userWishlistGames, game],
          ));
          return AddResult.added;
        } else {
          Logger.warning('Failed to add to wishlist (service returned false)');
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error('Wishlist addition failed', e);
        return AddResult.failed;
      }
    } else {
      // If not in success state, still try to add then refresh lists
      try {
        final success = await _gameService.addToWishlist(game.id);
        if (success) {
          await fetchGames();
          return AddResult.added;
        } else {
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error('Wishlist addition failed', e);
        return AddResult.failed;
      }
    }
  }

  /// Attempts to add [game] to library.
  /// Returns AddResult.added | alreadyExists | failed
  Future<AddResult> addGameToLibrary(Game game) async {
    final currentState = state;
    if (currentState is LibrarySuccess) {
      if (currentState.userLibraryGames.any((g) => g.id == game.id)) {
        Logger.warning('Game already in library');
        return AddResult.alreadyExists;
      }

      try {
        final success = await _gameService.addToLibrary(game.id);
        if (success) {
          Logger.info('Game added to library');
          emit(currentState.copyWith(
            userLibraryGames: [...currentState.userLibraryGames, game],
          ));
          return AddResult.added;
        } else {
          Logger.warning('Failed to add to library (service returned false)');
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error('Library addition failed', e);
        return AddResult.failed;
      }
    } else {
      // Not in success state: try and refresh afterwards
      try {
        final success = await _gameService.addToLibrary(game.id);
        if (success) {
          await fetchGames();
          return AddResult.added;
        } else {
          return AddResult.failed;
        }
      } catch (e) {
        Logger.error('Library addition failed', e);
        return AddResult.failed;
      }
    }
  }
}
