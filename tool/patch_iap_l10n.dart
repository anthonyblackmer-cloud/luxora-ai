// ignore_for_file: avoid_print
// Run: dart run tool/patch_iap_l10n.dart && flutter gen-l10n

import 'dart:convert';
import 'dart:io';

void main() {
  const locales = ['de', 'es', 'fr', 'it', 'pt', 'ru', 'hi', 'tr', 'ja', 'ko', 'zh'];
  final keys = _keys();
  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map = jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map.addAll(keys[locale]!);
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}

Map<String, Map<String, dynamic>> _keys() => {
      'de': _de(),
      'es': _es(),
      'fr': _fr(),
      'it': _it(),
      'pt': _pt(),
      'ru': _ru(),
      'hi': _hi(),
      'tr': _tr(),
      'ja': _ja(),
      'ko': _ko(),
      'zh': _zh(),
    };

Map<String, dynamic> _bundle({
  required String restore,
  required String success,
  required String pending,
  required String failed,
  required String canceled,
  required String restoreOk,
  required String restoreNone,
  required String storeUnavailable,
  required String productUnavailable,
}) =>
    {
      'paywallRestorePurchases': restore,
      'paywallPurchaseSuccess': success,
      'paywallPurchasePending': pending,
      'paywallPurchaseFailed': failed,
      'paywallPurchaseCanceled': canceled,
      'paywallRestoreComplete': restoreOk,
      'paywallRestoreNone': restoreNone,
      'paywallStoreUnavailable': storeUnavailable,
      'paywallProductUnavailable': productUnavailable,
    };

Map<String, dynamic> _de() => _bundle(
      restore: 'Käufe wiederherstellen',
      success: 'Kauf abgeschlossen — Ihr Concierge ist freigeschaltet.',
      pending: 'Kauf wird abgeschlossen…',
      failed: 'Kauf fehlgeschlagen. Erneut versuchen oder Käufe wiederherstellen.',
      canceled: 'Kauf abgebrochen.',
      restoreOk: 'Käufe wiederhergestellt.',
      restoreNone: 'Keine früheren Käufe für diese Apple-ID oder dieses Google-Konto.',
      storeUnavailable: 'App-Store-Abrechnung auf diesem Gerät nicht verfügbar.',
      productUnavailable: 'Dieses Paket ist im Store noch nicht verfügbar.',
    );

Map<String, dynamic> _es() => _bundle(
      restore: 'Restaurar compras',
      success: 'Compra completada — su conserje está desbloqueado.',
      pending: 'Completando compra…',
      failed: 'No se pudo completar la compra. Inténtelo de nuevo o restaure compras.',
      canceled: 'Compra cancelada.',
      restoreOk: 'Compras restauradas.',
      restoreNone: 'No se encontraron compras anteriores para esta cuenta.',
      storeUnavailable: 'La facturación de la tienda no está disponible en este dispositivo.',
      productUnavailable: 'Este pack aún no está disponible en la tienda.',
    );

Map<String, dynamic> _fr() => _bundle(
      restore: 'Restaurer les achats',
      success: 'Achat terminé — votre concierge est débloqué.',
      pending: 'Finalisation de l’achat…',
      failed: 'Achat impossible. Réessayez ou restaurez les achats.',
      canceled: 'Achat annulé.',
      restoreOk: 'Achats restaurés.',
      restoreNone: 'Aucun achat précédent pour ce compte Apple ou Google.',
      storeUnavailable: 'La facturation App Store n’est pas disponible sur cet appareil.',
      productUnavailable: 'Ce pack n’est pas encore disponible dans le store.',
    );

Map<String, dynamic> _it() => _bundle(
      restore: 'Ripristina acquisti',
      success: 'Acquisto completato — il concierge è sbloccato.',
      pending: 'Completamento acquisto…',
      failed: 'Acquisto non riuscito. Riprova o ripristina gli acquisti.',
      canceled: 'Acquisto annullato.',
      restoreOk: 'Acquisti ripristinati.',
      restoreNone: 'Nessun acquisto precedente per questo account.',
      storeUnavailable: 'Fatturazione store non disponibile su questo dispositivo.',
      productUnavailable: 'Questo pacchetto non è ancora disponibile nello store.',
    );

Map<String, dynamic> _pt() => _bundle(
      restore: 'Restaurar compras',
      success: 'Compra concluída — seu concierge está desbloqueado.',
      pending: 'Concluindo compra…',
      failed: 'Não foi possível concluir a compra. Tente novamente ou restaure compras.',
      canceled: 'Compra cancelada.',
      restoreOk: 'Compras restauradas.',
      restoreNone: 'Nenhuma compra anterior para esta conta.',
      storeUnavailable: 'Cobrança da loja indisponível neste dispositivo.',
      productUnavailable: 'Este pacote ainda não está disponível na loja.',
    );

Map<String, dynamic> _ru() => _bundle(
      restore: 'Восстановить покупки',
      success: 'Покупка завершена — консьерж разблокирован.',
      pending: 'Завершение покупки…',
      failed: 'Не удалось завершить покупку. Повторите или восстановите покупки.',
      canceled: 'Покупка отменена.',
      restoreOk: 'Покупки восстановлены.',
      restoreNone: 'Предыдущие покупки для этой учётной записи не найдены.',
      storeUnavailable: 'Оплата через магазин недоступна на этом устройстве.',
      productUnavailable: 'Этот пакет пока недоступен в магазине.',
    );

Map<String, dynamic> _hi() => _bundle(
      restore: 'खरीदारी पुनर्स्थापित करें',
      success: 'खरीद पूर्ण — आपका concierge अनलॉक हो गया।',
      pending: 'खरीद पूरी हो रही है…',
      failed: 'खरीद पूरी नहीं हो सकी। फिर कोशिश करें या restore करें।',
      canceled: 'खरीद रद्द।',
      restoreOk: 'खरीदारी पुनर्स्थापित।',
      restoreNone: 'इस Apple/Google खाते के लिए कोई पिछली खरीद नहीं मिली।',
      storeUnavailable: 'इस डिवाइस पर स्टोर बिलिंग उपलब्ध नहीं।',
      productUnavailable: 'यह पैक अभी स्टोर में उपलब्ध नहीं है।',
    );

Map<String, dynamic> _tr() => _bundle(
      restore: 'Satın alımları geri yükle',
      success: 'Satın alma tamamlandı — concierge kilidi açıldı.',
      pending: 'Satın alma tamamlanıyor…',
      failed: 'Satın alma tamamlanamadı. Tekrar deneyin veya geri yükleyin.',
      canceled: 'Satın alma iptal edildi.',
      restoreOk: 'Satın alımlar geri yüklendi.',
      restoreNone: 'Bu Apple veya Google hesabı için önceki satın alım bulunamadı.',
      storeUnavailable: 'Bu cihazda mağaza faturalandırması kullanılamıyor.',
      productUnavailable: 'Bu paket mağazada henüz mevcut değil.',
    );

Map<String, dynamic> _ja() => _bundle(
      restore: '購入を復元',
      success: '購入完了 — コンシェルジュがアンロックされました。',
      pending: '購入を完了しています…',
      failed: '購入を完了できませんでした。再試行するか復元してください。',
      canceled: '購入がキャンセルされました。',
      restoreOk: '購入を復元しました。',
      restoreNone: 'このApple/Googleアカウントの以前の購入は見つかりませんでした。',
      storeUnavailable: 'このデバイスではストア課金を利用できません。',
      productUnavailable: 'このパックはストアでまだ利用できません。',
    );

Map<String, dynamic> _ko() => _bundle(
      restore: '구매 복원',
      success: '구매 완료 — 컨시어지가 잠금 해제되었습니다.',
      pending: '구매 완료 중…',
      failed: '구매를 완료하지 못했습니다. 다시 시도하거나 복원하세요.',
      canceled: '구매가 취소되었습니다.',
      restoreOk: '구매가 복원되었습니다.',
      restoreNone: '이 Apple/Google 계정의 이전 구매를 찾을 수 없습니다.',
      storeUnavailable: '이 기기에서는 스토어 결제를 사용할 수 없습니다.',
      productUnavailable: '이 팩은 아직 스토어에서 이용할 수 없습니다.',
    );

Map<String, dynamic> _zh() => _bundle(
      restore: '恢复购买',
      success: '购买完成 — 礼宾已解锁。',
      pending: '正在完成购买…',
      failed: '无法完成购买。请重试或恢复购买。',
      canceled: '购买已取消。',
      restoreOk: '购买已恢复。',
      restoreNone: '未找到此 Apple/Google 账户的先前购买。',
      storeUnavailable: '此设备无法使用商店计费。',
      productUnavailable: '该套餐尚未在商店上架。',
    );
