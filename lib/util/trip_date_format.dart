import 'package:intl/intl.dart';

/// ISO `yyyy-MM-dd` storage and human-readable trip date ranges.
abstract final class TripDateFormat {
  static String toIso(DateTime date) {
    final y = date.year.toString().padLeft(4, '0');
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  static DateTime? parseIso(String? raw) {
    if (raw == null || raw.trim().isEmpty) return null;
    return DateTime.tryParse(raw.trim());
  }

  static String displayRange({
    required String startIso,
    required String endIso,
    required String localeName,
    required String flexibleLabel,
  }) {
    final start = parseIso(startIso);
    final end = parseIso(endIso);
    if (start == null && end == null) return flexibleLabel;
    final locale = localeName.isEmpty ? 'en' : localeName;
    if (start != null && end != null) {
      if (start.year == end.year) {
        final fmt = DateFormat.MMMd(locale);
        return '${fmt.format(start)} – ${fmt.format(end)}';
      }
      final fmt = DateFormat.yMMMd(locale);
      return '${fmt.format(start)} – ${fmt.format(end)}';
    }
    final fmt = DateFormat.yMMMd(locale);
    return fmt.format(start ?? end!);
  }

  static String displaySingle(String iso, String localeName) {
    final parsed = parseIso(iso);
    if (parsed == null) return '';
    return DateFormat.yMMMd(localeName.isEmpty ? 'en' : localeName)
        .format(parsed);
  }
}
