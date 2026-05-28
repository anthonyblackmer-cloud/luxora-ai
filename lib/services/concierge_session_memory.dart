import 'package:shared_preferences/shared_preferences.dart';

/// In-trip style preferences the concierge remembers for this session.
/// Future: merge into persistent trip profile (Supabase).
class ConciergeSessionMemory {
  static const _key = 'luxora_concierge_style_prefs';

  Future<List<String>> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<void> save(List<String> prefs) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setStringList(_key, prefs);
  }

  Future<void> add(String preference) async {
    final current = await load();
    final trimmed = preference.trim();
    if (trimmed.isEmpty || current.contains(trimmed)) return;
    await save([...current, trimmed]);
  }

  Future<void> remove(String preference) async {
    final current = await load();
    await save(current.where((p) => p != preference).toList());
  }

  /// Map free-text to known preference phrases when users hint at style.
  static String? preferenceFromUserMessage(String message) {
    final lower = message.toLowerCase();
    if (_matches(lower, ['less crowd', 'fewer crowd', 'avoid crowd'])) {
      return 'Less crowded';
    }
    if (_matches(lower, ['not flashy', 'subtle luxury', 'understated'])) {
      return 'Luxury but not flashy';
    }
    if (_matches(lower, ['hidden luxury', 'secret luxury', 'insider luxury'])) {
      return 'Hidden luxury';
    }
    if (_matches(lower, ['nature heavy', 'lots of nature']) ||
        (lower.contains('nature') && lower.contains('wellness'))) {
      return 'Nature heavy';
    }
    if (_matches(lower, ['walkable', 'walk everywhere'])) {
      return 'Walkable when possible';
    }
    if (_matches(lower, ['slow morning', 'sleep in', 'late start'])) {
      return 'Slow mornings';
    }
    if (_matches(lower, ['tourist trap', 'no tourist', 'avoid tourist'])) {
      return 'No tourist traps';
    }
    if (_matches(lower, ['aesthetic', 'beautiful plate', 'photo-worthy'])) {
      return 'Aesthetic dining';
    }
    if (_matches(lower, ['family easy', 'kids easy', 'stroller', 'family logistics'])) {
      return 'Family-easy logistics';
    }
    return null;
  }

  static bool _matches(String lower, List<String> needles) {
    return needles.any(lower.contains);
  }
}

/// Multi-select personality layers — shapes Gems, Feed, map, and timeline.
const styleMemorySuggestions = [
  'Less crowded',
  'Luxury but not flashy',
  'Hidden luxury',
  'Walkable when possible',
  'Slow mornings',
  'No tourist traps',
  'Nature heavy',
  'Nature + wellness only',
  'Aesthetic dining',
  'Family-easy logistics',
];
