import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/theme/lux_breakpoints.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/discover_radius_selector.dart';
import 'package:luxora_ai/widgets/discover_scope_banner.dart';
import 'package:luxora_ai/widgets/lux_responsive_frame.dart';
import 'package:luxora_ai/widgets/lux_secondary_app_bar.dart';
import 'package:luxora_ai/widgets/stay_dining/categorized_browse_section.dart';

/// Browse curated dining by category — theme park, budget, upscale, and search.
class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key, this.embedded = false});

  final bool embedded;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final compact = luxIsTablet(context);

    final body = ListenableBuilder(
      listenable: Listenable.merge([
        CityPackRegistry.instance,
        DiscoverRadiusController.instance,
      ]),
      builder: (context, _) {
        return ValueListenableBuilder<TripProfile?>(
          valueListenable: TripProfileStore.instance.profile,
          builder: (context, profile, _) {
            return ListView(
              shrinkWrap: embedded,
              physics: embedded
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                compact ? 16 : 20,
                embedded ? 0 : 8,
                compact ? 16 : 20,
                24,
              ),
              children: [
                if (!embedded) ...[
                  Text(
                    l.restaurantsPageTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 8),
                ],
                CategorizedRestaurantSection(
                  profile: profile ?? const TripProfile(),
                ),
                const SizedBox(height: 16),
                const DiscoverRadiusSelector(),
                const SizedBox(height: 12),
                const DiscoverScopeBanner(),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    l.browseFullCatalogHint,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.4,
                      color: tokens.textMuted,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );

    if (embedded) return body;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: LuxSecondaryAppBar(title: l.navRestaurants),
      body: SafeArea(
        top: false,
        child: LuxResponsiveFrame(child: body),
      ),
    );
  }
}
