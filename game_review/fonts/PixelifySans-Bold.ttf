import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  static const _size = 100.0;
  static const _spacingBetween = 8.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Semantics(
          label: 'App logo',
          image: true,
          child: Image.asset(
            'lib/common/assets/images/game_logo.png',
            height: AppLogo._size,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: _spacingBetween),
        Text(
          'PAW GAMES',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'PixelifySans',
            color: AppColors.softWhite,
            fontSize: 36,
            fontWeight: FontWeight.w700,
            height: 1.0,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Discover. Rate. Share.',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'JosefinSans',
            color: AppColors.textTertiary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}
