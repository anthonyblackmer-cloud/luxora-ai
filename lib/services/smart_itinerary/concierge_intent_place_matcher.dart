import 'package:luxora_ai/models/lux_place.dart';

/// Parses natural Concierge chat for scheduling intent and catalog place mentions.
abstract final class ConciergeIntentPlaceMatcher {
  static const _schedulingPhrases = [
    'add ',
    'add a ',
    'include ',
    'put ',
    'put us',
    'schedule ',
    'slot ',
    'slotted',
    'fit in',
    'squeeze in',
    'make time for',
    'make room for',
    'we want',
    'i want',
    "let's",
    'let us',
    'can we',
    'could we',
    'we should',
    'i need',
    'go to',
    'visit ',
    'check out',
    'stop at',
    'on day',
    'day 1',
    'day 2',
    'day 3',
    'day 4',
    'day 5',
    'day 6',
    'day 7',
    'second day',
    'third day',
    'fourth day',
    'fifth day',
    'tomorrow',
    'instead of',
    'swap ',
    'replace ',
    'change ',
    'move ',
    'also do',
    'work in',
    'get us to',
    'take us to',
  ];

  static const _schedulingPhrasesIntl = [
    'добав',
    'включ',
    'постав',
    'запланир',
    'хочу',
    'хотим',
    'можем',
    'день ',
    'день 1',
    'день 2',
    'день 3',
    'день 4',
    'вместо',
    'замен',
    'agregar',
    'incluir',
    'quiero',
    'queremos',
    'día ',
    'ajouter',
    'inclure',
    'voglio',
    'vogliamo',
  ];

  static const _titleStopWords = {
    'the',
    'and',
    'for',
    'with',
    'from',
    'at',
    'orlando',
    'miami',
    'tampa',
    'florida',
    'fl',
    'park',
    'world',
    'resort',
    'hotel',
    'center',
    'centre',
  };

  static bool hasActivitySchedulingIntent(String message) {
    final lower = message.toLowerCase().replaceAll('ё', 'е').trim();
    if (lower.isEmpty) return false;
    if (_schedulingPhrases.any(lower.contains)) return true;
    if (_schedulingPhrasesIntl.any(lower.contains)) return true;
    if (RegExp(r'\bday\s*\d+\b').hasMatch(lower)) return true;
    if (RegExp(r'\b(on|for)\s+(monday|tuesday|wednesday|thursday|friday|saturday|sunday)\b')
        .hasMatch(lower)) {
      return true;
    }
    return false;
  }

  /// Places whose titles (or strong title tokens) appear in [text].
  static List<LuxPlace> placesMentionedIn(
    String text,
    Iterable<LuxPlace> pool,
  ) {
    final lower = text.toLowerCase().replaceAll('ё', 'е');
    if (lower.trim().isEmpty) return const [];

    final scored = <({LuxPlace place, int score})>[];
    for (final place in pool) {
      final title = place.title.toLowerCase();
      var score = 0;
      if (title.length >= 5 && lower.contains(title)) {
        score = 100 + title.length;
      } else {
        final tokens = _titleTokens(title);
        if (tokens.length >= 2 &&
            tokens.every((token) => lower.contains(token))) {
          score = 60 + tokens.length * 8;
        } else if (tokens.length == 1 && tokens.first.length >= 7) {
          if (lower.contains(tokens.first)) {
            score = 45 + tokens.first.length;
          }
        }
      }
      if (score > 0) {
        scored.add((place: place, score: score));
      }
    }

    scored.sort((a, b) => b.score.compareTo(a.score));
    final out = <LuxPlace>[];
    final seenIds = <String>{};
    for (final entry in scored) {
      if (seenIds.add(entry.place.id)) {
        out.add(entry.place);
      }
    }
    return out;
  }

  /// 0-based day index from phrases like "day 3" / "third day", or null.
  static int? resolveTargetDayIndex(String message, int totalDays) {
    if (totalDays <= 0) return null;
    final lower = message.toLowerCase();

    final numeric = RegExp(r'\bday\s*(\d+)\b').firstMatch(lower);
    if (numeric != null) {
      final day = int.tryParse(numeric.group(1)!);
      if (day != null && day >= 1 && day <= totalDays) {
        return day - 1;
      }
    }

    const ordinals = {
      'first day': 1,
      'second day': 2,
      'third day': 3,
      'fourth day': 4,
      'fifth day': 5,
      'sixth day': 6,
      'seventh day': 7,
    };
    for (final entry in ordinals.entries) {
      if (lower.contains(entry.key) && entry.value <= totalDays) {
        return entry.value - 1;
      }
    }

    if (lower.contains('tomorrow') && totalDays >= 2) {
      return 1.clamp(0, totalDays - 1);
    }
    return null;
  }

  static List<String> _titleTokens(String titleLower) {
    return titleLower
        .split(RegExp(r'[^\w]+'))
        .where((t) => t.length >= 4 && !_titleStopWords.contains(t))
        .toList();
  }
}
