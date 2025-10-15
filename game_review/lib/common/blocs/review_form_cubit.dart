import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/blocs/review_form_state.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/common/services/reviews_service.dart';
import 'package:game_review/common/utils/app_exception.dart';
import 'package:game_review/common/utils/logger.dart';

class ReviewFormCubit extends Cubit<ReviewFormState> {
  final ReviewsService _service;

  ReviewFormCubit(this._service) : super(const ReviewFormState.initial());

  Future<ReviewModel?> addReview({
    required String userId,
    required String gameId,
    String? title,
    String? content,
    double? overallRating,
    double? gameplayRating,
    double? graphicsRating,
    double? storyRating,
    double? soundRating,
    double? valueRating,
    List<String>? pros,
    List<String>? cons,
    int? playtimeHours,
    String? completionStatus,
    bool? recommended,
  }) async {
    emit(const ReviewFormState.loading());
    try {
      final review = await _service.addReview(
        userId: userId,
        gameId: gameId,
        title: title,
        content: content,
        overallRating: overallRating,
        gameplayRating: gameplayRating,
        graphicsRating: graphicsRating,
        storyRating: storyRating,
        soundRating: soundRating,
        valueRating: valueRating,
        pros: pros,
        cons: cons,
        playtimeHours: playtimeHours,
        completionStatus: completionStatus,
        recommended: recommended,
      );
      emit(ReviewFormState.success(review));
      return review;
    } on AppException catch (e) {
      Logger.error('Error adding review', e);
      // Use fallback message since we can't translate in cubit
      final errorMessage = e.fallbackMessage ?? e.messageKey;
      emit(ReviewFormState.error(errorMessage));
      return null;
    } catch (e) {
      Logger.error('Error adding review', e);
      emit(ReviewFormState.error(e.toString()));
      return null;
    }
  }

  Future<bool> updateReview({
    required String id,
    String? title,
    String? content,
    double? overallRating,
    double? gameplayRating,
    double? graphicsRating,
    double? storyRating,
    double? soundRating,
    double? valueRating,
    List<String>? pros,
    List<String>? cons,
    int? playtimeHours,
    String? completionStatus,
    bool? recommended,
  }) async {
    emit(const ReviewFormState.loading());
    try {
      await _service.updateReview(
        id: id,
        title: title,
        content: content,
        overallRating: overallRating,
        gameplayRating: gameplayRating,
        graphicsRating: graphicsRating,
        storyRating: storyRating,
        soundRating: soundRating,
        valueRating: valueRating,
        pros: pros,
        cons: cons,
        playtimeHours: playtimeHours,
        completionStatus: completionStatus,
        recommended: recommended,
      );
      emit(const ReviewFormState.success(null));
      return true;
    } on AppException catch (e) {
      Logger.error('Error updating review', e);
      final errorMessage = e.fallbackMessage ?? e.messageKey;
      emit(ReviewFormState.error(errorMessage));
      return false;
    } catch (e) {
      Logger.error('Error updating review', e);
      emit(ReviewFormState.error(e.toString()));
      return false;
    }
  }

  Future<bool> deleteReview(String reviewId) async {
    emit(const ReviewFormState.loading());
    try {
      await _service.deleteReview(reviewId);
      emit(const ReviewFormState.success(null));
      return true;
    } on AppException catch (e) {
      Logger.error('Error deleting review', e);
      final errorMessage = e.fallbackMessage ?? e.messageKey;
      emit(ReviewFormState.error(errorMessage));
      return false;
    } catch (e) {
      Logger.error('Error deleting review', e);
      emit(ReviewFormState.error(e.toString()));
      return false;
    }
  }
}
