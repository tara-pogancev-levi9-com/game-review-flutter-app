import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/blocs/games_state.dart';
import 'package:game_review/common/services/games_service.dart';

class GamesCubit extends Cubit<GamesState> {
  final GamesService _service;

  GamesCubit(this._service) : super(const GamesState.initial());

  Future<void> loadGames({int limit = 10}) async {
    emit(const GamesState.loading());
    try {
      final games = await _service.fetchGames(limit: limit);
      emit(GamesState.loaded(games));
    } catch (e) {
      emit(GamesState.error(e.toString()));
    }
  }
}
