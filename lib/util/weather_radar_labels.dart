import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/services/rainviewer_service.dart';

String weatherRadarFrameLabel(AppLocalizations l, RainViewerFrame frame) {
  final now = DateTime.now();
  final minutes = frame.time.difference(now).inMinutes;
  if (minutes.abs() <= 5) return l.weatherRadarNow;
  if (minutes < 0) return l.weatherRadarMinutesAgo(-minutes);
  return l.weatherRadarMinutesAhead(minutes);
}

int closestRadarFrameIndex(List<RainViewerFrame> frames, Duration offsetFromNow) {
  if (frames.isEmpty) return 0;
  final target = DateTime.now().add(offsetFromNow);
  var best = 0;
  var bestDiff = const Duration(days: 999);
  for (var i = 0; i < frames.length; i++) {
    final diff = frames[i].time.difference(target).abs();
    if (diff < bestDiff) {
      bestDiff = diff;
      best = i;
    }
  }
  return best;
}
