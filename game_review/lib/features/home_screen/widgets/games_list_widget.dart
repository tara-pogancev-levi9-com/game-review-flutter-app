// lib/features/home_screen/widgets/games_list_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/blocs/games_cubit.dart';
import 'package:game_review/common/blocs/games_state.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/common/widgets/error_view.dart';
import 'package:game_review/common/widgets/section_header.dart';
import 'package:game_review/features/home_screen/widgets/games_list_view.dart';

class GamesListWidget extends StatefulWidget {
  final String title;
  final int limit;

  const GamesListWidget({
    super.key,
    required this.title,
    this.limit = 10,
  });

  @override
  State<GamesListWidget> createState() => _GamesListWidgetState();
}

class _GamesListWidgetState extends State<GamesListWidget> {
  late final GamesCubit _gamesCubit;

  @override
  void initState() {
    super.initState();
    _gamesCubit = locator<GamesCubit>();
    _gamesCubit.loadGames(limit: widget.limit);
  }

  @override
  void dispose() {
    _gamesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: widget.title),
        BlocBuilder<GamesCubit, GamesState>(
          bloc: _gamesCubit,
          builder: (context, state) => state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const SizedBox(
              height: 260,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            loaded: (games, hasMore, isLoadingMore) {
              return GamesList(
                games: games,
                hasMore: hasMore,
                isLoadingMore: isLoadingMore,
                onLoadMore: () => _gamesCubit.loadMoreGames(),
              );
            },
            error: (msg) => SizedBox(
              height: 260,
              child: ErrorView(
                message: msg,
                onRetry: () => _gamesCubit.loadGames(limit: widget.limit),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
