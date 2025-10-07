import 'package:flutter/material.dart';
import 'package:game_review/features/library_screen/models/game.dart';

class GameDetailsPage extends StatelessWidget {
  final Game game;

  const GameDetailsPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // Cover image or placeholder
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
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
          // Title and genres
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              game.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          if (game.genres != null && game.genres!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8,
                children: game.genres!
                    .map((genre) => Chip(label: Text(genre)))
                    .toList(),
              ),
            ),
          // TODO: Recommendation %
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              children: [
                Text(
                  '99% of players recommend this game',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.add_circle_outline, size: 18),
              ],
            ),
          ),
          // Overall section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            child: Text(
              'Overall',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          // Description
          if (game.description != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                game.description!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          // Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Details', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Developer'),
                    Text(game.developer ?? '-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Publisher'),
                    Text(game.publisher ?? '-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Released'),
                    Text(game.releaseDate != null
                        ? '${game.releaseDate!.toLocal()}'.split(' ')[0]
                        : '-'),
                  ],
                ),
              ],
            ),
          ),
          // Platforms
          if (game.platforms != null && game.platforms!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Available on', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: game.platforms!
                        .map((platform) => Chip(label: Text(platform)))
                        .toList(),
                  ),
                ],
              ),
            ),
          // TODO: Reviews
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Recent reviews', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          ),
          // TODO: Review
        ],
      ),
    );
  }
}