import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';

/// Compact labeled dropdown used on the Agenda screen.
class AgendaCompactDropdown extends StatelessWidget {
  const AgendaCompactDropdown({
    super.key,
    required this.label,
    required this.icon,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint,
    this.prominent = false,
    this.selectedItemBuilder,
  });

  final String label;
  final IconData icon;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;
  final String? hint;
  final bool prominent;
  final DropdownButtonBuilder? selectedItemBuilder;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);

    final labelStyle = prominent
        ? TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: tokens.accent.withValues(alpha: 0.9),
          )
        : TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 14,
            color: tokens.textPrimary,
          );

    return GlassCard(
      glow: prominent,
      padding: prominent
          ? const EdgeInsets.fromLTRB(16, 14, 16, 10)
          : const EdgeInsets.fromLTRB(14, 12, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (prominent)
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: tokens.accent.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: tokens.accent.withValues(alpha: 0.28),
                    ),
                  ),
                  child: Icon(icon, color: tokens.accent, size: 20),
                )
              else
                Icon(icon, color: tokens.accent, size: 18),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: labelStyle,
                ),
              ),
            ],
          ),
          SizedBox(height: prominent ? 12 : 8),
          InputDecorator(
            decoration: InputDecoration(
              filled: true,
              fillColor: prominent
                  ? tokens.accent.withValues(alpha: tokens.isLight ? 0.06 : 0.08)
                  : tokens.panelFill,
              contentPadding: EdgeInsets.symmetric(
                horizontal: prominent ? 14 : 12,
                vertical: prominent ? 8 : 4,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(prominent ? 12 : 10),
                borderSide: BorderSide(
                  color: prominent
                      ? tokens.accent.withValues(alpha: 0.35)
                      : tokens.borderSubtle,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(prominent ? 12 : 10),
                borderSide: BorderSide(
                  color: prominent
                      ? tokens.accent.withValues(alpha: 0.35)
                      : tokens.borderSubtle,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(prominent ? 12 : 10),
                borderSide: BorderSide(
                  color: tokens.accent.withValues(alpha: prominent ? 0.75 : 0.55),
                  width: prominent ? 1.5 : 1,
                ),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                isExpanded: true,
                hint: hint == null
                    ? null
                    : Text(
                        hint!,
                        style: TextStyle(color: tokens.textMuted, fontSize: 14),
                      ),
                dropdownColor: tokens.bgSecondary,
                icon: Icon(
                  Icons.expand_more_rounded,
                  color: prominent ? tokens.accent : tokens.textMuted,
                  size: prominent ? 28 : 24,
                ),
                style: TextStyle(
                  fontSize: prominent ? 17 : 14,
                  fontWeight: prominent ? FontWeight.w800 : FontWeight.w600,
                  color: tokens.textPrimary,
                  height: prominent ? 1.2 : null,
                ),
                selectedItemBuilder: selectedItemBuilder,
                items: items,
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
