import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_review/common/models/models.dart';
import 'package:game_review/core/services/game_service.dart';
import 'package:game_review/core/storage/secure_storage.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'package:get_it/get_it.dart';

abstract class GameDetailsState extends Equatable {
  const GameDetailsState();

  @override
  List<Object?> get props => [];
}

class GameDetailsInitial extends GameDetailsState {}

class GameDetailsLoading extends GameDetailsState {}

class GameDetailsLoaded extends GameDetailsState {
  final Game game;
  final Map<String, int> statistics;
  final bool isInWishlist;
  final bool isInLibrary;

  const GameDetailsLoaded({
    required this.game,
    required this.statistics,
    required this.isInWishlist,
    required this.isInLibrary,
  });

  @override
  List<Object?> get props => [game, statistics, isInWishlist, isInLibrary];
}

class GameDetailsError extends GameDetailsState {
  final String message;

  const GameDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}

class GameDetailsCubit extends Cubit<GameDetailsState> {
  final GameService _gameService;

  GameDetailsCubit({GameService? gameService})
    : _gameService = gameService ?? GetIt.instance<GameService>(),
      super(GameDetailsInitial());

  String? _successMessage;
  String? get successMessage => _successMessage;

  void clearSuccessMessage() {
    _successMessage = null;
  }

  Future<void> loadGameDetails(String gameId) async {
    emit(GameDetailsLoading());

    try {
      final game = await _gameService.getGameById(gameId);
      if (game == null) {
        emit(GameDetailsError(t.errors.gameNotFound));
        return;
      }

      final statistics = await _gameService.getGameStatistics(gameId);

      final isInWishlist = await _gameService.isInWishlist(gameId);
      final isInLibrary = await _gameService.isInLibrary(gameId);

      emit(
        GameDetailsLoaded(
          game: game,
          statistics: statistics,
          isInWishlist: isInWishlist,
          isInLibrary: isInLibrary,
        ),
      );
    } catch (e) {
      emit(GameDetailsError(e.toString()));
    }
  }

  Future<void> toggleWishlist(String gameId) async {
    final currentState = state;
    if (currentState is! GameDetailsLoaded) return;

    final token = await SecureStorage.getToken();
    if (token == null) {
      emit(GameDetailsError(t.gameDetails.loginRequiredWishlist));
      return;
    }

    try {
      if (currentState.isInWishlist) {
        await _gameService.removeFromWishlist(gameId);
        _successMessage = t.gameDetails.removedFromWishlist;

        emit(
          GameDetailsLoaded(
            game: currentState.game,
            statistics: currentState.statistics,
            isInWishlist: false,
            isInLibrary: currentState.isInLibrary,
          ),
        );
      } else {
        await _gameService.addToWishlist(gameId, 1);
        _successMessage = t.gameDetails.addedToWishlist;

        emit(
          GameDetailsLoaded(
            game: currentState.game,
            statistics: currentState.statistics,
            isInWishlist: true,
            isInLibrary: currentState.isInLibrary,
          ),
        );
      }
    } catch (e) {
      if (e.toString().contains('Failed to add to wishlist')) {
        emit(GameDetailsError(t.errors.failedToAddToWishlist));
      } else if (e.toString().contains('Failed to remove from wishlist')) {
        emit(GameDetailsError(t.errors.failedToRemoveFromWishlist));
      } else {
        emit(GameDetailsError(e.toString()));
      }
    }
  }

  Future<void> toggleLibrary(String gameId) async {
    final currentState = state;
    if (currentState is! GameDetailsLoaded) return;

    final token = await SecureStorage.getToken();
    if (token == null) {
      emit(GameDetailsError(t.gameDetails.loginRequiredLibrary));
      return;
    }

    try {
      if (currentState.isInLibrary) {
        await _gameService.removeFromLibrary(gameId);
        _successMessage = t.gameDetails.removedFromLibrary;

        emit(
          GameDetailsLoaded(
            game: currentState.game,
            statistics: currentState.statistics,
            isInWishlist: currentState.isInWishlist,
            isInLibrary: false,
          ),
        );
      } else {
        final platformId = currentState.game.platforms?.isNotEmpty == true
            ? currentState.game.platforms!.first
            : null;

        await _gameService.addToLibrary(gameId, platformId);
        _successMessage = t.gameDetails.addedToLibrary;

        emit(
          GameDetailsLoaded(
            game: currentState.game,
            statistics: currentState.statistics,
            isInWishlist: currentState.isInWishlist,
            isInLibrary: true,
          ),
        );
      }
    } catch (e) {
      if (e.toString().contains('Game already in library')) {
        emit(GameDetailsError(t.gameDetails.alreadyInLibrary));
      } else if (e.toString().contains('Failed to add to library')) {
        emit(GameDetailsError(t.errors.failedToAddToLibrary));
      } else if (e.toString().contains('Failed to remove from library')) {
        emit(GameDetailsError(t.errors.failedToRemoveFromLibrary));
      } else {
        emit(GameDetailsError(e.toString()));
      }
    }
  }
}
