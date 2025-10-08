import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/blocs/games_cubit.dart';
import 'package:game_review/common/blocs/games_state.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/common/widgets/error_view.dart';
import 'package:game_review/features/home_screen/widgets/game_card.dart';
import 'package:game_review/features/review_screen/add_review_page.dart';
import 'package:game_review/i18n/strings.g.dart';

class GameSelectorBottomSheet extends StatefulWidget {
  const GameSelectorBottomSheet({super.key});

  @override
  State<GameSelectorBottomSheet> createState() =>
      _GameSelectorBottomSheetState();
}

class _GameSelectorBottomSheetState extends State<GameSelectorBottomSheet> {
  late final GamesCubit _gamesCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _gamesCubit = locator<GamesCubit>()..loadGames(limit: 10);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final state = _gamesCubit.state;
      state.maybeWhen(
        loaded: (games, hasMore, isLoadingMore) {
          if (hasMore && !isLoadingMore) {
            _gamesCubit.loadMoreGames();
          }
        },
        orElse: () {},
      );
    }
  }

  void _onGameSelected(GameModel game) async {
    Navigator.pop(context);

    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => AddReviewPage(game: game),
      ),
    );

    if (!mounted) return;

    if (result == true && context.mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        gradient: Theme.of(context).extension<AppGradients>()?.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),

      child: Column(
        children: [
          // Header with title and X button
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    t.selectAGameFromYourLibrary,
                    style: AppTypography.gameTitle28,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.textPrimary,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          // Games Grid
          Expanded(
            child: BlocBuilder<GamesCubit, GamesState>(
              bloc: _gamesCubit,
              builder: (context, state) => state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loaded: (games, hasMore, isLoadingMore) {
                  if (games.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          t.NoGamesFound,
                          style: const TextStyle(color: AppColors.textPrimary),
                        ),
                      ),
                    );
                  }

                  return GridView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.68,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                    itemCount: games.length + (hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == games.length) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return GameCard(
                        game: games[index],
                        onTap: () => _onGameSelected(games[index]),
                      );
                    },
                  );
                },
                error: (msg) => ErrorView(
                  message: msg,
                  onRetry: () => _gamesCubit.loadGames(limit: 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
