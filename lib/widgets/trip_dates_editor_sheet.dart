import 'package:flutter/material.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/services/saved_trips_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/trip_date_picker_fields.dart';

/// Bottom sheet to change dates on a saved trip card.
class TripDatesEditorSheet extends StatefulWidget {
  const TripDatesEditorSheet({super.key, required this.trip});

  final SavedTripSummary trip;

  static Future<void> show(BuildContext context, SavedTripSummary trip) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: LuxColors.bg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (_) => TripDatesEditorSheet(trip: trip),
    );
  }

  @override
  State<TripDatesEditorSheet> createState() => _TripDatesEditorSheetState();
}

class _TripDatesEditorSheetState extends State<TripDatesEditorSheet> {
  late String _startIso;
  late String _endIso;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _startIso = widget.trip.startDate;
    _endIso = widget.trip.endDate;
  }

  Future<void> _save() async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      await SavedTripsStore.instance.updateTripDates(
        widget.trip.id,
        startIso: _startIso,
        endIso: _endIso,
        localeName: Localizations.localeOf(context).languageCode,
        flexibleDateLabel: AppLocalizations.of(context).tripsDatesFlexible,
      );
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context).tripsDatesUpdated),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        12,
        20,
        20 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 42,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l.tripsEditDates,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 6),
          Text(
            widget.trip.title,
            style: TextStyle(color: LuxColors.stone400, fontSize: 13),
          ),
          const SizedBox(height: 20),
          TripDatePickerFields(
            startIso: _startIso,
            endIso: _endIso,
            onChanged: (start, end) => setState(() {
              _startIso = start;
              _endIso = end;
            }),
          ),
          const SizedBox(height: 20),
          LuxButton(
            label: l.tripsSaveDates,
            icon: Icons.check_rounded,
            onPressed: _saving ? null : _save,
          ),
        ],
      ),
    );
  }
}
