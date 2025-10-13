import 'package:game_review/i18n/strings.g.dart';

extension DateTimeX on DateTime {
  String get formattedDate => '$day/$month/$year';

  String get relativeTime {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 0) {
      return t.dateTime.daysAgo.replaceAll(
        '{days}',
        difference.inDays.toString(),
      );
    } else if (difference.inHours > 0) {
      return t.dateTime.hoursAgo.replaceAll(
        '{hours}',
        difference.inHours.toString(),
      );
    } else if (difference.inMinutes > 0) {
      return t.dateTime.minutesAgo.replaceAll(
        '{minutes}',
        difference.inMinutes.toString(),
      );
    } else {
      return t.dateTime.justNow;
    }
  }
}
