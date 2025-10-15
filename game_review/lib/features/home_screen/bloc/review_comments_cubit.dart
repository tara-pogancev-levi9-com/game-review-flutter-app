import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/features/home_screen/bloc/review_comments_state.dart';
import 'package:game_review/features/home_screen/services/review_comment_service.dart';

class ReviewCommentsCubit extends Cubit<ReviewCommentsState> {
  final ReviewCommentService _reviewCommentService;

  ReviewCommentsCubit(this._reviewCommentService) : super(const ReviewCommentsState.initial());

  Future<void> loadComments(String reviewId) async {
    emit(const ReviewCommentsState.loading());
    try {
      final comments = await _reviewCommentService.getCommentsForReview(reviewId);
      emit(ReviewCommentsState.success(comments));
    } catch (e) {
      Logger.error('Failed to load comments', e);
      emit(ReviewCommentsState.error(e.toString()));
    }
  }

  // TODO: add createComment/removeComment methods and update state locally (optimistic)
}
