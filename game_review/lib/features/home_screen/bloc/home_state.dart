import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/models/review_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;
  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.success({
    required List<GameModel> discoverGames,
    @Default([]) List<ReviewModel> recentReviews,
    @Default(false) bool isLoadingMore,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMoreGames,
    @Default(true) bool hasMoreGames,
  }) = HomeSuccess;
  const factory HomeState.error(String message) = HomeError;
}
