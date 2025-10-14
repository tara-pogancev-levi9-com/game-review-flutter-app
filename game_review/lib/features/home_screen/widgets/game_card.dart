import 'package:flutter/material.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/features/game_details/game_details.dart';

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
          MaterialPageRoute(builder: (_) => GameDetailsPage(gameId: game.id)),
        );
      }
    }

    return SizedBox(
      width: cardWidth,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: radius),
        elevation: 0,
        color: AppColors.surface,
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
                    : Container(
                        height: imageHeight,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.surfaceVariant,
                              AppColors.surfaceVariant.withValues(alpha: 0.7),
                            ],
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.videogame_asset,
                          size: 40,
                          color: AppColors.textSecondary,
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
