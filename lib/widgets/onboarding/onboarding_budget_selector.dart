import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Compact horizontal budget tiers ($ – $$$$) — avoids 4-column grid overflow.
class OnboardingBudgetSelector<T> extends StatelessWidget {
  const OnboardingBudgetSelector({
    super.key,
    required this.options,
    required this.labelFor,
    required this.selected,
    required this.onSelected,
  });

  final List<T> options;
  final String Function(T value) labelFor;
  final T selected;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < options.length; i++) ...[
          if (i > 0) const SizedBox(width: 8),
          Expanded(
            child: _BudgetTile(
              label: labelFor(options[i]),
              selected: options[i] == selected,
              onTap: () => onSelected(options[i]),
            ),
          ),
        ],
      ],
    );
  }
}

class _BudgetTile extends StatelessWidget {
  const _BudgetTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = selected
        ? LuxColors.gold.withValues(alpha: 0.85)
        : Colors.white.withValues(alpha: 0.12);
    final bg = selected
        ? LuxColors.gold.withValues(alpha: 0.14)
        : Colors.white.withValues(alpha: 0.05);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: borderColor, width: selected ? 1.5 : 1),
          ),
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: selected ? LuxColors.gold : LuxColors.stone400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
