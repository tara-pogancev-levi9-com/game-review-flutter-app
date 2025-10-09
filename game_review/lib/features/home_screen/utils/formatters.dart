String formatIsoDate(DateTime? dt) {
  if (dt == null) return '';
  final d = dt.toLocal();
  return '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

String formatTimeAgo(DateTime? dt) {
  if (dt == null) return '';
  final now = DateTime.now();
  final difference = now.difference(dt);

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds}s ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes}m ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}h ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays}d ago';
  } else if (difference.inDays < 30) {
    return '${(difference.inDays / 7).floor()}w ago';
  } else if (difference.inDays < 365) {
    return '${(difference.inDays / 30).floor()}mo ago';
  } else {
    return '${(difference.inDays / 365).floor()}y ago';
  }
}