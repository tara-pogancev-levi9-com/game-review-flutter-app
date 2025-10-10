import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_typography.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;

  const SectionTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTypography.heading,
    );
  }
}
