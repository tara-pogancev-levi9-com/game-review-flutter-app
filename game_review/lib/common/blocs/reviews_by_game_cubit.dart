import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/common/services/reviews_service.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'review_state.dart';
import 'package:game_review/common/utils/logger.dart';

class ReviewsByGameCubit extends Cubit<ReviewState> {
  final ReviewsService _service;
  static const int _pageSize = 10;
  String? _currentGameId; // Track what we're viewing

  ReviewsByGameCubit(this._service) : super(const ReviewState.initial());

  Future<void> loadReviews({
    required String gameId,
    int limit = Endpoints.limitRecentReviews,
  }) async {
    _currentGameId = gameId;
    emit(const ReviewState.loading());
    try {
      final reviews = await _service.fetchReviewsByGame(
        game_id: gameId,
        limit: limit,
      );
      final hasMore = reviews.length >= limit;
      emit(ReviewState.loaded(reviews, hasMore: hasMore));
    } catch (e) {
      Logger.error('Error loading reviews', e);
      emit(ReviewState.error(e.toString()));
    }
  }

  Future<void> loadMoreReviews() async {
    if (_currentGameId == null) return;

    final currentState = state;
    await currentState.maybeWhen(
      loaded: (reviews, hasMore, isLoadingMore) async {
        if (!hasMore || isLoadingMore) return;

        emit(
          ReviewState.loaded(
            reviews,
            hasMore: hasMore,
            isLoadingMore: true,
          ),
        );

        try {
          final offset = reviews.length;
          final newReviews = await _service.fetchReviewsByGame(
            game_id: _currentGameId!,
            limit: _pageSize,
            offset: offset,
          );
          final allReviews = [...reviews, ...newReviews];
          final hasMoreNew = newReviews.length >= _pageSize;

          emit(
            ReviewState.loaded(
              allReviews,
              hasMore: hasMoreNew,
              isLoadingMore: false,
            ),
          );
        } catch (e) {
          Logger.error('Failed to load more reviews', e);
          emit(ReviewState.error(t.errorLoadingMoreGames));
        }
      },
      orElse: () {},
    );
  }

  Future<void> refresh() async {
    if (_currentGameId != null) {
      await loadReviews(gameId: _currentGameId!);
    }
  }

  void prependReview(ReviewModel review) {
    state.maybeWhen(
      loaded: (reviews, hasMore, isLoadingMore) {
        emit(
          ReviewState.loaded(
            [review, ...reviews],
            hasMore: hasMore,
            isLoadingMore: isLoadingMore,
          ),
        );
      },
      orElse: () {},
    );
  }

  void removeReview(String reviewId) {
    state.maybeWhen(
      loaded: (reviews, hasMore, isLoadingMore) {
        final updated = reviews.where((r) => r.id != reviewId).toList();
        emit(
          ReviewState.loaded(
            updated,
            hasMore: hasMore,
            isLoadingMore: isLoadingMore,
          ),
        );
      },
      orElse: () {},
    );
  }
}
