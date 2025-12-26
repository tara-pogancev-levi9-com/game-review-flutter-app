import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/common/models/models.dart';

part 'review_comments_state.freezed.dart';

@freezed
class ReviewCommentsState with _$ReviewCommentsState {
  const factory ReviewCommentsState.initial() = ReviewCommentsInitial;

  const factory ReviewCommentsState.loading() = ReviewCommentsLoading;

  const factory ReviewCommentsState.success(List<ReviewCommentModel> comments) =
      ReviewCommentsSuccess;

  const factory ReviewCommentsState.error(String message) = ReviewCommentsError;
}
