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
  final List<ReviewModel> _reviews = [];

  HomeCubit(
    this._gameService,
    this._reviewService, {
    this.reviewsPageSize = Endpoints.limitRecentReviews,
  }) : super(const HomeState.initial());

  Future<void> loadHome({
    int discoverLimit = Endpoints.limitDiscoverGames,
  }) async {
    emit(const HomeState.loading());
    try {
      final results = await Future.wait([
        _gameService.getLatestGames(limit: discoverLimit),
        _reviewService.getRecentReviews(limit: reviewsPageSize, offset: 0),
      ]);

      final latestGames = results[0] as List<GameModel>;
      final first = results[1] as List<ReviewModel>;

      _reviews
        ..clear()
        ..addAll(first);

      final hasMore = first.length >= reviewsPageSize;
      emit(
        HomeState.success(
          discoverGames: latestGames,
          recentReviews: List.unmodifiable(_reviews),
          isLoadingMore: false,
          hasMore: hasMore,
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

  List<ReviewModel> get currentReviews => List.unmodifiable(_reviews);

  Future<void> refresh() => loadHome();
}
