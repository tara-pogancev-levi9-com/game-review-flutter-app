import 'package:flutter/material.dart';
import 'package:game_review/common/models/review_media_model.dart';

class MediaThumb extends StatelessWidget {
  final ReviewMediaModel image;

  const MediaThumb({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 92,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(image.mediaUrl) as ImageProvider,
        ),
      ),
    );
  }
}
