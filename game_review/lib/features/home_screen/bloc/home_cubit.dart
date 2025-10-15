import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/common/services/reviews_service.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/core/services/game_service.dart';
import 'package:game_review/i18n/strings.g.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GameService _gameService;
  final ReviewsService _reviewService;
  final int reviewsPageSize;
  final int gamesPageSize;

  final List<ReviewModel> _reviews = [];
  final List<GameModel> _games = [];

  HomeCubit(
    this._gameService,
    this._reviewService, {
    this.reviewsPageSize = Endpoints.limitRecentReviews,
    this.gamesPageSize = 10, // Page size for games
  }) : super(const HomeState.initial());

  Future<void> loadHome({
    int discoverLimit = 10,
  }) async {
    emit(const HomeState.loading());
    try {
      final results = await Future.wait([
        _gameService.fetchGames(limit: discoverLimit, offset: 0),
        _reviewService.getRecentReviews(limit: reviewsPageSize, offset: 0),
      ]);

      final initialGames = results[0] as List<GameModel>;
      final initialReviews = results[1] as List<ReviewModel>;

      _games
        ..clear()
        ..addAll(initialGames);

      _reviews
        ..clear()
        ..addAll(initialReviews);

      final hasMoreReviews = initialReviews.length >= reviewsPageSize;
      final hasMoreGames = initialGames.length >= discoverLimit;

      emit(
        HomeState.success(
          discoverGames: List.unmodifiable(_games),
          recentReviews: List.unmodifiable(_reviews),
          isLoadingMore: false,
          hasMore: hasMoreReviews,
          isLoadingMoreGames: false,
          hasMoreGames: hasMoreGames,
        ),
      );
    } catch (e) {
      Logger.error(t.errors.failedToLoadHome, e);
      emit(HomeState.error(e.toString()));
    }
  }

  Future<void> loadMoreReviews() async {
    final current = state;
    final inSuccess = current is HomeSuccess;
    if (!inSuccess) return;

    final success = current;
    if (success.isLoadingMore || !success.hasMore) return;

    emit(success.copyWith(isLoadingMore: true));

    try {
      final offset = _reviews.length;
      final next = await _reviewService.getRecentReviews(
        limit: reviewsPageSize,
        offset: offset,
      );

      if (next.isNotEmpty) {
        _reviews.addAll(next);
      }

      final hasMore = next.length >= reviewsPageSize;

      emit(
        success.copyWith(
          recentReviews: List.unmodifiable(_reviews),
          isLoadingMore: false,
          hasMore: hasMore,
        ),
      );
    } catch (e) {
      Logger.error('Failed to load more reviews', e);
      emit(success.copyWith(isLoadingMore: false));
    }
  }

  Future<void> loadMoreGames() async {
    final current = state;
    final inSuccess = current is HomeSuccess;
    if (!inSuccess) return;

    final success = current;
    if (success.isLoadingMoreGames || !success.hasMoreGames) return;

    emit(success.copyWith(isLoadingMoreGames: true));

    try {
      final offset = _games.length;
      final next = await _gameService.fetchGames(
        limit: gamesPageSize,
        offset: offset,
      );

      if (next.isNotEmpty) {
        _games.addAll(next);
      }

      final hasMoreGames = next.length >= gamesPageSize;

      emit(
        success.copyWith(
          discoverGames: List.unmodifiable(_games),
          isLoadingMoreGames: false,
          hasMoreGames: hasMoreGames,
        ),
      );
    } catch (e) {
      Logger.error('Failed to load more games', e);
      emit(success.copyWith(isLoadingMoreGames: false));
    }
  }

  List<ReviewModel> get currentReviews => List.unmodifiable(_reviews);
  List<GameModel> get currentGames => List.unmodifiable(_games);

  Future<void> refresh() => loadHome();
}
