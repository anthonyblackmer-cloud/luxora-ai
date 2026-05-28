import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxora_ai/router/app_router.dart';
import 'package:luxora_ai/services/unsplash_photo_registry.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/web_viewport_guard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleFonts.pendingFonts([GoogleFonts.notoColorEmoji()]);
  await UnsplashPhotoRegistry.instance.ensureLoaded();
  runApp(const LuxoraApp());
}

class LuxoraApp extends StatelessWidget {
  const LuxoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Luxora AI',
      debugShowCheckedModeBanner: false,
      theme: buildLuxTheme(),
      routerConfig: createAppRouter(),
      builder: webViewportGuard,
    );
  }
}
