import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_typography.dart';

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
          style: AppTypography.logoTitle,
        ),
        const SizedBox(height: 8),
        Text(
          'Discover. Rate. Share.',
          textAlign: TextAlign.center,
          style: AppTypography.logoTagline,
        ),
      ],
    );
  }
}
