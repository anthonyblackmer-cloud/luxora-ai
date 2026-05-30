import 'package:luxora_ai/services/concierge_voice_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('mergeVoiceTranscripts', () {
    test('prefers final transcript over partial and fallback', () {
      expect(
        mergeVoiceTranscripts(
          finalText: 'Plan dinner in Orlando',
          partialText: 'Plan dinner',
          latestText: 'Plan',
          fallback: 'fallback',
        ),
        'Plan dinner in Orlando',
      );
    });

    test('falls back through partial and UI text', () {
      expect(
        mergeVoiceTranscripts(
          partialText: 'Where should we eat',
          fallback: 'Where should',
        ),
        'Where should we eat',
      );
    });

    test('returns empty when nothing was heard', () {
      expect(mergeVoiceTranscripts(), '');
    });
  });
}
