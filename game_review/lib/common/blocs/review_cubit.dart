import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/services/reviews_service.dart';
import 'package:game_review/i18n/strings.g.dart';
import 'review_state.dart';
import 'package:game_review/common/utils/logger.dart';

class ReviewsCubit extends Cubit<ReviewState> {
  final ReviewsService _service;
  static const int _pageSize = 10;

  ReviewsCubit(this._service) : super(const ReviewState.initial());

  Future<void> loadReviewsByGame({
    required String game_id,
    int limit = 10,
  }) async {
    emit(const ReviewState.loading());
    try {
      final reviews = await _service.fetchReviewsByGame(
        game_id: game_id,
        limit: limit,
      );
      final hasMore = reviews.length >= limit;
      emit(ReviewState.loaded(reviews, hasMore: hasMore));
    } catch (e) {
      Logger.error('Error loading reviews', e);

      emit(ReviewState.error(e.toString()));
    }
  }

  Future<void> loadReviewsByUser({
    required String user_id,
    int limit = 10,
  }) async {
    emit(const ReviewState.loading());
    try {
      final reviews = await _service.fetchReviewsByUser(
        user_id: user_id,
        limit: limit,
      );
      final hasMore = reviews.length >= limit;
      emit(ReviewState.loaded(reviews, hasMore: hasMore));
    } catch (e) {
      Logger.error('Error loading reviews', e);
      emit(ReviewState.error(e.toString()));
    }
  }

  Future<void> loadMoreReviews({required String game_id}) async {
    final currentState = state;
    await currentState.maybeWhen(
      loaded: (reviews, hasMore, isLoadingMore) async {
        if (!hasMore || isLoadingMore) return;
        Logger.info('Loading more reviews...');

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
            game_id: game_id,
            limit: _pageSize,
            offset: offset,
          );
          final allReviews = [...reviews, ...newReviews];
          final hasMoreNew = newReviews.length >= _pageSize;

          Logger.info(
            'Loaded ${newReviews.length} more reviews, total: ${allReviews.length}',
          );

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

  Future<void> addReview({
    required String user_id,
    required String game_id,
    String? title,
    String? content,
    double? overall_rating,
    double? gameplay_rating,
    double? graphics_rating,
    double? story_rating,
    double? sound_rating,
    double? value_rating,
    List<String>? pros,
    List<String>? cons,
    int? playtime_hours,
    String? completion_status,
    bool? recommended,
  }) async {
    emit(const ReviewState.loading());
    try {
      final review = await _service.addReview(
        user_id: user_id,
        game_id: game_id,
        title: title,
        content: content,
        overall_rating: overall_rating,
        gameplay_rating: gameplay_rating,
        graphics_rating: graphics_rating,
        story_rating: story_rating,
        sound_rating: sound_rating,
        value_rating: value_rating,
        pros: pros,
        cons: cons,
        playtime_hours: playtime_hours,
        completion_status: completion_status,
        recommended: recommended,
      );
      emit(ReviewState.reviewAdded(review));
    } catch (e) {
      Logger.error('Error adding review', e);
      emit(ReviewState.error(e.toString()));
    }
  }

  Future<void> updateReview({
    required String id,
    String? title,
    String? content,
    double? overall_rating,
    double? gameplay_rating,
    double? graphics_rating,
    double? story_rating,
    double? sound_rating,
    double? value_rating,
    List<String>? pros,
    List<String>? cons,
    int? playtime_hours,
    String? completion_status,
    bool? recommended,
  }) async {
    emit(const ReviewState.loading());
    try {
      await _service.updateReview(
        id: id,
        title: title,
        content: content,
        overall_rating: overall_rating,
        gameplay_rating: gameplay_rating,
        graphics_rating: graphics_rating,
        story_rating: story_rating,
        sound_rating: sound_rating,
        value_rating: value_rating,
        pros: pros,
        cons: cons,
        playtime_hours: playtime_hours,
        completion_status: completion_status,
        recommended: recommended,
      );
      // Reload reviews after update
      final currentState = state;
      await currentState.maybeWhen(
        loaded: (reviews, _, __) async {
          emit(ReviewState.loaded(reviews));
        },
        orElse: () {},
      );
    } catch (e) {
      Logger.error('Error updating review', e);
      emit(ReviewState.error(e.toString()));
    }
  }

  Future<void> deleteReview(String reviewId) async {
    try {
      await _service.deleteReview(reviewId);
      // Reload reviews after delete
      final currentState = state;
      await currentState.maybeWhen(
        loaded: (reviews, _, __) async {
          final updatedReviews = reviews
              .where((review) => review.id != reviewId)
              .toList();
          emit(ReviewState.loaded(updatedReviews));
        },
        orElse: () {},
      );
    } catch (e) {
      Logger.error('Error deleting review', e);
      emit(ReviewState.error(e.toString()));
    }
  }
}
