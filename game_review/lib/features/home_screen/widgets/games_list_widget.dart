import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/blocs/games_cubit.dart';
import 'package:game_review/common/blocs/games_state.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';

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
              loaded: (games) => _GamesList(games: games),
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

class _GamesList extends StatelessWidget {
  final List<GameModel> games;

  const _GamesList({required this.games});

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('No games found'),
        ),
      );
    }

    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: games.length,
        itemBuilder: (_, index) => _GameCard(game: games[index]),
      ),
    );
  }
}

class _GameCard extends StatelessWidget {
  final GameModel game;

  const _GameCard({required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 180, // Reduced from 200 to make room for title
              width: 150,
              color: AppColors.surfaceVariant,
              child: game.coverImageUrl != null
                  ? Image.network(
                      game.coverImageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => _placeholder(),
                    )
                  : _placeholder(),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              game.title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholder() => const Center(
    child: Icon(
      Icons.gamepad_rounded,
      size: 48,
      color: AppColors.textSecondary,
    ),
  );
}
