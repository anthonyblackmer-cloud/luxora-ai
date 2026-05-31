import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/services/cloud_trips_auth_service.dart';
import 'package:luxora_ai/services/cloud_trips_sync_service.dart';
import 'package:luxora_ai/widgets/cloud/cloud_trips_account_sheet.dart';
import 'package:luxora_ai/widgets/cloud/cloud_trips_banner.dart';
import 'package:luxora_ai/widgets/more/luxora_more_grid_tile.dart';

/// More tab entry for cloud trip backup — rebuilds on auth/sync changes.
class CloudTripsMoreTile extends StatelessWidget {
  const CloudTripsMoreTile({super.key, required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return ListenableBuilder(
      listenable: Listenable.merge([
        CloudTripsAuthService.instance,
        CloudTripsSyncService.instance,
      ]),
      builder: (context, _) {
        return LuxoraMoreListTile(
          compact: compact,
          icon: Icons.cloud_outlined,
          title: l.cloudTripsTitle,
          subtitle: cloudTripsMoreSubtitle(context),
          onTap: () => CloudTripsAccountSheet.show(context),
        );
      },
    );
  }
}
