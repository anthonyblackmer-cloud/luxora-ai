/// How far guests are willing to travel from the Orlando hub.
enum DiscoverRadius {
  miles25(25, '25 mi'),
  miles50(50, '50 mi'),
  miles100(100, '100 mi'),
  allFlorida(0, 'All Florida');

  const DiscoverRadius(this.miles, this.shortLabel);

  final int miles;
  final String shortLabel;

  bool get isUnlimited => miles <= 0;

  String get description => switch (this) {
        DiscoverRadius.miles25 => 'Day trips around Orlando core',
        DiscoverRadius.miles50 => 'Springs, coast day trips, Space Coast',
        DiscoverRadius.miles100 => 'Tampa Bay, Daytona, deeper Gulf',
        DiscoverRadius.allFlorida => 'Keys, Miami, statewide highlights',
      };

  static DiscoverRadius fromStored(String? raw) {
    if (raw == null || raw.isEmpty) {
      return DiscoverRadius.miles50;
    }
    return DiscoverRadius.values.firstWhere(
      (r) => r.name == raw,
      orElse: () => DiscoverRadius.miles50,
    );
  }
}
