import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';

import '../../home_screen/widgets/game_card.dart';

class GameSection extends StatelessWidget {
  final String? title;
  final List<GameModel> games;

  const GameSection({super.key, this.title, required this.games});

  @override
  Widget build(BuildContext context) {
    if (games.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null && title!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.headlineSmall,
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
