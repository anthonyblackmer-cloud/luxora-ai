import 'package:luxora_ai/l10n/luxora_l10n_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// In-trip style preferences the concierge remembers for this session.
/// Future: merge into persistent trip profile (Supabase).
class ConciergeSessionMemory {
  static const _key = 'luxora_concierge_style_prefs';
  static const _lastVisitKey = 'luxora_concierge_last_visit';

  Future<List<String>> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  /// The timestamp of the previous concierge visit, or null on first ever open.
  /// Lets the concierge greet a returning traveler with what it remembers.
  Future<DateTime?> lastVisit() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_lastVisitKey);
    return raw == null ? null : DateTime.tryParse(raw);
  }

  /// Stamps "now" as the latest visit. Call after reading [lastVisit] so the
  /// next open can recognize a returning user.
  Future<void> markVisited() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_lastVisitKey, DateTime.now().toIso8601String());
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

/// @deprecated Use [styleMemoryCanonicalPrefs].
const styleMemorySuggestions = styleMemoryCanonicalPrefs;
