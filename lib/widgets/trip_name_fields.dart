import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/trip_name_generator.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Toggle Luxora naming vs a custom title — used in onboarding and Concierge.
class TripNameFields extends StatefulWidget {
  const TripNameFields({
    super.key,
    required this.profile,
    required this.onChanged,
    this.compact = false,
  });

  final TripProfile profile;
  final ValueChanged<TripProfile> onChanged;
  final bool compact;

  @override
  State<TripNameFields> createState() => _TripNameFieldsState();
}

class _TripNameFieldsState extends State<TripNameFields> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.tripName);
  }

  @override
  void didUpdateWidget(covariant TripNameFields oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.profile.tripName != _nameController.text &&
        widget.profile.tripName != oldWidget.profile.tripName) {
      _nameController.text = widget.profile.tripName;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final tokens = luxThemeTokensOf(context);
    final suggested = TripNameGenerator.suggest(widget.profile);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.compact) ...[
          Text(
            l.onboardStepNameTitle,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: tokens.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l.onboardStepNameSubtitle,
            style: TextStyle(
              fontSize: 12,
              height: 1.35,
              color: tokens.textMuted,
            ),
          ),
          const SizedBox(height: 12),
        ],
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            FilterChip(
              selected: widget.profile.useAutoTripName,
              label: Text(l.onboardTripNameLuxora),
              onSelected: (_) => widget.onChanged(
                widget.profile.copyWith(useAutoTripName: true),
              ),
              selectedColor: LuxColors.gold.withValues(alpha: 0.2),
              checkmarkColor: LuxColors.gold,
            ),
            FilterChip(
              selected: !widget.profile.useAutoTripName,
              label: Text(l.onboardTripNameYours),
              onSelected: (_) => widget.onChanged(
                widget.profile.copyWith(useAutoTripName: false),
              ),
              selectedColor: LuxColors.gold.withValues(alpha: 0.2),
              checkmarkColor: LuxColors.gold,
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (widget.profile.useAutoTripName)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: widget.compact ? 12 : 14,
              vertical: widget.compact ? 10 : 12,
            ),
            decoration: BoxDecoration(
              color: tokens.panelFill,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: tokens.borderSubtle),
            ),
            child: Row(
              children: [
                Icon(Icons.auto_awesome_rounded, size: 18, color: tokens.accent),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    l.onboardTripNameSuggested(suggested),
                    style: TextStyle(
                      fontSize: widget.compact ? 13 : 14,
                      fontWeight: FontWeight.w600,
                      color: tokens.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          )
        else
          TextField(
            controller: _nameController,
            maxLength: TripNameGenerator.maxCustomLength,
            style: TextStyle(color: tokens.textPrimary),
            decoration: InputDecoration(
              hintText: l.onboardTripNameHint,
              hintStyle: TextStyle(color: tokens.textMuted.withValues(alpha: 0.9)),
              filled: true,
              fillColor: tokens.panelFill,
              counterStyle: TextStyle(color: tokens.textMuted, fontSize: 11),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: tokens.borderSubtle),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: tokens.borderSubtle),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: tokens.accent.withValues(alpha: 0.5)),
              ),
            ),
            onChanged: (value) => widget.onChanged(
              widget.profile.copyWith(tripName: value, useAutoTripName: false),
            ),
          ),
      ],
    );
  }
}
