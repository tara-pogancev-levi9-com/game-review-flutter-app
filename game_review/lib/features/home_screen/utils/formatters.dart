import 'package:game_review/i18n/strings.g.dart';

extension DateTimeX on DateTime {
  String get formattedIso {
    final d = toLocal();
    return '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(toLocal());

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} ${t.time.secondsAgo}';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${t.time.minutesAgo}';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${t.time.hoursAgo}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${t.time.daysAgo}';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${t.time.weeksAgo}';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${t.time.monthsAgo}';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${t.time.yearsAgo}';
    }
  }
}
String formatIsoDate(DateTime? dt) => dt?.formattedIso ?? '';
String formatTimeAgo(DateTime? dt) => dt?.timeAgo ?? '';
