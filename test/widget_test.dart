import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/main.dart';

void main() {
  testWidgets('Luxora app launches', (tester) async {
    await tester.pumpWidget(const LuxoraApp());
    expect(find.textContaining('vacation'), findsWidgets);
  });
}
