/// Display-friendly traveler name for Luxora copy.
abstract final class TravelerNameDisplay {
  static String? firstName(String? raw) {
    final trimmed = raw?.trim();
    if (trimmed == null || trimmed.isEmpty) return null;
    final first = trimmed.split(RegExp(r'\s+')).first;
    if (first.isEmpty) return null;
    return first;
  }
}
