import 'package:game_review/i18n/strings.g.dart';
import 'package:sprintf/sprintf.dart';

extension DateTimeX on DateTime {
  String get formattedDate => '$day/$month/$year';

  String get relativeTime {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 0) {
      return sprintf(t.dateTime.daysAgo, [difference.inDays]);
    } else if (difference.inHours > 0) {
      return sprintf(t.dateTime.hoursAgo, [difference.inHours]);
    } else if (difference.inMinutes > 0) {
      return sprintf(t.dateTime.minutesAgo, [difference.inMinutes]);
    } else {
      return t.dateTime.justNow;
    }
  }
}
