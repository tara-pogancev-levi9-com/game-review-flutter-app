import 'package:flutter/material.dart';

class MediaThumb extends StatelessWidget {
  const MediaThumb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 92,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(child: Icon(Icons.play_circle_outline)),
    );
  }
}
