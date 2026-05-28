import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/discover_radius_controller.dart';
import 'package:luxora_ai/services/places_repository.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Shows how many destinations match the current Orlando radius.
class DiscoverScopeBanner extends StatelessWidget {
  const DiscoverScopeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: DiscoverRadiusController.instance,
      builder: (context, _) {
        final radius = DiscoverRadiusController.instance.radius;
        final count = PlacesRepository.instance.countWithinRadius(radius);
        final l = context.l10n;
        final label = radius.isUnlimited
            ? l.scopeDestinationsAll(count)
            : l.scopeDestinationsRadius(
                count,
                radius.shortLabelL10n(l),
              );

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: LuxColors.gold.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: LuxColors.gold.withValues(alpha: 0.25)),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: LuxColors.gold.withValues(alpha: 0.95),
            ),
          ),
        );
      },
    );
  }
}
