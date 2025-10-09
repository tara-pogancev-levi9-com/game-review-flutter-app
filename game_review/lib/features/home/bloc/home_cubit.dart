import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/utils/logger.dart';
import 'package:game_review/core/api/endpoints.dart';
import 'package:game_review/features/home/models/review.dart';
import 'package:game_review/features/library_screen/models/game.dart';
import 'package:game_review/features/library_screen/services/game_service.dart';
import 'package:game_review/features/home/services/review_service.dart';
import 'home_state.dart';
import 'package:game_review/i18n/strings.g.dart';


class HomeCubit extends Cubit<HomeState> {
  final GameService _gameService;
  final ReviewService _reviewService;

  HomeCubit(this._gameService, this._reviewService) : super(const HomeState.initial());

  // TODO: Maybe caching results to avoid excessive API calls
  Future<void> loadHome({int discoverLimit = Endpoints.limitDiscoverGames, int reviewsLimit = Endpoints.limitRecentReviews}) async {
    emit(const HomeState.loading());
    try {
      final results = await Future.wait([
      _gameService.getLatestGames(limit: discoverLimit),
      _reviewService.getRecentReviews(limit: reviewsLimit),
    ]);

    final latestGames = results[0] as List<Game>;
    final recentReviews = results[1] as List<Review>;

    emit(HomeState.success(
      discoverGames: latestGames,
      recentReviews: recentReviews,
    ));

    } catch (e) {
      Logger.error(t.errors.failedToLoadHome, e);
      emit(HomeState.error(e.toString()));
    }
  }

  Future<void> refresh() => loadHome();
}
