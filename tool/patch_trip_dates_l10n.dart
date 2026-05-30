// ignore_for_file: avoid_print
//
// Trip date picker strings for all locale ARBs.
// Run: dart run tool/patch_trip_dates_l10n.dart

import 'dart:convert';
import 'dart:io';

void main() {
  const locales = ['de', 'es', 'fr', 'it', 'pt', 'ru', 'hi', 'tr', 'ja', 'ko', 'zh'];
  final keys = _keys();
  for (final locale in locales) {
    final path = 'lib/l10n/app_$locale.arb';
    final map =
        jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;
    map.addAll(keys[locale]!);
    File(path).writeAsStringSync(
      '${const JsonEncoder.withIndent('  ').convert(map)}\n',
    );
    print('Patched $path');
  }
}

Map<String, Map<String, dynamic>> _keys() => {
      'de': {
        'onboardStartDateLabel': 'Startdatum',
        'onboardEndDateLabel': 'Enddatum',
        'onboardPickDate': 'Tippen zum Auswählen',
        'onboardSelectStartDate': 'Startdatum wählen',
        'onboardSelectEndDate': 'Enddatum wählen',
        'onboardDatesHint':
            'Sie können die Daten jederzeit unter Reisen ändern.',
        'onboardStepBudgetTitle': 'Entspannt planen',
        'onboardStepBudgetSubtitle': 'Was fühlt sich für diese Reise richtig an?',
        'tripsEditDates': 'Reisedaten',
        'tripsSaveDates': 'Daten speichern',
        'tripsDatesUpdated': 'Reisedaten aktualisiert',
        'tripsDatesFlexible': 'Flexible Daten',
      },
      'es': {
        'onboardStartDateLabel': 'Fecha de inicio',
        'onboardEndDateLabel': 'Fecha de fin',
        'onboardPickDate': 'Toca para elegir',
        'onboardSelectStartDate': 'Elegir fecha de inicio',
        'onboardSelectEndDate': 'Elegir fecha de fin',
        'onboardDatesHint':
            'Puedes cambiarlas cuando quieras en la pestaña Viajes.',
        'onboardStepBudgetTitle': 'Planifica con calma',
        'onboardStepBudgetSubtitle': '¿Qué encaja con esta escapada?',
        'tripsEditDates': 'Fechas del viaje',
        'tripsSaveDates': 'Guardar fechas',
        'tripsDatesUpdated': 'Fechas actualizadas',
        'tripsDatesFlexible': 'Fechas flexibles',
      },
      'fr': {
        'onboardStartDateLabel': 'Date de départ',
        'onboardEndDateLabel': 'Date de retour',
        'onboardPickDate': 'Appuyer pour choisir',
        'onboardSelectStartDate': 'Choisir la date de départ',
        'onboardSelectEndDate': 'Choisir la date de retour',
        'onboardDatesHint':
            'Modifiable à tout moment dans l’onglet Voyages.',
        'onboardStepBudgetTitle': 'Planifier sereinement',
        'onboardStepBudgetSubtitle': 'Quel budget pour cette escapade ?',
        'tripsEditDates': 'Dates du voyage',
        'tripsSaveDates': 'Enregistrer les dates',
        'tripsDatesUpdated': 'Dates mises à jour',
        'tripsDatesFlexible': 'Dates flexibles',
      },
      'it': {
        'onboardStartDateLabel': 'Data di inizio',
        'onboardEndDateLabel': 'Data di fine',
        'onboardPickDate': 'Tocca per scegliere',
        'onboardSelectStartDate': 'Scegli data di inizio',
        'onboardSelectEndDate': 'Scegli data di fine',
        'onboardDatesHint':
            'Puoi modificarle in qualsiasi momento nella scheda Viaggi.',
        'onboardStepBudgetTitle': 'Pianifica con calma',
        'onboardStepBudgetSubtitle': 'Quale budget per questa fuga?',
        'tripsEditDates': 'Date del viaggio',
        'tripsSaveDates': 'Salva date',
        'tripsDatesUpdated': 'Date aggiornate',
        'tripsDatesFlexible': 'Date flessibili',
      },
      'pt': {
        'onboardStartDateLabel': 'Data de início',
        'onboardEndDateLabel': 'Data de fim',
        'onboardPickDate': 'Toque para escolher',
        'onboardSelectStartDate': 'Escolher data de início',
        'onboardSelectEndDate': 'Escolher data de fim',
        'onboardDatesHint':
            'Você pode alterar a qualquer momento na aba Viagens.',
        'onboardStepBudgetTitle': 'Planeje com calma',
        'onboardStepBudgetSubtitle': 'O que faz sentido para esta viagem?',
        'tripsEditDates': 'Datas da viagem',
        'tripsSaveDates': 'Salvar datas',
        'tripsDatesUpdated': 'Datas atualizadas',
        'tripsDatesFlexible': 'Datas flexíveis',
      },
      'ru': {
        'onboardStartDateLabel': 'Дата начала',
        'onboardEndDateLabel': 'Дата окончания',
        'onboardPickDate': 'Нажмите, чтобы выбрать',
        'onboardSelectStartDate': 'Выберите дату начала',
        'onboardSelectEndDate': 'Выберите дату окончания',
        'onboardDatesHint':
            'Их можно изменить в любой момент на вкладке «Поездки».',
        'onboardStepBudgetTitle': 'Планируйте спокойно',
        'onboardStepBudgetSubtitle': 'Какой бюджет для этой поездки?',
        'tripsEditDates': 'Даты поездки',
        'tripsSaveDates': 'Сохранить даты',
        'tripsDatesUpdated': 'Даты обновлены',
        'tripsDatesFlexible': 'Гибкие даты',
      },
      'hi': {
        'onboardStartDateLabel': 'शुरुआत की तारीख',
        'onboardEndDateLabel': 'अंत की तारीख',
        'onboardPickDate': 'चुनने के लिए टैप करें',
        'onboardSelectStartDate': 'शुरुआत की तारीख चुनें',
        'onboardSelectEndDate': 'अंत की तारीख चुनें',
        'onboardDatesHint':
            'आप इन्हें कभी भी यात्राएँ टैब से बदल सकते हैं।',
        'onboardStepBudgetTitle': 'आराम से योजना बनाएँ',
        'onboardStepBudgetSubtitle': 'इस यात्रा के लिए क्या सही लगता है?',
        'tripsEditDates': 'यात्रा की तारीखें',
        'tripsSaveDates': 'तारीखें सहेजें',
        'tripsDatesUpdated': 'तारीखें अपडेट हो गईं',
        'tripsDatesFlexible': 'लचीली तारीखें',
      },
      'tr': {
        'onboardStartDateLabel': 'Başlangıç tarihi',
        'onboardEndDateLabel': 'Bitiş tarihi',
        'onboardPickDate': 'Seçmek için dokunun',
        'onboardSelectStartDate': 'Başlangıç tarihi seçin',
        'onboardSelectEndDate': 'Bitiş tarihi seçin',
        'onboardDatesHint':
            'Geziler sekmesinden istediğiniz zaman değiştirebilirsiniz.',
        'onboardStepBudgetTitle': 'Rahat planlayın',
        'onboardStepBudgetSubtitle': 'Bu kaçamak için ne uygun?',
        'tripsEditDates': 'Gezi tarihleri',
        'tripsSaveDates': 'Tarihleri kaydet',
        'tripsDatesUpdated': 'Tarihler güncellendi',
        'tripsDatesFlexible': 'Esnek tarihler',
      },
      'ja': {
        'onboardStartDateLabel': '開始日',
        'onboardEndDateLabel': '終了日',
        'onboardPickDate': 'タップして選択',
        'onboardSelectStartDate': '開始日を選択',
        'onboardSelectEndDate': '終了日を選択',
        'onboardDatesHint': '旅行タブからいつでも変更できます。',
        'onboardStepBudgetTitle': '無理のない計画',
        'onboardStepBudgetSubtitle': 'この旅に合う予算は？',
        'tripsEditDates': '旅行の日程',
        'tripsSaveDates': '日程を保存',
        'tripsDatesUpdated': '日程を更新しました',
        'tripsDatesFlexible': '日程は未定',
      },
      'ko': {
        'onboardStartDateLabel': '출발일',
        'onboardEndDateLabel': '귀국일',
        'onboardPickDate': '탭하여 선택',
        'onboardSelectStartDate': '출발일 선택',
        'onboardSelectEndDate': '귀국일 선택',
        'onboardDatesHint': '여행 탭에서 언제든 변경할 수 있습니다.',
        'onboardStepBudgetTitle': '편안하게 계획',
        'onboardStepBudgetSubtitle': '이 여행에 맞는 예산은?',
        'tripsEditDates': '여행 날짜',
        'tripsSaveDates': '날짜 저장',
        'tripsDatesUpdated': '날짜가 업데이트되었습니다',
        'tripsDatesFlexible': '날짜 미정',
      },
      'zh': {
        'onboardStartDateLabel': '开始日期',
        'onboardEndDateLabel': '结束日期',
        'onboardPickDate': '点击选择',
        'onboardSelectStartDate': '选择开始日期',
        'onboardSelectEndDate': '选择结束日期',
        'onboardDatesHint': '可随时在「行程」标签页中修改。',
        'onboardStepBudgetTitle': '轻松规划',
        'onboardStepBudgetSubtitle': '这次旅行适合的预算是？',
        'tripsEditDates': '行程日期',
        'tripsSaveDates': '保存日期',
        'tripsDatesUpdated': '日期已更新',
        'tripsDatesFlexible': '日期待定',
      },
    };
