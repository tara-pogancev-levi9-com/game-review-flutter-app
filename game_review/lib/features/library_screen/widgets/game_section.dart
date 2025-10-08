import 'package:flutter/material.dart';
import 'package:game_review/features/library_screen/temporary_placeholder/models/game.dart';
import 'game_card.dart';

class GameSection extends StatelessWidget {
  final String title;
  final List<Game> games;

  const GameSection({super.key, required this.title, required this.games});

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: games.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return GameCard(game: games[index]);
            },
          ),
        ),
      ],
    );
  }
}