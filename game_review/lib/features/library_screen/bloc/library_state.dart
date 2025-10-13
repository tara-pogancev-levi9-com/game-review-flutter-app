import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_review/common/models/game_model.dart';

part 'library_state.freezed.dart';

@freezed
class LibraryState with _$LibraryState {
  const factory LibraryState.initial() = LibraryInitial;
  const factory LibraryState.loading() = LibraryLoading;
  const factory LibraryState.success({
    required List<Game> latestGames,
    required List<Game> popularGames,
    @Default([]) List<Game> userLibraryGames,
    @Default([]) List<Game> userWishlistGames,
  }) = LibrarySuccess;
  const factory LibraryState.error(String message) = LibraryError;
}