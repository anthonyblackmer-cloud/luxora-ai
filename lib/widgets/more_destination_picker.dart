import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/widgets/city_destination_picker.dart';

/// Switch the live concierge destination from the More hub.
class MoreDestinationPicker extends StatelessWidget {
  const MoreDestinationPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ListenableBuilder(
      listenable: CityPackRegistry.instance,
      builder: (context, _) {
        final cityId = CityPackRegistry.instance.active.cityId;
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: CityDestinationPicker(
                label: l.paywallSwitchCity,
                selectedCityId: cityId,
                onChanged: (next) async {
                  if (next == cityId) return;
                  if (PaywallService.needsUnlock(next)) {
                    final ok = await PaywallService.showPaywall(
                      context,
                      cityId: next,
                    );
                    if (!ok || !context.mounted) return;
                  } else {
                    await CityPackSync.switchCity(next);
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
