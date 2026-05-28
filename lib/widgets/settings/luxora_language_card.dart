import 'package:flutter/material.dart';

/// Language row card — matches Discipline AI picker style.
class LuxoraLanguageCard extends StatelessWidget {
  const LuxoraLanguageCard({
    super.key,
    required this.label,
    this.secondaryLabel,
    required this.flagEmoji,
    required this.selected,
    required this.onTap,
    required this.accent,
    required this.cardColor,
    required this.borderMuted,
  });

  final String label;
  final String? secondaryLabel;
  final String flagEmoji;
  final bool selected;
  final VoidCallback onTap;
  final Color accent;
  final Color cardColor;
  final Color borderMuted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedScale(
      scale: selected ? 1.02 : 1.0,
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 240),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected ? accent : borderMuted,
                width: selected ? 2 : 1,
              ),
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: accent.withValues(alpha: 0.45),
                        blurRadius: 20,
                      ),
                    ]
                  : null,
              gradient: selected
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        accent.withValues(alpha: 0.14),
                        Colors.transparent,
                      ],
                    )
                  : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 48,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: selected ? accent : accent.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected
                        ? accent.withValues(alpha: 0.2)
                        : accent.withValues(alpha: 0.12),
                  ),
                  child: Text(flagEmoji, style: const TextStyle(fontSize: 22)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          height: 1.25,
                        ),
                      ),
                      if (secondaryLabel != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          secondaryLabel!,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                            height: 1.4,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: selected ? accent : Colors.transparent,
                    border: Border.all(
                      color: selected
                          ? accent
                          : theme.colorScheme.outline.withValues(alpha: 0.55),
                      width: 2,
                    ),
                  ),
                  child: selected
                      ? Icon(
                          Icons.check,
                          size: 14,
                          color: theme.colorScheme.onPrimary,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
