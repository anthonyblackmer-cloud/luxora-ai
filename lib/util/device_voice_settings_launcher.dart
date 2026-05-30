import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens the closest OS screen for managing downloaded TTS voices.
Future<void> openDeviceVoiceSettings() async {
  if (kIsWeb) return;

  if (Platform.isIOS) {
    final candidates = <Uri>[
      Uri.parse('App-Prefs:root=General&path=ACCESSIBILITY/SPEECH'),
      Uri.parse('app-settings:'),
    ];
    for (final uri in candidates) {
      if (await canLaunchUrl(uri)) {
        final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
        if (ok) return;
      }
    }
  }

  if (Platform.isAndroid) {
    final uri = Uri.parse(
      'intent:#Intent;action=android.settings.ACCESSIBILITY_SETTINGS;end',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
