import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:luxora_ai/l10n/app_localizations.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/l10n/onboarding_l10n_helpers.dart';
import 'package:luxora_ai/models/trip_preferences.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/data/orlando/orlando_addon_catalog.dart';
import 'package:luxora_ai/services/city_pack_sync.dart';
import 'package:luxora_ai/services/city_pack_entitlement_store.dart';
import 'package:luxora_ai/services/city_picker_actions.dart';
import 'package:luxora_ai/services/concierge_voice_service.dart';
import 'package:luxora_ai/services/onboarding_finish_service.dart';
import 'package:luxora_ai/services/onboarding_preference_mapper.dart';
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
import 'package:luxora_ai/widgets/onboarding/onboarding_budget_selector.dart';
import 'package:luxora_ai/widgets/onboarding/onboarding_catalog.dart';
import 'package:luxora_ai/widgets/onboarding/onboarding_luxora_reply.dart';
import 'package:luxora_ai/widgets/onboarding/onboarding_option_grid.dart';
import 'package:luxora_ai/widgets/onboarding/onboarding_summary_panel.dart';
import 'package:luxora_ai/widgets/trip_date_picker_fields.dart';
import 'package:luxora_ai/widgets/trip_name_fields.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, this.initialCityId});

  final String? initialCityId;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _step = 0;
  bool _finishing = false;
  TripProfile _profile = const TripProfile();
  late final TextEditingController _travelerNameController;

  static const _stepCount = 15;

  @override
  void initState() {
    super.initState();
    _travelerNameController = TextEditingController();
    final cityId = widget.initialCityId;
    if (cityId != null) {
      _profile = PaywallService.profileForCity(_profile, cityId);
    }
    unawaited(_loadEntitlements());
    unawaited(ConciergeVoiceService.instance.initialize());
    CityPackEntitlementStore.instance.addListener(_onEntitlementsChanged);
  }

  @override
  void dispose() {
    unawaited(ConciergeVoiceService.instance.stopSpeaking());
    CityPackEntitlementStore.instance.removeListener(_onEntitlementsChanged);
    _travelerNameController.dispose();
    super.dispose();
  }

  Future<void> _loadEntitlements() async {
    await CityPackEntitlementStore.instance.load();
  }

  void _onEntitlementsChanged() {
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _finish() async {
    if (_finishing) return;
    setState(() => _finishing = true);
    try {
      var enriched = OnboardingPreferenceMapper.enrichForPlanning(_profile);
      enriched = TripOccasionInterpreter.apply(
        TripFeelInterpreter.enrich(enriched),
      );
      final locale = Localizations.localeOf(context).languageCode;
      final flexibleDates = AppLocalizations.of(context).tripsDatesFlexible;
      await TripProfileStore.instance.save(enriched);
      await SavedTripsStore.instance.upsertFromProfile(
        enriched,
        localeName: locale,
        flexibleDateLabel: flexibleDates,
      );
      if (!mounted) return;

      if (PaywallService.needsUnlock(enriched.cityId)) {
        final ok = await PaywallService.showPaywall(
          context,
          cityId: enriched.cityId,
        );
        if (!ok || !mounted) return;
      } else {
        await CityPackSync.switchCity(enriched.cityId);
      }

      if (enriched.cityId == OrlandoAddonCatalog.parentCityId) {
        await PaywallService.promptOrlandoThemeParksIfNeeded(context);
      }

      if (!mounted) return;
      final l = context.l10n;
      final buildResult = await OnboardingFinishService.complete(
        profile: enriched,
        l: l,
      );

      if (!mounted) return;
      if (buildResult == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.onboardBuildFailedHint),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }

      if (!mounted) return;
      context.go('/agenda');
    } finally {
      if (mounted) setState(() => _finishing = false);
    }
  }

  Future<void> _next() async {
    if (_finishing) return;

    if (_step == 5 &&
        _profile.cityId == OrlandoAddonCatalog.parentCityId &&
        _profile.tripStyles.contains(TripStyle.themeParks)) {
      final ready = await PaywallService.prepareOrlandoBeforeOccasion(context);
      if (!ready || !mounted) return;
      _onEntitlementsChanged();
    }

    if (_step < _stepCount - 1) {
      if (_step == 0) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
      setState(() => _step++);
    } else {
      await _finish();
    }
  }

  bool get _canContinue {
    return switch (_step) {
      0 => _profile.travelerName.trim().isNotEmpty,
      6 => _profile.tripStyles.isNotEmpty,
      7 => _profile.hotelTypePreferences.isNotEmpty,
      8 => _profile.cuisinePreferences.isNotEmpty ||
          _profile.diningPreferences.isNotEmpty,
      9 => true,
      10 => _profile.vacationGoals.isNotEmpty,
      11 => _profile.experiencePreferences.isNotEmpty,
      12 => true,
      13 => true,
      _ => true,
    };
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
                      context.go('/agenda');
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
                const SizedBox(height: 8),
                Text(
                  l.onboardV2Eyebrow,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    color: LuxColors.gold.withValues(alpha: 0.75),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(child: _buildStep(l)),
                const SizedBox(height: 16),
                LuxButton(
                  label: _finishing
                      ? l.onboardBuilding
                      : (_step == _stepCount - 1
                          ? l.onboardFinish
                          : l.commonContinue),
                  icon: _step >= _stepCount - 2
                      ? Icons.auto_awesome_rounded
                      : Icons.favorite_rounded,
                  onPressed: (_finishing || !_canContinue)
                      ? null
                      : () => unawaited(_next()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStep(AppLocalizations l) {
    return GlassCard(
      glow: _step >= 13,
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          ...switch (_step) {
            0 => _travelerNameStep(l),
            1 => _luxoraReplyStep(l),
            2 => _cityStep(l),
            3 => _datesStep(l),
            4 => _travelerStep(l),
            5 => _tripStyleStep(l),
            6 => _hotelStep(l),
            7 => _foodStep(l),
            8 => _paceStep(l),
            9 => _goalsStep(l),
            10 => _experienceStep(l),
            11 => _avoidStep(l),
            12 => _emotionStep(l),
            13 => _summaryStep(l),
            _ => _nameStep(l),
          },
        ],
      ),
    );
  }

  List<Widget> _header(String eyebrow, String title, String subtitle) => [
        Text(
          eyebrow,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            color: LuxColors.gold.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 13,
            height: 1.4,
            color: LuxColors.stone400.withValues(alpha: 0.95),
          ),
        ),
        const SizedBox(height: 20),
      ];

  List<Widget> _luxoraReplyStep(AppLocalizations l) => [
        OnboardingLuxoraReply(
          travelerName: _profile.travelerName,
          l: l,
        ),
      ];

  List<Widget> _travelerNameStep(AppLocalizations l) => [
        ..._header(
          l.onboardTravelerNameEyebrow,
          l.onboardTravelerNameTitle,
          l.onboardTravelerNameSubtitle,
        ),
        TextField(
          autofocus: true,
          controller: _travelerNameController,
          textCapitalization: TextCapitalization.words,
          autocorrect: false,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) {
            if (_canContinue) unawaited(_next());
          },
          decoration: InputDecoration(
            labelText: l.onboardTravelerNameLabel,
            hintText: l.onboardTravelerNameHint,
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
          ),
          style: const TextStyle(color: LuxColors.cream),
          onChanged: (value) => setState(
            () => _profile = _profile.copyWith(travelerName: value),
          ),
        ),
      ];

  List<Widget> _cityStep(AppLocalizations l) => [
        ..._header(l.onboardStep1Title, l.onboardStep1Subtitle, l.onboardCityUnlockNote),
        CityDestinationPicker(
          label: l.onboardCityLabel,
          selectedCityId: _profile.cityId,
          onChanged: (id) => CityPickerActions.handleSelection(
            context,
            pickedId: id,
            currentCityId: _profile.cityId,
            onCitySelected: (cityId) {
              setState(() {
                _profile = PaywallService.profileForCity(_profile, cityId);
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        _readOnlyField(l.onboardRegion, _profile.region),
      ];

  List<Widget> _datesStep(AppLocalizations l) => [
        ..._header(l.onboardStep2Title, l.onboardStep2Subtitle, l.onboardDatesHint),
        TripDatePickerFields(
          startIso: _profile.startDate,
          endIso: _profile.endDate,
          onChanged: (start, end) => setState(
            () => _profile = _profile.copyWith(
              startDate: start,
              endDate: end,
            ),
          ),
        ),
      ];

  List<Widget> _travelerStep(AppLocalizations l) => [
        ..._header(
          l.onboardV2StepTravelerEyebrow,
          l.onboardV2StepTravelerTitle,
          l.onboardV2StepTravelerSubtitle,
        ),
        OnboardingOptionGrid<TravelerType>(
          options: [
            for (final o in OnboardingCatalog.travelerTypes)
              OnboardingGridOption(value: o.value, icon: o.icon),
          ],
          labelFor: (v) => onboardingTravelerLabel(l, v),
          selected: {_profile.travelerType},
          onChanged: (next) => setState(
            () => _profile = _profile.copyWith(travelerType: next.first),
          ),
        ),
        if (_profile.travelerType == TravelerType.family) ...[
          const SizedBox(height: 20),
          Text(
            l.onboardV2ChildrenLabel,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: LuxColors.cream,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            l.onboardV2ChildrenSubtitle,
            style: TextStyle(
              fontSize: 12,
              height: 1.35,
              color: LuxColors.stone400.withValues(alpha: 0.95),
            ),
          ),
          const SizedBox(height: 10),
          OnboardingOptionGrid<ChildrenType>(
            columns: 2,
            multiSelect: true,
            options: [
              for (final o in OnboardingCatalog.childrenTypes)
                if (o.value != ChildrenType.none)
                  OnboardingGridOption(value: o.value, icon: o.icon),
            ],
            labelFor: (v) => onboardingChildrenLabel(l, v),
            selected: _profile.childrenTypes.toSet(),
            onChanged: (next) {
              final ages = next.where((t) => t != ChildrenType.none).toList();
              setState(
                () => _profile = _profile.copyWith(childrenTypes: ages),
              );
            },
          ),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => setState(
                () => _profile = _profile.copyWith(childrenTypes: const []),
              ),
              child: Text(l.onboardPrefChildrenNone),
            ),
          ),
        ],
        if (_profile.travelerType == TravelerType.friends) ...[
          const SizedBox(height: 20),
          LuxSliderField(
            label: l.onboardTravelers,
            value: _profile.travelerCount.toDouble(),
            min: 2,
            max: 12,
            divisions: 10,
            onChanged: (v) => setState(
              () => _profile = _profile.copyWith(travelerCount: v.round()),
            ),
          ),
        ],
      ];

  List<Widget> _tripStyleStep(AppLocalizations l) => [
        ..._header(
          l.onboardV2StepStyleEyebrow,
          l.onboardV2StepStyleTitle,
          l.onboardV2StepStyleSubtitle,
        ),
        OnboardingOptionGrid<TripStyle>(
          multiSelect: true,
          options: [
            for (final o in OnboardingCatalog.tripStyles)
              OnboardingGridOption(value: o.value, icon: o.icon),
          ],
          labelFor: (v) => onboardingTripStyleLabel(l, v),
          selected: _profile.tripStyles.toSet(),
          onChanged: (next) =>
              setState(() => _profile = _profile.copyWith(tripStyles: next.toList())),
        ),
      ];

  List<Widget> _hotelStep(AppLocalizations l) => [
        ..._header(
          l.onboardV2StepHotelEyebrow,
          l.onboardV2StepHotelTitle,
          l.onboardV2StepHotelSubtitle,
        ),
        OnboardingOptionGrid<HotelTypePreference>(
          multiSelect: true,
          options: [
            for (final o in OnboardingCatalog.hotelTypes)
              OnboardingGridOption(value: o.value, icon: o.icon),
          ],
          labelFor: (v) => onboardingHotelTypeLabel(l, v),
          selected: _profile.hotelTypePreferences.toSet(),
          onChanged: (next) => setState(
            () => _profile = _profile.copyWith(hotelTypePreferences: next.toList()),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          l.onboardV2HotelBudgetLabel,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: LuxColors.cream,
          ),
        ),
        const SizedBox(height: 10),
        OnboardingBudgetSelector<HotelBudgetLevel>(
          options: [
            for (final o in OnboardingCatalog.hotelBudgets) o.value,
          ],
          labelFor: (v) => onboardingBudgetLabel(l, v),
          selected: _profile.hotelBudgetLevel,
          onSelected: (v) =>
              setState(() => _profile = _profile.copyWith(hotelBudgetLevel: v)),
        ),
        const SizedBox(height: 20),
        Text(
          l.onboardV2HotelAmenitiesLabel,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: LuxColors.cream,
          ),
        ),
        const SizedBox(height: 10),
        OnboardingOptionGrid<HotelAmenity>(
          multiSelect: true,
          options: [
            for (final o in OnboardingCatalog.hotelAmenities)
              OnboardingGridOption(value: o.value, icon: o.icon),
          ],
          labelFor: (v) => onboardingAmenityLabel(l, v),
          selected: _profile.hotelAmenities.toSet(),
          onChanged: (next) => setState(
            () => _profile = _profile.copyWith(hotelAmenities: next.toList()),
          ),
        ),
      ];

  List<Widget> _foodStep(AppLocalizations l) => [
        ..._header(
          l.onboardV2StepFoodEyebrow,
          l.onboardV2StepFoodTitle,
          l.onboardV2StepFoodSubtitle,
        ),
        Text(
          l.onboardV2CuisineLabel,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: LuxColors.cream,
          ),
        ),
        const SizedBox(height: 10),
        OnboardingOptionGrid<CuisinePreference>(
          multiSelect: true,
          options: [
            for (final o in OnboardingCatalog.cuisines)
              OnboardingGridOption(value: o.value, icon: o.icon),
          ],
          labelFor: (v) => onboardingCuisineLabel(l, v),
          selected: _profile.cuisinePreferences.toSet(),
          onChanged: (next) => setState(
            () => _profile = _profile.copyWith(cuisinePreferences: next.toList()),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          l.onboardV2DiningStyleLabel,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: LuxColors.cream,
          ),
        ),
        const SizedBox(height: 10),
        OnboardingOptionGrid<DiningPreference>(
          multiSelect: true,
          options: [
            for (final o in OnboardingCatalog.diningStyles)
              OnboardingGridOption(value: o.value, icon: o.icon),
          ],
          labelFor: (v) => onboardingDiningLabel(l, v),
          selected: _profile.diningPreferences.toSet(),
          onChanged: (next) => setState(
            () => _profile = _profile.copyWith(diningPreferences: next.toList()),
          ),
        ),
      ];

  List<Widget> _paceStep(AppLocalizations l) => [
        ..._header(
          l.onboardV2StepPaceEyebrow,
          l.onboardV2StepPaceTitle,
          l.onboardV2StepPaceSubtitle,
        ),
        OnboardingHeroOptions<PacePreference>(
          options: [
            for (final o in OnboardingCatalog.paceOptions)
              OnboardingGridOption(value: o.value, icon: o.icon),
          ],
          labelFor: (v) => onboardingPaceLabel(l, v),
          subtitleFor: (v) => switch (v) {
            PacePreference.slow => l.onboardV2PaceRelaxedBody,
            PacePreference.balanced => l.onboardV2PaceBalancedBody,
            PacePreference.packed => l.onboardV2PacePackedBody,
          },
          selected: _profile.pace,
          onSelected: (v) => setState(() => _profile = _profile.copyWith(pace: v)),
        ),
      ];

  List<Widget> _goalsStep(AppLocalizations l) => [
        ..._header(
          l.onboardV2StepGoalsEyebrow,
          l.onboardV2StepGoalsTitle,
          l.onboardV2StepGoalsSubtitle,
        ),
        OnboardingOptionGrid<VacationGoal>(
          multiSelect: true,
          maxSelections: 5,
          options: [
            for (final o in OnboardingCatalog.vacationGoals)
              OnboardingGridOption(value: o.value, icon: o.icon),
          ],
          labelFor: (v) => onboardingGoalLabel(l, v),
          selected: _profile.vacationGoals.toSet(),
          onChanged: (next) => setState(
            () => _profile = _profile.copyWith(vacationGoals: next.toList()),
          ),
        ),
      ];

  List<Widget> _experienceStep(AppLocalizations l) => [
        ..._header(
          l.onboardV2StepExperienceEyebrow,
          l.onboardV2StepExperienceTitle,
          l.onboardV2StepExperienceSubtitle,
        ),
        OnboardingOptionGrid<ExperiencePreference>(
          multiSelect: true,
          options: [
            for (final o in OnboardingCatalog.experiences)
              OnboardingGridOption(value: o.value, icon: o.icon),
          ],
          labelFor: (v) => onboardingExperienceLabel(l, v),
          selected: _profile.experiencePreferences.toSet(),
          onChanged: (next) => setState(
            () =>
                _profile = _profile.copyWith(experiencePreferences: next.toList()),
          ),
        ),
      ];

  List<Widget> _avoidStep(AppLocalizations l) => [
        ..._header(
          l.onboardV2StepAvoidEyebrow,
          l.onboardV2StepAvoidTitle,
          l.onboardV2StepAvoidSubtitle,
        ),
        OnboardingOptionGrid<AvoidPreference>(
          multiSelect: true,
          options: [
            for (final o in OnboardingCatalog.avoidOptions)
              OnboardingGridOption(value: o.value, icon: o.icon),
          ],
          labelFor: (v) => onboardingAvoidLabel(l, v),
          selected: _profile.avoidPreferences.toSet(),
          onChanged: (next) => setState(
            () => _profile = _profile.copyWith(avoidPreferences: next.toList()),
          ),
        ),
      ];

  List<Widget> _emotionStep(AppLocalizations l) => [
        ..._header(
          l.onboardV2StepEmotionEyebrow,
          l.onboardV2StepEmotionTitle,
          l.onboardV2StepEmotionSubtitle,
        ),
        OnboardingOptionGrid<DesiredTripEmotion>(
          columns: 2,
          options: [
            for (final o in OnboardingCatalog.emotions)
              OnboardingGridOption(value: o.value, icon: o.icon),
          ],
          labelFor: (v) => onboardingEmotionLabel(l, v),
          selected: {_profile.desiredTripEmotion},
          onChanged: (next) => setState(
            () => _profile = _profile.copyWith(desiredTripEmotion: next.first),
          ),
        ),
      ];

  List<Widget> _summaryStep(AppLocalizations l) => [
        ..._header(
          l.onboardV2StepSummaryEyebrow,
          l.onboardV2StepSummaryTitle,
          l.onboardV2StepSummarySubtitle,
        ),
        OnboardingSummaryPanel(
          profile: OnboardingPreferenceMapper.enrichForPlanning(_profile),
        ),
      ];

  List<Widget> _nameStep(AppLocalizations l) => [
        ..._header(
          l.onboardStepNameEyebrow,
          l.onboardStepNameTitle,
          l.onboardStepNameSubtitle,
        ),
        TripNameFields(
          profile: _profile,
          compact: true,
          onChanged: (next) => setState(() => _profile = next),
        ),
      ];

  Widget _readOnlyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
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
        ),
        child: Text(
          value,
          style: const TextStyle(color: LuxColors.stone300),
        ),
      ),
    );
  }
}
