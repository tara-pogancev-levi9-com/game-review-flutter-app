import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/blocs/games_cubit.dart';
import 'package:game_review/common/blocs/games_state.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/home_screen/widgets/games_list_view.dart';

class GamesListWidget extends StatelessWidget {
  final String title;
  final int limit;

  const GamesListWidget({
    super.key,
    required this.title,
    this.limit = 10,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<GamesCubit>()..loadGames(limit: limit),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          BlocBuilder<GamesCubit, GamesState>(
            builder: (context, state) => state.when(
              initial: () => const SizedBox.shrink(),
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(),
                ),
              ),
              loaded: (games, hasMore, isLoadingMore) => GamesList(
                games: games,
                hasMore: hasMore,
                isLoadingMore: isLoadingMore,
                onLoadMore: () => context.read<GamesCubit>().loadMoreGames(),
              ),
              error: (msg) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(msg, style: const TextStyle(color: Colors.red)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
