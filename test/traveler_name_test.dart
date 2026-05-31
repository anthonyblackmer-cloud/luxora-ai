import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/util/traveler_name.dart';

void main() {
  test('firstName extracts first token', () {
    expect(TravelerNameDisplay.firstName('Maria Lopez'), 'Maria');
    expect(TravelerNameDisplay.firstName('  Tony  '), 'Tony');
    expect(TravelerNameDisplay.firstName(''), isNull);
    expect(TravelerNameDisplay.firstName(null), isNull);
  });
}
