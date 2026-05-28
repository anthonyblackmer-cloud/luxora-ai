import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:luxora_ai/l10n/app_localizations.dart';

import 'package:luxora_ai/router/app_router.dart';

import 'package:luxora_ai/services/discover_radius_controller.dart';

import 'package:luxora_ai/services/places_repository.dart';

import 'package:luxora_ai/services/unsplash_photo_registry.dart';

import 'package:luxora_ai/state/luxora_app_state.dart';

import 'package:luxora_ai/util/web_viewport_guard.dart';

import 'package:provider/provider.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await GoogleFonts.pendingFonts([GoogleFonts.notoColorEmoji()]);

  await UnsplashPhotoRegistry.instance.ensureLoaded();

  await DiscoverRadiusController.instance.load();

  await PlacesRepository.instance.initialize();



  final appState = LuxoraAppState();

  await appState.load();



  runApp(LuxoraApp(appState: appState));

}



class LuxoraApp extends StatelessWidget {

  const LuxoraApp({super.key, required this.appState});



  final LuxoraAppState appState;



  @override

  Widget build(BuildContext context) {

    return ChangeNotifierProvider<LuxoraAppState>.value(

      value: appState,

      child: Consumer<LuxoraAppState>(

        builder: (context, state, _) {

          return MaterialApp.router(

            title: 'Luxora AI',

            debugShowCheckedModeBanner: false,

            theme: state.theme,

            locale: Locale(state.locale),

            localizationsDelegates: const [

              AppLocalizations.delegate,

              GlobalMaterialLocalizations.delegate,

              GlobalWidgetsLocalizations.delegate,

              GlobalCupertinoLocalizations.delegate,

            ],

            supportedLocales: AppLocalizations.supportedLocales,

            routerConfig: createAppRouter(),

            builder: webViewportGuard,

          );

        },

      ),

    );

  }

}


