import 'package:flutter/material.dart';
import 'package:luxora_ai/theme/lux_theme.dart';

/// Visual card grid for onboarding selections — luxury concierge feel.
class OnboardingOptionGrid<T> extends StatelessWidget {
  const OnboardingOptionGrid({
    super.key,
    required this.options,
    required this.labelFor,
    required this.selected,
    required this.onChanged,
    this.multiSelect = false,
    this.maxSelections,
    this.columns = 2,
  });

  final List<OnboardingGridOption<T>> options;
  final String Function(T value) labelFor;
  final Set<T> selected;
  final ValueChanged<Set<T>> onChanged;
  final bool multiSelect;
  final int? maxSelections;
  final int columns;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: switch (columns) {
          2 => 1.35,
          3 => 1.05,
          _ => 0.78,
        },
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final opt = options[index];
        final isSelected = selected.contains(opt.value);
        return _OptionCard(
          icon: opt.icon,
          label: labelFor(opt.value),
          selected: isSelected,
          onTap: () {
            if (multiSelect) {
              final next = Set<T>.from(selected);
              if (isSelected) {
                next.remove(opt.value);
              } else {
                if (maxSelections != null && next.length >= maxSelections!) {
                  return;
                }
                next.add(opt.value);
              }
              onChanged(next);
            } else {
              onChanged({opt.value});
            }
          },
        );
      },
    );
  }
}

class OnboardingGridOption<T> {
  const OnboardingGridOption({required this.value, required this.icon});

  final T value;
  final IconData icon;
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
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
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: selected ? 1.5 : 1),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: LuxColors.gold.withValues(alpha: 0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 28,
                color: selected ? LuxColors.gold : LuxColors.stone300,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                  height: 1.2,
                  color: selected ? LuxColors.cream : LuxColors.stone400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Large single-select cards for pace and emotion steps.
class OnboardingHeroOptions<T> extends StatelessWidget {
  const OnboardingHeroOptions({
    super.key,
    required this.options,
    required this.labelFor,
    required this.subtitleFor,
    required this.selected,
    required this.onSelected,
  });

  final List<OnboardingGridOption<T>> options;
  final String Function(T value) labelFor;
  final String Function(T value) subtitleFor;
  final T? selected;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final opt in options) ...[
          _HeroCard(
            icon: opt.icon,
            title: labelFor(opt.value),
            subtitle: subtitleFor(opt.value),
            selected: selected == opt.value,
            onTap: () => onSelected(opt.value),
          ),
          const SizedBox(height: 10),
        ],
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: selected
                ? LuxColors.gold.withValues(alpha: 0.12)
                : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: selected
                  ? LuxColors.gold.withValues(alpha: 0.8)
                  : Colors.white.withValues(alpha: 0.1),
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, color: selected ? LuxColors.gold : LuxColors.stone400),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        color: selected ? LuxColors.cream : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: LuxColors.stone400.withValues(alpha: 0.95),
                      ),
                    ),
                  ],
                ),
              ),
              if (selected)
                const Icon(Icons.check_circle_rounded, color: LuxColors.gold),
            ],
          ),
        ),
      ),
    );
  }
}
