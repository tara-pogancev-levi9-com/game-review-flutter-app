import 'package:flutter/material.dart';
import 'package:game_review/common/theme/app_colors.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final BoxFit fit;
  final double placeholderIconSize;
  final IconData placeholderIcon;
  final Color placeholderIconColor;
  final Widget? placeholder;

  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.placeholderIconSize = 48.0,
    this.placeholderIcon = Icons.gamepad_rounded,
    this.placeholderIconColor = AppColors.textSecondary,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _buildPlaceholder();
    }

    return Image.network(
      imageUrl!,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return _buildPlaceholder();
      },
    );
  }

  Widget _buildPlaceholder() {
    if (placeholder != null) return placeholder!;

    return Center(
      child: Icon(
        placeholderIcon,
        size: placeholderIconSize,
        color: placeholderIconColor,
      ),
    );
  }
}
