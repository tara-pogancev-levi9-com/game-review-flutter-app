import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/blocs/games_state.dart';
import 'package:game_review/common/services/games_service.dart';
import 'dart:developer' as developer;
import 'package:game_review/i18n/strings.g.dart';

class GamesCubit extends Cubit<GamesState> {
  final GamesService _service;
  static const int _pageSize = 10;

  GamesCubit(this._service) : super(const GamesState.initial());

  Future<void> loadGames({int limit = 10}) async {
    emit(const GamesState.loading());
    try {
      final games = await _service.fetchGames(limit: limit);
      final hasMore = games.length >= limit;
      emit(GamesState.loaded(games, hasMore: hasMore));
    } catch (e) {
      emit(GamesState.error(e.toString()));
    }
  }

  Future<void> loadMoreGames() async {
    final currentState = state;

    await currentState.maybeWhen(
      loaded: (games, hasMore, isLoadingMore) async {
        if (!hasMore || isLoadingMore) return;

        developer.log('Loading more games...', name: 'GamesCubit');

        emit(
          GamesState.loaded(
            games,
            hasMore: hasMore,
            isLoadingMore: true,
          ),
        );

        try {
          final offset = games.length;
          final newGames = await _service.fetchGames(
            limit: _pageSize,
            offset: offset,
          );

          final allGames = [...games, ...newGames];
          final hasMoreNew = newGames.length >= _pageSize;

          print(
            "Loaded ${newGames.length} more games, total: ${allGames.length}",
          );

          emit(
            GamesState.loaded(
              allGames,
              hasMore: hasMoreNew,
              isLoadingMore: false,
            ),
          );
        } catch (e) {
          developer.log(
            'Failed to load more games',
            name: 'GamesCubit',
            error: e,
          );
          emit(GamesState.error(t.errorLoadingMoreGames));
        }
      },
      orElse: () {},
    );
  }
}
