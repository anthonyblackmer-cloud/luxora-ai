// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => 'Настройки';

  @override
  String get appearance => 'Появление';

  @override
  String get settingsThemeIntro =>
      'Кинематографичная роскошь или чистая читаемость — выберите то, что подходит вашему дню.';

  @override
  String get settingsThemeSectionLuxury => 'Кинематографичная роскошь';

  @override
  String get settingsThemeSectionReadable => 'Чисто и читаемо';

  @override
  String get dark_mode => 'Темный режим';

  @override
  String get light_mode => 'Светлый режим';

  @override
  String get language => 'Язык';

  @override
  String get settings_language_picker_note =>
      'Изменения вступают в силу немедленно.';

  @override
  String get settings_regions_coming_title => 'Страны и города';

  @override
  String get settings_regions_coming_subtitle =>
      'Домашний хаб и городские пакеты — скоро.';

  @override
  String get commonSoon => 'Скоро';

  @override
  String get commonContinue => 'Продолжать';

  @override
  String get commonNew => 'Новый';

  @override
  String get commonRoadmap => 'Дорожная карта';

  @override
  String get commonLive => 'Жить';

  @override
  String get commonClose => 'Закрывать';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get settingsStartOverSubtitle => 'Начните новое путешествие с нуля';

  @override
  String get navConcierge => 'Консьерж';

  @override
  String get navDiscover => 'Обнаружить';

  @override
  String get navMap => 'Карта';

  @override
  String get navTrips => 'Путешествия';

  @override
  String get navMore => 'Более';

  @override
  String get navTimeline => 'Хронология';

  @override
  String get navGems => 'Драгоценные камни';

  @override
  String get navFeed => 'Кормить';

  @override
  String get navTicketSavings => 'Экономия';

  @override
  String get navStays => 'Остается';

  @override
  String get morePageTitle => 'Более';

  @override
  String get morePageSubtitle =>
      'Инструменты для путешествий, учетная запись и предпочтения — созданы для обеспечения беспрепятственного доступа.';

  @override
  String get moreSectionTravelTools => 'ИНСТРУМЕНТЫ ДЛЯ ПУТЕШЕСТВИЯ';

  @override
  String get moreSectionAccount => 'СЧЕТ';

  @override
  String get moreSectionApp => 'ПРИЛОЖЕНИЕ';

  @override
  String get moreCardHotelsSub =>
      'Интеллектуальное пребывание в соответствии с вашим настроением';

  @override
  String get moreCardGemsSub => 'Инсайдерские открытия местные жители охраняют';

  @override
  String get moreCardTicketsSub =>
      'Сравните сбережения авторизованных партнеров';

  @override
  String get moreCardWeatherSub => 'Руководство на день с учетом прогноза';

  @override
  String get moreCardProfileTitle => 'Профиль поездки';

  @override
  String get moreCardProfileSub => 'Кто путешествует, как это должно быть';

  @override
  String get moreCardFavoritesSub =>
      'Направления, которые вы добавили в закладки';

  @override
  String get moreCardNotificationsTitle => 'Уведомления';

  @override
  String get moreCardNotificationsSub =>
      'Оповещения о поездках и обновления консьержа';

  @override
  String get moreCardSettingsSub => 'Тема, городские пакеты и предпочтения';

  @override
  String get moreCardAboutSub => 'Почему мы строим Луксору';

  @override
  String get moreCardHelpSub => 'Гиды и консьерж-поддержка';

  @override
  String get moreCardCityPacksSub =>
      'Разблокируйте консьержей пункта назначения';

  @override
  String get moreCardPartnersSub => 'Рекомендуемый опыт партнеров';

  @override
  String get moreCardItinerarySub => 'Ваш золотой побег изо дня в день';

  @override
  String get savedFavoritesTitle => 'Сохраненные избранные';

  @override
  String get savedFavoritesEmpty =>
      'Добавьте пункты назначения в закладки на карте или в ленте — они появятся здесь.';

  @override
  String get helpCenterTitle => 'Справочный центр';

  @override
  String get helpCenterBody =>
      'Отправьте электронное письмо по адресу support@luxora.ai, чтобы получить помощь консьержа. Скоро появятся встроенные в приложение руководства.';

  @override
  String get notificationsComingSoon =>
      'Уведомления о поездках появятся в будущем обновлении.';

  @override
  String get partnerOffersTitle => 'Партнерские предложения';

  @override
  String get ticketSavingsTitle => 'Умная экономия на билетах';

  @override
  String get ticketSavingsBadgeLabel => 'ПРЕМИУМ-ЭКОНОМИЯ';

  @override
  String get ticketSavingsSubtitle =>
      'Luxora предлагает авторизованных реселлеров, пакеты и рекламные акции, чтобы вы чувствовали себя консультантом по роскоши, а не сайтом купонов.';

  @override
  String ticketSavingsBadge(int percent) {
    return 'СЭКОНОМЬТЕ $percent %';
  }

  @override
  String get ticketOfficialPrice => 'Официальный';

  @override
  String get ticketDiscountPrice => 'Цена Луксоры';

  @override
  String ticketSaveAmount(String amount) {
    return 'Сэкономьте $amount';
  }

  @override
  String get ticketSaveAmountLabel => 'Экономия';

  @override
  String ticketSavePerTicket(String amount) {
    return 'Вы можете сэкономить $amount на билете.';
  }

  @override
  String ticketFamilySave(String amount) {
    return 'Предполагаемая семейная экономия: $amount.';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return 'Предполагаемая семейная экономия: $amount.';
  }

  @override
  String ticketSource(String source) {
    return 'Источник: $source';
  }

  @override
  String ticketExpires(String date) {
    return 'Предложение до $date';
  }

  @override
  String get ticketBetterOption => 'Луксора нашла лучший вариант.';

  @override
  String get ticketOverpaying => 'Возможно, вы переплачиваете по цене ворот.';

  @override
  String get ticketRecommendedSavings => 'Доступна рекомендуемая экономия';

  @override
  String get ticketCalculatorTitle => 'Потенциальная экономия';

  @override
  String get ticketFilterLabel => 'Фильтр';

  @override
  String get ticketFilterAll => 'Все';

  @override
  String get ticketFilterThemeParks => 'Тематические парки';

  @override
  String get ticketFilterAttractions => 'Достопримечательности';

  @override
  String get ticketFilterTours => 'Туры';

  @override
  String get ticketFilterDining => 'Обеденный опыт';

  @override
  String get ticketFilterWaterParks => 'Аквапарки';

  @override
  String get ticketFilterFamily => 'Семейные мероприятия';

  @override
  String get ticketFilterEntertainment => 'Развлечение';

  @override
  String get ticketSortLabel => 'Сортировать по';

  @override
  String get ticketSortHighestSavings => 'Максимальная экономия';

  @override
  String get ticketSortMostPopular => 'Самый популярный';

  @override
  String get ticketSortFamilyFriendly => 'Для семейного отдыха';

  @override
  String get ticketSortLuxury => 'Роскошные впечатления';

  @override
  String get ticketSortClosest => 'Самый близкий ко мне';

  @override
  String get ticketDealsSectionTitle => 'Авторизованные сделки';

  @override
  String ticketDealsPricesAsOf(String date) {
    return 'Цены на $date';
  }

  @override
  String get ticketDealsRefreshFailed =>
      'Не удалось обновить цены — показываем кэшированные предложения.';

  @override
  String get ticketDealsUpdating => 'Обновление цен…';

  @override
  String get ticketNoDeals =>
      'В этом фильтре нет предложений — попробуйте другую категорию.';

  @override
  String get ticketConfidenceHigh => 'Высокая уверенность';

  @override
  String get ticketConfidenceVerified => 'Проверенный реселлер';

  @override
  String get ticketConfidenceLimited => 'Ограниченное время';

  @override
  String get ticketAiInsightTitle => 'Луксора рекомендация';

  @override
  String get ticketInsightDisneyPass =>
      'В зависимости от вашего маршрута трехдневный пропуск в Мир Уолта Диснея вместо однодневных билетов может сэкономить вашей семье примерно 120 долларов США.';

  @override
  String get ticketInsightUniversalCombo =>
      'Ваш план включает в себя Universal — для большинства семей билет на 2 парка лучше, чем покупка дней по отдельности.';

  @override
  String get ticketInsightSeaworldCombo =>
      'SeaWorld на вашем маршруте — комбинация Aquatica часто превосходит два отдельных входа.';

  @override
  String get ticketInsightGeneric =>
      'Луксора сопоставила экономию с остановками вашего маршрута — сравните, прежде чем покупать у ворот.';

  @override
  String get ticketInsightMiamiCulture =>
      'Культура не входит в ваш план — предложения партнеров Vizcaya и ПАММ могут превзойти цены на ворота на этой неделе.';

  @override
  String get ticketInsightMiamiEverglades =>
      'День Эверглейдс в вашем маршруте — утренние места на аэроглиссере часто стоят дешевле в середине недели.';

  @override
  String get ticketInsightMiamiWynwood =>
      'Винвуд на вашем маршруте — художественная прогулка с гидом может обойтись дешевле, чем в кабинке без лифта.';

  @override
  String get ticketItineraryMatchTitle => 'Проверка экономии на маршруте';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'Консьерж';

  @override
  String conciergeTripFeel(String feel) {
    return 'Ощущение поездки: «$feel»';
  }

  @override
  String get conciergeWelcome =>
      'Добро пожаловать в Луксору — вашего эмоционально умного компаньона из Флориды.\n\nВыберите подсказку ниже или опишите ощущение, которое вы хотите, чтобы ваша поездка вызвала.';

  @override
  String get conciergeQuickPrompts => 'Быстрые подсказки';

  @override
  String get conciergeRemembering => 'Вспоминая об этой поездке';

  @override
  String get conciergeStyleMemory => 'Память стиля';

  @override
  String get conciergeInputHint =>
      'Опишите ощущение, которое вы хотите, чтобы ваша поездка вызвала…';

  @override
  String get conciergeGreetingMorning => 'Доброе утро.';

  @override
  String get conciergeGreetingAfternoon => 'Добрый день.';

  @override
  String get conciergeGreetingEvening => 'Добрый вечер.';

  @override
  String get conciergeWelcomeWarm =>
      'Я здесь для того, чтобы сформировать Флориду так, как вы хотите себя чувствовать, а не просто список достопримечательностей. Чего вы жаждете сегодня?';

  @override
  String get conciergeRefineStyle => 'Уточнить мой стиль';

  @override
  String get conciergeRecallReturning => 'Добро пожаловать.';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'Я помню, тебе нравится $prefs.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'И вы хотели, чтобы эта поездка вызывала ощущение: «$feel».';
  }

  @override
  String get conciergePromptRomantic => 'Романтический отдых';

  @override
  String get conciergePromptWellness => 'Оздоровительный сброс';

  @override
  String get conciergePromptFamily => 'Семейная магия';

  @override
  String get conciergePromptHiddenLuxury => 'Скрытая роскошь';

  @override
  String get conciergePromptFoodie => 'Гурманское приключение';

  @override
  String get conciergePromptSoftLuxury => 'Мягкий роскошный побег';

  @override
  String get conciergePromptAdventure => 'Режим приключений';

  @override
  String get conciergePromptDisney => 'Дисней после наступления темноты';

  @override
  String get discoverSearchHint => 'Поиск направлений…';

  @override
  String get discoverSearchTitle => 'Найти пункт назначения';

  @override
  String get discoverFromOrlando => 'Из Орландо';

  @override
  String discoverFromHub(String hub) {
    return 'Из $hub';
  }

  @override
  String get discoverSearchScopeAll => 'Поиск по всей Флориде в каталоге.';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'В пределах $radius от Орландо';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return 'В пределах $radius от $hub';
  }

  @override
  String get discoverSearchEmpty =>
      'В этом радиусе нет совпадений — попробуйте более короткое имя, увеличьте метку расстояния на карте или в ленте или выполните поиск по словам «пляж», «Дисней» или «источники».';

  @override
  String get discoverFilterAll => 'Все';

  @override
  String get discoverFilterHotels => 'Отели';

  @override
  String get discoverFilterRestaurants => 'Рестораны';

  @override
  String get discoverFilterDestinations => 'Направления';

  @override
  String get discoverPopularInRadius => 'Популярно в вашем радиусе';

  @override
  String get discoverTrySearching => 'Попробуйте поискать';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return 'Направления: $count · в пределах $radius от Орландо';
  }

  @override
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return 'Направления: $count · в пределах $radius от $hub';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count направлений · вся Флорида';
  }

  @override
  String get radius25 => '25 миль';

  @override
  String get radius50 => '50 миль';

  @override
  String get radius100 => '100 миль';

  @override
  String get radiusAllFlorida => 'Вся Флорида';

  @override
  String get radiusDesc25 => 'Однодневные поездки по центру Орландо';

  @override
  String get radiusDesc50 =>
      'Спрингс, однодневные поездки на побережье, Космическое побережье';

  @override
  String get radiusDesc100 => 'Тампа-Бэй, Дейтона, более глубокий залив';

  @override
  String get radiusDescAll => 'Кис, Майами, достопримечательности штата';

  @override
  String get radiusDesc25Miami => 'Саут-Бич, Брикелл и основные районы';

  @override
  String get radiusDesc50Miami => 'Винвуд, Коконат Гроув, Ки-Бискейн';

  @override
  String get radiusDesc100Miami =>
      'Эверглейдс, Форт-Лодердейл, глубокая Южная Флорида';

  @override
  String get radiusDescAllMiami =>
      'Тропа Флорида-Кис и достопримечательности штата';

  @override
  String get radiusDesc25Keys =>
      'Ки-Ларго, Исламорада и северный рифовый коридор';

  @override
  String get radiusDesc50Keys => 'Маратон, Биг-Пайн и пляжи средних Кис';

  @override
  String get radiusDesc100Keys => 'Вся Overseas Highway до Ки-Уэста';

  @override
  String get radiusDescAllKeys =>
      'Вся цепь островов и воды для однодневных поездок';

  @override
  String get feedBadge => 'ЖИВОЕ ОТКРЫТИЕ';

  @override
  String get feedTitle => 'Лента опыта';

  @override
  String get feedSubtitle =>
      'Что происходит сейчас — популярные места, новые вакансии, выбор авторов, сезонные маршруты и постоянные обновления.';

  @override
  String get feedSubtitleFamily =>
      'Семейные идеи — парки, простые планы и моменты для детей и родителей.';

  @override
  String get feedPillTrending => 'Тенденции';

  @override
  String get feedPillNewOpenings => 'Новые открытия';

  @override
  String get feedPillCreator => 'Выбор автора';

  @override
  String get feedPillLive => 'Живые обновления';

  @override
  String get feedMoodPrompt => 'КАК ВЫ ХОТИТЕ ЧУВСТВОВАТЬ?';

  @override
  String get feedMoodPromptFamily => 'КАК ДОЛЖЕН ПРОЙТИ ДЕНЬ ДЛЯ ВАШЕЙ СЕМЬИ?';

  @override
  String get feedMoodAll => 'Все';

  @override
  String get feedMoodFamily => 'Семейная магия';

  @override
  String get feedMoodRomantic => 'Романтический';

  @override
  String get feedMoodCalm => 'Спокойствие';

  @override
  String get feedMoodAdventurous => 'авантюрный';

  @override
  String get feedMoodPampered => 'Избалованный';

  @override
  String get feedMoodSocial => 'Жужжание';

  @override
  String get feedMoodFoodie => 'Гурман';

  @override
  String get feedFamilyMoodHint =>
      'Theme parks, character meals, and easy parent wins — filtered for family tags.';

  @override
  String get feedEmptyHint =>
      'В этом радиусе нет карточек с фидами — попробуйте 50 миль или всю Флориду, чтобы увидеть побережье Мексиканского залива и основные моменты Киса.';

  @override
  String get feedEmptyHintFamily =>
      'No family-tagged cards in this radius — try Adventurous or Everything, or widen the radius.';

  @override
  String get gemsBadge => 'ИНСАЙДЕРСКОЕ КУРИРОВАНИЕ';

  @override
  String get gemsTitle => 'Скрытые сокровища';

  @override
  String get gemsSubtitle =>
      'Тайные открытия, которые охраняют местные жители — почему это особенное, когда идти, насколько здесь многолюдно и советы, которые вы не найдете на открытке.';

  @override
  String get gemsPillHidden => 'Скрытые места';

  @override
  String get gemsPillLocal => 'Только для местного населения';

  @override
  String get gemsPillInsider => 'Советы инсайдера';

  @override
  String get gemsPillCrowd => 'Информация о толпе';

  @override
  String get gemsEmptyHint =>
      'В этом радиусе пока нет драгоценных камней — расширите его до 50 миль или дальше, чтобы увидеть источники и секреты Космического побережья.';

  @override
  String get gemsSearchHint => 'Ищите скрытые сокровища и направления…';

  @override
  String get gemLocalSecret => 'МЕСТНАЯ СЕКРЕТА';

  @override
  String get gemsMatchedBadge => 'Ваш стиль';

  @override
  String gemsMatchedNote(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count драгоценных камней соответствуют вашему стилю',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
  }

  @override
  String get gemWhySpecial => 'Почему это особенное';

  @override
  String get gemBestTime => 'Лучшее время, чтобы пойти';

  @override
  String get gemCrowdLevel => 'Уровень толпы';

  @override
  String get gemInsiderTip => 'Инсайдерский совет';

  @override
  String get gemLocalNote => 'Примечание только для местных пользователей';

  @override
  String get mapBadge => 'ИИ КАРТА';

  @override
  String get mapTitle => 'Ваш разумный маршрут';

  @override
  String get mapSubtitle =>
      'Булавки для выбранного вами дня: золотые ромбы — это драгоценные камни, голубые маркеры — это шкала сегодняшнего дня, золотая линия — это маршрут настроения.';

  @override
  String get mapPlanDayTitle => 'План на сегодня';

  @override
  String get mapPlanDaySuggested =>
      'Настроение, предложенное в поездке: добавьте места в закладки, чтобы они стали вашими.';

  @override
  String get mapPlanDayEmpty =>
      'Добавьте пункты назначения в закладки (♥), и Луксора построит оптимизированный маршрут из вашего узла в Орландо — минимум поездок, максимум ощущений.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return 'Остановок: $count · $miles · поездка $time';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return 'Начиная с $hotel';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return '$time в пути · $miles от предыдущей остановки';
  }

  @override
  String get mapCrowdLevelQuiet => 'Тихий';

  @override
  String get mapCrowdLevelModerate => 'Умеренный';

  @override
  String get mapCrowdLevelBusy => 'Занятый';

  @override
  String get mapCrowdLevelPacked => 'упакованный';

  @override
  String mapCrowdAtStop(String level) {
    return 'Толпа: $level';
  }

  @override
  String get mapParkingLevelEasy => 'Легко';

  @override
  String get mapParkingLevelModerate => 'Умеренно';

  @override
  String get mapParkingLevelDifficult => 'Сложно';

  @override
  String get mapParkingLevelLimited => 'Ограничено · приезжайте рано';

  @override
  String mapParkingAtStop(String level) {
    return 'Парковка: $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return 'Стресс в пути: $score/90';
  }

  @override
  String get mapRerouteButton =>
      'Измените маршрут на более спокойные остановки';

  @override
  String mapRerouteApplied(int count) {
    return 'День скорректирован: $count остановок заменено на меньшее количество людей.';
  }

  @override
  String get mapRerouteNone => 'Ваш маршрут уже выглядит спокойным.';

  @override
  String get mapRerouteRainHint =>
      'Вероятен дождь — нажмите «Перенаправление» для резервных копий в помещении.';

  @override
  String get dayFlowSwapTitle => 'Изменить остановку';

  @override
  String dayFlowSwapSubtitle(String current) {
    return 'Скажите Luxora, что вы хотели бы вместо $current.';
  }

  @override
  String get dayFlowSwapTemplate => 'Я думал скорее о чём-то вроде…';

  @override
  String get dayFlowSwapHint =>
      'e.g. a quiet park this morning, or seafood for dinner';

  @override
  String get dayFlowSwapApply => 'Обновить день';

  @override
  String get dayFlowSwapViewPlace => 'Текущая остановка';

  @override
  String dayFlowSwapSuccess(String newStop, String phase) {
    return 'Updated — $newStop is now your $phase stop.';
  }

  @override
  String get dayFlowSwapNoMatch =>
      'Couldn\'t find a match nearby — try being more specific.';

  @override
  String get dayFlowSwapTapToChange => 'Change this stop';

  @override
  String get dayFlowSwapHoldSpeak => 'Удерживайте для речи';

  @override
  String get dayFlowSwapListening => 'Слушаю…';

  @override
  String get rightNowButton => 'Что нам следует делать прямо сейчас?';

  @override
  String get rightNowEmpty =>
      'В вашем радиусе пока нет сильных моментов — расширьте список избранных или добавьте в закладки несколько избранных.';

  @override
  String get rightNowResultTitle => 'ПРЯМО СЕЙЧАС';

  @override
  String get rightNowTapForDetails => 'Нажмите, чтобы узнать подробности';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return 'Вы в $minutes минутах от $district. Погода идеальная: выпейте кофе в $place, а затем прогуляйтесь по $walkArea, пока не собралось много людей (толп $crowd).';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return 'Вы в $minutes минутах от $district. Небо выглядит великолепно — отправляйтесь в $place, пока толпа еще $crowd.';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return 'Наступает золотой час — выезжайте примерно через $minutes минут до $place ($crowd до заката).';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return 'Дождь на радаре — $minutes минут до уютного места в помещении: $place.';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return 'Спокойствие перед сном — $minutes минут до легкой семейной перезагрузки в $place.';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return 'Энергия свидания и вечера — $minutes минут до $place до спешки.';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return 'Тихое окно — $minutes минут до $place ($crowd прямо сейчас).';
  }

  @override
  String get goldenHourTitle => 'Золотой час';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return 'Выезжайте в $time ($minutes мин езды) в $place — прибудьте примерно за 15 минут до заката.';
  }

  @override
  String get goldenHourKindBeach => 'Окно заката на пляже';

  @override
  String get goldenHourKindRooftop => 'Золотой час на крыше';

  @override
  String get goldenHourKindScenic => 'Время для живописной фотосъемки';

  @override
  String get vacationScoreTitle => 'Оценка отпуска';

  @override
  String vacationScoreSubtitle(int score) {
    return 'Сегодняшний день похож на $score/100.';
  }

  @override
  String get onboardOccasionLabel => 'Какой случай?';

  @override
  String get occasionGeneral => 'Просто изучаю';

  @override
  String get occasionAnniversary => 'Годовщина';

  @override
  String get occasionHoneymoon => 'Медовый месяц';

  @override
  String get occasionDateNight => 'Ночное свидание';

  @override
  String get occasionProposal => 'Предложение поездки';

  @override
  String get occasionFamily => 'Семья с детьми';

  @override
  String get occasionDisneyAdventure => 'Приключение Disney';

  @override
  String get occasionUniversalAdventure => 'Приключение Universal';

  @override
  String get localSecretTitle => 'Местная тайна';

  @override
  String get localSecretWinterParkParkAvenue =>
      'Местные жители ныряют в переулок за книжным магазином — уличного указателя нет.';

  @override
  String get localSecretWorldFoodTrucks =>
      'Заказывайте ежедневный улов, а не гамбургер — у дальнего окна очередь движется быстрее.';

  @override
  String get localSecretWekiwaSprings =>
      'Пропустите главный променад после 14:00 — в начале северной тропы будет тихо.';

  @override
  String get localSecretDisneySpringsParking =>
      'Лучшая парковка — оранжевый гараж — идите со стороны пристани, а не к главному входу.';

  @override
  String get localSecretLakeEolaSunset =>
      'Повернитесь лицом к амфитеатру и сделайте фотографии лебедей, пока небо становится золотым.';

  @override
  String get localSecretMiamiWynwoodAlley =>
      'Пройдите через погрузочную аллею за Panther Coffee — местные жители снимают фрески без толпы посетителей.';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      'Сначала купите cafecito в тележке у окна — завсегдатаи боковой скамейки открываются, когда вы держите кортадито.';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      'Пропустите спешку по главной террасе — войдите из восточного сада и пройдите по набережной, заросшей мангровыми деревьями, против часовой стрелки.';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      'В 7 утра повернитесь на восток на Ламмус — пастельные тона в стиле ар-деко сияют еще до того, как прибудет толпа бранча.';

  @override
  String get localSecretMiamiPantherAlley =>
      'Сделайте заказ у окна, пройдите по переулку по часовой стрелке — лучший свет фрески падает на бирюзовую стену в 8:45 утра.';

  @override
  String get momentsTitle => 'ЛУКСОРА МОМЕНТЫ';

  @override
  String get momentsSubtitle => 'Ищите чувство, а не место.';

  @override
  String get momentFeelRelaxed => 'Почувствуйте себя расслабленным';

  @override
  String get momentImpressSpouse => 'Произвести впечатление на мою супругу';

  @override
  String get momentPerfectSunset => 'Идеальный закат';

  @override
  String get momentFamilyMemory => 'Семейная память';

  @override
  String get momentLuxuryValue => 'Роскошь без переплаты';

  @override
  String get momentPromptRelaxed =>
      'Я хочу чувствовать себя полностью расслабленным в течение следующих нескольких часов — медленно, красиво, без толпы.';

  @override
  String get momentPromptImpressSpouse =>
      'Сегодня вечером я хочу произвести впечатление на своего супруга чем-то романтичным и неожиданным.';

  @override
  String get momentPromptPerfectSunset =>
      'Мне нужен идеальный момент заката во Флориде — где нам быть и когда нам уходить?';

  @override
  String get momentPromptFamilyMemory =>
      'Я хочу незабываемый семейный момент, который будет легким для родителей и волшебным для детей.';

  @override
  String get momentPromptLuxuryValue =>
      'Я хочу роскошь, которая кажется особенной, не тратя при этом целое состояние.';

  @override
  String get visualShareImageButton => 'Поделиться карточкой изображения';

  @override
  String get tripStoryTitle => 'История вашей поездки';

  @override
  String tripStoryHeading(String title) {
    return '$title — ваша история о Флориде';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return 'Вы пришли за $moods.';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return 'Эта глава: $title.';
  }

  @override
  String get tripStoryBeatClosing =>
      'Луксора формировала моменты — вы их проживали.';

  @override
  String get tripsOpenStory => 'Ваша история';

  @override
  String get conciergeVoiceHold => 'Удерживайте, чтобы говорить';

  @override
  String get conciergeVoiceSoon =>
      'Разрешите микрофон, чтобы Luxora могла слушать.';

  @override
  String get conciergeVoiceListening => 'Luxora слушает…';

  @override
  String get conciergeVoiceSpeaking => 'Luxora говорит…';

  @override
  String get conciergeVoiceRelease => 'Отпустите, чтобы отправить';

  @override
  String get conciergeVoiceSend => 'Отправить Luxora';

  @override
  String get conciergeVoiceProcessing => 'Отправка Luxora…';

  @override
  String get conciergeVoiceNoSpeech =>
      'Не расслышала — удерживайте, говорите и отпустите.';

  @override
  String get conciergeVoicePreviewFailed =>
      'Не удалось воспроизвести. Проверьте громкость и попробуйте снова.';

  @override
  String get conciergeVoiceUnavailable =>
      'Голос недоступен на этом устройстве.';

  @override
  String get conciergeVoiceSettingsTitle => 'Голос Luxora';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Выберите акцент, тон и темп — используются системные голоса устройства.';

  @override
  String get conciergeVoiceRateLabel => 'Темп речи';

  @override
  String get conciergeVoiceRateSlow => 'Медленно';

  @override
  String get conciergeVoiceRateNatural => 'Естественно';

  @override
  String get conciergeVoiceRateFast => 'Быстро';

  @override
  String get conciergeVoicePreview => 'Прослушать голос';

  @override
  String get conciergeVoicePreviewSample =>
      'Привет — я Luxora. Расскажи, каким ты хочешь чувствовать это путешествие.';

  @override
  String get conciergeVoiceDeviceNote =>
      'Download more voices in iPhone Settings → Accessibility → Spoken Content → Voices. Return here and tap Refresh.';

  @override
  String get conciergeVoiceDeviceSection => 'Голоса на этом iPhone';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'Includes voices you downloaded — tap one to use it for Luxora.';

  @override
  String get conciergeVoiceRefreshList => 'Обновить список';

  @override
  String get conciergeVoiceShowAllLanguages => 'Show all languages';

  @override
  String get conciergeVoiceOpenSettings => 'Open iPhone voice settings';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      'No voices found — download packs in Settings, then refresh.';

  @override
  String get conciergeVoicePresetSection => 'Быстрый выбор';

  @override
  String get conciergeVoiceRegionRecommended => 'Рекомендуется';

  @override
  String get conciergeVoiceRegionEnglish => 'Английский';

  @override
  String get conciergeVoiceRegionRussian => 'Русский';

  @override
  String get conciergeVoiceRegionSpanish => 'Испанский';

  @override
  String get conciergeVoiceRegionFrench => 'Французский';

  @override
  String get conciergeVoiceRegionGerman => 'Немецкий';

  @override
  String get conciergeVoiceRegionOther => 'Другие';

  @override
  String get conciergeVoicePresetMatchApp => 'Язык приложения · Женский';

  @override
  String get conciergeVoicePresetEnUsF => 'Американский · Женский';

  @override
  String get conciergeVoicePresetEnUsM => 'Американский · Мужской';

  @override
  String get conciergeVoicePresetEnGbF => 'Британский · Женский';

  @override
  String get conciergeVoicePresetEnGbM => 'Британский · Мужской';

  @override
  String get conciergeVoicePresetRuF => 'Русский · Женский';

  @override
  String get conciergeVoicePresetRuM => 'Русский · Мужской';

  @override
  String get conciergeVoicePresetEsF => 'Испанский · Женский';

  @override
  String get conciergeVoicePresetEsM => 'Испанский · Мужской';

  @override
  String get conciergeVoicePresetFrF => 'Французский · Женский';

  @override
  String get conciergeVoicePresetFrM => 'Французский · Мужской';

  @override
  String get conciergeVoicePresetDeF => 'Немецкий · Женский';

  @override
  String get conciergeVoicePresetDeM => 'Немецкий · Мужской';

  @override
  String get conciergeThinking => 'Luxora думает…';

  @override
  String get conciergeAiError =>
      'Не удалось связаться с Luxora. Проверьте подключение и попробуйте снова.';

  @override
  String get conciergeAiErrorVoice =>
      'Sorry — I couldn\'t connect to Luxora\'s concierge just now.';

  @override
  String get conciergeAiNotConfigured =>
      'Luxora\'s live concierge isn\'t wired up on this build yet — Supabase URL and anon key need to be baked into the app, and the edge function deployed. Map and itinerary still work; see docs/CONCIERGE_AI.md for setup.';

  @override
  String get conciergeAiOpenAiNotReady =>
      'Luxora heard you, but the concierge brain isn\'t online yet. Set OPENAI_API_KEY in Supabase secrets for the edge function (bright-processor), then try again.';

  @override
  String conciergeAiFunctionNotFound(String function) {
    return 'Luxora couldn\'t find the concierge edge function \"$function\". Deploy it in Supabase or fix SUPABASE_CONCIERGE_FUNCTION on this build.';
  }

  @override
  String get conciergeAiAuthFailed =>
      'Luxora couldn\'t authenticate with Supabase — double-check SUPABASE_ANON_KEY matches your project.';

  @override
  String get mapAiPowers => 'Силы карты ИИ';

  @override
  String get mapNavLayerTitle => 'Интеллект трения по остановкам';

  @override
  String get mapNavLayerSubtitle =>
      'Толпа, парковка и стресс в пути в плане дня — плюс спontaneous reroute.';

  @override
  String get mapBookingTitle => 'Бесшовное бронирование (партнеры)';

  @override
  String get mapCapMoodTitle => 'Маршруты по настроению';

  @override
  String get mapCapMoodDesc =>
      'Пути, которые сочетают в себе романтику, оздоровительный, семейный или приключенческий путь, а не только кратчайшее время в пути.';

  @override
  String get mapCapDriveTitle => 'Оптимизация времени в пути';

  @override
  String get mapCapDriveDesc =>
      'Интеллектуальная последовательность, позволяющая проводить время с чувствами, а не сидеть в пробке между основными моментами.';

  @override
  String get mapCapWeatherTitle => 'Предложения с учетом погоды';

  @override
  String get mapCapWeatherDesc =>
      'Резервные маршруты от дождя и живые окна для пляжей, крыш и источников.';

  @override
  String get mapCapSunsetTitle => 'Лучший закат прямо сейчас';

  @override
  String get mapCapSunsetDesc =>
      'Где золотой час наступит лучше всего в ближайшие 90 минут, судя по небу и толпе.';

  @override
  String get mapCapCrowdTitle => 'Прогноз толпы';

  @override
  String get mapCapCrowdDesc =>
      'Когда парки, источники и вирусные места затихнут — еще до вашего приезда.';

  @override
  String get mapCapGemsTitle => 'Близлежащие скрытые драгоценные камни';

  @override
  String get mapCapGemsDesc =>
      'На вашем маршруте появлялись инсайдерские значки, а не только топ-10 туристических остановок.';

  @override
  String get mapCapPersonalTitle => 'Персонализация маршрута';

  @override
  String get mapCapPersonalDesc =>
      'Ощущение, темп и бюджет вашей поездки меняют карту в реальном времени.';

  @override
  String get mapFutureCrowdTitle => 'Прогноз толпы';

  @override
  String get mapFutureCrowdDesc =>
      'Прогноз от спокойно до переполнено на каждой остановке Plan my day.';

  @override
  String get mapFutureParkingTitle => 'Прогноз парковки';

  @override
  String get mapFutureParkingDesc =>
      'Оценка трения с valet, гаражом и приездом до выезда.';

  @override
  String get mapFutureTrafficTitle => 'Drive friction score';

  @override
  String get mapFutureTrafficDesc =>
      'Оценка стресса по каждому плечу маршрута — не только минуты.';

  @override
  String get mapFutureRerouteTitle => 'Спонтанное перенаправление';

  @override
  String get mapFutureRerouteDesc =>
      'Смена погоды или всплеск толпы? Одно касание, чтобы изменить остальную часть вашего дня.';

  @override
  String affiliateReserve(String category) {
    return 'Резерв · $category · премиум-партнер (скоро)';
  }

  @override
  String get affiliateHotels => 'Отели и места отдыха';

  @override
  String get affiliateExperiences => 'Впечатления и туры';

  @override
  String get affiliateRestaurants => 'Бронирование ресторанов';

  @override
  String get affiliateThemeParks => 'Билеты в тематические парки';

  @override
  String get affiliateDayPasses => 'ResortPass / дневные пропуска';

  @override
  String get affiliateCarRentals => 'Прокат автомобилей';

  @override
  String get affiliateWellness => 'Бронирование велнес-услуг';

  @override
  String get tripsBadge => 'КОЛЛЕКЦИИ';

  @override
  String get tripsTitle => 'Сохраненные поездки';

  @override
  String get tripsSubtitle =>
      'Коснитесь поездки, чтобы просмотреть ее снимок в реальном времени — следующий момент, погоду, закат и временную шкалу.';

  @override
  String get tripsFooter =>
      'Обложки поездок из каталога настроений · Supabase sync Phase 2';

  @override
  String get tripsPlanNew => 'Планируйте новую поездку';

  @override
  String get tripsEmptyTitle => 'Сохраненных поездок пока нет.';

  @override
  String get tripsEmptyBody =>
      'Спланируйте свою первую поездку, и она появится здесь, и вы сможете вернуться к ней в любое время.';

  @override
  String get tripsDeleteTitle => 'Удалить поездку?';

  @override
  String tripsDeleteBody(String title) {
    return 'Это приведет к удалению «$title» из ваших сохраненных поездок. Это невозможно отменить.';
  }

  @override
  String get tripsDeleted => 'Поездка удалена';

  @override
  String get tripsEditDates => 'Даты поездки';

  @override
  String get tripsSaveDates => 'Сохранить даты';

  @override
  String get tripsDatesUpdated => 'Даты обновлены';

  @override
  String get tripsDatesFlexible => 'Гибкие даты';

  @override
  String get tripsLiveWeather => 'Живая погода';

  @override
  String get tripsNextUp => 'Дальше';

  @override
  String get tripsSunsetWindow => 'Окно заката';

  @override
  String get tripsTimelineSnapshot => 'Снимок временной шкалы';

  @override
  String get tripsOpenTimeline => 'Открыть полную хронологию';

  @override
  String get tripsShare => 'Делиться';

  @override
  String get shareItineraryFooter =>
      'Спланировано с Луксорой — вашим эмоционально умным компаньоном из Флориды.';

  @override
  String shareSubject(String title) {
    return 'Мой $title';
  }

  @override
  String get itineraryBadge => 'ВАША ГРАФИКА';

  @override
  String get itineraryTagline =>
      'Каждый момент связан: ожидание встроено, стресс отсутствует.';

  @override
  String itineraryDayTab(int day, String label) {
    return 'День $day · $label';
  }

  @override
  String get detailWhySpecial => 'Почему это особенное';

  @override
  String get detailBestTime => 'Лучшее время для поездки';

  @override
  String get detailInsiderTips => 'Советы для инсайдеров';

  @override
  String get detailReserve => 'Зарезервировать опыт';

  @override
  String get detailReserveSoon => 'Скоро появятся партнеры по бронированию.';

  @override
  String get detailNearbyGems => 'Близлежащие драгоценные камни';

  @override
  String get detailDuration => 'Продолжительность';

  @override
  String get detailPractical => 'Практические детали';

  @override
  String get detailCostRange => 'Диапазон стоимости';

  @override
  String get detailBestFor => 'Лучшее для';

  @override
  String get detailVibeMatch => 'Вибрационный матч';

  @override
  String get detailCrowd => 'Толпа';

  @override
  String get detailTravelIntelTitle => 'Прогноз трения поездки';

  @override
  String get detailTravelIntelSubtitle =>
      'Прогноз по категории, времени и расстоянию — без live-сенсоров.';

  @override
  String detailCrowdOutlook(String level) {
    return 'Толпа: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return 'Парковка: $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return 'Стресс в пути: $score/90';
  }

  @override
  String get detailPrice => 'Цена';

  @override
  String get detailLocation => 'Расположение';

  @override
  String get detailGetDirections => 'Проложить маршрут';

  @override
  String get detailParkMap => 'Карта парка';

  @override
  String get detailViewOnMap => 'Посмотреть на карте';

  @override
  String get detailMapsError => 'Не удалось открыть карты на этом устройстве.';

  @override
  String get detailGoogleMaps => 'Карты Google';

  @override
  String get detailAppleMaps => 'Apple Карты';

  @override
  String get detailOpenInMaps => 'Открыть в картах';

  @override
  String detailDriveFromOrlando(String time) {
    return '$time поездка из Орландо';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '$time ехать из $hub';
  }

  @override
  String get detailSaveToItinerary => 'Сохранить в маршрут';

  @override
  String get detailSaved => 'Сохранено';

  @override
  String get detailSavedSnack => 'Сохранено в вашем маршруте.';

  @override
  String get detailRemovedSnack => 'Удалено из вашего маршрута';

  @override
  String get detailSetHomeBase => 'Установить в качестве домашней базы';

  @override
  String get detailHomeBaseActive => 'База вашего путешествия';

  @override
  String get detailHomeBaseHint =>
      'Маршрут вашего дня начинается и заканчивается здесь.';

  @override
  String get detailHomeBaseSetSnack => 'Установить в качестве базы для поездки';

  @override
  String get detailHomeBaseClearedSnack => 'База очищена';

  @override
  String get detailMenuTitle => 'Основные моменты меню';

  @override
  String get detailMenuDisclaimer =>
      'Избранное — полное меню и цены могут различаться в зависимости от заведения.';

  @override
  String get detailMenuComingSoon =>
      'Мы все еще курируем это меню. Тем временем смотрите последнее меню и цены онлайн.';

  @override
  String get detailViewMenuOnline => 'Посмотреть меню онлайн';

  @override
  String get photoClose => 'Закрывать';

  @override
  String get photoViewDestination => 'Посмотреть пункт назначения';

  @override
  String get photoBy => 'Фото автора';

  @override
  String get photoOn => 'на';

  @override
  String milesFromOrlando(String distance) {
    return '$distance от Орландо';
  }

  @override
  String milesFromHub(String distance, String hub) {
    return '$distance от $hub';
  }

  @override
  String get landingBadge => 'ФЛОРИДА · ОРЛАНДО MVP';

  @override
  String get landingTitle1 => 'отпуск';

  @override
  String get landingTitle2 => 'уже началось.';

  @override
  String get landingSubtitle =>
      'Luxora AI — ваш эмоционально умный консьерж: скрытые драгоценные камни, закаты на крыше и моменты, созданные для того, чтобы вы почувствовали себя незабываемыми еще до того, как вы соберете вещи.';

  @override
  String get landingBegin => 'Начните свое путешествие';

  @override
  String get landingTalk => 'Поговорите с Луксорой';

  @override
  String get landingWhy => 'Почему мы это создаем';

  @override
  String get storyTitle => 'Наша история';

  @override
  String get storyHeroBadge => 'СОЗДАНО С НАМЕРЕНИЕМ';

  @override
  String get storyHeroCreator => 'Создатель, Луксора AI';

  @override
  String get storyHeroSubtitle =>
      'Флорида · путешествие, основанное на эмоциях';

  @override
  String get storyHeading => 'Почему мы строим Луксору';

  @override
  String get storyProblemLead =>
      'Мы поняли, что планирование поездки во Флориду/Орландо на удивление фрагментировано и утомительно.';

  @override
  String get storyJumpingBetween => 'Люди обычно прыгают между';

  @override
  String get storyProblemTail =>
      '…и все равно в конечном итоге придерживаемся общих туристических планов.';

  @override
  String get storyDifferentLead => 'Мы хотим построить что-то другое.';

  @override
  String get storyNotPlannerTitle => 'Не просто планировщик путешествий';

  @override
  String get storyNotPlannerBody =>
      'Попутчик с искусственным интеллектом, ориентированный на эмоции.';

  @override
  String get storyInsteadOfAsking => 'Вместо того, чтобы спрашивать';

  @override
  String get storyAppAsks => 'Приложение спрашивает';

  @override
  String get storyInsteadQuestion => '«Куда мне идти?»';

  @override
  String get storyFeelQuestion => '«Какие ощущения от этой поездки?»';

  @override
  String get storyMoodBuildLine =>
      'Затем ИИ создает персонализированный опыт на основе этого настроения.';

  @override
  String get storyFloridaFirstTitle => 'Почему сначала Флорида/Орландо?';

  @override
  String get storyFloridaFirstLead => 'Орландо — идеальный тестовый рынок:';

  @override
  String get storyVisionTitle => 'Наше видение';

  @override
  String get storyVisionLead => 'Объедините:';

  @override
  String get storyVisionCard =>
      'Таким образом, приложение больше напоминает роскошного AI-консьержа, а не еще один скучный инструмент для составления маршрута.';

  @override
  String get storyLongTermTitle => 'Долгосрочная возможность';

  @override
  String get storySourceGoogleMaps => 'Карты Google';

  @override
  String get storySourceTikTok => 'ТикТок';

  @override
  String get storySourceInstagram => 'Инстаграм-ролики';

  @override
  String get storySourceTravelBlogs => 'туристические блоги';

  @override
  String get storySourceRestaurantApps => 'ресторанные приложения';

  @override
  String get storySourceWeatherApps => 'погодные приложения';

  @override
  String get storySourceTicketSites => 'сайты билетов';

  @override
  String get storySourceTop10 =>
      'случайные статьи из «10 лучших статей Орландо»';

  @override
  String get storyBulletMarket => 'Огромный туристический рынок';

  @override
  String get storyBulletAudience =>
      'Семьи, пары, роскошные путешественники и велнес-путешественники';

  @override
  String get storyBulletOptions =>
      'Бесконечные рестораны, курорты, скрытые жемчужины, тематические парки, источники и ночная жизнь.';

  @override
  String get storyBulletRepeat => 'Высокий уровень повторных посещений';

  @override
  String get storyBulletLogisticsGap =>
      'Большинство туристических приложений ориентированы на логистику, а не на дизайн впечатлений.';

  @override
  String get storyPillarAiItinerary => 'Генерация маршрута с помощью ИИ';

  @override
  String get storyPillarMoodPlanning =>
      'Планирование путешествия по настроению';

  @override
  String get storyPillarLiveDiscovery => 'Живые открытия и актуальные события';

  @override
  String get storyPillarHiddenGems => 'Скрытые местные жемчужины';

  @override
  String get storyPillarRouting => 'Умная маршрутизация';

  @override
  String get storyPillarWeatherSunset => 'Информация о погоде и закате';

  @override
  String get storyPillarPremiumUx => 'Премиальный эстетический UX';

  @override
  String get storyOpportunityMultilingual => 'Многоязычное расширение';

  @override
  String get storyOpportunityAffiliate => 'Партнерство и бронирование';

  @override
  String get storyOpportunityInventory => 'Рестораны, впечатления и билеты';

  @override
  String get storyOpportunitySubscriptions => 'Премиум-подписки';

  @override
  String get storyOpportunityScale =>
      'Масштабируемость за пределы Флориды → другие направления позже';

  @override
  String get landingValues => 'Воспоминания · Эмоции · Побег · Связь';

  @override
  String get landingRegionBadge => 'Регион запуска';

  @override
  String get landingRegionTitle => 'Орландо и Флорида — созданы для чувств';

  @override
  String get onboardFinish => 'Познакомьтесь с вашим консьержем';

  @override
  String get onboardStep1Title => 'Где мечты приземляются в первую очередь';

  @override
  String get onboardStep1Subtitle => 'Куда вы направляетесь?';

  @override
  String get onboardDestination => 'Место назначения';

  @override
  String get onboardRegion => 'Область';

  @override
  String get onboardCityLabel => 'Выберите город';

  @override
  String get onboardCityUnlockNote =>
      'У каждого направления свой разблокировщик консьержа — разовая покупка на город. Парки Орlando — один пакет (Disney и Universal вместе).';

  @override
  String get landingCityLabel => 'Куда вы направляетесь?';

  @override
  String get paywallSwitchCity => 'Направление';

  @override
  String get cityPickerUnlocked => 'Разблокировано';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'Разблокировать $price';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'Дополнение Orlando · Disney и Universal вместе';

  @override
  String get onboardStep2Title => 'Время чувствовать себя свободным';

  @override
  String get onboardStep2Subtitle => 'Когда начнется твой побег?';

  @override
  String get onboardStartDateLabel => 'Дата начала';

  @override
  String get onboardEndDateLabel => 'Дата окончания';

  @override
  String get onboardPickDate => 'Нажмите, чтобы выбрать';

  @override
  String get onboardSelectStartDate => 'Выберите дату начала';

  @override
  String get onboardSelectEndDate => 'Выберите дату окончания';

  @override
  String get onboardDatesHint =>
      'Их можно изменить в любой момент на вкладке «Поездки».';

  @override
  String get onboardStepBudgetTitle => 'Планируйте спокойно';

  @override
  String get onboardStepBudgetSubtitle => 'Какой бюджет для этой поездки?';

  @override
  String get onboardBudget => 'Бюджет поездки (долл. США)';

  @override
  String get onboardStep3Title => 'Кто поделится историей';

  @override
  String get onboardStep3Subtitle => 'Кто путешествует с вами?';

  @override
  String get onboardTravelers => 'Путешественники';

  @override
  String get onboardStep4Title => 'Ваш ритм';

  @override
  String get onboardStep4Subtitle => 'Как должны протекать ваши дни?';

  @override
  String get onboardNightlife => 'Интерес к ночной жизни';

  @override
  String get onboardFoodie => 'Гурманская страсть';

  @override
  String get onboardPoolside => 'У бассейна и время простоя';

  @override
  String get onboardAdventure => 'Приключения и отдых на природе';

  @override
  String get onboardCulture => 'Культура и достопримечательности';

  @override
  String get dayFlowSubtitle =>
      'День, основанный на том, как вы хотите себя чувствовать, а не на контрольном списке.';

  @override
  String get dayFlowMorning => 'УТРО';

  @override
  String get dayFlowMidday => 'ПОЛДЕНЬ';

  @override
  String get dayFlowAfternoon => 'ПОЛДЕНЬ';

  @override
  String get dayFlowEvening => 'ВЕЧЕР';

  @override
  String get dayFlowNight => 'НОЧЬ';

  @override
  String get dayFlowReasonMorningPool =>
      'Расслабьтесь медленно — у бассейна или в спа-салоне до начала дня.';

  @override
  String get dayFlowReasonMorningCalm => 'Мягкое начало, задающее тон.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Часы пиковой энергии — большое приключение, пока вы свежи.';

  @override
  String get dayFlowReasonMiddayCulture =>
      'Осмотр достопримечательностей при ярком свете.';

  @override
  String get dayFlowReasonMiddayIcon => 'Фирменный момент дня.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'Послеобеденное время для подзарядки.';

  @override
  String get dayFlowReasonAfternoonGem => 'Скрытая жемчужина вдали от толпы.';

  @override
  String get dayFlowReasonEveningDining => 'Еда дня — ваш выбор гурмана.';

  @override
  String get dayFlowReasonNightOut => 'Последнее сияние — вечеринка.';

  @override
  String weatherToday(String place) {
    return 'Прямо сейчас в $place';
  }

  @override
  String weatherSunset(String time) {
    return 'Закат $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% вероятность дождя — упакуйте легкий слой.';
  }

  @override
  String get weatherConditionClear => 'Прозрачный';

  @override
  String get weatherConditionPartlyCloudy => 'Переменная облачность';

  @override
  String get weatherConditionCloudy => 'Облачно';

  @override
  String get weatherConditionFog => 'Туман';

  @override
  String get weatherConditionDrizzle => 'Морось';

  @override
  String get weatherConditionRain => 'Дождь';

  @override
  String get weatherConditionSnow => 'Снег';

  @override
  String get weatherConditionThunder => 'Грозы';

  @override
  String get weatherConciergeTitle => 'Погода Консьерж';

  @override
  String get weatherConciergeTapHint =>
      'Нажмите, чтобы просмотреть прогноз с учетом путешествий';

  @override
  String get weatherConciergeAdviceTitle => 'Прогноз погоды в Луксоре';

  @override
  String weatherFeelsLike(String temp) {
    return 'По ощущениям $temp';
  }

  @override
  String get weatherHumidity => 'Влажность';

  @override
  String get weatherWind => 'Ветер';

  @override
  String weatherWindValue(String dir, int speed) {
    return '$dir со скоростью $speed миль/ч';
  }

  @override
  String get weatherUv => 'УФ-индекс';

  @override
  String get weatherCloudCover => 'Облачность';

  @override
  String get weatherVisibility => 'Видимость';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$miles миль';
  }

  @override
  String weatherSunrise(String time) {
    return 'Восход солнца $time';
  }

  @override
  String get weatherStatRain => 'Дождь';

  @override
  String get weatherWhatToBring => 'Что взять с собой сегодня';

  @override
  String get weatherPlanImpact => 'Влияние на ваш план';

  @override
  String get weatherHourlyTitle => 'Почасовой прогноз';

  @override
  String get weatherHourlyUnavailable =>
      'Почасовой прогноз появится при загрузке данных.';

  @override
  String get weatherLiveRadar => 'Живой радар';

  @override
  String get weatherRadarComingSoon => 'Живой радар скоро появится.';

  @override
  String get weatherRadarPlay => 'Воспроизвести цикл';

  @override
  String get weatherRadarPause => 'Пауза цикла';

  @override
  String get weatherRadarTapToExpand => 'Нажмите для полноэкранного режима';

  @override
  String get weatherRadarNow => 'Сейчас';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return '$minutes мин назад';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes мин';
  }

  @override
  String get weatherRadarStepBack => 'Earlier frame';

  @override
  String get weatherRadarStepForward => 'Later frame';

  @override
  String get weatherRadarJumpNow => 'Now';

  @override
  String get weatherRadarJump1h => '−1 hr';

  @override
  String get weatherRadarJump2h => '−2 hr';

  @override
  String get weatherRadarJump30m => '+30 min';

  @override
  String get weatherRadarSpeedSlow => 'Slow';

  @override
  String get weatherRadarSpeedNormal => 'Normal';

  @override
  String get weatherRadarSpeedFast => 'Fast';

  @override
  String get weatherRadarLoopNote =>
      'Radar loop: past ~2 hours in 10‑minute steps, plus short-range nowcast when available — not a 4‑hour forecast.';

  @override
  String get shareMapPreviewCaption =>
      'Превью карты · откройте в Luxora для маршрута';

  @override
  String get weatherMapOverlays => 'Наложения карт';

  @override
  String get weatherOverlayPrecip => 'Осадки';

  @override
  String get weatherOverlayTemp => 'Температура';

  @override
  String get weatherOverlayWind => 'Ветер';

  @override
  String get weatherOverlayCloud => 'Облачность';

  @override
  String get weatherComingSoon => 'Вскоре';

  @override
  String get weatherAdjustDay => 'Настройте свой день в зависимости от погоды';

  @override
  String get weatherBestOutdoorWindow => 'Лучшее наружное окно';

  @override
  String get weatherRainWindow => 'Вероятен дождь';

  @override
  String get weatherSunsetRec => 'Рекомендация заката';

  @override
  String weatherOutdoorAtRisk(int count) {
    return 'Это может повлиять на остановки на открытом воздухе: $count.';
  }

  @override
  String get weatherIndoorBackup =>
      'Идеи резервного копирования внутри помещения';

  @override
  String get weatherAdviceLightJacket =>
      'Возьмите с собой легкую куртку этим вечером.';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return 'Запланируйте мероприятия на свежем воздухе до $time.';
  }

  @override
  String get weatherAdviceHighUv =>
      'Сегодня высокий уровень ультрафиолета — возьмите с собой солнцезащитный крем и избегайте длительного пребывания под прямыми солнечными лучами в полдень.';

  @override
  String get weatherAdviceRainLater =>
      'Риск дождя сегодня увеличится, поэтому перенесите мероприятия в помещении на вторую половину дня.';

  @override
  String get weatherAdviceWindBeach =>
      'Сегодня ветер может сделать отдых на пляже или на лодке менее комфортным.';

  @override
  String get weatherAdviceGreatSunset =>
      'Сегодня вечером отличные условия на закате — подумайте об ужине на крыше или прогулке по озеру.';

  @override
  String get weatherAdviceDefault =>
      'Небо выглядит управляемым — следуйте своему плану и держите под рукой легкий слой.';

  @override
  String weatherSunsetRecRooftop(String time) {
    return 'Рядом с $time ясное небо. Возможно, вам удастся поужинать на крыше или прогуляться по озеру.';
  }

  @override
  String get weatherPackSunscreen => 'солнцезащитный крем';

  @override
  String get weatherPackSunglasses => 'Солнцезащитные очки';

  @override
  String get weatherPackUmbrella => 'Зонтик';

  @override
  String get weatherPackLightJacket => 'Легкая куртка';

  @override
  String get weatherPackShoes => 'Удобная обувь';

  @override
  String get weatherPackWater => 'Бутылка с водой';

  @override
  String get weatherPackHat => 'Шляпа';

  @override
  String get weatherPackPoncho => 'Пончо';

  @override
  String get weatherPackSwimwear => 'Купальники';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return 'Риск дождя возрастает через $time. Рассмотрите возможность перемещения $outdoorStop раньше и сохранения $indoorStop на более позднее время.';
  }

  @override
  String weatherImpactHeat(String time) {
    return 'В полдень сильная жара — планируйте прогулки на свежем воздухе до $time.';
  }

  @override
  String get weatherImpactClear =>
      'Этим утром небо выглядит дружелюбным для ваших планов на свежем воздухе.';

  @override
  String weatherImpactMixed(int count) {
    return 'Сегодня может потребоваться корректировка времени для остановок на открытом воздухе ($count).';
  }

  @override
  String get weatherImpactNoPlanRain =>
      'Идет дождь — сначала постройте свой день с помощью внутренних якорей.';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return 'Лучшее наружное окно выглядит так: $start–$end до наступления жары или дождя.';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      'Погода выглядит стабильной — нажмите «Спланировать день», когда будете готовы сделать последовательные остановки.';

  @override
  String get weatherImpactIndoorFallback => 'спа или музей';

  @override
  String get hotelIntelBadge => 'ОТЕЛЬ ИНТЕЛЛЕКТ';

  @override
  String get hotelIntelTitle => 'Найдите свою домашнюю базу';

  @override
  String get hotelIntelSubtitle =>
      'В зависимости от поездки, которую вы хотите совершить, Luxora подбирает варианты проживания, которые формируют ваш день, а не сетку бронирования.';

  @override
  String get hotelDiscoveryTitle => 'Куратор для Орландо';

  @override
  String get hotelMatchmakerTeaser =>
      'Расскажите Луксоре о своем стиле поездки и получите три пребывания, выбранных консьержем, с честными компромиссами.';

  @override
  String get hotelMatchmakerCta => 'AI Отель Сваха';

  @override
  String get hotelMatchmakerTitle => 'Отель Сваха';

  @override
  String get hotelMatchmakerSubtitle =>
      'Расскажите, как вы путешествуете: Луксора рекомендует, где лучше провести свой день.';

  @override
  String get hotelMatchmakerRun => 'Найдите мои 3 лучших варианта проживания';

  @override
  String get hotelMatchBudget => 'Бюджетная зона комфорта';

  @override
  String get hotelMatchTravelers => 'Путешественники';

  @override
  String get hotelMatchAdults => 'Взрослые';

  @override
  String get hotelMatchKids => 'Дети';

  @override
  String get hotelMatchAttractions => 'Достопримечательности в вашем списке';

  @override
  String get hotelMatchLuxuryLevel => 'Желаемый уровень роскоши';

  @override
  String get hotelMatchTransport => 'Передвижение';

  @override
  String get hotelTransportCar => 'Прокат автомобилей';

  @override
  String get hotelTransportRideshare => 'Райдшеринг';

  @override
  String get hotelTransportShuttle => 'Трансфер до курорта';

  @override
  String get hotelTransportWalkable => 'Пешеходный район';

  @override
  String get hotelMatchResultsTitle => 'Ваши лучшие 3 матча';

  @override
  String hotelMatchWhyTitle(int score) {
    return 'Счет матча $score';
  }

  @override
  String get hotelMatchBestForLabel => 'Лучше всего для:';

  @override
  String get hotelMatchItineraryLabel => 'Маршрут:';

  @override
  String get hotelMatchTradeoffsLabel => 'Компромиссы:';

  @override
  String get hotelMatchNearbyLabel => 'Рядом:';

  @override
  String get hotelLuxoraScore => 'Луксора';

  @override
  String get hotelHomeBaseBadge => 'ДОМАШНЯЯ БАЗА';

  @override
  String get hotelScoreLuxury => 'Роскошь';

  @override
  String get hotelScoreFamily => 'Семья';

  @override
  String get hotelScoreRomance => 'Романтика';

  @override
  String get hotelScoreWalkability => 'Ходить';

  @override
  String get hotelWhyRecommendTitle => 'Почему Луксора рекомендует это';

  @override
  String get hotelItineraryImpactTitle => 'Как это формирует ваши дни';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return 'Неровный выезд из хаба: $driveTime. Оценка трения при движении: $friction/90 (чем ниже, тем спокойнее).';
  }

  @override
  String get hotelAddHomeBase => 'Добавить в качестве домашней базы';

  @override
  String get hotelHomeBaseActive => 'Домашняя база активна';

  @override
  String get hotelViewOnMap => 'Посмотреть на карте';

  @override
  String get hotelGetDirections => 'Проложить маршрут';

  @override
  String get hotelCheckRates => 'Проверить тарифы';

  @override
  String get hotelVisitWebsite => 'Посетите веб-сайт';

  @override
  String get hotelLinkUnavailable =>
      'Ссылка на бронирование для этого отеля пока недоступна.';

  @override
  String get hotelLinkOpenFailed =>
      'Не удалось открыть ссылку — попробуйте снова в браузере.';

  @override
  String get hotelSave => 'Сохранить отель';

  @override
  String get hotelSaved => 'Сохранено';

  @override
  String get hotelDistanceTitle => 'Расстояние до ключевых точек';

  @override
  String get hotelCompareTitle => 'Сравнить проживание';

  @override
  String get hotelCompareSubtitle => 'Бок о бок консьержа — до трех отелей.';

  @override
  String hotelCompareSelected(int count) {
    return '$count выбрано';
  }

  @override
  String get hotelComparePrice => 'Ценовой диапазон';

  @override
  String get hotelCompareDriveImpact => 'Увеличьте влияние';

  @override
  String get hotelCompareNearby => 'Достопримечательности поблизости';

  @override
  String get hotelPriceBudget => 'Бюджет';

  @override
  String get hotelPriceModerate => 'Умеренный';

  @override
  String get hotelPriceUpscale => 'высококлассный';

  @override
  String get hotelPriceLuxury => 'Роскошь';

  @override
  String get hotelTagCouples => 'Лучшее для пар';

  @override
  String get hotelTagDisney => 'Лучшее для Диснея';

  @override
  String get hotelTagUniversal => 'Лучшее для универсального';

  @override
  String get hotelTagLuxuryStaycation => 'Роскошный отдых';

  @override
  String get hotelTagFamily => 'Для семейного отдыха';

  @override
  String get hotelTagQuiet => 'Тихий побег';

  @override
  String get hotelTagWalkableDining => 'Прогулочная столовая';

  @override
  String get hotelTagResort => 'Курортная атмосфера';

  @override
  String get hotelTagBudget => 'Бюджетно';

  @override
  String get hotelReasonMatchesMood =>
      'Соответствует настроению и темпу вашего путешествия.';

  @override
  String get hotelReasonCloseStops =>
      'Рядом с запланированными остановками на вашей временной шкале.';

  @override
  String hotelReasonSavesDrive(String time) {
    return 'Экономит время в пути по сравнению с обычным хабом — примерно $time от центра.';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return 'Соответствует зоне комфорта $range, не переплачивая при выборе не того курорта.';
  }

  @override
  String get hotelReasonBetterGroup =>
      'Лучше подходит для вашего типа группы и уровня энергии.';

  @override
  String get hotelReasonNearbyDining =>
      'Хороший ресторан неподалеку для непринужденных вечеров.';

  @override
  String get hotelReasonLowStress =>
      'Курортное спокойствие — меньше логистики, больше отдыха.';

  @override
  String get hotelMatchAttractionsGeneral =>
      'ваши запланированные достопримечательности';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return 'Учитывая ваш маршрут $attractions, $hotel сокращает время в пути и делает вечера легкими.';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$hotel в $neighborhood соответствует вашим ожиданиям от этой поездки.';
  }

  @override
  String get hotelMatchBestForFamily =>
      'Семьи, которые хотят провести дни у бассейна, не жертвуя при этом доступом в парк.';

  @override
  String get hotelMatchBestForCouple =>
      'Пары, которым нужна романтика без хаоса в тематических парках.';

  @override
  String get hotelMatchBestForGroup =>
      'Группы, сочетающие комфорт, доступ и спокойную логистику.';

  @override
  String hotelMatchImpactDisney(String time) {
    return 'Более короткие пробеги Диснея — примерно $time до парков от вашей двери.';
  }

  @override
  String get hotelMatchImpactUniversal =>
      'Льготы Universal Express или доступ к водному такси могут сэкономить часы вашего дня.';

  @override
  String get hotelMatchImpactWalkable =>
      'Ходите на ужин пешком — меньше стресса при парковке после долгих дней в парке.';

  @override
  String hotelMatchImpactDefault(String time) {
    return 'Среднее количество поездок сохраняется примерно в $time, поэтому ваш дневной поток остается спокойным.';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget =>
      'Курортные цены премиум-класса — тратьте больше на номер, меньше на другое место.';

  @override
  String get hotelMatchTradeoffCarNeeded =>
      'Вы будете полагаться на автомобиль или компанию, а не на вездеходную базу.';

  @override
  String get hotelMatchTradeoffLessFamily =>
      'Меньше внимания уделяется удобствам, ориентированным на детей, чем специализированным семейным курортам.';

  @override
  String get hotelMatchTradeoffLessRomantic =>
      'Больше энергии в тематическом парке, чем в тихом уединении для пар.';

  @override
  String get hotelMatchTradeoffDefault =>
      'У каждого пребывания есть свои компромиссы — Луксора выбрала это в первую очередь для своих приоритетов.';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return 'Рестораны и впечатления от $neighborhood.';
  }

  @override
  String get mapHotelIntelBannerTitle => 'Выберите правильную базу';

  @override
  String get mapHotelIntelBannerBody =>
      'Ваш отель определяет время поездки, дневной поток и то, где вы едите. Luxora поможет вам сделать выбор без давления на бронирование.';

  @override
  String get mapHotelIntelBannerCta => 'Изучите информацию об отеле';

  @override
  String get sponsorLuxoraRecommended => 'Луксора Рекомендуем';

  @override
  String get sponsorBadgeFeaturedPartner => 'Рекомендуемый партнер';

  @override
  String get sponsorBadgeSponsored => 'Спонсор';

  @override
  String get sponsorBadgePromoted => 'Продвинутый';

  @override
  String get sponsorBadgePartnerOffer => 'Партнерское предложение';

  @override
  String get sponsorCtaVisitWebsite => 'Посетите веб-сайт';

  @override
  String get sponsorCtaBookNow => 'Забронируйте сейчас';

  @override
  String get sponsorCtaCheckRates => 'Проверить тарифы';

  @override
  String get sponsorCtaGetTickets => 'Получить билеты';

  @override
  String get sponsorCtaViewOffer => 'Посмотреть предложение';

  @override
  String get featuredStaysTitle => 'Рекомендуемые пребывания';

  @override
  String get featuredStaysSubtitle =>
      'Размещение партнеров — отдельно от результатов органических матчей отелей Luxora.';

  @override
  String get featuredExperiencesTitle => 'Рекомендуемые впечатления';

  @override
  String get featuredExperiencesSubtitle =>
      'Продвигаемые варианты под ваше настроение — всегда помечены, а не замаскированы под ранг ИИ.';

  @override
  String get featuredDiningTitle => 'Рекомендуемые рестораны';

  @override
  String get featuredDiningSubtitle =>
      'Рестораны-партнеры Luxora подчеркивают: ваш список органических драгоценных камней остается независимым.';

  @override
  String get featuredTicketPartnersTitle =>
      'Рекомендуемые партнеры по продаже билетов';

  @override
  String get featuredTicketPartnersSubtitle =>
      'Предложения авторизованных партнеров — сравните с органической экономией ниже.';

  @override
  String get featuredCityHomeTitle => 'Рекомендуемые партнеры';

  @override
  String get featuredCityHomeSubtitle =>
      'Полезные варианты партнеров для Орландо — четко обозначены и никогда не скрываются от выбора ИИ.';

  @override
  String get dayFlowVibeFoodie => 'Гурманин-форвард';

  @override
  String get dayFlowVibeNightlife => 'Ночная жизнь';

  @override
  String get dayFlowVibePoolside => 'У бассейна';

  @override
  String get dayFlowVibeAdventure => 'авантюрный';

  @override
  String get dayFlowVibeCulture => 'Культура';

  @override
  String get onboardStep5Title => 'Сердце Луксоры';

  @override
  String get onboardStep5Subtitle =>
      'Какими вы хотите ЧУВСТВОВАТЬ эту поездку?';

  @override
  String get onboardTripFeelHint =>
      'Ужины на закате, медленное утро, смех с моим партнером…';

  @override
  String get moodRomantic => 'Романтический';

  @override
  String get moodRelaxing => 'Расслабляющий';

  @override
  String get moodAdventurous => 'авантюрный';

  @override
  String get moodLuxurious => 'Роскошный';

  @override
  String get moodFamily => 'Семейные связи';

  @override
  String get moodSocial => 'Социальные';

  @override
  String get moodNature => 'Ориентированный на природу';

  @override
  String get moodWellness => 'Оздоровительный отдых';

  @override
  String get moodFoodie => 'Опыт гурмана';

  @override
  String get catHiddenGems => 'Скрытые драгоценные камни';

  @override
  String get catLuxuryStay => 'Роскошный отдых';

  @override
  String get catBeaches => 'Пляжи';

  @override
  String get catRooftop => 'Ресторан на крыше';

  @override
  String get catSpas => 'Спа';

  @override
  String get catNightlife => 'Ночная жизнь';

  @override
  String get catFamily => 'Семья';

  @override
  String get catEco => 'Эко туризм';

  @override
  String get catThemeParks => 'Тематические парки';

  @override
  String get catRomantic => 'Романтический отдых';

  @override
  String get catFood => 'Еда опыт';

  @override
  String get catSprings => 'Пружины';

  @override
  String get catIslands => 'Путешествие по островам';

  @override
  String get catInfluencer => 'Достойный влиятельного лица';

  @override
  String get placeCatBeach => 'Пляж';

  @override
  String get placeCatDining => 'Столовая';

  @override
  String get placeCatNature => 'Природа';

  @override
  String get placeCatNightlife => 'Ночная жизнь';

  @override
  String get placeCatWellness => 'Велнес';

  @override
  String get placeCatFamily => 'Семья';

  @override
  String get placeCatSprings => 'Пружины';

  @override
  String get placeCatRomantic => 'Романтический';

  @override
  String get placeCatAdventure => 'Приключение';

  @override
  String get placeCatHotel => 'Отель';

  @override
  String get styleLessCrowded => 'Менее многолюдно';

  @override
  String get styleLuxurySubtle => 'Роскошный, но не кричащий';

  @override
  String get styleHiddenLuxury => 'Скрытая роскошь';

  @override
  String get styleWalkable => 'Проходимость, когда это возможно';

  @override
  String get styleSlowMornings => 'Медленное утро';

  @override
  String get styleNoTraps => 'Никаких туристических ловушек';

  @override
  String get styleNatureHeavy => 'Природа тяжелая';

  @override
  String get styleNatureWellness => 'Только природа + велнес';

  @override
  String get styleAestheticDining => 'Эстетическая столовая';

  @override
  String get styleFamilyEasy => 'Удобная для всей семьи логистика';

  @override
  String get paywallHeroEyebrow => 'ВАШ ЛИЧНЫЙ КОНСЬЕРЖ';

  @override
  String get paywallHeroHeadline => 'НЕ ПОТЕРЯЙТЕ СВОЙ ОТПУСК';

  @override
  String get paywallHeroSubheadline =>
      'Луксора планирует поездку так, чтобы вы получили от нее удовольствие.';

  @override
  String get paywallEmotionalLine =>
      'Вы уже тратите тысячи на отпуск. Не оставляйте этот опыт на волю случая.';

  @override
  String paywallHeadlineCouples(String cityName) {
    return 'Ваш идеальный отдых в $cityName начинается здесь.';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return 'Тратьте меньше времени на планирование и больше времени на воспоминания о городе $cityName.';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return 'Откройте для себя $cityName по-другому.';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return 'Откройте для себя $cityName, который большинство туристов никогда не видят.';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return 'Попробуйте $cityName как местный инсайдер.';
  }

  @override
  String get paywallWhatYouUnlock => 'Что вы открываете';

  @override
  String get paywallFeatureAiConcierge => 'ИИ-консьерж';

  @override
  String get paywallFeatureItineraries => 'Персонализированные маршруты';

  @override
  String get paywallFeatureHiddenGems => 'Скрытые сокровища';

  @override
  String get paywallFeatureHotelIntel => 'Отель Интеллект';

  @override
  String get paywallFeatureTicketSavings => 'Умная экономия на билетах';

  @override
  String get paywallFeatureWeatherConcierge => 'Погода Консьерж';

  @override
  String get paywallFeatureCrowdIntel => 'Интеллект толпы';

  @override
  String get paywallFeatureGpsNav => 'GPS-навигация';

  @override
  String get paywallFeatureLocalSecrets => 'Местные тайны';

  @override
  String get paywallFeatureDining => 'Рекомендации по питанию';

  @override
  String get paywallFeatureUnlimitedPlanning =>
      'Неограниченное городское планирование';

  @override
  String get paywallWhyTravelersUnlock =>
      'Почему путешественники открывают Луксору';

  @override
  String get paywallBenefitSaveTimeTitle => 'Экономьте время';

  @override
  String get paywallBenefitSaveTimeBody =>
      'Пропустите часы исследований и планирования.';

  @override
  String get paywallBenefitSaveMoneyTitle => 'Экономьте деньги';

  @override
  String get paywallBenefitSaveMoneyBody =>
      'Откройте для себя экономию на билетах, местные предложения и более разумный выбор.';

  @override
  String get paywallBenefitAvoidTrapsTitle => 'Избегайте туристических ловушек';

  @override
  String get paywallBenefitAvoidTrapsBody =>
      'Найдите впечатления, которые действительно рекомендуют местные жители.';

  @override
  String get paywallBenefitTravelSmarterTitle => 'Путешествуйте разумнее';

  @override
  String get paywallBenefitTravelSmarterBody =>
      'Получайте рекомендации с учетом погоды, количества людей и стиля вашей поездки.';

  @override
  String get paywallLockedPreviewTitle => 'Ожидание внутри вашего консьержа';

  @override
  String get paywallLockedPreviewSubtitle =>
      'Разблокируйте, чтобы открыть маршруты и секреты, адаптированные к вашему путешествию.';

  @override
  String get paywallLockedDateNight =>
      'Романтические маршруты для свиданий и ночных свиданий';

  @override
  String get paywallLockedHiddenLuxury => 'Скрытые роскошные впечатления';

  @override
  String get paywallLockedVipSecrets => 'VIP-местные секреты';

  @override
  String get paywallLockedConciergeRecs => 'Рекомендации консьержа';

  @override
  String get paywallLockedFamilyPlans => 'Семейные планы без стресса';

  @override
  String get paywallLockedWeatherReroute =>
      'Изменение маршрута с учетом погоды';

  @override
  String get paywallLockedHotelMatchmaker => 'Смарт Отель Сваха';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return 'Разблокируйте консьержа $cityName';
  }

  @override
  String get paywallOneTimePurchase => 'Разовая покупка';

  @override
  String get paywallNoSubscription => 'Нет подписки';

  @override
  String get paywallNoMonthlyFees => 'Никаких ежемесячных платежей';

  @override
  String paywallLifetimeAccess(String cityName) {
    return 'Пожизненный доступ к городу $cityName';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return 'Будущие обновления для города $cityName включены';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return 'Большинство отпусков в городе $cityName стоят $minUsd–$maxUsd+.';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price Один раз';
  }

  @override
  String get paywallLessThanDinner =>
      'Меньше, чем стоимость праздничного ужина.';

  @override
  String get paywallSocialProofTitle => 'Путешественники, открывшие Луксору';

  @override
  String get paywallReview1 => '«Сэкономили нам часы планирования».';

  @override
  String get paywallReview2 =>
      '«Нашли места, которые мы никогда бы не открыли».';

  @override
  String get paywallReview3 =>
      '«Одни только скрытые драгоценные камни того стоят».';

  @override
  String paywallCtaUnlock(String cityName) {
    return 'Разблокируйте консьержа $cityName';
  }

  @override
  String get paywallContinueExploring => 'Продолжить исследование';

  @override
  String get paywallConciergePromise =>
      'Разовая покупка · Личный консьерж · Без подписки';

  @override
  String get settingsUnlockConciergeTitle =>
      'Разблокировать городского консьержа';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'Одноразовый городской пакет — не подписка';

  @override
  String get settingsOpenConciergeSubtitle => 'Открыть вкладку ИИ-консьержа';

  @override
  String get weatherMiamiHumidityIndoor =>
      'Сегодня высокая влажность. Сходите на пляж или в бассейн раньше, а затем в Уинвуд или Брикелл, чтобы пообедать в помещении и в галереях в самые жаркие часы.';

  @override
  String get weatherMiamiHeatAdvisory =>
      'Рекомендуемые условия жары — легкие ткани, увлажнение и перерывы в тени между остановками на открытом воздухе.';

  @override
  String get weatherMiamiBeachMorning =>
      'Сильный ультрафиолет на песке — солнцезащитный крем, шляпа и пляж до полудня.';

  @override
  String get weatherMiamiBoatWind =>
      'Ветер сильный — пересмотрите занятия на лодке или яхте; Ресторан на крыше все еще может работать.';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return 'Впереди дождливое окно — поменяйте планы на открытом воздухе на $indoorSpot или время галереи.';
  }

  @override
  String get weatherMiamiSunsetWaterfront =>
      'Закат выглядит сильным — на набережной или на крыше с видом с востока на запад.';

  @override
  String get miamiBeachIntelTitle => 'Пляжная разведка';

  @override
  String miamiBeachBestTime(String time) {
    return 'Лучшее время: $time';
  }

  @override
  String get miamiBeachFamilyScore => 'Семья';

  @override
  String get miamiBeachCrowdScore => 'Толпа';

  @override
  String get miamiBeachPhotoScore => 'Фото';

  @override
  String get miamiBeachRomanceScore => 'Романтика';

  @override
  String get miamiBeachSunsetScore => 'Закат';

  @override
  String miamiBeachParking(String level) {
    return 'Парковка: $level';
  }

  @override
  String get miamiNightlifeTitle => 'Ночная жизнь Консьерж';

  @override
  String miamiNightlifeDressCode(String code) {
    return 'Дресс-код: $code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return 'Лучшее прибытие: $time';
  }

  @override
  String get miamiNightlifeReservation => 'Рекомендуется бронирование';

  @override
  String get miamiMoodRoutesTitle => 'Маршруты настроения Майами';

  @override
  String miamiMoodRouteStart(String time) {
    return 'Начало около $time';
  }

  @override
  String get keysWaterIntelTitle => 'Водная аналитика Кис';

  @override
  String keysWaterBestTime(String time) {
    return 'Лучшее окно: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'Вода: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'Снорклинг';

  @override
  String get keysWaterDivingScore => 'Дайвинг';

  @override
  String get keysWaterBoatingScore => 'Лодка';

  @override
  String get keysWaterFishingScore => 'Рыбалка';

  @override
  String get keysWaterWindScore => 'Ветер';

  @override
  String get keysWaterSunsetScore => 'Закат';

  @override
  String get keysWaterCrowdScore => 'Люди';

  @override
  String get keysMoodRoutesTitle => 'Островные маршруты Кис';

  @override
  String keysMoodRouteStart(String time) {
    return 'Старт $time';
  }

  @override
  String get paywallHeadlineMiamiDefault => 'ОПЫТ МАЙАМИ ПО-РАЗНОМУ';

  @override
  String get paywallHeadlineMiamiWeekend =>
      'НЕ ПОТЕРЯЙТЕ СВОИ ВЫХОДНЫЕ В МАЙАМИ';

  @override
  String get paywallOrlandoAddonsHeading => 'Пакет тематических парков';

  @override
  String get paywallOrlandoBaseIncludes =>
      'Orlando включает рестораны, скрытые жемчужины, отели и впечатления вне парков. Добавьте пакет парков для Disney и Universal вместе.';

  @override
  String get paywallAddonThemeParksTitle => 'Пакет Disney и Universal';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World и Universal Orlando — все парки, предложения, маршруты и intel толпы в одной покупке.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return 'Разблокировать $packName · $price';
  }

  @override
  String get paywallAddonUnlocked => 'Разблокировано';

  @override
  String get paywallAddonRequiresOrlando =>
      'Сначала нужен разблокировщик Orlando';

  @override
  String paywallUnlockAddonPack(String packName) {
    return 'Разблокировать $packName';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return 'Разблокировать $packName';
  }

  @override
  String get orlandoThemeParksPromptTitle =>
      'Разблокировать Disney и Universal для Орlando?';

  @override
  String get orlandoThemeParksPromptBody =>
      'Добавьте пакет парков для Walt Disney World и Universal Orlando — все парки, билетные предложения, маршруты и intel по толпам в одной разблокировке.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'Разблокировать · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'Не сейчас';
}
