import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/features/home_screen/models/review_comment.dart';

part 'review_comments_state.freezed.dart';

@freezed
class ReviewCommentsState with _$ReviewCommentsState {
  const factory ReviewCommentsState.initial() = ReviewCommentsInitial;
  const factory ReviewCommentsState.loading() = ReviewCommentsLoading;
  const factory ReviewCommentsState.success(List<ReviewComment> comments) = ReviewCommentsSuccess;
  const factory ReviewCommentsState.error(String message) = ReviewCommentsError;
}
