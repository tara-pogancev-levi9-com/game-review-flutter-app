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
    emit(const ReviewFormState.loading());
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
    emit(const ReviewFormState.loading());
    try {
      await _service.updateReview(
        id: id,
        title: title,
        content: content,
        overallRating: overall_rating,
        gameplayRating: gameplay_rating,
        graphicsRating: graphics_rating,
        storyRating: story_rating,
        soundRating: sound_rating,
        valueRating: value_rating,
        pros: pros,
        cons: cons,
        playtimeHours: playtime_hours,
        completionStatus: completion_status,
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
