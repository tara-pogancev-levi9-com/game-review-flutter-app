import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/common/models/review_model.dart';

part 'review_form_state.freezed.dart';

@freezed
abstract class ReviewFormState with _$ReviewFormState {
  const factory ReviewFormState.initial() = _Initial;
  const factory ReviewFormState.loading() = _Loading;
  const factory ReviewFormState.success(ReviewModel? review) = _Success;
  const factory ReviewFormState.error(String message) = _Error;
}
