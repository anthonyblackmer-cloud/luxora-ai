import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/cloud_trips_auth_service.dart';
import 'package:luxora_ai/services/cloud_trips_entitlement.dart';
import 'package:luxora_ai/services/cloud_trips_sync_service.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/cloud/cloud_trips_account_sheet.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_button.dart';

/// Prompt on Trips when premium is unlocked but cloud sign-in is pending.
class CloudTripsBanner extends StatelessWidget {
  const CloudTripsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    if (!CloudTripsEntitlement.canUseCloud) {
      return const SizedBox.shrink();
    }

    return ListenableBuilder(
      listenable: CloudTripsAuthService.instance,
      builder: (context, _) {
        if (CloudTripsAuthService.instance.isSignedIn) {
          return const SizedBox.shrink();
        }

        final l = context.l10n;
        final tokens = luxThemeTokensOf(context);

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: GlassCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.cloud_upload_outlined, color: tokens.accent),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        l.cloudTripsBannerTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: tokens.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  l.cloudTripsBannerBody,
                  style: TextStyle(
                    color: tokens.textMuted,
                    height: 1.35,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 14),
                LuxButton(
                  label: l.cloudTripsBannerCta,
                  icon: Icons.login_rounded,
                  fullWidth: true,
                  onPressed: () => CloudTripsAccountSheet.show(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Account section subtitle for More → Cloud backup tile.
String cloudTripsMoreSubtitle(BuildContext context) {
  final l = context.l10n;
  if (!CloudTripsEntitlement.isBackendReady) {
    return l.cloudTripsNotConfigured;
  }
  if (!CloudTripsEntitlement.hasPremium) {
    return l.cloudTripsUnlockRequired;
  }
  if (CloudTripsAuthService.instance.isSignedIn) {
    final email = CloudTripsAuthService.instance.email;
    if (email != null && email.isNotEmpty) {
      return l.cloudTripsMoreSubSignedIn(email);
    }
    return l.cloudTripsSyncSuccess;
  }
  if (CloudTripsSyncService.instance.status == CloudSyncStatus.syncing) {
    return l.cloudTripsMoreSubSyncing;
  }
  return l.cloudTripsMoreSubSignedOut;
}
