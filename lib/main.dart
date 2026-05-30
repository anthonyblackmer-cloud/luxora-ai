import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';

import 'package:luxora_ai/router/app_router.dart';

import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';

import 'package:luxora_ai/services/discover_radius_controller.dart';

import 'package:luxora_ai/services/home_base_store.dart';

import 'package:luxora_ai/services/places_repository.dart';

import 'package:luxora_ai/services/saved_places_storage.dart';

import 'package:luxora_ai/services/saved_trips_store.dart';

import 'package:luxora_ai/services/trip_profile_store.dart';

import 'package:luxora_ai/services/city_pack_sync.dart';

import 'package:luxora_ai/services/ticket_deals_repository.dart';

import 'package:luxora_ai/services/unsplash_photo_registry.dart';

import 'package:luxora_ai/state/luxora_app_state.dart';

import 'package:luxora_ai/util/web_viewport_guard.dart';

import 'package:provider/provider.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UnsplashPhotoRegistry.instance.ensureLoaded();

  await CityPackRegistry.instance.load();

  await CityPackEntitlementStore.instance.load();

  await DiscoverRadiusController.instance.load();

  await PlacesRepository.instance.initialize();

  await TicketDealsRepository.instance.load();

  await SavedPlacesStorage.instance.load();

  await SavedTripsStore.instance.load();

  await TripProfileStore.instance.load();

  await CityPackSync.bootstrapAfterLoad();

  await HomeBaseStore.instance.load();



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

            routerConfig: createAppRouter(),

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


