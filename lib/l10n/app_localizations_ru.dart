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
  String get commonClose => 'Закрывать';

  @override
  String get navConcierge => 'Консьерж';

  @override
  String get navTimeline => 'Хронология';

  @override
  String get navMap => 'Карта';

  @override
  String get navGems => 'Драгоценные камни';

  @override
  String get navFeed => 'Кормить';

  @override
  String get navTrips => 'Путешествия';

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
  String get discoverSearchScopeAll => 'Поиск по всей Флориде в каталоге.';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'В пределах $radius от Орландо';
  }

  @override
  String get discoverSearchEmpty =>
      'В этом радиусе нет совпадений — попробуйте более короткое имя, увеличьте метку расстояния на карте или в ленте или выполните поиск по словам «пляж», «Дисней» или «источники».';

  @override
  String get discoverPopularInRadius => 'Популярно в вашем радиусе';

  @override
  String get discoverTrySearching => 'Попробуйте поискать';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return 'Направления: $count · в пределах $radius от Орландо';
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
  String get feedBadge => 'ЖИВОЕ ОТКРЫТИЕ';

  @override
  String get feedTitle => 'Лента опыта';

  @override
  String get feedSubtitle =>
      'Что происходит сейчас — популярные места, новые вакансии, выбор авторов, сезонные маршруты и постоянные обновления.';

  @override
  String get feedPillTrending => 'Тенденции';

  @override
  String get feedPillNewOpenings => 'Новые открытия';

  @override
  String get feedPillCreator => 'Выбор автора';

  @override
  String get feedPillLive => 'Живые обновления';

  @override
  String get feedEmptyHint =>
      'В этом радиусе нет карточек с фидами — попробуйте 50 миль или всю Флориду, чтобы увидеть побережье Мексиканского залива и основные моменты Киса.';

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
  String get mapAiPowers => 'Силы карты ИИ';

  @override
  String get mapNavLayerTitle => 'Слой навигации AI (следующий)';

  @override
  String get mapNavLayerSubtitle =>
      'Помимо открытий — живая информация о том, стоит ли останавливаться прямо сейчас.';

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
  String get mapFutureCrowdTitle => 'Живая толпа, жара';

  @override
  String get mapFutureCrowdDesc =>
      'Плотность источников, парков и вирусных крыш в реальном времени — стоит ли оно того прямо сейчас?';

  @override
  String get mapFutureParkingTitle => 'Сложность парковки';

  @override
  String get mapFutureParkingDesc =>
      'Оценка трения перед совершением сделки — золотая середина для парковщика, гаража или совместного использования автомобилей.';

  @override
  String get mapFutureTrafficTitle => 'Оценка трения привода';

  @override
  String get mapFutureTrafficDesc =>
      'Маршрутизация с учетом стресса — не просто минуты, а то, как будет ощущаться поездка.';

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
  String get detailPrice => 'Цена';

  @override
  String get detailLocation => 'Расположение';

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
  String get onboardStep2Title => 'Время чувствовать себя свободным';

  @override
  String get onboardStep2Subtitle => 'Когда начнется твой побег?';

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
}
