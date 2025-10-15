import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryPurple = Color(0xFF2A0144);
  static const Color nearBlack = Color(0xFF010101);

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFA88EB9);
  static const Color textTertiary = Color(0xFF785E88);
  static const Color softWhite = Color(0xFFF9F0FF);
  static const Color lilacSelected = Color(0xFFE2C4F7);

  static const Color surface = Color(0xFF151017);
  static const Color surfaceVariant = Color(0xFF1C1522);

  static const Color outline = Color(0xFFA88EB9);

  //success states
  static const Color successBackground = Color(0x33228B22);
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);

  static const Color transparent = Colors.transparent;
  static const Color white = Colors.white;
}

@immutable
class AppGradients extends ThemeExtension<AppGradients> {
  final LinearGradient background;

  const AppGradients({required this.background});

  @override
  AppGradients copyWith({LinearGradient? background}) =>
      AppGradients(background: background ?? this.background);

  @override
  AppGradients lerp(ThemeExtension<AppGradients>? other, double t) {
    if (other is! AppGradients) return this;
    return AppGradients(
      background: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color.lerp(
            background.colors.first,
            other.background.colors.first,
            t,
          )!,
          Color.lerp(background.colors.last, other.background.colors.last, t)!,
        ],
      ),
    );
  }

  static const AppGradients dark = AppGradients(
    background: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        AppColors.primaryPurple,
        AppColors.nearBlack,
      ],
    ),
  );
}
