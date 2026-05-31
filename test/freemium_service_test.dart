import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/services/freemium_limits.dart';
import 'package:luxora_ai/services/freemium_service.dart';

void main() {
  group('FreemiumLimits', () {
    test('preview caps match product spec', () {
      expect(FreemiumLimits.freeConciergeMessages, 3);
      expect(FreemiumLimits.previewHotels, 5);
      expect(FreemiumLimits.previewRestaurants, 5);
      expect(FreemiumLimits.previewHiddenGems, 5);
      expect(FreemiumLimits.previewLocalSecrets, 2);
      expect(FreemiumLimits.previewExperiences, 5);
      expect(FreemiumLimits.freeDayIndex, 0);
    });
  });

  group('FreemiumService.previewSlice', () {
    test('returns full list when access is granted', () {
      final items = List.generate(10, (i) => i);
      final sliced = FreemiumService.previewSlice(
        items,
        FreemiumUnlockTrigger.hotelsPreview,
      );
      if (FreemiumService.hasFullAccess()) {
        expect(sliced.length, 10);
      } else {
        expect(sliced.length, FreemiumLimits.previewHotels);
      }
    });

    test('lockedCount never exceeds total', () {
      final locked = FreemiumService.lockedCount(
        3,
        FreemiumUnlockTrigger.hotelsPreview,
      );
      expect(locked, FreemiumService.hasFullAccess() ? 0 : 0);
    });
  });
}
