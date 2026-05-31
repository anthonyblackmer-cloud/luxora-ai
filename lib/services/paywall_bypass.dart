import 'package:flutter/foundation.dart';

/// Debug-only paywall bypass for local and web builds without store billing.
///
/// Enabled when:
/// - `--dart-define=BYPASS_PAYWALL=true`, or
/// - `--dart-define=SIMULATE_IAP=true`, or
/// - running on **web** in debug (Edge/Chrome — no IAP).
///
/// Disabled when:
/// - `--dart-define=BYPASS_PAYWALL=false`, or
/// - `--dart-define=PREVIEW_PAYWALL=true` (freemium + paywall UI for QA).
abstract final class PaywallBypass {
  static bool get forcePreviewMode =>
      kDebugMode &&
      const bool.fromEnvironment('PREVIEW_PAYWALL', defaultValue: false);

  static bool get enabled {
    if (!kDebugMode) return false;
    if (forcePreviewMode) return false;

    const bypassFlag = String.fromEnvironment('BYPASS_PAYWALL');
    if (bypassFlag == 'false') return false;
    if (bypassFlag == 'true') return true;
    if (const bool.fromEnvironment('SIMULATE_IAP', defaultValue: false)) {
      return true;
    }
    return kIsWeb;
  }
}
