import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/util/trip_date_format.dart';

/// Start/end date pickers used in onboarding and trip editing.
class TripDatePickerFields extends StatelessWidget {
  const TripDatePickerFields({
    super.key,
    required this.startIso,
    required this.endIso,
    required this.onChanged,
  });

  final String startIso;
  final String endIso;
  final void Function(String startIso, String endIso) onChanged;

  Future<void> _pick(
    BuildContext context, {
    required bool pickingStart,
  }) async {
    final l = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final initial = TripDateFormat.parseIso(pickingStart ? startIso : endIso) ??
        TripDateFormat.parseIso(startIso) ??
        today;
    final picked = await showDatePicker(
      context: context,
      initialDate: initial.isBefore(today) ? today : initial,
      firstDate: today,
      lastDate: today.add(const Duration(days: 730)),
      helpText:
          pickingStart ? l.onboardSelectStartDate : l.onboardSelectEndDate,
      locale: locale,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: LuxColors.gold,
              onPrimary: LuxColors.bg,
              surface: LuxColors.bg,
              onSurface: LuxColors.cream,
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
    if (picked == null) return;

    var nextStart = startIso;
    var nextEnd = endIso;
    if (pickingStart) {
      nextStart = TripDateFormat.toIso(picked);
      final end = TripDateFormat.parseIso(endIso);
      if (end != null && end.isBefore(picked)) {
        nextEnd = '';
      }
    } else {
      final start = TripDateFormat.parseIso(startIso);
      if (start != null && picked.isBefore(start)) {
        nextEnd = TripDateFormat.toIso(start);
        nextStart = TripDateFormat.toIso(picked);
      } else {
        nextEnd = TripDateFormat.toIso(picked);
      }
    }
    onChanged(nextStart, nextEnd);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).languageCode;
    final startLabel = startIso.isEmpty
        ? l.onboardPickDate
        : TripDateFormat.displaySingle(startIso, locale);
    final endLabel = endIso.isEmpty
        ? l.onboardPickDate
        : TripDateFormat.displaySingle(endIso, locale);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _DateTile(
          label: l.onboardStartDateLabel,
          value: startLabel,
          onTap: () => _pick(context, pickingStart: true),
        ),
        const SizedBox(height: 12),
        _DateTile(
          label: l.onboardEndDateLabel,
          value: endLabel,
          onTap: () => _pick(context, pickingStart: false),
        ),
        const SizedBox(height: 10),
        Text(
          l.onboardDatesHint,
          style: TextStyle(
            fontSize: 12,
            height: 1.4,
            color: LuxColors.stone400.withValues(alpha: 0.95),
          ),
        ),
      ],
    );
  }
}

class _DateTile extends StatelessWidget {
  const _DateTile({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.06),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.calendar_month_rounded,
                size: 20,
                color: LuxColors.gold.withValues(alpha: 0.9),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                        color: LuxColors.stone500.withValues(alpha: 0.95),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: LuxColors.cream,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: LuxColors.stone500.withValues(alpha: 0.9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
