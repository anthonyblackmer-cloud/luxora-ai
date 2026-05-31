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
  });

  final String label;
  final IconData icon;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final ValueChanged<String?> onChanged;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final tokens = luxThemeTokensOf(context);

    return GlassCard(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: tokens.accent, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: tokens.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          InputDecorator(
            decoration: InputDecoration(
              filled: true,
              fillColor: tokens.panelFill,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: tokens.borderSubtle),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: tokens.borderSubtle),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: tokens.accent.withValues(alpha: 0.55)),
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
                icon: Icon(Icons.expand_more_rounded, color: tokens.textMuted),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: tokens.textPrimary,
                ),
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
