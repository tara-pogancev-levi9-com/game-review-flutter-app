import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/features/library_screen/models/game.dart';
import 'package:game_review/features/home/models/review.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;
  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.success({
    required List<Game> discoverGames,
    @Default([]) List<Review> recentReviews,
  }) = HomeSuccess;
  const factory HomeState.error(String message) = HomeError;
}
