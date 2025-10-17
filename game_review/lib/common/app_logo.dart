import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_typography.dart';
import 'package:game_review/i18n/strings.g.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 100.0});

  final double size;
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
            height: size,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: _spacingBetween),
        Text(
          t.app.branding.title,
          textAlign: TextAlign.center,
          style: AppTypography.logoTitle,
        ),
        const SizedBox(height: 8),
        Text(
          t.app.branding.tagline,
          textAlign: TextAlign.center,
          style: AppTypography.logoTagline,
        ),
      ],
    );
  }
}
