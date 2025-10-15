import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/features/search_screen/bloc/search_state.dart';
import 'package:game_review/features/search_screen/services/search_service.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchService _service;

  SearchCubit(this._service) : super(const SearchState.initial());

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      emit(const SearchState.initial());
      return;
    }

    emit(const SearchState.loading());

    try {
      final results = await Future.wait([
        _service.searchGames(query: query.trim()),
        _service.searchReviews(query: query.trim()),
      ]);

      final games = results[0] as List;
      final reviews = results[1] as List;

      Logger.info(
        'Search results: ${games.length} games, ${reviews.length} reviews',
      );

      emit(
        SearchState.loaded(
          games: games.cast(),
          reviews: reviews.cast(),
          query: query.trim(),
        ),
      );
    } catch (e) {
      Logger.error('Search failed', e);
      emit(SearchState.error(e.toString()));
    }
  }

  void clear() {
    emit(const SearchState.initial());
  }
}
