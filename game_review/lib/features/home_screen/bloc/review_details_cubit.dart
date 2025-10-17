import 'package:bloc/bloc.dart';
import 'package:game_review/common/models/review_media_model.dart';
import 'package:game_review/common/services/reviews_service.dart';
import 'package:game_review/features/home_screen/bloc/review_details_state.dart';

class ReviewDetailsCubit extends Cubit<ReviewDetailsState> {
  final ReviewsService _reviewService;

  ReviewDetailsCubit(this._reviewService)
    : super(const ReviewDetailsState.loading());

  Future<void> loadReviewMedia(String reviewId) async {
    try {
      List<ReviewMediaModel> result = await _reviewService.getReviewMedia(
        reviewId,
      );
      print("REVIEW MEDIA: $result.toString() REVIEW ID: $reviewId");
      emit(ReviewDetailsState.loaded(reviewMedia: result));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
