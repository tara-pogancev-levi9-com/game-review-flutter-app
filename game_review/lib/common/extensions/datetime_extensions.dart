import 'package:game_review/i18n/strings.g.dart';

extension DateTimeX on DateTime {
  String get formattedDate => '$day/$month/$year';

  String get relativeTime {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 0) {
      return t.dateTime.daysAgo(count: difference.inDays);
    } else if (difference.inHours > 0) {
      return t.dateTime.hoursAgo(count: difference.inHours);
    } else if (difference.inMinutes > 0) {
      return t.dateTime.minutesAgo(count: difference.inMinutes);
    } else {
      return t.dateTime.justNow;
    }
  }
}
