import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  final String label;
  final double? value;
  const RatingRow({super.key, required this.label, required this.value});

  Widget _ratingStars(double? rating) {
    final v = (rating ?? 0).clamp(0, 10);
    final filled = (v / 2).round();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        if (i < filled) return const Icon(Icons.star, size: 18);
        return const Icon(Icons.star_border, size: 18);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyMedium)),
          _ratingStars(value),
        ],
      ),
    );
  }
}
