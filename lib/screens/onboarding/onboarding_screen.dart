import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/l10n/luxora_l10n_helpers.dart';
import 'package:luxora_ai/data/saved_trips.dart';
import 'package:luxora_ai/models/trip_occasion.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/paywall_service.dart';
import 'package:luxora_ai/services/saved_trips_store.dart';
import 'package:luxora_ai/services/trip_feel_interpreter.dart';
import 'package:luxora_ai/services/trip_occasion_interpreter.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/city_destination_picker.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/lux_background.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/lux_slider_field.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, this.initialCityId});

  final String? initialCityId;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _step = 0;
  TripProfile _profile = const TripProfile();

  static const _stepCount = 5;
  static const _budgetMinUsd = 1000;
  static const _budgetMaxUsd = 100000;

  @override
  void initState() {
    super.initState();
    final cityId = widget.initialCityId;
    if (cityId != null) {
      _profile = PaywallService.profileForCity(_profile, cityId);
    }
  }

  Future<void> _finish() async {
    // Let the typed "trip feel" actually reshape the dials/moods that drive
    // the Day Flow and recommendations.
    final enriched = TripOccasionInterpreter.apply(
      TripFeelInterpreter.enrich(_profile),
    );
    await TripProfileStore.instance.save(enriched);
    await SavedTripsStore.instance.add(
      SavedTripSummary.fromProfile(
        enriched,
        id: 'trip-${DateTime.now().millisecondsSinceEpoch}',
      ),
    );
    if (!mounted) return;

    final unlocked = await PaywallService.showPaywall(
      context,
      cityId: enriched.cityId,
    );
    if (!mounted) return;
    context.go(unlocked ? '/trips' : '/discover');
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
    final l = context.l10n;
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
              : IconButton(
                  icon: const Icon(Icons.close_rounded),
                  tooltip: l.commonClose,
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/discover');
                    }
                  },
                ),
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
                      ? l.onboardFinish
                      : l.commonContinue,
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
    final l = context.l10n;
    return switch (_step) {
      0 => _stepCard(
          l.onboardStep1Title,
          l.onboardStep1Subtitle,
          [
            CityDestinationPicker(
              label: l.onboardCityLabel,
              selectedCityId: _profile.cityId,
              onChanged: (cityId) {
                setState(() {
                  _profile = PaywallService.profileForCity(_profile, cityId);
                });
              },
            ),
            const SizedBox(height: 8),
            Text(
              l.onboardCityUnlockNote,
              style: TextStyle(
                fontSize: 12,
                height: 1.4,
                color: LuxColors.stone400.withValues(alpha: 0.95),
              ),
            ),
            const SizedBox(height: 16),
            _readOnlyField(l.onboardRegion, _profile.region),
          ],
        ),
      1 => _stepCard(
          l.onboardStep2Title,
          l.onboardStep2Subtitle,
          [
            LuxSliderField(
              label: l.onboardBudget,
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
          l.onboardStep3Title,
          l.onboardStep3Subtitle,
          [
            LuxSliderField(
              label: l.onboardTravelers,
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
          l.onboardStep4Title,
          l.onboardStep4Subtitle,
          [
            LuxSliderField(
              label: l.onboardNightlife,
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
              label: l.onboardPoolside,
              value: _profile.poolsideInterest.toDouble(),
              min: 0,
              max: 100,
              divisions: 20,
              suffix: '%',
              onChanged: (v) {
                setState(
                  () => _profile =
                      _profile.copyWith(poolsideInterest: v.round()),
                );
              },
            ),
            LuxSliderField(
              label: l.onboardAdventure,
              value: _profile.adventureInterest.toDouble(),
              min: 0,
              max: 100,
              divisions: 20,
              suffix: '%',
              onChanged: (v) {
                setState(
                  () => _profile =
                      _profile.copyWith(adventureInterest: v.round()),
                );
              },
            ),
            LuxSliderField(
              label: l.onboardCulture,
              value: _profile.cultureInterest.toDouble(),
              min: 0,
              max: 100,
              divisions: 20,
              suffix: '%',
              onChanged: (v) {
                setState(
                  () => _profile =
                      _profile.copyWith(cultureInterest: v.round()),
                );
              },
            ),
            LuxSliderField(
              label: l.onboardFoodie,
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
          l.onboardStep5Title,
          l.onboardStep5Subtitle,
          [
            TextField(
              maxLines: 3,
              style: const TextStyle(color: Colors.white),
              decoration: _inputDeco(l.onboardTripFeelHint),
              onChanged: (v) =>
                  setState(() => _profile = _profile.copyWith(tripFeel: v)),
            ),
            const SizedBox(height: 16),
            Text(
              l.onboardOccasionLabel,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: LuxColors.cream,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final o in TripOccasion.values)
                  FilterChip(
                    selected: _profile.occasion == o,
                    label: Text(_occasionLabel(l, o)),
                    onSelected: (_) => setState(
                      () => _profile = _profile.copyWith(occasion: o),
                    ),
                    selectedColor: LuxColors.gold.withValues(alpha: 0.2),
                    checkmarkColor: LuxColors.gold,
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: moodOptionsL10n(l).map((m) {
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

  Widget _readOnlyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InputDecorator(
        decoration: _inputDeco(label),
        child: Text(
          value,
          style: const TextStyle(color: LuxColors.stone300),
        ),
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

  String _occasionLabel(AppLocalizations l, TripOccasion o) => switch (o) {
        TripOccasion.general => l.occasionGeneral,
        TripOccasion.coupleAnniversary => l.occasionAnniversary,
        TripOccasion.coupleHoneymoon => l.occasionHoneymoon,
        TripOccasion.coupleDateNight => l.occasionDateNight,
        TripOccasion.coupleProposal => l.occasionProposal,
        TripOccasion.familyWithKids => l.occasionFamily,
      };
}
