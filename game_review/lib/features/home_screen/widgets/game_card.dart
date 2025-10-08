import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/models/game_model.dart';
import 'package:game_review/features/welcome_screen/welcome_page.dart';
import 'package:game_review/common/theme/app_typography.dart';

class GameCard extends StatelessWidget {
  final GameModel game;

  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              // TODO: Implement navigation to game details page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const WelcomePage(), //GameDetailsScreen(game: game)
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 180,
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  border: Border.all(
                    color: AppColors.outline.withOpacity(0.2),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: game.coverImageUrl != null
                    ? Image.network(
                        game.coverImageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _placeholder(),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return _placeholder();
                        },
                      )
                    : _placeholder(),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              game.title,
              style: AppTypography.gameTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
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
