/// A titled block inside a branded Luxora share card.
class LuxoraShareSection {
  const LuxoraShareSection({
    this.heading,
    this.body,
    this.lines = const [],
  });

  final String? heading;
  final String? body;
  final List<String> lines;
}
