import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/common/models/game_model.dart';

part 'games_state.freezed.dart';

@freezed
abstract class GamesState with _$GamesState {
  const factory GamesState.initial() = _Initial;
  const factory GamesState.loading() = _Loading;
  const factory GamesState.loaded(List<GameModel> games) = _Loaded;
  const factory GamesState.error(String message) = _Error;
}
