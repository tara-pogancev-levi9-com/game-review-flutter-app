import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/blocs/games_cubit.dart';
import 'package:game_review/common/blocs/games_state.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/widgets/error_view.dart';
import 'package:game_review/common/widgets/section_header.dart';
import 'package:game_review/features/home_screen/widgets/games_list_view.dart';
import 'package:game_review/common/theme/app_typography.dart';

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
    final bloc = locator<GamesCubit>()..loadGames(limit: limit);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title),
        BlocBuilder<GamesCubit, GamesState>(
          bloc: bloc,
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
              onLoadMore: () => bloc.loadMoreGames(),
            ),
            error: (msg) => ErrorView(
              message: msg,
              onRetry: () => bloc.loadGames(limit: limit),
            ),
          ),
        ),
      ],
    );
  }
}
