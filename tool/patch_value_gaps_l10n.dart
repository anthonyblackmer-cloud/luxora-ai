// ignore_for_file: avoid_print
// Run: dart run tool/patch_value_gaps_l10n.dart && flutter gen-l10n

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

Map<String, dynamic> _enLike({
  required String localTry,
  required String localPlan,
  required String localNoIntent,
  required String intelBadge,
  required String intelAgenda,
  required String fixRain,
  required String rerouteDone,
  required String rerouteNone,
  required String scoreAfterRain,
}) =>
    {
      'conciergeLocalTryPlanning': localTry,
      'conciergeLocalPlanBuilt': localPlan,
      'conciergeLocalNoIntent': localNoIntent,
      'ticketConciergeIntelBadge': intelBadge,
      'ticketConciergeIntelAgenda': intelAgenda,
      'agendaFixAfternoonRain': fixRain,
      'agendaRainRerouteDone': rerouteDone,
      'agendaRainRerouteNone': rerouteNone,
      'agendaRainScoreNote': scoreAfterRain,
    };

Map<String, dynamic> _de() => _enLike(
      localTry:
          'Sagen Sie mir, wie sich die Reise anfühlen soll — z. B. „Plane einen entspannten 2-Tage-Orlando-Trip mit Quellen und Essen.“ Ich erstelle eine echte Agenda auf dem Gerät.',
      localPlan:
          'Ich habe Ihren {city}-Tag erstellt — {count} Stopps nach Stimmung und Fahrzeit. Öffnen Sie **Agenda** oder **Karte** für Ihre Route.',
      localNoIntent:
          'Beschreiben Sie Ihre Reisestimmung oder sagen Sie „Plane meinen Tag in Orlando“ — ich baue eine echte Route auf dem Gerät.',
      intelBadge: 'Concierge-Intel',
      intelAgenda: 'Abgestimmt auf Ihre Agenda — keine generische Gutscheinliste.',
      fixRain: 'Regen kommt — Nachmittag anpassen',
      rerouteDone: 'Nachmittag aktualisiert — {count} Stopps nach drinnen verlegt.',
      rerouteNone: 'Ihr Plan passt bereits zu diesem Wetter.',
      scoreAfterRain: 'Urlaubs-Score jetzt {score}/100',
    );

Map<String, dynamic> _es() => _enLike(
      localTry:
          'Dígame cómo quiere sentir el viaje — p. ej. «Planifica 2 días relajados en Orlando con manantiales y comida». Crearé una agenda real en el dispositivo.',
      localPlan:
          'Creé su día en {city} — {count} paradas por ambiente y conducción. Abra **Agenda** o **Mapa** para ver la ruta.',
      localNoIntent:
          'Describa el ambiente del viaje o diga «Planifica mi día en Orlando» — construiré una ruta real en el dispositivo.',
      intelBadge: 'Intel de conserjería',
      intelAgenda: 'Ajustado a su agenda — no es una lista genérica de cupones.',
      fixRain: 'Lloverá — arreglar mi tarde',
      rerouteDone: 'Tarde actualizada — {count} paradas movidas bajo techo.',
      rerouteNone: 'Su plan ya encaja con este clima.',
      scoreAfterRain: 'Puntuación de vacaciones ahora {score}/100',
    );

Map<String, dynamic> _fr() => _enLike(
      localTry:
          'Dites-moi ce que vous voulez ressentir — ex. « Planifie 2 jours détente à Orlando avec sources et food ». Je crée une vraie agenda sur l’appareil.',
      localPlan:
          'J’ai créé votre journée à {city} — {count} arrêts selon l’ambiance et la route. Ouvrez **Agenda** ou **Carte**.',
      localNoIntent:
          'Décrivez l’ambiance ou dites « Planifie ma journée à Orlando » — je construis un vrai parcours sur l’appareil.',
      intelBadge: 'Intel concierge',
      intelAgenda: 'Aligné sur votre agenda — pas une liste de coupons générique.',
      fixRain: 'Pluie en vue — réorganiser l’après-midi',
      rerouteDone: 'Après-midi mis à jour — {count} arrêts déplacés à l’intérieur.',
      rerouteNone: 'Votre plan convient déjà à ce temps.',
      scoreAfterRain: 'Score vacances maintenant {score}/100',
    );

Map<String, dynamic> _it() => _enLike(
      localTry:
          'Dimmi che sensazione vuoi dal viaggio — es. «Pianifica 2 giorni rilassati a Orlando con sorgenti e cibo». Creo un’agenda reale sul dispositivo.',
      localPlan:
          'Ho creato la tua giornata a {city} — {count} tappe per mood e guida. Apri **Agenda** o **Mappa**.',
      localNoIntent:
          'Descrivi l’atmosfera o di’ «Pianifica la mia giornata a Orlando» — costruisco un percorso reale sul dispositivo.',
      intelBadge: 'Intel concierge',
      intelAgenda: 'Allineato alla tua agenda — non coupon generici.',
      fixRain: 'Pioggia in arrivo — sistema il pomeriggio',
      rerouteDone: 'Pomeriggio aggiornato — {count} tappe spostate al coperto.',
      rerouteNone: 'Il piano funziona già con questo meteo.',
      scoreAfterRain: 'Punteggio vacanza ora {score}/100',
    );

Map<String, dynamic> _pt() => _enLike(
      localTry:
          'Diga como quer sentir a viagem — ex. «Planeje 2 dias relax em Orlando com nascentes e comida». Crio uma agenda real no dispositivo.',
      localPlan:
          'Criei seu dia em {city} — {count} paradas por clima e condução. Abra **Agenda** ou **Mapa**.',
      localNoIntent:
          'Descreva o clima da viagem ou diga «Planeje meu dia em Orlando» — monto uma rota real no dispositivo.',
      intelBadge: 'Intel do concierge',
      intelAgenda: 'Alinhado à sua agenda — não cupons genéricos.',
      fixRain: 'Chuva chegando — ajustar minha tarde',
      rerouteDone: 'Tarde atualizada — {count} paradas movidas para ambientes fechados.',
      rerouteNone: 'Seu plano já combina com este clima.',
      scoreAfterRain: 'Pontuação de férias agora {score}/100',
    );

Map<String, dynamic> _ru() => _enLike(
      localTry:
          'Опишите, каким должен быть поезд — напр. «Спланируй 2 спокойных дня в Орландо с источниками и едой». Я построю реальную agenda на устройстве.',
      localPlan:
          'Я собрал ваш день в {city} — {count} остановок по настроению и дороге. Откройте **Agenda** или **Карту**.',
      localNoIntent:
          'Опишите настроение или скажите «Спланируй мой день в Орlando» — построю маршрут на устройстве.',
      intelBadge: 'Intel консьержа',
      intelAgenda: 'Под вашу agenda — не общий список купонов.',
      fixRain: 'Дождь — перестроить вторую половину дня',
      rerouteDone: 'День обновлён — {count} остановок перенесены в помещение.',
      rerouteNone: 'План уже подходит под эту погоду.',
      scoreAfterRain: 'Оценка отдыха сейчас {score}/100',
    );

Map<String, dynamic> _hi() => _enLike(
      localTry:
          'बताएं यात्रा कैसी महसूस होनी चाहिए — जैसे «Orlando में 2 आरामदायक दिन springs और food के साथ plan करो»। मैं डिवाइस पर असली agenda बनाऊंगा।',
      localPlan:
          'मैंने {city} का आपका दिन बनाया — mood और drive के हिसाब से {count} स्टॉप। **Agenda** या **Map** खोलें।',
      localNoIntent:
          'मूड बताएं या कहें «Plan my Orlando day» — मैं डिवाइस पर असली रूट बनाऊंगा।',
      intelBadge: 'Concierge intel',
      intelAgenda: 'आपकी agenda से मेल — generic coupons नहीं।',
      fixRain: 'बारिश आ रही है — दोपहर ठीक करें',
      rerouteDone: 'दोपहर अपडेट — {count} स्टॉप indoor ले गए।',
      rerouteNone: 'आपका plan पहले से इस मौसम के लिए ठीक है।',
      scoreAfterRain: 'Vacation score अब {score}/100',
    );

Map<String, dynamic> _tr() => _enLike(
      localTry:
          'Seyahatin nasıl hissettirmesini istediğinizi söyleyin — örn. «Orlando’da 2 rahat gün, kaynaklar ve yemek planla». Cihazda gerçek bir agenda oluştururum.',
      localPlan:
          '{city} gününüzü oluşturdum — ruh hali ve sürüşe göre {count} durak. **Agenda** veya **Harita**yı açın.',
      localNoIntent:
          'Ruh halini anlatın veya «Orlando günümü planla» deyin — cihazda gerçek rota kurarım.',
      intelBadge: 'Concierge intel',
      intelAgenda: 'Agendanıza uygun — genel kupon listesi değil.',
      fixRain: 'Yağmur geliyor — öğleden sonrayı düzelt',
      rerouteDone: 'Öğleden sonra güncellendi — {count} durak iç mekâna alındı.',
      rerouteNone: 'Planınız bu hava için zaten uygun.',
      scoreAfterRain: 'Tatil skoru şimdi {score}/100',
    );

Map<String, dynamic> _ja() => _enLike(
      localTry:
          '旅の雰囲気を教えてください — 例:「オーランドで2日、泉と食を楽しむプラン」。端末上で本当のagendaを作ります。',
      localPlan:
          '{city}の1日を作成 — ムードとドライブで{count} stops。**Agenda**または**Map**を開いてください。',
      localNoIntent:
          '雰囲気を伝えるか「Plan my Orlando day」と言ってください — 端末で本当のルートを作ります。',
      intelBadge: 'Concierge intel',
      intelAgenda: 'あなたのagendaに合わせた情報 — 一般的なクーポンではありません。',
      fixRain: '雨が来ます — 午後を調整',
      rerouteDone: '午後を更新 — {count} stopsを屋内へ。',
      rerouteNone: 'この天気にプランはすでに適しています。',
      scoreAfterRain: 'Vacation score {score}/100',
    );

Map<String, dynamic> _ko() => _enLike(
      localTry:
          '원하는 여행 분위기를 알려주세요 — 예: «올랜도에서 2일 휴식, springs와 맛집». 기기에서 실제 agenda를 만듭니다.',
      localPlan:
          '{city} 하루를 만들었습니다 — mood와 drive 기준 {count} stops. **Agenda** 또는 **Map**을 여세요.',
      localNoIntent:
          '분위기를 설명하거나 «Plan my Orlando day»라고 하세요 — 기기에서 실제 경로를 만듭니다.',
      intelBadge: 'Concierge intel',
      intelAgenda: 'agenda에 맞춘 정보 — 일반 쿠폰 목록이 아닙니다.',
      fixRain: '비 예보 — 오후 일정 조정',
      rerouteDone: '오후 업데이트 — {count} stops 실내로 이동.',
      rerouteNone: '이 날씨에 이미 맞는 일정입니다.',
      scoreAfterRain: 'Vacation score {score}/100',
    );

Map<String, dynamic> _zh() => _enLike(
      localTry:
          '告诉我您想要的旅行感觉 — 例如「在奥兰多规划2天放松行程，含泉水和美食」。我会在设备上生成真实 agenda。',
      localPlan:
          '已为您规划{city}的一天 — 按心情与车程安排{count}站。打开**Agenda**或**Map**查看路线。',
      localNoIntent:
          '描述旅行氛围，或说「Plan my Orlando day」— 我会在设备上构建真实路线。',
      intelBadge: 'Concierge intel',
      intelAgenda: '匹配您的 agenda — 不是普通优惠券列表。',
      fixRain: '即将下雨 — 调整下午行程',
      rerouteDone: '下午已更新 — {count} 站改为室内。',
      rerouteNone: '您的计划已适合当前天气。',
      scoreAfterRain: '度假评分 {score}/100',
    );
