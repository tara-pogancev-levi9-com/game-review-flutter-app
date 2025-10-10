import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/features/library_screen/widgets/game_actions_menu.dart';
import 'package:game_review/i18n/strings.g.dart';

class GameDetailsPage extends StatelessWidget {
  final Game game;

  const GameDetailsPage({super.key, required this.game});

  static const _imageBorderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(32),
    bottomRight: Radius.circular(32),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: _imageBorderRadius,
              image: game.coverImageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(game.coverImageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: game.coverImageUrl == null
                ? const Center(child: Icon(Icons.image, size: 64, color: Colors.white70))
                : null,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    game.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                GameActionsMenu(game: game),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                Text(
                  t.gameDetails.recommendText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.add_circle_outline, size: 18),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Text(
              t.gameDetails.overall,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          if (game.description != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                game.description!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.gameDetails.details,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t.gameDetails.developer),
                    Text(game.developer ?? '-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t.gameDetails.publisher),
                    Text(game.publisher ?? '-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t.gameDetails.released),
                    Text(game.releaseDate != null
                        ? '${game.releaseDate!.toLocal()}'.split(' ')[0]
                        : '-'),
                  ],
                ),
              ],
            ),
          ),

          if (game.platforms != null && game.platforms!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(t.gameDetails.availableOn,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children:
                        game.platforms!.map((p) => Chip(label: Text(p))).toList(),
                  ),
                ],
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(t.gameDetails.recentReviews,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
