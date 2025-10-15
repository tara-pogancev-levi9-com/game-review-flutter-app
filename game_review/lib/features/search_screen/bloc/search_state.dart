import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/models/review_model.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded({
    required List<GameModel> games,
    required List<ReviewModel> reviews,
    required String query,
  }) = _Loaded;
  const factory SearchState.error(String message) = _Error;
}
