String formatIsoDate(DateTime? dt) {
  if (dt == null) return '';
  final d = dt.toLocal();
  return '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}
