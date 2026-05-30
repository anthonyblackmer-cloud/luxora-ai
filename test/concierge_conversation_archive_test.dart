import 'package:flutter_test/flutter_test.dart';
import 'package:luxora_ai/models/concierge/concierge_trip_context.dart';
import 'package:luxora_ai/services/concierge_conversation_archive.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('archiveThread persists and reloads', () async {
    final archive = ConciergeConversationArchive.instance;
    await archive.archiveThread(
      messages: [
        (user: true, text: 'Plan a luxury day'),
        (user: false, text: 'Sounds wonderful.'),
      ],
      apiHistory: const [
        ConciergeChatMessage(role: 'user', content: 'Plan a luxury day'),
        ConciergeChatMessage(role: 'assistant', content: 'Sounds wonderful.'),
      ],
      summary: 'Stop A → Stop B',
    );

    final loaded = await archive.loadArchived();
    expect(loaded.length, 1);
    expect(loaded.first.summary, 'Stop A → Stop B');
    expect(loaded.first.messages.length, 2);
    expect(loaded.first.apiHistory.length, 2);
  });
}
