import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/features/search_screen/widgets/game_search_item.dart';
import 'package:game_review/i18n/strings.g.dart';

class HorizontalGamesList extends StatelessWidget {
  final List games;

  const HorizontalGamesList({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: games.length,
            itemBuilder: (context, index) {
              return Container(
                width: 320,
                margin: EdgeInsets.only(
                  right: index < games.length - 1 ? 16 : 0,
                ),
                child: GameSearchItem(game: games[index]),
              );
            },
          ),
        ),
        // Scroll hint indicator
        if (games.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.swipe_rounded,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(width: 8),
                Text(
                  t.swipeToSeeMore,
                  style: AppTypography.searchItemSubtitle.copyWith(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
