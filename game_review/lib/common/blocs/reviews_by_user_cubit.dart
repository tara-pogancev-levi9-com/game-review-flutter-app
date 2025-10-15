import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/blocs/review_state.dart';
import 'package:game_review/common/services/reviews_service.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/i18n/strings.g.dart';

class ReviewsByUserCubit extends Cubit<ReviewState> {
  final ReviewsService _service;
  static const int _pageSize = 10;
  String? _currentUserId;

  ReviewsByUserCubit(this._service) : super(const ReviewState.initial());

  Future<void> loadReviews({
    required String userId,
    int limit = Endpoints.limitRecentReviews,
  }) async {
    _currentUserId = userId;
    emit(const ReviewState.loading());
    try {
      final reviews = await _service.fetchReviewsByUser(
        user_id: userId,
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
    if (_currentUserId == null) return;

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
          final newReviews = await _service.fetchReviewsByUser(
            user_id: _currentUserId!,
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
}
