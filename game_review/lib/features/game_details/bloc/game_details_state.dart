import 'package:equatable/equatable.dart';
import 'package:game_review/common/models/models.dart';

sealed class GameDetailsState extends Equatable {
  const GameDetailsState();

  @override
  List<Object?> get props => [];
}

class GameDetailsInitial extends GameDetailsState {}

class GameDetailsLoading extends GameDetailsState {}

class GameDetailsLoaded extends GameDetailsState {
  final GameModel game;
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
