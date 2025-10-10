import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/common/models/review_model.dart';

part 'review_state.freezed.dart';

@freezed
abstract class ReviewState with _$ReviewState {
  const factory ReviewState.initial() = _Initial;
  const factory ReviewState.loading() = _Loading;
  const factory ReviewState.loaded(
    List<ReviewModel> reviews, {
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = _Loaded;
  const factory ReviewState.reviewAdded(ReviewModel review) = _ReviewAdded;
  const factory ReviewState.error(String message) = _Error;
}
