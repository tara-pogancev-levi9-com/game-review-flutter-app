import 'package:flutter/material.dart';
import 'package:game_review/features/library_screen/temporary_placeholder/game_details_page.dart';
import 'package:game_review/features/library_screen/temporary_placeholder/models/game.dart';

class GameCard extends StatelessWidget {
  final Game game;
  final VoidCallback? onTap;

  const GameCard({super.key, required this.game, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => GameDetailsPage(game: game),
          ),
        );
      },
      child: SizedBox(
        width: 140,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (game.coverImageUrl != null)
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.network(
                    game.coverImageUrl!,
                    height: 100,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                )
              else
                Container(
                  height: 100,
                  width: 140,
                  color: Colors.grey[800],
                  child: const Icon(Icons.videogame_asset, size: 40),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  game.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}