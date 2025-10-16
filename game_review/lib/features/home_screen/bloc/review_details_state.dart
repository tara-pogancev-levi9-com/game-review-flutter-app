import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/common/models/review_media_model.dart';

part 'review_details_state.freezed.dart';

@freezed
class ReviewDetailsState with _$ReviewDetailsState {
  const factory ReviewDetailsState.loading() = ReviewDetailsLoading;

  const factory ReviewDetailsState.loaded({
    required List<ReviewMediaModel> reviewMedia,
  }) = ReviewDetailsLoaded;
}
