import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/library_screen/game_details_page.dart';

class GameCard extends StatelessWidget {
  final GameModel game;
  final VoidCallback? onTap;

  const GameCard({super.key, required this.game, this.onTap});

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 140;
    const double imageHeight = 100;
    final BorderRadius radius = BorderRadius.circular(12);

    void handleTap() {
      if (onTap != null) {
        onTap!();
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => GameDetailsPage(game: game)),
        );
      }
    }

    return SizedBox(
      width: cardWidth,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: radius),
        child: InkWell(
          borderRadius: radius,
          onTap: handleTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child:
                    (game.coverImageUrl != null &&
                        game.coverImageUrl!.isNotEmpty)
                    ? Image.network(
                        game.coverImageUrl!,
                        height: imageHeight,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : SizedBox(
                        height: imageHeight,
                        width: double.infinity,
                        child: Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceVariant,
                            border: Border.all(
                              color: AppColors.outline.withValues(alpha: 0.2),
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: const Icon(Icons.videogame_asset, size: 40),
                        ),
                      ),
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
