import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/router/app_router.dart';
import 'package:luxora_ai/services/app_bootstrap.dart';
import 'package:luxora_ai/state/luxora_app_state.dart';
import 'package:luxora_ai/util/web_viewport_guard.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appState = LuxoraAppState();
  await Future.wait([
    AppBootstrap.prepareForFirstFrame(),
    appState.load(),
  ]);

  runApp(LuxoraApp(appState: appState));
  unawaited(AppBootstrap.loadDeferredServices());
}

class LuxoraApp extends StatefulWidget {
  const LuxoraApp({super.key, required this.appState});

  final LuxoraAppState appState;

  @override
  State<LuxoraApp> createState() => _LuxoraAppState();
}

class _LuxoraAppState extends State<LuxoraApp> {
  /// Created once — theme/locale updates must not rebuild GoRouter or navigation resets to `/`.
  late final GoRouter _router = createAppRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LuxoraAppState>.value(
      value: widget.appState,
      child: Consumer<LuxoraAppState>(
        builder: (context, state, _) {
          return MaterialApp.router(
            title: 'Luxora AI',
            debugShowCheckedModeBanner: false,
            theme: state.theme,
            themeAnimationDuration: const Duration(milliseconds: 450),
            themeAnimationCurve: Curves.easeInOutCubic,
            locale: Locale(state.locale),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: _router,
            builder: (context, child) {
              final guarded = webViewportGuard(context, child);
              final tint = state.themePalette.overlayTint;
              if (tint.a <= 0.001) return guarded;
              return Stack(
                fit: StackFit.expand,
                children: [
                  guarded,
                  IgnorePointer(child: ColoredBox(color: tint)),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
