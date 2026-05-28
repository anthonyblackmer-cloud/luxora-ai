import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/data/florida_experiences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/trip_profile_storage.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_background.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/lux_slider_field.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _step = 0;
  TripProfile _profile = const TripProfile();
  final _storage = TripProfileStorage();

  static const _stepCount = 5;
  static const _budgetMinUsd = 1000;
  static const _budgetMaxUsd = 100000;

  Future<void> _finish() async {
    await _storage.save(_profile);
    if (!mounted) return;
    context.go('/concierge');
  }

  void _next() {
    if (_step < _stepCount - 1) {
      setState(() => _step++);
    } else {
      _finish();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LuxBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: !kIsWeb,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: _step > 0
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () => setState(() => _step--),
                )
              : null,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: (_step + 1) / _stepCount,
                    minHeight: 4,
                    backgroundColor: Colors.white.withValues(alpha: 0.1),
                    color: LuxColors.gold,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(child: _buildStep()),
                const SizedBox(height: 16),
                LuxButton(
                  label: _step == _stepCount - 1
                      ? 'Meet your concierge'
                      : 'Continue',
                  icon: Icons.favorite_rounded,
                  onPressed: _next,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStep() {
    return switch (_step) {
      0 => _stepCard(
          'Where dreams land first',
          'Where are you headed?',
          [
            _field('Destination', _profile.destination, (v) {
              setState(() => _profile = _profile.copyWith(destination: v));
            }),
            _field('Region', _profile.region, (v) {
              setState(() => _profile = _profile.copyWith(region: v));
            }),
          ],
        ),
      1 => _stepCard(
          'Time to feel free',
          'When does your escape begin?',
          [
            LuxSliderField(
              label: 'Trip budget (USD)',
              value: _profile.budgetUsd.toDouble(),
              min: _budgetMinUsd.toDouble(),
              max: _budgetMaxUsd.toDouble(),
              divisions: 99,
              prefix: r'$',
              formatDisplay: (v) => luxFormatUsd(v.round()),
              onChanged: (v) {
                setState(
                  () => _profile = _profile.copyWith(budgetUsd: v.round()),
                );
              },
            ),
          ],
        ),
      2 => _stepCard(
          "Who shares the story",
          "Who's traveling with you?",
          [
            LuxSliderField(
              label: 'Travelers',
              value: _profile.travelerCount.toDouble(),
              min: 1,
              max: 12,
              divisions: 11,
              onChanged: (v) {
                setState(
                  () => _profile = _profile.copyWith(travelerCount: v.round()),
                );
              },
            ),
          ],
        ),
      3 => _stepCard(
          'Your rhythm',
          'How should your days flow?',
          [
            LuxSliderField(
              label: 'Nightlife interest',
              value: _profile.nightlifeInterest.toDouble(),
              min: 0,
              max: 100,
              divisions: 20,
              suffix: '%',
              onChanged: (v) {
                setState(
                  () => _profile =
                      _profile.copyWith(nightlifeInterest: v.round()),
                );
              },
            ),
            LuxSliderField(
              label: 'Foodie passion',
              value: _profile.foodieInterest.toDouble(),
              min: 0,
              max: 100,
              divisions: 20,
              suffix: '%',
              onChanged: (v) {
                setState(
                  () =>
                      _profile = _profile.copyWith(foodieInterest: v.round()),
                );
              },
            ),
          ],
        ),
      _ => _stepCard(
          'The heart of Luxora',
          'What do you want this trip to FEEL like?',
          [
            TextField(
              maxLines: 3,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDeco(
                'Sunset dinners, slow mornings, laughter with my partner…',
              ),
              onChanged: (v) =>
                  setState(() => _profile = _profile.copyWith(tripFeel: v)),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: moodOptions.map((m) {
                final selected = _profile.moods.contains(m.mood);
                return FilterChip(
                  selected: selected,
                  label: Text('${m.emoji} ${m.label}'),
                  onSelected: (_) {
                    setState(() {
                      final moods = List<TripMood>.from(_profile.moods);
                      if (selected) {
                        moods.remove(m.mood);
                      } else {
                        moods.add(m.mood);
                      }
                      _profile = _profile.copyWith(moods: moods);
                    });
                  },
                  selectedColor: LuxColors.gold.withValues(alpha: 0.2),
                  checkmarkColor: LuxColors.gold,
                );
              }).toList(),
            ),
          ],
          glow: true,
        ),
    };
  }

  Widget _stepCard(String eyebrow, String title, List<Widget> children,
      {bool glow = false}) {
    return GlassCard(
      glow: glow,
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Text(eyebrow,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
                color: LuxColors.gold.withValues(alpha: 0.8),
              )),
          const SizedBox(height: 8),
          Text(title, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _field(String label, String value, ValueChanged<String> onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        key: ValueKey('$label-$value'),
        initialValue: value,
        style: const TextStyle(color: Colors.white),
        decoration: _inputDeco(label),
        onChanged: onChanged,
      ),
    );
  }

  InputDecoration _inputDeco(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: LuxColors.stone500.withValues(alpha: 0.9)),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.06),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: LuxColors.gold.withValues(alpha: 0.5)),
      ),
    );
  }
}
