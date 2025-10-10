import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/common/models/review_model.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/services/game_service.dart';
import 'package:game_review/common/services/review_service.dart';
import 'home_state.dart';
import 'package:game_review/i18n/strings.g.dart';


class HomeCubit extends Cubit<HomeState> {
  final GameService _gameService;
  final ReviewService _reviewService;


// Q: Is using "flags" like _isLoadingMore and _hasMore a good practice in Cubit? Or is there a "built in" way to handle such states?

  final int reviewsPageSize;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  final List<Review> _reviews = [];

  HomeCubit(this._gameService, this._reviewService, {this.reviewsPageSize = Endpoints.limitRecentReviews}) : super(const HomeState.initial());

  Future<void> loadHome({int discoverLimit = Endpoints.limitDiscoverGames}) async {
    emit(const HomeState.loading());
    try {
      final latestGames = await _gameService.getLatestGames(limit: discoverLimit);
      _reviews.clear();
      final first = await _reviewService.getRecentReviews(limit: reviewsPageSize, offset: 0);
      _reviews.addAll(first);
      _hasMore = first.length >= reviewsPageSize;
      emit(HomeState.success(discoverGames: latestGames, recentReviews: List.unmodifiable(_reviews)));
    } catch (e) {
      Logger.error(t.errors.failedToLoadHome, e);
      emit(HomeState.error(e.toString()));
    }
  }

  Future<void> loadMoreReviews() async {
    if (_isLoadingMore || !_hasMore) return;
    _isLoadingMore = true;
    try {
      final offset = _reviews.length;
      final next = await _reviewService.getRecentReviews(limit: reviewsPageSize, offset: offset);
      if (next.isEmpty) {
        _hasMore = false;
      } else {
        _reviews.addAll(next);
        _hasMore = next.length >= reviewsPageSize;
        final discoverGames = state.maybeWhen(success: (d, r) => d, orElse: () => <Game>[]);
        emit(HomeState.success(discoverGames: discoverGames, recentReviews: List.unmodifiable(_reviews)));
      }
    } catch (e) {
      Logger.error('Failed to load more reviews', e);
    } finally {
      _isLoadingMore = false;
    }
  }

  bool get hasMoreReviews => _hasMore;
  bool get isLoadingMore => _isLoadingMore;
  List<Review> get currentReviews => List.unmodifiable(_reviews);

  Future<void> refresh() => loadHome();
}
