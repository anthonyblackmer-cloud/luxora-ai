// ignore_for_file: avoid_print
//
// Adds hotel link snackbar l10n keys to all locale ARBs.
// Run: dart run tool/patch_hotel_link_l10n.dart

import 'dart:convert';
import 'dart:io';

void main() {
  const locales = {
    'de': (
      unavailable: 'Buchungslink für diesen Aufenthalt noch nicht verfügbar.',
      failed: 'Link konnte nicht geöffnet werden — versuche es im Browser erneut.',
    ),
    'es': (
      unavailable: 'Enlace de reserva no disponible para esta estancia.',
      failed: 'No se pudo abrir el enlace — inténtalo de nuevo en el navegador.',
    ),
    'fr': (
      unavailable: 'Lien de réservation indisponible pour ce séjour.',
      failed: 'Impossible d\'ouvrir le lien — réessayez dans votre navigateur.',
    ),
    'it': (
      unavailable: 'Link di prenotazione non disponibile per questo soggiorno.',
      failed: 'Impossibile aprire il link — riprova nel browser.',
    ),
    'pt': (
      unavailable: 'Link de reserva indisponível para esta estadia.',
      failed: 'Não foi possível abrir o link — tente novamente no navegador.',
    ),
    'ru': (
      unavailable: 'Ссылка на бронирование для этого отеля пока недоступна.',
      failed: 'Не удалось открыть ссылку — попробуйте снова в браузере.',
    ),
    'hi': (
      unavailable: 'इस प्रवास के लिए बुकिंग लिंक उपलब्ध नहीं है।',
      failed: 'लिंक नहीं खुल सका — ब्राउज़र में फिर से कोशिश करें।',
    ),
    'tr': (
      unavailable: 'Bu konaklama için rezervasyon bağlantısı henüz yok.',
      failed: 'Bağlantı açılamadı — tarayıcıda tekrar deneyin.',
    ),
    'ja': (
      unavailable: 'この宿泊の予約リンクはまだ利用できません。',
      failed: 'リンクを開けませんでした — ブラウザでもう一度お試しください。',
    ),
    'ko': (
      unavailable: '이 숙소의 예약 링크를 아직 사용할 수 없습니다.',
      failed: '링크를 열 수 없습니다 — 브라우저에서 다시 시도하세요.',
    ),
    'zh': (
      unavailable: '此住宿的预订链接尚不可用。',
      failed: '无法打开链接 — 请在浏览器中重试。',
    ),
  };

  for (final entry in locales.entries) {
    final path = 'lib/l10n/app_${entry.key}.arb';
    final map =
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map['hotelLinkUnavailable'] = entry.value.unavailable;
    map['hotelLinkOpenFailed'] = entry.value.failed;
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}
