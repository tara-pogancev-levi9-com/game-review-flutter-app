import 'package:flutter/material.dart';
import 'package:game_review/common/dependency_injection/injection_container.dart';
import 'package:game_review/features/library_screen/bloc/library_cubit.dart';
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
          // Title + actions row
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
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) async {
                    final cubit = locator<LibraryCubit>();
                    switch (value) {
                      case 'wishlist':
                        final result = await cubit.addGameToWishlist(game);
                        if (result == AddResult.added) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to Wishlist')),
                          );
                        } else if (result == AddResult.alreadyExists) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Game already in Wishlist')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Failed to add to Wishlist')),
                          );
                        }
                        break;
                      case 'library':
                        final result = await cubit.addGameToLibrary(game);
                        if (result == AddResult.added) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to My Library')),
                          );
                        } else if (result == AddResult.alreadyExists) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Game already in Library')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Failed to add to Library')),
                          );
                        }
                        break;
                      case 'review':
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Add review feature coming soon!')),
                        );
                        break;
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'wishlist', child: Text('Add to Wishlist')),
                    PopupMenuItem(value: 'library', child: Text('Add to My Library')),
                    PopupMenuItem(value: 'review', child: Text('Add Review')),
                  ],
                  icon: const Icon(Icons.more_vert),
                ),
              ],
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