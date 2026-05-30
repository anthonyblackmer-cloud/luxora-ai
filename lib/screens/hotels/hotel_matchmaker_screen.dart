import 'package:flutter/material.dart';
import 'package:luxora_ai/l10n/luxora_l10n_ext.dart';
import 'package:luxora_ai/models/lux_hotel.dart';
import 'package:luxora_ai/models/trip_profile.dart';
import 'package:luxora_ai/services/city_pack_registry.dart';
import 'package:luxora_ai/services/hotel_intelligence_service.dart';
import 'package:luxora_ai/services/trip_profile_store.dart';
import 'package:luxora_ai/theme/lux_theme.dart';
import 'package:luxora_ai/widgets/glass_card.dart';
import 'package:luxora_ai/widgets/hotel_card.dart';
import 'package:luxora_ai/widgets/hotel_detail_sheet.dart';
import 'package:luxora_ai/theme/lux_breakpoints.dart';
import 'package:luxora_ai/widgets/lux_button.dart';
import 'package:luxora_ai/widgets/lux_responsive_frame.dart';

class HotelMatchmakerScreen extends StatefulWidget {
  const HotelMatchmakerScreen({super.key});

  @override
  State<HotelMatchmakerScreen> createState() => _HotelMatchmakerScreenState();
}

class _HotelMatchmakerScreenState extends State<HotelMatchmakerScreen> {
  HotelPriceRange? _budget;
  int _adults = 2;
  int _kids = 0;
  int _luxuryLevel = 3;
  HotelTransportPreference _transport = HotelTransportPreference.rentalCar;
  final Set<String> _attractions = {};
  final Set<String> _vibes = {};
  List<HotelMatchResult>? _results;
  HotelMatchmakerInput? _lastInput;

  String get _cityId => CityPackRegistry.instance.active.cityId;

  void _runMatchmaker() {
    final l = context.l10n;
    final input = HotelMatchmakerInput(
      budget: _budget,
      adults: _adults,
      kids: _kids,
      luxuryLevel: _luxuryLevel,
      transport: _transport,
      plannedAttractions: _attractions.toList(),
      preferredVibes: _vibes.toList(),
    );
    setState(() {
      _lastInput = input;
      _results = HotelIntelligenceService.match(input: input, l: l);
    });
  }

  @override
  void initState() {
    super.initState();
    TripProfileStore.instance.profile.addListener(_seedFromProfile);
    CityPackRegistry.instance.addListener(_onCityChanged);
    _seedFromProfile();
  }

  @override
  void dispose() {
    TripProfileStore.instance.profile.removeListener(_seedFromProfile);
    CityPackRegistry.instance.removeListener(_onCityChanged);
    super.dispose();
  }

  void _onCityChanged() {
    final visible = HotelIntelligenceService.visibleMatchmakerAttractions(
      _cityId,
    );
    final allowed = visible.map((e) => e.tag).toSet();
    setState(() {
      _attractions.removeWhere((tag) => !allowed.contains(tag));
      _results = null;
    });
  }

  void _seedFromProfile() {
    final profile = TripProfileStore.instance.profile.value;
    if (profile == null) return;
    setState(() {
      _adults = profile.adults;
      _kids = profile.kids;
      _vibes.clear();
      if (profile.moods.contains(TripMood.romantic)) _vibes.add('romantic');
      if (profile.kids > 0 || profile.moods.contains(TripMood.familyBonding)) {
        _vibes.add('family');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final attractionOptions =
        HotelIntelligenceService.visibleMatchmakerAttractions(_cityId);
    final compact = luxIsTablet(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0C0A09),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(l.hotelMatchmakerTitle),
      ),
      body: SafeArea(
        child: LuxResponsiveFrame(
          child: ListView(
          padding: EdgeInsets.all(compact ? 16 : 20),
          children: [
            Text(
              l.hotelMatchmakerSubtitle,
              style: const TextStyle(
                fontSize: 13,
                height: 1.45,
                color: LuxColors.stone400,
              ),
            ),
            const SizedBox(height: 20),
            _SectionLabel(l.hotelMatchBudget),
            Wrap(
              spacing: 8,
              children: HotelPriceRange.values.map((r) {
                final selected = _budget == r;
                return ChoiceChip(
                  label: Text(
                    HotelIntelligenceService.priceRangeLabel(l, r),
                    style: TextStyle(fontSize: compact ? 12 : null),
                  ),
                  visualDensity:
                      compact ? VisualDensity.compact : VisualDensity.standard,
                  selected: selected,
                  onSelected: (_) => setState(() => _budget = r),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            _SectionLabel(l.hotelMatchTravelers),
            Row(
              children: [
                Expanded(
                  child: _StepperRow(
                    label: l.hotelMatchAdults,
                    value: _adults,
                    onChanged: (v) => setState(() => _adults = v),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StepperRow(
                    label: l.hotelMatchKids,
                    value: _kids,
                    onChanged: (v) => setState(() => _kids = v),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _SectionLabel(l.hotelMatchAttractions),
            if (attractionOptions.isEmpty)
              Text(
                l.hotelMatchAttractionsGeneral,
                style: const TextStyle(
                  fontSize: 12,
                  color: LuxColors.stone400,
                ),
              )
            else
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final option in attractionOptions)
                    _AttractionChip(
                      label: option.label,
                      tag: option.tag,
                      compact: compact,
                      selected: _attractions.contains(option.tag),
                      onTap: () => setState(() {
                        if (_attractions.contains(option.tag)) {
                          _attractions.remove(option.tag);
                        } else {
                          _attractions.add(option.tag);
                        }
                      }),
                    ),
                ],
              ),
            const SizedBox(height: 16),
            _SectionLabel(l.hotelMatchLuxuryLevel),
            Slider(
              value: _luxuryLevel.toDouble(),
              min: 1,
              max: 5,
              divisions: 4,
              label: '$_luxuryLevel',
              onChanged: (v) => setState(() => _luxuryLevel = v.round()),
            ),
            const SizedBox(height: 8),
            _SectionLabel(l.hotelMatchTransport),
            DropdownButton<HotelTransportPreference>(
              value: _transport,
              isExpanded: true,
              dropdownColor: const Color(0xFF1C1917),
              items: [
                DropdownMenuItem(
                  value: HotelTransportPreference.rentalCar,
                  child: Text(l.hotelTransportCar),
                ),
                DropdownMenuItem(
                  value: HotelTransportPreference.rideshare,
                  child: Text(l.hotelTransportRideshare),
                ),
                DropdownMenuItem(
                  value: HotelTransportPreference.resortShuttle,
                  child: Text(l.hotelTransportShuttle),
                ),
                DropdownMenuItem(
                  value: HotelTransportPreference.walkableArea,
                  child: Text(l.hotelTransportWalkable),
                ),
              ],
              onChanged: (v) {
                if (v != null) setState(() => _transport = v);
              },
            ),
            const SizedBox(height: 20),
            LuxButton(
              label: l.hotelMatchmakerRun,
              icon: Icons.auto_awesome_rounded,
              onPressed: _runMatchmaker,
            ),
            if (_results != null) ...[
              const SizedBox(height: 28),
              Text(
                l.hotelMatchResultsTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: LuxColors.cream,
                ),
              ),
              const SizedBox(height: 12),
              for (final result in _results!)
                _MatchResultCard(
                  result: result,
                  onTap: () {
                    final place =
                        HotelIntelligenceService.placeFor(result.hotel);
                    if (place == null) return;
                    showHotelDetailSheet(
                      context,
                      hotel: result.hotel,
                      place: place,
                      matchInput: _lastInput,
                    );
                  },
                ),
            ],
          ],
        ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
          color: LuxColors.gold.withValues(alpha: 0.85),
        ),
      ),
    );
  }
}

class _StepperRow extends StatelessWidget {
  const _StepperRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: const TextStyle(fontSize: 12)),
          ),
          IconButton(
            onPressed: value > 0 ? () => onChanged(value - 1) : null,
            icon: const Icon(Icons.remove_circle_outline),
          ),
          Text('$value', style: const TextStyle(fontWeight: FontWeight.w700)),
          IconButton(
            onPressed: () => onChanged(value + 1),
            icon: const Icon(Icons.add_circle_outline),
          ),
        ],
      ),
    );
  }
}

class _AttractionChip extends StatelessWidget {
  const _AttractionChip({
    required this.label,
    required this.tag,
    required this.selected,
    required this.onTap,
    this.compact = false,
  });

  final String label;
  final String tag;
  final bool selected;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label, style: TextStyle(fontSize: compact ? 12 : null)),
      visualDensity: compact ? VisualDensity.compact : VisualDensity.standard,
      selected: selected,
      onSelected: (_) => onTap(),
    );
  }
}

class _MatchResultCard extends StatelessWidget {
  const _MatchResultCard({required this.result, required this.onTap});

  final HotelMatchResult result;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final place = HotelIntelligenceService.placeFor(result.hotel);
    if (place == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HotelCard(
          hotel: result.hotel,
          place: place,
          onTap: onTap,
        ),
        GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l.hotelMatchWhyTitle(result.matchScore),
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                  color: LuxColors.gold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                result.whyMatch,
                style: const TextStyle(
                  fontSize: 12,
                  height: 1.45,
                  color: LuxColors.cream,
                ),
              ),
              const SizedBox(height: 10),
              _Bullet(l.hotelMatchBestForLabel, result.bestForTraveler),
              _Bullet(l.hotelMatchItineraryLabel, result.itineraryImpact),
              _Bullet(l.hotelMatchTradeoffsLabel, result.tradeoffs),
              if (result.nearbyHighlights.isNotEmpty) ...[
                const SizedBox(height: 6),
                Text(
                  l.hotelMatchNearbyLabel,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: LuxColors.stone400,
                  ),
                ),
                Text(
                  result.nearbyHighlights.join(' · '),
                  style: const TextStyle(
                    fontSize: 11,
                    color: LuxColors.stone400,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _Bullet extends StatelessWidget {
  const _Bullet(this.label, this.body);

  final String label;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 11, color: LuxColors.stone400),
          children: [
            TextSpan(
              text: '$label ',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: LuxColors.cream,
              ),
            ),
            TextSpan(text: body),
          ],
        ),
      ),
    );
  }
}
