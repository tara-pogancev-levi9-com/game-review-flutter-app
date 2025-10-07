import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/features/library_screen/services/game_service.dart';
import 'library_state.dart';

class LibraryCubit extends Cubit<LibraryState> {
  final GameService _gameService;

  LibraryCubit(this._gameService) : super(const LibraryState.initial());

  Future<void> fetchGames() async {
    emit(const LibraryState.loading());
    try {
      final results = await Future.wait([
        _gameService.getLatestGames(),
        _gameService.getPopularGames(),
      ]);
      emit(LibraryState.success( 
        latestGames: results[0], 
        popularGames: results[1],
      ));
    } catch (e) {
      emit(LibraryState.error(e.toString()));
    }
  }

}