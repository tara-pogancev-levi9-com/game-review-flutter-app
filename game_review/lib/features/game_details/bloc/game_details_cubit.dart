import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/core/services/game_service.dart';
import 'package:game_review/core/storage/secure_storage.dart';
import 'package:game_review/i18n/strings.g.dart';

import 'game_details_state.dart';

class _ErrorMessages {
  static const String failedToAddToWishlist = 'Failed to add to wishlist';
  static const String failedToRemoveFromWishlist =
      'Failed to remove from wishlist';
  static const String gameAlreadyInLibrary = 'Game already in library';
  static const String failedToAddToLibrary = 'Failed to add to library';
  static const String failedToRemoveFromLibrary =
      'Failed to remove from library';
}

class GameDetailsCubit extends Cubit<GameDetailsState> {
  final GameService _gameService;

  GameDetailsCubit({GameService? gameService})
    : _gameService = gameService ?? locator<GameService>(),
      super(GameDetailsInitial());

  String? _successMessage;
  String? get successMessage => _successMessage;

  void clearSuccessMessage() {
    _successMessage = null;
  }

  String _mapErrorToLocalizedMessage(Object error) {
    final errorString = error.toString();

    if (errorString.contains(_ErrorMessages.failedToAddToWishlist)) {
      return t.errors.failedToAddToWishlist;
    } else if (errorString.contains(
      _ErrorMessages.failedToRemoveFromWishlist,
    )) {
      return t.errors.failedToRemoveFromWishlist;
    } else if (errorString.contains(_ErrorMessages.gameAlreadyInLibrary)) {
      return t.gameDetails.alreadyInLibrary;
    } else if (errorString.contains(_ErrorMessages.failedToAddToLibrary)) {
      return t.errors.failedToAddToLibrary;
    } else if (errorString.contains(_ErrorMessages.failedToRemoveFromLibrary)) {
      return t.errors.failedToRemoveFromLibrary;
    }

    return errorString;
  }

  Future<void> loadGameDetails(String gameId) async {
    emit(GameDetailsLoading());

    try {
      final game = await _gameService.getGameById(gameId);
      if (game == null) {
        emit(GameDetailsError(t.errors.gameNotFound));
        return;
      }

      final isInWishlist = await _gameService.isInWishlist(gameId);
      final isInLibrary = await _gameService.isInLibrary(gameId);

      emit(
        GameDetailsLoaded(
          game: game,
          isInWishlist: isInWishlist,
          isInLibrary: isInLibrary,
        ),
      );
    } catch (e) {
      emit(GameDetailsError(e.toString()));
    }
  }

  bool _checkTokenAndEmitErrorIfNeeded() {
    final token = SecureStorage.getToken();
    if (token == null) {
      emit(GameDetailsError(t.gameDetails.loginRequiredWishlist));
      return false;
    }
    return true;
  }

  void _emitUpdatedState(
    GameDetailsLoaded currentState, {
    required bool isInWishlist,
    required bool isInLibrary,
  }) {
    emit(
      GameDetailsLoaded(
        game: currentState.game,
        isInWishlist: isInWishlist,
        isInLibrary: isInLibrary,
      ),
    );
  }

  Future<void> toggleWishlist(String gameId) async {
    final currentState = state;
    if (currentState is! GameDetailsLoaded) return;

    if (!_checkTokenAndEmitErrorIfNeeded()) return;

    try {
      if (currentState.isInWishlist) {
        await _gameService.removeFromWishlist(gameId);
        _successMessage = t.gameDetails.removedFromWishlist;

        _emitUpdatedState(
          currentState,
          isInWishlist: false,
          isInLibrary: currentState.isInLibrary,
        );
      } else {
        await _gameService.addToWishlist(gameId, 1);
        _successMessage = t.gameDetails.addedToWishlist;

        _emitUpdatedState(
          currentState,
          isInWishlist: true,
          isInLibrary: currentState.isInLibrary,
        );
      }
    } catch (e) {
      emit(GameDetailsError(_mapErrorToLocalizedMessage(e)));
    }
  }

  Future<void> toggleLibrary(String gameId) async {
    final currentState = state;
    if (currentState is! GameDetailsLoaded) return;

    if (!_checkTokenAndEmitErrorIfNeeded()) return;

    try {
      if (currentState.isInLibrary) {
        await _gameService.removeFromLibrary(gameId);
        _successMessage = t.gameDetails.removedFromLibrary;

        _emitUpdatedState(
          currentState,
          isInWishlist: currentState.isInWishlist,
          isInLibrary: false,
        );
      } else {
        final platformId = currentState.game.platforms?.isNotEmpty == true
            ? currentState.game.platforms!.first
            : null;

        await _gameService.addToLibrary(gameId, platformId);
        _successMessage = t.gameDetails.addedToLibrary;

        _emitUpdatedState(
          currentState,
          isInWishlist: currentState.isInWishlist,
          isInLibrary: true,
        );
      }
    } catch (e) {
      emit(GameDetailsError(_mapErrorToLocalizedMessage(e)));
    }
  }
}
