// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => '설정';

  @override
  String get appearance => '모습';

  @override
  String get settingsThemeIntro => '시네마틱 다크 또는 리조트 라이트 — 여행 분위기를 선택하세요.';

  @override
  String get settingsThemeLabel => '테마';

  @override
  String get themeGoldenEmber => 'Golden Ember';

  @override
  String get themeGoldenEmberMood => '따뜻한 울트라 럭셔리';

  @override
  String get themeMidnightAmethyst => 'Midnight Amethyst';

  @override
  String get themeMidnightAmethystMood => '신비롭고 독점적인';

  @override
  String get themeEmeraldHaven => 'Emerald Haven';

  @override
  String get themeEmeraldHavenMood => '고요한 열대 럭셔리';

  @override
  String get themeRivieraWhite => 'Riviera White';

  @override
  String get themeRivieraWhiteMood => '우아한 럭셔리 여행 매거진';

  @override
  String get themeCoastalGlass => 'Coastal Glass';

  @override
  String get themeCoastalGlassMood => '깔끔한 프리미엄 휴양 에너지';

  @override
  String get themeChampagneLuxe => 'Champagne Luxe';

  @override
  String get themeChampagneLuxeMood => '프라이빗 컨시어지 우아함';

  @override
  String get themeBlackCard => 'Black Card';

  @override
  String get themeBlackCardMood => '프라이빗 항공의 위엄';

  @override
  String get settingsThemeSectionLuxury => '럭셔리 시네마틱';

  @override
  String get settingsThemeSectionReadable => '깨끗하고 읽기 쉽습니다.';

  @override
  String get settingsMapSkinSection => '지도 베이스맵';

  @override
  String get settingsMapSkinIntro => '지도 탭의 타일 모양을 선택하세요.';

  @override
  String get mapSkinVoyager => 'Voyager';

  @override
  String get mapSkinVoyagerMood => '부드러운 색 — 공원, 물, 도로';

  @override
  String get mapSkinOsm => 'OpenStreetMap';

  @override
  String get mapSkinOsmMood => '클래식, 자연스러운 톤';

  @override
  String get mapSkinCartoLight => 'Carto Light';

  @override
  String get mapSkinCartoLightMood => '미니멀하고 밝음';

  @override
  String get mapSkinCartoDark => 'Carto Dark';

  @override
  String get mapSkinCartoDarkMood => '야간 친화 베이스맵';

  @override
  String get mapSkinMapboxStreets => 'Mapbox Streets';

  @override
  String get mapSkinMapboxStreetsMood => '풍부한 디테일, 여행 앱 느낌';

  @override
  String get mapSkinMapboxOutdoors => 'Mapbox Outdoors';

  @override
  String get mapSkinMapboxOutdoorsMood => '녹색과 지형 강조';

  @override
  String get dark_mode => '다크 모드';

  @override
  String get light_mode => '라이트 모드';

  @override
  String get language => '언어';

  @override
  String get settings_language_picker_note => '변경사항은 즉시 적용됩니다.';

  @override
  String get settings_regions_coming_title => '국가 및 도시';

  @override
  String get settings_regions_coming_subtitle => '홈 허브와 시티 팩이 곧 출시됩니다.';

  @override
  String get commonSoon => '곧';

  @override
  String get commonContinue => '계속하다';

  @override
  String get commonNew => '새로운';

  @override
  String get commonRoadmap => '로드맵';

  @override
  String get commonLive => '살다';

  @override
  String get commonClose => '닫다';

  @override
  String get commonCancel => '취소';

  @override
  String get commonDelete => '삭제';

  @override
  String get settingsStartOverSubtitle => '처음부터 새로운 여행을 시작해보세요';

  @override
  String get navConcierge => '관리인';

  @override
  String get navAgenda => '오늘';

  @override
  String get navDiscover => '발견하다';

  @override
  String get navMap => '지도';

  @override
  String get navTrips => '여행';

  @override
  String get navMore => '더';

  @override
  String get navRestaurants => '레스토랑';

  @override
  String get navTimeline => '타임라인';

  @override
  String get agendaTabItinerary => '날';

  @override
  String get agendaTabRestaurants => '레스토랑';

  @override
  String get restaurantsPageTitle => '레스토랑';

  @override
  String get restaurantsPageSubtitle =>
      'Luxora가 아는 식사를 찾아보세요. 즐겨찾기를 저장하거나 컨시어지가 오늘 밤 식사를 선택하도록 하세요.';

  @override
  String get restaurantsConciergePick => '나를 위해 레스토랑을 골라주세요';

  @override
  String restaurantsConciergePickDone(String name) {
    return '$name님을 저장했습니다. 컨시어지에게 여행에 추가해 달라고 요청하세요.';
  }

  @override
  String restaurantsSavedCount(int count) {
    return '여행을 위해 $count가 절약되었습니다';
  }

  @override
  String get restaurantsEmptyHint => '검색 반경에 레스토랑이 없습니다. 지도에서 반경을 넓혀보세요.';

  @override
  String get moreCardRestaurantsSub => '식사를 둘러보고 컨시어지가 골라드립니다.';

  @override
  String get agendaHotelSuggestionsTitle => '머무를 곳';

  @override
  String agendaHotelSuggestionsSubtitle(int budget) {
    return '귀하의 ~$budget USD 여행 예산에 맞춰 AI가 매칭됩니다. 모든 옵션을 보려면 탭하세요.';
  }

  @override
  String agendaHotelTopPick(String name) {
    return '최고 선택: $name';
  }

  @override
  String get agendaStayDropdownHint => '호텔을 선택하세요';

  @override
  String get agendaDiningDropdownHint => '레스토랑을 선택하세요';

  @override
  String get agendaDaySelectLabel => '어느 날';

  @override
  String get agendaDayDiningTitle => '오늘 밤에 먹을 곳';

  @override
  String agendaDayDiningSubtitle(int budget, String tier) {
    return '오늘의 계획을 기준으로 ~$budget USD 예산($tier 식사)에 대한 제안입니다.';
  }

  @override
  String get agendaDiningNearStops => '오늘 정류장 근처';

  @override
  String get agendaDiningFitsBudget => '여행 예산에 맞는';

  @override
  String get agendaDiningMatchesDay => '오늘 분위기에 딱 맞는';

  @override
  String get agendaDiningFoodiePick => '미식가가 좋아하는';

  @override
  String get browseCatRecommended => '추천';

  @override
  String get browseCatDisneyHotels => '디즈니 지역';

  @override
  String get browseCatBudgetFriendly => '예산 친화적';

  @override
  String get browseCatUpscaleLuxury => '고급스럽고 럭셔리한';

  @override
  String get browseCatUniversalHotels => '유니버설 에어리어';

  @override
  String get browseCatThemeParkDining => '테마파크 다이닝';

  @override
  String get browseCatUpscaleDining => '고급스럽고 고급스러운 식사';

  @override
  String get browseSearchAllHotels => '전체 호텔 카탈로그를 검색해 보세요…';

  @override
  String get browseSearchAllRestaurants => '전체 레스토랑 카탈로그를 검색해 보세요…';

  @override
  String get browseCategoryEmpty =>
      '이 카테고리에는 귀하의 반경과 일치하는 항목이 없습니다. 검색을 시도하거나 검색 범위를 넓혀보세요.';

  @override
  String get browseFullCatalogHint =>
      '전체 카탈로그를 보려면 위에서 검색하세요. Luxora가 알고 있는 모든 호텔과 레스토랑이 있습니다.';

  @override
  String get agendaPageSubtitle => '나는 지금 무엇을 하고 있는 걸까?';

  @override
  String get navGems => '보석';

  @override
  String get navFeed => '밥을 먹이다';

  @override
  String get navTicketSavings => '저금';

  @override
  String get navStays => '숙박';

  @override
  String get morePageTitle => '더';

  @override
  String get morePageSubtitle => '여행 도구, 계정, 기본 설정 — 차분한 액세스를 위해 선별되었습니다.';

  @override
  String get moreSectionTravelTools => '여행 도구';

  @override
  String get moreSectionAccount => '계정';

  @override
  String get moreSectionApp => '앱';

  @override
  String get moreCardHotelsSub => '당신의 기분에 맞춰 지능적인 숙박을 제공합니다.';

  @override
  String get moreCardGemsSub => '내부자 발견 현지인 경비';

  @override
  String get moreCardTicketsSub => '공인 파트너 절감액 비교';

  @override
  String get moreCardWeatherSub => '일기예보를 고려한 요일 안내';

  @override
  String get moreCardProfileTitle => '여행 프로필';

  @override
  String get moreCardProfileSub => '여행하는 사람은 어떤 느낌이어야 할까요?';

  @override
  String get moreCardFavoritesSub => '북마크한 목적지';

  @override
  String get moreCardNotificationsTitle => '알림';

  @override
  String get moreCardNotificationsSub => '여행 알림 및 컨시어지 업데이트';

  @override
  String get moreCardSettingsSub => '테마, 시티팩, 환경설정';

  @override
  String get moreCardAboutSub => '우리가 Luxora를 구축하는 이유';

  @override
  String get moreCardHelpSub => '가이드 및 컨시어지 지원';

  @override
  String get moreCardCityPacksSub => '목적지 컨시어지 잠금 해제';

  @override
  String get moreCardPartnersSub => '주요 파트너 경험';

  @override
  String get moreCardItinerarySub => '당신의 일상을 황금빛 탈출로';

  @override
  String get moreCardDiscoverSub => '인기 급상승 식사, 체험, 실시간 검색';

  @override
  String get savedFavoritesTitle => '저장된 즐겨찾기';

  @override
  String get savedFavoritesEmpty => '지도나 피드의 목적지를 북마크하세요. 여기에 표시됩니다.';

  @override
  String get helpCenterTitle => '도움말 센터';

  @override
  String get helpCenterBody =>
      '컨시어지 도움을 받으려면 support@luxora.ai로 이메일을 보내세요. 인앱 가이드가 곧 제공될 예정입니다.';

  @override
  String get notificationsComingSoon => '여행 알림은 향후 업데이트를 통해 제공될 예정입니다.';

  @override
  String get partnerOffersTitle => '파트너 제안';

  @override
  String get ticketSavingsTitle => '스마트 티켓 절약';

  @override
  String get ticketSavingsBadgeLabel => '프리미엄 절약';

  @override
  String get ticketSavingsSubtitle =>
      'Luxora는 공인 리셀러, 번들 및 프로모션을 제공하므로 귀하는 쿠폰 사이트가 아닌 고급 조언자처럼 느껴질 수 있습니다.';

  @override
  String ticketSavingsBadge(int percent) {
    return '$percent% 절약';
  }

  @override
  String get ticketOfficialPrice => '공식적인';

  @override
  String get ticketDiscountPrice => '룩소라 가격';

  @override
  String ticketSaveAmount(String amount) {
    return '$amount 절약';
  }

  @override
  String get ticketSaveAmountLabel => '저금';

  @override
  String ticketSavePerTicket(String amount) {
    return '티켓당 $amount를 절약할 수 있습니다.';
  }

  @override
  String ticketFamilySave(String amount) {
    return '예상 가족 절감액: $amount.';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return '예상 가족 절감액: $amount.';
  }

  @override
  String ticketSource(String source) {
    return '출처: $source';
  }

  @override
  String ticketExpires(String date) {
    return '$date까지 제공';
  }

  @override
  String get ticketBetterOption => 'Luxora는 더 나은 옵션을 찾았습니다.';

  @override
  String get ticketOverpaying => '게이트 가격을 초과 지불했을 수 있습니다.';

  @override
  String get ticketRecommendedSavings => '추천 할인 가능';

  @override
  String get ticketCalculatorTitle => '잠재적인 절감';

  @override
  String get ticketFilterLabel => '필터';

  @override
  String get ticketFilterAll => '모두';

  @override
  String get ticketFilterThemeParks => '테마파크';

  @override
  String get ticketFilterAttractions => '관광명소';

  @override
  String get ticketFilterTours => '투어';

  @override
  String get ticketFilterDining => '식사 경험';

  @override
  String get ticketFilterWaterParks => '워터파크';

  @override
  String get ticketFilterFamily => '가족 활동';

  @override
  String get ticketFilterEntertainment => '오락';

  @override
  String get ticketSortLabel => '정렬 기준';

  @override
  String get ticketSortHighestSavings => '최고의 절감 효과';

  @override
  String get ticketSortMostPopular => '가장 인기있는';

  @override
  String get ticketSortFamilyFriendly => '가족 친화적';

  @override
  String get ticketSortLuxury => '럭셔리한 경험';

  @override
  String get ticketSortClosest => '나에게 가장 가까운';

  @override
  String get ticketDealsSectionTitle => '승인된 거래';

  @override
  String ticketDealsPricesAsOf(String date) {
    return '$date 기준 가격';
  }

  @override
  String get ticketDealsRefreshFailed => '가격을 새로고침할 수 없습니다. 캐시된 거래를 표시합니다.';

  @override
  String get ticketDealsUpdating => '가격 업데이트 중…';

  @override
  String get ticketNoDeals => '이 필터에는 거래가 없습니다. 다른 카테고리를 시도해 보세요.';

  @override
  String get ticketConfidenceHigh => '높은 신뢰도';

  @override
  String get ticketConfidenceVerified => '검증된 리셀러';

  @override
  String get ticketConfidenceLimited => '제한된 시간';

  @override
  String get ticketAiInsightTitle => '룩소라 추천';

  @override
  String get ticketInsightDisneyPass =>
      '여행 일정에 따라 1일 티켓 대신 월트 디즈니 월드 3일 패스를 선택하면 가족이 약 120달러를 절약할 수 있습니다.';

  @override
  String get ticketInsightUniversalCombo =>
      '귀하의 계획에는 유니버설이 포함되어 있습니다. 대부분의 가족에게 2파크 티켓은 구매일보다 훨씬 빠릅니다.';

  @override
  String get ticketInsightSeaworldCombo =>
      '귀하의 경로에 있는 SeaWorld — Aquatica 콤보는 종종 두 개의 별도 입장권을 능가합니다.';

  @override
  String get ticketInsightGeneric =>
      'Luxora는 여행 일정에 맞춰 할인된 가격을 제공합니다. 게이트에서 구매하기 전에 비교해 보세요.';

  @override
  String get ticketInsightMiamiCulture =>
      '귀하의 계획에서 문화가 중단됩니다. Vizcaya 및 PAMM 파트너 제안은 이번 주에 게이트 가격보다 높을 수 있습니다.';

  @override
  String get ticketInsightMiamiEverglades =>
      '여행 일정에 포함된 에버글레이즈 데이 — 아침 에어보트 슬롯은 종종 주중에 더 저렴하게 운영됩니다.';

  @override
  String get ticketInsightMiamiWynwood =>
      '귀하의 경로에있는 Wynwood - 가이드 아트 워크가 워크업 부스 가격을 능가할 수 있습니다.';

  @override
  String get ticketItineraryMatchTitle => '여정 절약 확인';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => '관리인';

  @override
  String conciergeTripFeel(String feel) {
    return '여행 느낌: “$feel”';
  }

  @override
  String get conciergeWelcome =>
      '감성 지능이 뛰어난 플로리다의 동반자인 Luxora에 오신 것을 환영합니다.\n\n아래에서 프롬프트를 선택하거나 여행으로 만들고 싶은 느낌을 설명하세요.';

  @override
  String get conciergeQuickPrompts => '빠른 프롬프트';

  @override
  String get conciergeRemembering => '이번 여행의 추억';

  @override
  String get conciergeStyleMemory => '스타일 메모리';

  @override
  String get conciergeInputHint => '여행을 통해 만들고 싶은 느낌을 설명하세요.';

  @override
  String get conciergeGreetingMorning => '좋은 아침이에요.';

  @override
  String get conciergeGreetingAfternoon => '좋은 오후에요.';

  @override
  String get conciergeGreetingEvening => '좋은 저녁이에요.';

  @override
  String get conciergeWelcomeWarm =>
      '저는 명소에 대한 체크리스트가 아니라 여러분이 느끼고 싶은 대로 플로리다를 형성하기 위해 왔습니다. 오늘 당신은 무엇을 갈망하고 있습니까?';

  @override
  String get conciergeRefineStyle => '내 스타일 다듬기';

  @override
  String get conciergeRecallReturning => '돌아온 것을 환영합니다.';

  @override
  String conciergeRecallStyle(String prefs) {
    return '당신이 $prefs를 좋아했던 것으로 기억해요.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return '그리고 당신은 이번 여행이 \"$feel\"이라는 느낌을 받기를 원했습니다.';
  }

  @override
  String get conciergePromptRomantic => '낭만적인 휴가';

  @override
  String get conciergePromptWellness => '웰니스 재설정';

  @override
  String get conciergePromptFamily => '가족의 마법';

  @override
  String get conciergePromptHiddenLuxury => '숨겨진 럭셔리';

  @override
  String get conciergePromptFoodie => '미식가 모험';

  @override
  String get conciergePromptSoftLuxury => '소프트 럭셔리 탈출';

  @override
  String get conciergePromptAdventure => '모험 모드';

  @override
  String get conciergePromptDisney => '디즈니 애프터 다크';

  @override
  String get discoverSearchHint => '목적지 검색…';

  @override
  String get discoverSearchTitle => '목적지 찾기';

  @override
  String get discoverFromOrlando => '올랜도에서';

  @override
  String discoverFromHub(String hub) {
    return '$hub에서';
  }

  @override
  String get discoverSearchScopeAll => '카탈로그에서 모든 플로리다 검색';

  @override
  String discoverSearchScopeRadius(String radius) {
    return '올랜도를 중심으로 $radius 이내';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return '$hub의 $radius 내';
  }

  @override
  String get discoverSearchEmpty =>
      '이 반경에는 일치하는 항목이 없습니다. 더 짧은 이름을 사용하거나 지도 또는 피드에서 거리 칩을 넓히거나 \'해변\', \'디즈니\' 또는 \'봄\'을 검색하세요.';

  @override
  String get discoverFilterAll => '모두';

  @override
  String get discoverFilterHotels => '호텔';

  @override
  String get discoverFilterRestaurants => '레스토랑';

  @override
  String get discoverFilterDestinations => '목적지';

  @override
  String get discoverPopularInRadius => '해당 반경에서 인기 있음';

  @override
  String get discoverTrySearching => '검색해 보세요';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '목적지 $count개 · 올랜도 $radius 이내';
  }

  @override
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return '$count개의 목적지 · $hub의 $radius 이내';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count개 목적지 · 플로리다 전체';
  }

  @override
  String get radius25 => '25마일';

  @override
  String get radius50 => '50마일';

  @override
  String get radius100 => '100마일';

  @override
  String get radiusAllFlorida => '플로리다 전체';

  @override
  String get radiusDesc25 => '올랜도 코어 주변 당일 여행';

  @override
  String get radiusDesc50 => '스프링스, 해안 당일 여행, 스페이스 코스트';

  @override
  String get radiusDesc100 => '탬파베이, 데이토나, 더 깊은 만';

  @override
  String get radiusDescAll => '키스, 마이애미, 주 전체 하이라이트';

  @override
  String get radiusDesc25Miami => '사우스 비치, 브리켈 및 핵심 지역';

  @override
  String get radiusDesc50Miami => '윈우드, 코코넛 그로브, 키 비스케인';

  @override
  String get radiusDesc100Miami => '에버글레이즈, 포트로더데일, 더 깊은 남부 플로리다';

  @override
  String get radiusDescAllMiami => '플로리다 키스 트레일과 주 전체 하이라이트';

  @override
  String get radiusDesc25Keys => 'Key Largo, Islamorada 및 상부 암초 회랑';

  @override
  String get radiusDesc50Keys => '마라톤, 빅 파인, 미들 키스 해변';

  @override
  String get radiusDesc100Keys => '키웨스트를 통과하는 해외 고속도로';

  @override
  String get radiusDescAllKeys => '섬 전체와 당일 여행 가능 바다';

  @override
  String get feedBadge => '실시간 검색';

  @override
  String get feedTitle => '경험 피드';

  @override
  String get feedSubtitle =>
      '현재 인기 있는 장소, 인기 명소, 새로운 오프닝, 크리에이터 추천, 시즌별 경로, 실시간 업데이트 등이 있습니다.';

  @override
  String get feedSubtitleFamily =>
      '가족 친화적인 선택 - 공원, 손쉬운 승리, 어린이(및 부모)와 함께하는 순간.';

  @override
  String get feedPillTrending => '인기 급상승';

  @override
  String get feedPillNewOpenings => '새로운 오프닝';

  @override
  String get feedPillCreator => '크리에이터 추천';

  @override
  String get feedPillLive => '실시간 업데이트';

  @override
  String get feedMoodPrompt => '어떤 느낌을 원하시나요?';

  @override
  String get feedMoodPromptFamily => '오늘은 승무원들에게 어떤 느낌일까요?';

  @override
  String get feedMoodAll => '모든 것';

  @override
  String get feedMoodFamily => '가족의 마법';

  @override
  String get feedMoodRomantic => '로맨틱';

  @override
  String get feedMoodCalm => '침착한';

  @override
  String get feedMoodAdventurous => '모험심이 강한';

  @override
  String get feedMoodPampered => '애지중지';

  @override
  String get feedMoodSocial => '윙윙거리는 소리';

  @override
  String get feedMoodFoodie => '미식가';

  @override
  String get vibeSunsetReady => '석양';

  @override
  String get vibeViral => '바이럴';

  @override
  String get vibeFamilyApproved => '가족';

  @override
  String get vibeHiddenGem => '숨은 보석';

  @override
  String get vibeRainSafe => '비 OK';

  @override
  String get vibeDateNight => '데이트';

  @override
  String get vibeNightVibe => '나이트';

  @override
  String get vibeFoodie => '푸디';

  @override
  String get vibeLuxury => '럭셔리';

  @override
  String get vibeTrending => '트렌드';

  @override
  String get vibeLive => '라이브';

  @override
  String get vibeSeasonal => '시즌';

  @override
  String get vibeLocalPick => '로컬';

  @override
  String get vibeAdventure => '모험';

  @override
  String get vibeWellness => '웰니스';

  @override
  String get vibeBeachDay => '해변';

  @override
  String get vibeLuxoraPick => 'Luxora 추천';

  @override
  String get mapLayersTitle => '지도 레이어';

  @override
  String get mapLayerAll => '전체';

  @override
  String get mapLayerGems => '보석';

  @override
  String get mapLayerNight => '나이트';

  @override
  String get mapLayerDateNight => '데이트';

  @override
  String get mapLayerWeather => '좋은 날씨';

  @override
  String get mapLayerItinerary => '일정';

  @override
  String get mapExpandMap => '지도 확대';

  @override
  String get mapFullscreenTitle => '지도';

  @override
  String get mapCloseFullscreen => '지도 닫기';

  @override
  String get mapItineraryDayLabel => '일정 표시';

  @override
  String get mapItineraryCurrentDay => '오늘';

  @override
  String get feedFamilyMoodHint => '테마파크, 캐릭터 식사, 쉬운 부모 승리 — 가족 태그로 필터링됩니다.';

  @override
  String get feedEmptyHint =>
      '이 반경에는 피드 카드가 없습니다. 걸프 해안과 키스 하이라이트를 보려면 50마일 또는 All Florida를 시도해 보세요.';

  @override
  String get feedEmptyHintFamily =>
      '이 반경에는 가족 태그가 지정된 카드가 없습니다. 모험 또는 모든 것을 시도하거나 반경을 넓히세요.';

  @override
  String get gemsBadge => '내부자 큐레이션';

  @override
  String get gemsTitle => '숨겨진 보석';

  @override
  String get gemsSubtitle =>
      '지역 주민들이 지키는 비밀 발견 — 이곳이 왜 특별한지, 언제 가야 하는지, 얼마나 붐비는지, 엽서에서는 찾을 수 없는 팁 등이 있습니다.';

  @override
  String get gemsPillHidden => '숨겨진 장소';

  @override
  String get gemsPillLocal => '로컬 전용';

  @override
  String get gemsPillInsider => '내부자 팁';

  @override
  String get gemsPillCrowd => '군중 정보';

  @override
  String get gemsEmptyHint =>
      '이 반경에는 아직 보석이 없습니다. 샘과 스페이스 코스트의 비밀을 보려면 50마일 이상으로 넓혀보세요.';

  @override
  String get gemsSearchHint => '숨겨진 보석과 목적지를 검색하세요…';

  @override
  String get gemLocalSecret => '로컬 비밀';

  @override
  String get gemsMatchedBadge => '당신의 스타일';

  @override
  String gemsMatchedNote(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개의 보석이 스타일과 일치합니다',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
  }

  @override
  String get gemWhySpecial => '특별한 이유';

  @override
  String get gemBestTime => '가기 가장 좋은 시간';

  @override
  String get gemCrowdLevel => '군중 수준';

  @override
  String get gemInsiderTip => '내부자 팁';

  @override
  String get gemLocalNote => '로컬 전용 메모';

  @override
  String get mapBadge => 'AI 지도';

  @override
  String get mapTitle => '귀하의 지능형 경로';

  @override
  String get mapSubtitle =>
      '선별된 하루를 위한 핀 — 금색 다이아몬드는 보석, 청록색 마커는 오늘의 타임라인, 금색 선은 기분 경로입니다.';

  @override
  String get mapPlanDayTitle => '나의 하루를 계획해보세요';

  @override
  String get mapPlanDaySuggested =>
      '여행 기분에 따라 추천되는 장소를 즐겨찾기에 추가해 나만의 장소로 만들어 보세요.';

  @override
  String get mapPlanDayEmpty =>
      '목적지를 북마크(♥)하면 Luxora는 올랜도 허브에서 가장 적은 운전으로 가장 기분 좋은 최적의 경로를 구축합니다.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count 정거장 · $miles · $time 운전';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return '$hotel에서 출발';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return '이전 정류장에서 $time 운전 · $miles';
  }

  @override
  String get mapCrowdLevelQuiet => '조용한';

  @override
  String get mapCrowdLevelModerate => '보통의';

  @override
  String get mapCrowdLevelBusy => '바쁘다';

  @override
  String get mapCrowdLevelPacked => '포장됨';

  @override
  String mapCrowdAtStop(String level) {
    return '군중: $level';
  }

  @override
  String get mapParkingLevelEasy => '쉬운';

  @override
  String get mapParkingLevelModerate => '보통의';

  @override
  String get mapParkingLevelDifficult => '어려운';

  @override
  String get mapParkingLevelLimited => '한정 · 조기 도착';

  @override
  String mapParkingAtStop(String level) {
    return '주차: $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return '마찰 유도: $score/90';
  }

  @override
  String get mapRerouteButton => '더 조용한 정류장으로 경로 변경';

  @override
  String mapRerouteApplied(int count) {
    return '요일 조정 — $count 정거장이 더 적은 군중으로 교체되었습니다.';
  }

  @override
  String get mapRerouteNone => '당신의 길은 이미 평온해 보입니다.';

  @override
  String get mapRerouteRainHint =>
      '걱정 마세요 — 가까운 대안을 찾아 두었습니다. 오늘도 즐겁고 스트레스 없는 하루로.';

  @override
  String get dayFlowSwapTitle => '이 정류장 변경';

  @override
  String dayFlowSwapSubtitle(String current) {
    return '$current 대신 무엇을 하고 싶은지 Luxora에게 알려주십시오.';
  }

  @override
  String get dayFlowSwapTemplate => '나는 더 비슷한 것을 생각하고있었습니다…';

  @override
  String get dayFlowSwapHint => '예를 들어 오늘 아침은 조용한 공원, 저녁은 해산물';

  @override
  String get dayFlowSwapApply => '내 하루 업데이트';

  @override
  String get dayFlowSwapViewPlace => '현재 정류장 보기';

  @override
  String dayFlowSwapSuccess(String newStop, String phase) {
    return '업데이트됨 — 이제 $newStop이 $phase 정류장입니다.';
  }

  @override
  String get dayFlowSwapNoMatch =>
      '근처에서 일치하는 항목을 찾을 수 없습니다. 좀 더 구체적으로 입력해 보세요.';

  @override
  String get dayFlowSwapTapToChange => '이 정류장 변경';

  @override
  String get dayFlowSwapHoldSpeak => '길게 눌러 말하세요';

  @override
  String get dayFlowSwapListening => '청취…';

  @override
  String get rightNowButton => '지금 당장 무엇을 해야 할까요?';

  @override
  String get rightNowEmpty =>
      '아직 귀하의 반경에 좋은 순간이 없습니다. 몇 가지 즐겨찾기를 발견하거나 북마크에 추가하세요.';

  @override
  String get rightNowResultTitle => '지금 바로';

  @override
  String get rightNowTapForDetails => '세부정보를 보려면 탭하세요.';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return '$minutes에서 $district분 거리에 있습니다. 날씨가 완벽합니다. $place에서 커피를 마시고 군중이 도착하기 전에 $walkArea를 산책하세요($crowd 군중).';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return '$minutes에서 $district분 거리에 있습니다. 하늘이 정말 멋집니다. 군중이 여전히 $crowd 있는 동안 $place로 가세요.';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return '골든 아워가 다가오고 있습니다. 약 $minutes분 후에 $place(일몰까지 $crowd)까지 출발하세요.';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return '레이더에 비가 내림 — 아늑한 실내 선택까지 $minutes분 소요: $place.';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return '낮잠 창 ​​진정 — $minutes에서 가족이 쉽게 재설정할 수 있는 시간은 $place분입니다.';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return '데이트-밤 에너지 — 출퇴근 시간 전 $minutes까지 $place분.';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return '조용한 시간 — $minutes까지 $place분(지금은 $crowd).';
  }

  @override
  String get goldenHourTitle => '골든아워';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return '$time(차로 $minutes분)까지 $place로 출발 — 일몰 ~15분 전에 도착하세요.';
  }

  @override
  String get goldenHourKindBeach => '해변 일몰 창';

  @override
  String get goldenHourKindRooftop => '루프탑 골든아워';

  @override
  String get goldenHourKindScenic => '절경 촬영 타이밍';

  @override
  String get vacationScoreTitle => '휴가 점수';

  @override
  String vacationScoreSubtitle(int score) {
    return '오늘은 $score/100 같은 날인 것 같아요.';
  }

  @override
  String get onboardOccasionLabel => '어떤 행사인가요?';

  @override
  String get onboardThemeParksOccasionHint =>
      '올랜도 잠금을 해제하면 아래에 디즈니 및 유니버설 테마파크 행사가 표시됩니다.';

  @override
  String get occasionGeneral => '그냥 탐색 중';

  @override
  String get occasionAnniversary => '기념일';

  @override
  String get occasionHoneymoon => '신흔 여행';

  @override
  String get occasionDateNight => '데이트 밤';

  @override
  String get occasionProposal => '프로포즈 여행';

  @override
  String get occasionFamily => '어린이 동반 가족';

  @override
  String get occasionDisneyAdventure => '디즈니 어드벤처';

  @override
  String get occasionUniversalAdventure => '보편적인 모험';

  @override
  String get localSecretTitle => '로컬 비밀';

  @override
  String get localSecretWinterParkParkAvenue =>
      '지역 주민들은 거리 표지판이 없는 서점 뒤의 골목 안뜰로 몸을 숨깁니다.';

  @override
  String get localSecretWorldFoodTrucks =>
      '버거가 아닌 매일 캐치를 주문하십시오. 줄은 먼 창에서 더 빠르게 움직입니다.';

  @override
  String get localSecretWekiwaSprings =>
      '오후 2시 이후에는 메인 산책로를 건너뛰세요. 북쪽 트레일 기점은 조용합니다.';

  @override
  String get localSecretDisneySpringsParking =>
      '가장 좋은 주차 장소는 주황색 차고입니다. 정문이 붐비지 않고 정박지 쪽을 따라 걸어가세요.';

  @override
  String get localSecretLakeEolaSunset =>
      '하늘이 금빛으로 변하는 동안 원형극장 쪽에서 백조 사진을 찍으세요.';

  @override
  String get localSecretMiamiWynwoodAlley =>
      '팬더 커피(Panther Coffee) 뒤의 로딩 골목을 통과해 들어가세요. 현지인들은 메인 라인에 모인 군중 없이 벽화를 촬영합니다.';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      '먼저 창가 카트에서 카페시토를 구입하세요. 코르타디토를 들고 있으면 사이드라인 벤치 단골 손님이 열립니다.';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      '메인 테라스 혼잡을 건너뛰고 동쪽 정원에서 들어가 맹그로브 산책로를 시계 반대 방향으로 걸어보세요.';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      'Lummus에서는 오전 7시에 동쪽을 향합니다. 브런치 군중이 도착하기 전에 아르데코 파스텔이 빛납니다.';

  @override
  String get localSecretMiamiPantherAlley =>
      '창가에서 주문하고 시계 방향으로 골목을 걷습니다. 오전 8시 45분에 청록색 벽에 가장 좋은 벽화 조명이 비칩니다.';

  @override
  String get localSecretTampaBayRiverwalkParking =>
      'Whiting Street 주차장 이용 — 강을 따라 남쪽으로 걸어 부두 근처 통제 구간을 피하세요.';

  @override
  String get localSecretTampaBayClearwaterSunset =>
      'Pier 60 혼잡 피하기 — 일몰 40분 전 Sand Key 접근로.';

  @override
  String get localSecretTampaBayDaliGarden =>
      '오후 마지막 입장 예약 — 동쪽 정원 전망대는 테라스 혼잡 없이 다리 빛.';

  @override
  String get localSecretTampaBayPierTiming =>
      '평일 오후 4시 pier 입장 — 주말 유모차 혼잡 없는 일몰.';

  @override
  String get localSecretTampaBayYborCourtyard =>
      '쿠반 샌드위치 포장 — 오후 8시 이후 현지인이 쓰는 벽돌 안뜰에서.';

  @override
  String get localSecretTampaBaySpongeDocks =>
      '먼저 부두에서 점심, 스펀지 보트는 그다음 — 평일 오후 1시 이후 투어 감소.';

  @override
  String get localSecretVegasBellagioFountains =>
      '쇼 15분 전 잔디 중앙 — 앞 난간은 안무 전체를 가립니다.';

  @override
  String get localSecretVegasFremontTiming =>
      '평일 밤 9시 캐노피 아래 — 토요 혼잡 없이 Viva Vision 전체.';

  @override
  String get localSecretVegasCaesarsEntrance =>
      '주차장 연결 통로 — 저녁 시간 Strip 병목 회피.';

  @override
  String get localSecretVegasVenetianWalk =>
      '정오 실내 운하 산책 — 냉방 Strip 횡단으로 폭염 회피.';

  @override
  String get nycMoodRoutesTitle => '뉴욕 무드 루트';

  @override
  String get localSecretNycTimesSquareStrategy =>
      '7th Ave 골목으로 진입 — 교차로 혼잡을 피하고 브로드웨이 시야 유지.';

  @override
  String get localSecretNycObservationDeck =>
      '일몰 전 마지막 시간 예약 — 정오 대기열 없이 골든아워.';

  @override
  String get localSecretNycCentralParkEntrance =>
      '72nd Street 횡단로 — Columbus Circle 혼잡 없이 Bethesda까지 빠른 경로.';

  @override
  String get localSecretNycBroadwayTickets =>
      'TKTS 오전 줄은 일찍 — 러시 좌석이 관광객 가격보다 유리.';

  @override
  String get localSecretNycBrooklynBridgePhoto =>
      'Washington Street DUMBO 오전 8시 — 투어 그룹 전 빈 돌길 프레임.';

  @override
  String get localSecretNycFerryGoldenHour =>
      '일몰 시 Staten Island 페리 — 투어 보트 없이 무료 항만 루프.';

  @override
  String get momentsTitle => '룩소라 순간';

  @override
  String get momentsSubtitle => '장소가 아닌 느낌을 찾으세요.';

  @override
  String get momentFeelRelaxed => '편안한 느낌';

  @override
  String get momentImpressSpouse => '배우자에게 감동을 주세요';

  @override
  String get momentPerfectSunset => '완벽한 일몰';

  @override
  String get momentFamilyMemory => '가족의 기억';

  @override
  String get momentLuxuryValue => '과소비 없는 럭셔리';

  @override
  String get momentPromptRelaxed =>
      '앞으로 몇 시간 동안은 느리고, 아름답고, 사람이 붐비지 않고 완전한 편안함을 느끼고 싶습니다.';

  @override
  String get momentPromptImpressSpouse =>
      '오늘 밤 나는 로맨틱하고 예상치 못한 무언가로 배우자에게 깊은 인상을 주고 싶습니다.';

  @override
  String get momentPromptPerfectSunset =>
      '나는 완벽한 플로리다의 일몰 순간을 원합니다. 우리는 어디에 있어야 하며 언제 떠나야 할까요?';

  @override
  String get momentPromptFamilyMemory =>
      '나는 부모에게는 쉽고 아이들에게는 마법 같은 기억에 남는 가족의 순간을 원합니다.';

  @override
  String get momentPromptLuxuryValue =>
      '나는 많은 돈을 들이지 않고도 특별함을 느낄 수 있는 럭셔리를 원한다.';

  @override
  String get visualShareImageButton => '이미지 카드 공유';

  @override
  String get tripStoryTitle => '당신의 여행 이야기';

  @override
  String tripStoryHeading(String title) {
    return '$title — 당신의 플로리다 이야기';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return '당신은 $moods을 위해 왔습니다.';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return '이 장: $title.';
  }

  @override
  String get tripStoryBeatClosing => 'Luxora는 순간을 형성했습니다. 여러분은 그 순간을 살아냈습니다.';

  @override
  String get tripsOpenStory => '당신의 이야기';

  @override
  String get conciergeVoiceHold => '길게 눌러 말하세요';

  @override
  String get conciergeVoiceSoon =>
      '음성 컨시어지가 곧 출시됩니다. 지금은 순간을 탭하거나 원하는 느낌을 입력하세요.';

  @override
  String get conciergeVoiceListening => 'Luxora가 듣고 있습니다…';

  @override
  String get conciergeVoiceSpeaking => '룩소라가 말하고 있어요…';

  @override
  String get conciergeVoiceRelease => '보내려면 손을 떼세요';

  @override
  String get conciergeVoiceSend => '룩소라로 보내기';

  @override
  String get conciergeVoiceProcessing => '룩소라로 보내는 중…';

  @override
  String get conciergeVoiceNoSpeech => '인식하지 못했습니다. 버튼을 누른 채 말한 다음 손을 떼세요.';

  @override
  String get conciergeVoicePreviewFailed =>
      '미리보기를 재생할 수 없습니다. 볼륨을 확인하고 다시 시도하세요.';

  @override
  String get conciergeVoiceUnavailable => '이 기기에서는 음성을 사용할 수 없습니다.';

  @override
  String get conciergeVoiceSettingsTitle => '룩소라 목소리';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Luxora가 말할 때 발음하는 방식(액센트, 어조, 속도 등)을 선택하세요. 기기에 내장된 음성을 사용합니다.';

  @override
  String get conciergeVoiceRateLabel => '말하는 속도';

  @override
  String get conciergeVoiceRateSlow => '느린';

  @override
  String get conciergeVoiceRateNatural => '자연스러운';

  @override
  String get conciergeVoiceRateFast => '빠른';

  @override
  String get conciergeVoicePreview => '음성 미리보기';

  @override
  String get conciergeVoicePreviewCurrent => '현재 음성 미리듣기';

  @override
  String get conciergeVoicePreviewSample =>
      '안녕하세요 — 저는 Luxora입니다. 이번 여행이 어떤 느낌이었으면 좋겠는지 말해주세요.';

  @override
  String get conciergeVoiceDeviceNote =>
      'iPhone 설정 → 접근성 → 음성 콘텐츠 → 음성에서 더 많은 음성을 다운로드하세요. 여기로 돌아와서 새로고침을 탭하세요.';

  @override
  String get conciergeVoiceDeviceSection => '이 iPhone의 목소리';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      '다운로드한 음성이 포함되어 있습니다. 하나를 탭하면 Luxora에 사용할 수 있습니다.';

  @override
  String get conciergeVoiceRefreshList => '음성 목록 새로 고침';

  @override
  String get conciergeVoiceShowAllLanguages => '모든 언어 표시';

  @override
  String get conciergeVoiceOpenSettings => 'iPhone 음성 설정 열기';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      '음성을 찾을 수 없습니다. 설정에서 팩을 다운로드한 다음 새로 고치세요.';

  @override
  String get conciergeVoicePresetSection => '빠른 페르소나';

  @override
  String get conciergeVoiceRegionRecommended => '추천';

  @override
  String get conciergeVoiceRegionEnglish => '영어';

  @override
  String get conciergeVoiceRegionRussian => '러시아인';

  @override
  String get conciergeVoiceRegionSpanish => '스페인 사람';

  @override
  String get conciergeVoiceRegionFrench => '프랑스 국민';

  @override
  String get conciergeVoiceRegionGerman => '독일 사람';

  @override
  String get conciergeVoiceRegionOther => '다른';

  @override
  String get conciergeVoicePresetMatchApp => 'Luxora 기본 · Kate (Premium)';

  @override
  String get conciergeVoicePresetEnUsF => '미국인 · 여성';

  @override
  String get conciergeVoicePresetEnUsM => '미국인 · 남성';

  @override
  String get conciergeVoicePresetEnGbF => '영국인 · 여성';

  @override
  String get conciergeVoicePresetEnGbM => '영국인 · 남성';

  @override
  String get conciergeVoicePresetRuF => '러시아인 · 여성';

  @override
  String get conciergeVoicePresetRuM => '러시아인 · 남성';

  @override
  String get conciergeVoicePresetEsF => '스페인어 · 여성';

  @override
  String get conciergeVoicePresetEsM => '스페인어 · 남성';

  @override
  String get conciergeVoicePresetFrF => '프랑스인 · 여성';

  @override
  String get conciergeVoicePresetFrM => '프랑스인 · 남성';

  @override
  String get conciergeVoicePresetDeF => '독일인 · 여성';

  @override
  String get conciergeVoicePresetDeM => '독일인 · 남성';

  @override
  String get conciergeThinking => 'Luxora는 생각하고 있습니다…';

  @override
  String get conciergeItinerarySynced =>
      '이를 일정목록에 추가했습니다. 동일한 정류장이 지도에 표시되어 공유할 준비가 되었습니다.';

  @override
  String get conciergeAgendaUpdatedSnack => '귀하의 의제가 지도 및 의제에 준비되어 있습니다';

  @override
  String get conciergeAgendaSyncFailed =>
      '지도와 일정목록이 업데이트되지 않았습니다. 예를 들어 4일간의 디즈니 및 유니버셜 여행을 계획해 보세요.';

  @override
  String get conciergeViewAgendaOnMap => '의제 보기';

  @override
  String get conciergeAgendaDealsIntro =>
      '귀하의 일정에 맞춰 승인된 티켓 거래를 연결해 드렸습니다. 게이트에서 구매하기 전에 비교해 보세요.';

  @override
  String get conciergeAgendaDealsSnack => '귀하의 일정에 맞는 티켓 거래';

  @override
  String get conciergeViewTicketDeals => '거래 보기';

  @override
  String ticketAgendaMatchLine(String stop, String amount, String source) {
    return '$stop · 예상 절감액은 $source를 통해 $amount입니다.';
  }

  @override
  String ticketAgendaStopsSummary(int count) {
    return '귀하의 의제에 있는 $count 정거장에는 파트너 거래가 있습니다. 게이트에서 구매하기 전에 승인된 제안을 비교하십시오.';
  }

  @override
  String ticketAgendaStopsSavings(String amount) {
    return '예상 가족 저축 · $amount';
  }

  @override
  String get ticketBrowseAgendaDeals => '귀하의 의제에 대한 거래 찾아보기 →';

  @override
  String get conciergeFreshThread =>
      '귀하의 의제는 지도와 의제에 있습니다. 저는 이 채팅을 보관하고 새로 시작했습니다. 하루를 조정하고, 거래를 찾고, 새로운 것을 물어보세요.';

  @override
  String get conciergeThreadArchivedSnack => '보관된 채팅 — 새로운 스레드가 시작되었습니다.';

  @override
  String get conciergeNewConversationTooltip => '새 대화';

  @override
  String get itinerarySameAsMapAgenda =>
      '오늘의 컨시어지 계획 — 지도에도 고정되어 있습니다. 아래의 데이 카드를 공유하세요.';

  @override
  String get conciergeTicketsFoundIntro =>
      '귀하의 여행에 대한 승인된 티켓 거래를 찾았습니다. 직접 링크를 보려면 \'아젠다\'에서 티켓 예약을 탭하세요.';

  @override
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  ) {
    return '• $title: $source를 통한 $price($savings 절감)';
  }

  @override
  String get conciergeTicketsTimelineHint =>
      'Agenda의 각 정류장에는 이제 리셀러 링크가 있는 티켓 예약 버튼이 있습니다.';

  @override
  String itineraryBookTickets(String amount) {
    return '티켓 예약 · $amount 절약';
  }

  @override
  String get itineraryOpenTicketDeal => '티켓 예약';

  @override
  String conciergeTripSaved(String title) {
    return '여행에 “$title”을(를) 저장했습니다. 언제든지 여행 탭을 열어 다시 방문하세요.';
  }

  @override
  String conciergeTripSavedWithStops(String title, int count) {
    return '타임라인에 $count개의 경험이 포함된 “$title”을(를) 저장했습니다.';
  }

  @override
  String conciergeSavedTripsIntro(int count) {
    return '귀하는 $count개의 여행을 저장했습니다:';
  }

  @override
  String conciergeSavedTripLine(String title, String dates, String status) {
    return '• $title($dates) — $status';
  }

  @override
  String get conciergeSavedTripsEmpty =>
      '아직 저장된 여행이 없습니다. 저에게 계획을 물어본 다음 \"여행을 저장해 줘\"라고 말씀하세요.';

  @override
  String get conciergeSavedTripsHint => '여행 탭을 열어 카드를 보고, 날짜를 공유하거나 편집하세요.';

  @override
  String get conciergeAiError => '지금은 Luxora에 연결할 수 없습니다. 연결을 확인하고 다시 시도하세요.';

  @override
  String get conciergeAiErrorVoice => '죄송합니다. 지금은 Luxora의 컨시어지에 연결할 수 없습니다.';

  @override
  String get conciergeAiNotConfigured =>
      'Luxora의 라이브 컨시어지는 아직 이 빌드에 연결되지 않았습니다. Supabase URL과 익명 키를 앱에 구워야 하고 에지 기능이 배포되어야 합니다. 지도와 여행 일정은 여전히 ​​작동합니다. 설정은 docs/CONCIERGE_AI.md를 참조하세요.';

  @override
  String get conciergeAiOpenAiNotReady =>
      'Luxora가 당신의 말을 들었지만 컨시어지 두뇌는 아직 온라인 상태가 아닙니다. Edge 기능(브라이트 프로세서)에 대한 Supabase 비밀에 OPENAI_API_KEY를 설정한 후 다시 시도하세요.';

  @override
  String conciergeAiFunctionNotFound(String function) {
    return 'Luxora가 컨시어지 에지 함수 \"$function\"을(를) 찾을 수 없습니다. Supabase에 배포하거나 이 빌드에서 SUPABASE_CONCIERGE_FUNCTION을 수정하세요.';
  }

  @override
  String get conciergeAiAuthFailed =>
      'Luxora가 Supabase로 인증할 수 없습니다. SUPABASE_ANON_KEY가 프로젝트와 일치하는지 다시 확인하세요.';

  @override
  String get mapAiPowers => 'AI 지도의 힘';

  @override
  String get mapNavLayerTitle => 'AI 탐색 레이어(다음)';

  @override
  String get mapNavLayerSubtitle =>
      '발견 그 이상 - 지금 당장 정차할 가치가 있는지에 대한 실시간 인텔리전스입니다.';

  @override
  String get mapBookingTitle => '원활한 예약(파트너)';

  @override
  String get mapCapMoodTitle => '기분 기반 경로';

  @override
  String get mapCapMoodDesc => '짧은 운전 시간뿐만 아니라 로맨틱, 웰니스, 가족 또는 모험에 어울리는 경로입니다.';

  @override
  String get mapCapDriveTitle => '운전 시간 최적화';

  @override
  String get mapCapDriveDesc =>
      '스마트한 순서로 하이라이트 사이에 교통 체증을 겪지 않고 감정을 느끼며 시간을 보낼 수 있습니다.';

  @override
  String get mapCapWeatherTitle => '날씨 인식 제안';

  @override
  String get mapCapWeatherDesc => '해변, 옥상, 샘을 위한 비 백업 경로와 실시간 창문.';

  @override
  String get mapCapSunsetTitle => '지금 최고의 일몰';

  @override
  String get mapCapSunsetDesc =>
      '하늘과 군중 패턴을 기준으로 다음 90분 동안 골든 아워가 가장 잘 나타나는 곳입니다.';

  @override
  String get mapCapCrowdTitle => '군중 예측';

  @override
  String get mapCapCrowdDesc => '공원, 샘, 바이러스 명소가 조용해지면 도착하기 전에.';

  @override
  String get mapCapGemsTitle => '근처의 숨겨진 보석';

  @override
  String get mapCapGemsDesc => '상위 10개 관광 명소뿐만 아니라 경로를 따라 내부자 핀이 표시됩니다.';

  @override
  String get mapCapPersonalTitle => '경로 개인화';

  @override
  String get mapCapPersonalDesc => '여행 느낌, 속도 및 예산이 지도를 실시간으로 재구성합니다.';

  @override
  String get mapFutureCrowdTitle => '실시간 군중 열기';

  @override
  String get mapFutureCrowdDesc => '샘, 공원, 바이러스 옥상의 실시간 밀도 - 지금 당장 가치가 있나요?';

  @override
  String get mapFutureParkingTitle => '주차난이도';

  @override
  String get mapFutureParkingDesc =>
      '약속하기 전 마찰 점수 - 주차 대행, 차고 또는 차량 공유 최적의 장소.';

  @override
  String get mapFutureTrafficTitle => '드라이브 마찰 점수';

  @override
  String get mapFutureTrafficDesc =>
      '스트레스 가중치 라우팅 - 단지 몇 분이 아니라 드라이브의 느낌이 어떻게 될지.';

  @override
  String get mapFutureRerouteTitle => '자발적인 경로 변경';

  @override
  String get mapFutureRerouteDesc => '날씨 변화 또는 군중 급증? 탭 한 번으로 남은 하루를 바꿔보세요.';

  @override
  String affiliateReserve(String category) {
    return '예약 · $category · 프리미엄 파트너(곧)';
  }

  @override
  String get affiliateHotels => '호텔 및 호캉스';

  @override
  String get affiliateExperiences => '체험 & 투어';

  @override
  String get affiliateRestaurants => '레스토랑 예약';

  @override
  String get affiliateThemeParks => '테마파크 티켓';

  @override
  String get affiliateDayPasses => 'ResortPass / 일일 패스';

  @override
  String get affiliateCarRentals => '렌터카';

  @override
  String get affiliateWellness => '웰니스 예약';

  @override
  String get tripsBadge => '컬렉션';

  @override
  String get tripsTitle => '저장된 여행';

  @override
  String get tripsSubtitle => '다음 순간, 날씨, 일몰, 타임라인 등 실시간 스냅샷을 보려면 여행을 탭하세요.';

  @override
  String get tripsFooter => '무드 카탈로그의 여행 커버 · Supabase 동기화 2단계';

  @override
  String get tripsPlanNew => '새로운 여행을 계획해보세요';

  @override
  String get tripsEmptyTitle => '아직 저장된 여행이 없습니다.';

  @override
  String get tripsEmptyBody => '첫 번째 여행을 계획하면 여기에 표시되어 언제든지 다시 방문할 수 있습니다.';

  @override
  String get tripsDeleteTitle => '여행을 삭제하시겠습니까?';

  @override
  String tripsDeleteBody(String title) {
    return '이렇게 하면 저장된 여행에서 “$title”이(가) 제거됩니다. 이 작업은 취소할 수 없습니다.';
  }

  @override
  String get tripsDeleted => '여행이 삭제되었습니다.';

  @override
  String get tripsEditDates => '여행 날짜';

  @override
  String get tripsSaveDates => '날짜 저장';

  @override
  String get tripsDatesUpdated => '여행 날짜가 업데이트되었습니다.';

  @override
  String get tripsDatesFlexible => '날짜는 유동적입니다.';

  @override
  String get tripsLiveWeather => '실시간 날씨';

  @override
  String get tripsNextUp => '다음은';

  @override
  String get tripsSunsetWindow => '일몰창';

  @override
  String get tripsTimelineSnapshot => '타임라인 스냅샷';

  @override
  String get tripsOpenAgenda => '전체 안건 열기';

  @override
  String get tripsOpenTimeline => '전체 타임라인 열기';

  @override
  String get tripsShare => '공유하다';

  @override
  String get shareItineraryFooter => '감정적으로 지능적인 플로리다 동반자인 Luxora와 함께 계획하세요.';

  @override
  String get shareCardCta => '룩소라에서 계획을 세우세요';

  @override
  String get shareCardDownloadHint => 'iOS 및 Android에서 무료 · luxora.ai/download';

  @override
  String shareCardShareMessage(String title, String url) {
    return '$title\n\nLuxora AI로 계획된 감성 지능적인 플로리다 여행.\n앱 다운로드: $url';
  }

  @override
  String get conciergeLocalTryPlanning =>
      '여행이 어떤 느낌이기를 원하는지 알려주세요. \"샘과 ​​음식을 즐기며 편안한 2일 올랜도 여행을 계획해보세요.\" 귀하의 기기에 실제 의제를 작성해 드립니다(클라우드가 필요하지 않음).';

  @override
  String conciergeLocalPlanBuilt(String city, int count) {
    return '나는 당신의 $city일을 만들었습니다. 기분과 운전 시간에 따라 $count개의 정류장이 순서대로 정차됩니다. 일정이나 지도를 열어 경로를 확인하세요.';
  }

  @override
  String get conciergeLocalNoIntent =>
      '원하는 느낌을 설명하거나 \"올랜도에서의 하루 계획해 줘\"라고 말하면 기기에서 실제 경로를 만들어 드립니다.';

  @override
  String get ticketConciergeIntelBadge => '컨시어지 인텔';

  @override
  String get ticketConciergeIntelAgenda => '일반적인 쿠폰 목록이 아닌 귀하의 일정에 맞춰 일치합니다.';

  @override
  String get agendaFixAfternoonRain => '비가 오고 있어요 — 오후를 고쳐주세요';

  @override
  String agendaRainRerouteDone(int count, int score) {
    return '오후 업데이트 — $count 정류장이 실내로 이동했습니다. 휴가 점수 $score/100.';
  }

  @override
  String get agendaRainRerouteNone => '귀하의 계획은 이미 이 날씨에 적합합니다.';

  @override
  String get cloudTripsTitle => '클라우드 백업';

  @override
  String get cloudTripsSubtitle =>
      '로그인하면 저장된 여행이 여러 기기에서 동기화되며 모든 도시 잠금 해제에 포함됩니다.';

  @override
  String get cloudTripsMoreSubSignedOut => '저장된 여행을 백업하려면 로그인하세요.';

  @override
  String cloudTripsMoreSubSignedIn(String email) {
    return '$email(으)로 로그인됨';
  }

  @override
  String get cloudTripsMoreSubSyncing => '동기화 중…';

  @override
  String get cloudTripsUnlockRequired => '클라우드 백업을 활성화하려면 시티 팩을 잠금 해제하세요.';

  @override
  String get cloudTripsUnlockCta => '컨시어지 잠금 해제';

  @override
  String get cloudTripsEmailHint => '이메일 주소';

  @override
  String get cloudTripsSendCode => '로그인 코드 보내기';

  @override
  String get cloudTripsCodeHint => '이메일의 6자리 코드';

  @override
  String get cloudTripsVerify => '확인 및 로그인';

  @override
  String get cloudTripsCodeSent => '이메일에서 로그인 코드를 확인하세요.';

  @override
  String get cloudTripsSignOut => '로그아웃';

  @override
  String get cloudTripsSyncNow => '지금 동기화';

  @override
  String get cloudTripsSyncSuccess => '여행이 동기화되었습니다.';

  @override
  String get cloudTripsSyncError => '동기화 실패 - 다시 시도하세요';

  @override
  String get cloudTripsBannerTitle => '여행을 백업하세요';

  @override
  String get cloudTripsBannerBody => '새 휴대폰이나 태블릿에서 여행을 복원하려면 로그인하세요.';

  @override
  String get cloudTripsBannerCta => '클라우드 백업 설정';

  @override
  String get cloudTripsNotConfigured => '클라우드 백업에는 Supabase가 필요합니다(개발자 설정).';

  @override
  String get paywallFeatureCloudBackup => '클라우드 트립 백업';

  @override
  String shareSubject(String title) {
    return '내 $title';
  }

  @override
  String get itineraryBadge => '귀하의 타임라인';

  @override
  String get itineraryTagline => '모든 순간이 연결되어 있습니다. 기대감은 쌓이고 스트레스는 사라집니다.';

  @override
  String itineraryDayTab(int day, String label) {
    return '일 $day · $label';
  }

  @override
  String get detailWhySpecial => '특별한 이유';

  @override
  String get detailBestTime => '가기 가장 좋은 시기';

  @override
  String get detailInsiderTips => '내부자 팁';

  @override
  String get detailReserve => '체험 예약';

  @override
  String get detailReserveSoon => '예약 파트너가 곧 제공될 예정입니다.';

  @override
  String get detailNearbyGems => '주변 보석';

  @override
  String get detailDuration => '지속';

  @override
  String get detailPractical => '실용적인 세부 사항';

  @override
  String get detailCostRange => '비용 범위';

  @override
  String get detailBestFor => '다음에 가장 적합';

  @override
  String get detailVibeMatch => '바이브 매치';

  @override
  String get detailCrowd => '군중';

  @override
  String get detailTravelIntelTitle => '여행마찰 전망';

  @override
  String get detailTravelIntelSubtitle =>
      '라이브 센서가 아닌 카테고리, 시간, 거리를 기준으로 예측합니다.';

  @override
  String detailCrowdOutlook(String level) {
    return '군중: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return '주차: $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return '마찰 유도: $score/90';
  }

  @override
  String get detailPrice => '가격';

  @override
  String get detailLocation => '위치';

  @override
  String get detailGetDirections => '길찾기';

  @override
  String get detailParkMap => '공원 지도';

  @override
  String get detailViewOnMap => '지도에서 보기';

  @override
  String get detailMapsError => '이 기기에서 지도를 열 수 없습니다.';

  @override
  String get detailGoogleMaps => '구글 지도';

  @override
  String get detailAppleMaps => '애플 지도';

  @override
  String get detailOpenInMaps => '지도에서 열기';

  @override
  String detailDriveFromOrlando(String time) {
    return '올랜도에서 $time 운전';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '$hub에서 $time 운전';
  }

  @override
  String get detailSaveToItinerary => '여행 일정에 저장';

  @override
  String get detailSaved => '저장됨';

  @override
  String get detailSavedSnack => '여행 일정에 저장되었습니다';

  @override
  String get detailRemovedSnack => '여행 일정에서 삭제되었습니다.';

  @override
  String get detailSetHomeBase => '본거지로 설정';

  @override
  String get detailHomeBaseActive => '당신의 여행 본거지';

  @override
  String get detailHomeBaseHint => '하루의 경로는 여기에서 시작하고 끝납니다.';

  @override
  String get detailHomeBaseSetSnack => '여행의 본거지로 설정';

  @override
  String get detailHomeBaseClearedSnack => '본거지가 삭제되었습니다.';

  @override
  String get detailMenuTitle => '메뉴 하이라이트';

  @override
  String get detailMenuDisclaimer =>
      '엄선된 하이라이트 - 전체 메뉴와 가격은 행사장에 따라 다를 수 있습니다.';

  @override
  String get detailMenuComingSoon =>
      '이 메뉴는 아직 큐레이팅 중입니다. 그동안 온라인으로 최신 메뉴와 가격을 확인하세요.';

  @override
  String get detailViewMenuOnline => '온라인으로 메뉴 보기';

  @override
  String get photoClose => '닫다';

  @override
  String get photoViewDestination => '목적지 보기';

  @override
  String get photoBy => '사진 제공:';

  @override
  String get photoOn => '~에';

  @override
  String milesFromOrlando(String distance) {
    return '올랜도에서 $distance';
  }

  @override
  String milesFromHub(String distance, String hub) {
    return '$hub에서 $distance';
  }

  @override
  String get landingBadge => '플로리다 · 올랜도 MVP';

  @override
  String get landingTitle1 => '휴가';

  @override
  String get landingTitle2 => '이미 시작되었습니다.';

  @override
  String get landingSubtitle =>
      'Luxora AI는 정서적으로 지능적인 컨시어지입니다. 숨겨진 보석, 옥상의 일몰, 그리고 짐을 꾸리기 전에 잊을 수 없는 순간을 선사합니다.';

  @override
  String get landingBegin => '여행 시작하기';

  @override
  String get landingTalk => '룩소라와 대화';

  @override
  String get landingWhy => '우리가 이것을 구축하는 이유';

  @override
  String get storyTitle => '우리의 이야기';

  @override
  String get storyHeroBadge => '의도적으로 구축됨';

  @override
  String get storyHeroCreator => '크리에이터, 룩소라 AI';

  @override
  String get storyHeroSubtitle => '플로리다·감성 우선 여행';

  @override
  String get storyHeading => '우리가 Luxora를 구축하는 이유';

  @override
  String get storyProblemLead =>
      '우리는 플로리다/올랜도 여행을 계획하는 것이 놀라울 정도로 단편적이고 부담스럽다는 것을 깨달았습니다.';

  @override
  String get storyJumpingBetween => '사람들은 보통 사이를 뛰어다닙니다.';

  @override
  String get storyProblemTail => '...그리고 여전히 일반적인 관광 계획으로 끝나게 됩니다.';

  @override
  String get storyDifferentLead => '우리는 뭔가 다른 것을 만들고 싶습니다.';

  @override
  String get storyNotPlannerTitle => '단순한 여행 플래너가 아닌';

  @override
  String get storyNotPlannerBody => '감성을 먼저 생각하는 AI 여행 동반자.';

  @override
  String get storyInsteadOfAsking => '묻는 대신';

  @override
  String get storyAppAsks => '앱이 묻습니다.';

  @override
  String get storyInsteadQuestion => '“어디로 가야 하나요?”';

  @override
  String get storyFeelQuestion => '“이번 여행이 어떤 느낌이기를 바라나요?”';

  @override
  String get storyMoodBuildLine => '그런 다음 AI는 해당 분위기에 맞춰 개인화된 경험을 구축합니다.';

  @override
  String get storyFloridaFirstTitle => '왜 플로리다/올랜도가 먼저인가?';

  @override
  String get storyFloridaFirstLead => '올랜도는 완벽한 테스트 시장입니다.';

  @override
  String get storyVisionTitle => '우리의 비전';

  @override
  String get storyVisionLead => '결합하다:';

  @override
  String get storyVisionCard =>
      '따라서 이 앱은 또 다른 지루한 여행 일정 도구가 아니라 고급 AI 컨시어지에 더 가까운 느낌을 줍니다.';

  @override
  String get storyLongTermTitle => '장기적인 기회';

  @override
  String get storySourceGoogleMaps => '구글 지도';

  @override
  String get storySourceTikTok => '틱톡';

  @override
  String get storySourceInstagram => '인스타그램 릴';

  @override
  String get storySourceTravelBlogs => '여행 블로그';

  @override
  String get storySourceRestaurantApps => '레스토랑 앱';

  @override
  String get storySourceWeatherApps => '날씨 앱';

  @override
  String get storySourceTicketSites => '티켓 웹사이트';

  @override
  String get storySourceTop10 => '무작위 \"올랜도 상위 10개\" 기사';

  @override
  String get storyBulletMarket => '거대한 관광 시장';

  @override
  String get storyBulletAudience => '가족, 커플, 고급 여행자, 웰니스 여행자';

  @override
  String get storyBulletOptions => '끝없는 레스토랑, 리조트, 숨겨진 보석, 테마파크, 온천, 밤문화';

  @override
  String get storyBulletRepeat => '높은 재방문 행위';

  @override
  String get storyBulletLogisticsGap => '대부분의 여행 앱은 경험 디자인이 아닌 물류에 중점을 둡니다.';

  @override
  String get storyPillarAiItinerary => 'AI 여정 생성';

  @override
  String get storyPillarMoodPlanning => '기분에 따른 여행 계획';

  @override
  String get storyPillarLiveDiscovery => '실시간 검색 및 트렌드 경험';

  @override
  String get storyPillarHiddenGems => '숨겨진 지역 보석';

  @override
  String get storyPillarRouting => '스마트 라우팅';

  @override
  String get storyPillarWeatherSunset => '날씨 및 일몰 정보';

  @override
  String get storyPillarPremiumUx => '프리미엄 미적 UX';

  @override
  String get storyOpportunityMultilingual => '다국어 확장';

  @override
  String get storyOpportunityAffiliate => '제휴 및 예약 파트너십';

  @override
  String get storyOpportunityInventory => '레스토랑, 체험, 티켓';

  @override
  String get storyOpportunitySubscriptions => '프리미엄 구독';

  @override
  String get storyOpportunityScale => '플로리다를 넘어 확장 가능 → 나중에 다른 목적지로 확장 가능';

  @override
  String get landingValues => '추억·감정·탈출·연결';

  @override
  String get landingRegionBadge => '출시 지역';

  @override
  String get landingRegionTitle => '올랜도와 플로리다 — 느낌에 맞춰 선별';

  @override
  String get onboardFinish => '컨시어지를 만나보세요';

  @override
  String get onboardBuilding => '모험을 만드는 중…';

  @override
  String get onboardStep1Title => '꿈이 먼저 닿는 곳';

  @override
  String get onboardStep1Subtitle => '어디로 가시나요?';

  @override
  String get onboardDestination => '목적지';

  @override
  String get onboardRegion => '지역';

  @override
  String get onboardCityLabel => '도시를 선택하세요';

  @override
  String get onboardCityUnlockNote =>
      '각 목적지에는 자체 컨시어지 잠금 해제 기능이 있습니다. 즉, 도시별로 일회성 구매가 가능합니다.';

  @override
  String get landingCityLabel => '어디 가세요?';

  @override
  String get paywallSwitchCity => '목적지';

  @override
  String get paywallUnlockingDestination => '이번 여행 잠금 해제';

  @override
  String paywallUnifiedPriceHeadline(String price) {
    return '모든 시티 팩은 $price에 잠금 해제';
  }

  @override
  String get paywallUnifiedPriceBody =>
      '올랜도(Disney·Universal 포함), 마이애미, 플로리다 키스 — 동일 가격 일회 구매. 구독 없음.';

  @override
  String paywallSelectedPackToday(String packName) {
    return '오늘 잠금 해제: $packName';
  }

  @override
  String paywallAddonUnifiedHeadline(String price) {
    return 'Disney & Universal — $price 일회';
  }

  @override
  String get paywallAddonUnifiedBody =>
      '모든 플로리다 팩과 같은 간단한 가격 — 한 번 잠금 해제, 평생 이용.';

  @override
  String get cityPickerUnlocked => '잠금 해제됨';

  @override
  String cityPickerUnlockPrice(String price) {
    return '$price 잠금 해제';
  }

  @override
  String get cityPickerThemeParksSubtitle => '올랜도 추가 기능 · 디즈니와 유니버설이 함께';

  @override
  String get onboardStep2Title => '자유로움을 느끼는 시간';

  @override
  String get onboardStep2Subtitle => '탈출은 언제 시작되나요?';

  @override
  String get onboardStartDateLabel => '시작일';

  @override
  String get onboardEndDateLabel => '종료일';

  @override
  String get onboardPickDate => '선택하려면 탭하세요.';

  @override
  String get onboardSelectStartDate => '시작일 선택';

  @override
  String get onboardSelectEndDate => '종료일 선택';

  @override
  String get onboardDatesHint => '여행 탭에서 언제든지 변경할 수 있습니다.';

  @override
  String get onboardStepBudgetTitle => '쉽게 계획하세요';

  @override
  String get onboardStepBudgetSubtitle => '이번 탈출에는 무엇이 적합하다고 생각되나요?';

  @override
  String get onboardBudget => '여행 예산(USD)';

  @override
  String get onboardStep3Title => '이야기를 나누는 사람';

  @override
  String get onboardStep3Subtitle => '당신과 함께 여행하는 사람은 누구입니까?';

  @override
  String get onboardTravelers => '여행자';

  @override
  String get onboardStep4Title => '당신의 리듬';

  @override
  String get onboardStep4Subtitle => '당신의 하루는 어떻게 흘러가야 할까요?';

  @override
  String get onboardNightlife => '밤문화에 대한 관심';

  @override
  String get onboardFoodie => '미식가의 열정';

  @override
  String get onboardPoolside => '풀사이드 및 다운타임';

  @override
  String get onboardAdventure => '모험과 야외 활동';

  @override
  String get onboardCulture => '문화 및 관광';

  @override
  String get dayFlowSubtitle => '체크리스트가 아닌 당신이 느끼고 싶은 방식에 따라 하루를 정하세요.';

  @override
  String get dayFlowMorning => '아침';

  @override
  String get dayFlowMidday => '대낮';

  @override
  String get dayFlowAfternoon => '오후';

  @override
  String get dayFlowEvening => '저녁';

  @override
  String get dayFlowNight => '밤';

  @override
  String get dayFlowReasonMorningPool =>
      '천천히 휴식을 취하세요. 하루가 시작되기 전에 풀사이드나 스파에서 휴식을 취하세요.';

  @override
  String get dayFlowReasonMorningCalm => '분위기를 조성하기 위한 부드러운 시작입니다.';

  @override
  String get dayFlowReasonMiddayAdventure => '최대 에너지 시간 — 상쾌한 동안의 큰 모험.';

  @override
  String get dayFlowReasonMiddayCulture => '빛이 밝은 동안 관광.';

  @override
  String get dayFlowReasonMiddayIcon => '오늘의 시그니처 순간.';

  @override
  String get dayFlowReasonMiddayLunch =>
      'A midday meal break between experiences.';

  @override
  String get dayFlowReasonAfternoonDowntime => '재충전을 위한 오후의 다운타임.';

  @override
  String get dayFlowReasonAfternoonGem => '군중에서 멀리 떨어진 숨겨진 보석.';

  @override
  String get dayFlowReasonEveningDining => '오늘의 식사 – 미식가가 선택하세요.';

  @override
  String get dayFlowReasonNightOut => '마지막 빛 - 밤 외출.';

  @override
  String weatherToday(String place) {
    return '지금은 $place에 있어요';
  }

  @override
  String weatherSunset(String time) {
    return '일몰 $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '비 올 확률은 $percent%입니다. 얇은 옷을 준비하세요.';
  }

  @override
  String get weatherConditionClear => '분명한';

  @override
  String get weatherConditionPartlyCloudy => '약간 흐림';

  @override
  String get weatherConditionCloudy => '흐린';

  @override
  String get weatherConditionFog => '안개';

  @override
  String get weatherConditionDrizzle => '이슬비';

  @override
  String get weatherConditionRain => '비';

  @override
  String get weatherConditionSnow => '눈';

  @override
  String get weatherConditionThunder => '뇌우';

  @override
  String get weatherConciergeTitle => '날씨 컨시어지';

  @override
  String get weatherConciergeTapHint => '여행에 따른 예측을 보려면 탭하세요.';

  @override
  String get weatherConciergeAdviceTitle => '룩소라 날씨 조언';

  @override
  String weatherFeelsLike(String temp) {
    return '$temp 같은 느낌이에요';
  }

  @override
  String get weatherHumidity => '습기';

  @override
  String get weatherWind => '바람';

  @override
  String weatherWindValue(String dir, int speed) {
    return '${speed}mph로 $dir';
  }

  @override
  String get weatherUv => '자외선 지수';

  @override
  String get weatherCloudCover => '구름 덮개';

  @override
  String get weatherVisibility => '시계';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$miles마일';
  }

  @override
  String weatherSunrise(String time) {
    return '일출 $time';
  }

  @override
  String get weatherStatRain => '비';

  @override
  String get weatherWhatToBring => '오늘 가져갈 것';

  @override
  String get weatherPlanImpact => '귀하의 계획에 미치는 영향';

  @override
  String get weatherHourlyTitle => '시간별 전망';

  @override
  String get weatherHourlyUnavailable => '데이터가 로드되면 시간별 예측이 표시됩니다.';

  @override
  String get weatherLiveRadar => '라이브 레이더';

  @override
  String get weatherRadarComingSoon => '실시간 레이더가 곧 제공될 예정입니다.';

  @override
  String get weatherRadarPlay => '반복 재생';

  @override
  String get weatherRadarPause => '루프 일시 정지';

  @override
  String get weatherRadarTapToExpand => '전체 화면을 보려면 탭하세요.';

  @override
  String get weatherRadarNow => '지금';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return '$minutes분 전';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes분';
  }

  @override
  String get weatherRadarStepBack => '이전 프레임';

  @override
  String get weatherRadarStepForward => '이후 프레임';

  @override
  String get weatherRadarJumpNow => '지금';

  @override
  String get weatherRadarJump1h => '-1시간';

  @override
  String get weatherRadarJump2h => '-2시간';

  @override
  String get weatherRadarJump30m => '+30분';

  @override
  String get weatherRadarSpeedSlow => '느린';

  @override
  String get weatherRadarSpeedNormal => '정상';

  @override
  String get weatherRadarSpeedFast => '빠른';

  @override
  String get weatherRadarLoopNote =>
      '레이더 루프: 10분 간격으로 최대 2시간을 지나고 가능한 경우 단거리 현재 방송(4시간 예측이 아님).';

  @override
  String get shareMapPreviewCaption => '지도 미리보기 · 실시간 길안내를 위해 Luxora에서 열기';

  @override
  String get shareRadarPreviewCaption => '라이브 도플러 레이더 · 전체 루프를 위해 Luxora에서 개방';

  @override
  String get weatherMapOverlays => '지도 오버레이';

  @override
  String get weatherOverlayPrecip => '강수량';

  @override
  String get weatherOverlayTemp => '온도';

  @override
  String get weatherOverlayWind => '바람';

  @override
  String get weatherOverlayCloud => '구름 덮개';

  @override
  String get weatherComingSoon => '곧 출시 예정';

  @override
  String get weatherAdjustDay => '날씨에 맞춰 하루를 조정하세요';

  @override
  String get weatherBestOutdoorWindow => '최고의 야외 창문';

  @override
  String get weatherRainWindow => '비 가능성 있음';

  @override
  String get weatherSunsetRec => '일몰 추천';

  @override
  String weatherOutdoorAtRisk(int count) {
    return '$count개의 야외 정류장이 영향을 받을 수 있음';
  }

  @override
  String get weatherIndoorBackup => '실내 백업 아이디어';

  @override
  String get weatherAdviceLightJacket => '오늘 저녁에는 가벼운 재킷을 가져오세요.';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return '$time 이전에 야외 활동을 계획하세요.';
  }

  @override
  String get weatherAdviceHighUv =>
      '오늘은 자외선이 높습니다. 자외선 차단제를 준비하고 한낮에 장시간 직사광선 노출을 피하세요.';

  @override
  String get weatherAdviceRainLater => '오늘 늦게 비를 맞을 위험이 높아지므로 실내 체험은 오후로 옮기세요.';

  @override
  String get weatherAdviceWindBeach => '오늘은 바람 때문에 해변이나 보트 활동이 덜 편안해질 수 있습니다.';

  @override
  String get weatherAdviceGreatSunset =>
      '오늘 밤 일몰이 아주 좋습니다. 옥상 저녁 식사나 호수 산책을 고려해 보세요.';

  @override
  String get weatherAdviceDefault =>
      '하늘은 관리하기 쉬워 보입니다. 계획을 따르고 조명 레이어를 편리하게 유지하세요.';

  @override
  String weatherSunsetRecRooftop(String time) {
    return '$time 근처에는 하늘이 맑습니다. 옥상 저녁 식사나 호수 산책이 빛날 수 있습니다.';
  }

  @override
  String get weatherPackSunscreen => '자외선 차단제';

  @override
  String get weatherPackSunglasses => '색안경';

  @override
  String get weatherPackUmbrella => '우산';

  @override
  String get weatherPackLightJacket => '가벼운 재킷';

  @override
  String get weatherPackShoes => '편안한 신발';

  @override
  String get weatherPackWater => '물병';

  @override
  String get weatherPackHat => '모자';

  @override
  String get weatherPackPoncho => '판초';

  @override
  String get weatherPackSwimwear => '수영복';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return '$time 이후에는 비 위험이 높아집니다. $outdoorStop을(를) 더 일찍 이동하고 나중을 위해 $indoorStop을(를) 저장해 보세요.';
  }

  @override
  String weatherImpactHeat(String time) {
    return '한낮의 무더위 — $time 이전에 야외 산책을 계획하세요.';
  }

  @override
  String get weatherImpactClear => '오늘 아침에는 야외 활동을 계획하기 좋은 하늘이 보입니다.';

  @override
  String weatherImpactMixed(int count) {
    return '오늘 $count개의 야외 정류장에 시간 조정이 필요할 수 있습니다.';
  }

  @override
  String get weatherImpactNoPlanRain => '비가 오고 있습니다. 먼저 실내 앵커로 하루를 시작하세요.';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return '가장 좋은 실외 창문은 열기나 소나기가 내리기 전의 $start–$end입니다.';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      '날씨가 꾸준해 보입니다. 순서대로 정지할 준비가 되면 나의 하루 계획을 탭하세요.';

  @override
  String get weatherImpactIndoorFallback => '스파나 박물관';

  @override
  String get hotelIntelBadge => '호텔 인텔리전스';

  @override
  String get hotelIntelTitle => '귀하의 본거지를 찾으십시오';

  @override
  String get hotelIntelSubtitle =>
      'Luxora는 귀하가 원하는 여행을 기반으로 예약 그리드가 아닌 귀하의 하루를 형성하는 숙박 시설을 선택합니다.';

  @override
  String get hotelDiscoveryTitle => '올랜도를 위해 선별됨';

  @override
  String get hotelMatchmakerTeaser =>
      'Luxora에게 귀하의 여행 스타일을 알려주고 컨시어지가 선정한 3회의 숙박을 정직하게 교환하세요.';

  @override
  String get hotelMatchmakerCta => 'AI 호텔 매치메이커';

  @override
  String get hotelMatchmakerTitle => '호텔 중매인';

  @override
  String get hotelMatchmakerSubtitle =>
      '여행 방법을 공유하세요. Luxora는 하루의 정박 장소를 추천합니다.';

  @override
  String get hotelMatchmakerRun => '나의 상위 3개 숙박 시설 찾기';

  @override
  String get hotelMatchBudget => '예산 안락 지대';

  @override
  String get hotelMatchTravelers => '여행자';

  @override
  String get hotelMatchAdults => '성인';

  @override
  String get hotelMatchKids => '어린이';

  @override
  String get hotelMatchAttractions => '목록에 있는 명소';

  @override
  String get hotelMatchLuxuryLevel => '원하는 럭셔리 수준';

  @override
  String get hotelMatchTransport => '돌아다니기';

  @override
  String get hotelTransportCar => '렌트카';

  @override
  String get hotelTransportRideshare => '승차 공유';

  @override
  String get hotelTransportShuttle => '리조트 셔틀';

  @override
  String get hotelTransportWalkable => '걷기 좋은 동네';

  @override
  String get hotelMatchResultsTitle => '상위 3개 경기';

  @override
  String hotelMatchWhyTitle(int score) {
    return '경기 점수 $score';
  }

  @override
  String get hotelMatchBestForLabel => '가장 적합한 대상:';

  @override
  String get hotelMatchItineraryLabel => '여행일정:';

  @override
  String get hotelMatchTradeoffsLabel => '장단점:';

  @override
  String get hotelMatchNearbyLabel => '가까운:';

  @override
  String get hotelLuxoraScore => '룩소라';

  @override
  String get hotelHomeBaseBadge => '홈 베이스';

  @override
  String get hotelScoreLuxury => '사치';

  @override
  String get hotelScoreFamily => '가족';

  @override
  String get hotelScoreRomance => '로맨스';

  @override
  String get hotelScoreWalkability => '걷다';

  @override
  String get hotelWhyRecommendTitle => 'Luxora가 이것을 추천하는 이유';

  @override
  String get hotelItineraryImpactTitle => '이것이 당신의 하루를 어떻게 형성하는지';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return '허브에서 대략적인 주행 시간: $driveTime. 여행 마찰 점수: $friction/90(낮을수록 차분함).';
  }

  @override
  String get hotelAddHomeBase => '홈 베이스로 추가';

  @override
  String get hotelHomeBaseActive => '홈 베이스 액티브';

  @override
  String get hotelViewOnMap => '지도에서 보기';

  @override
  String get hotelGetDirections => '길찾기';

  @override
  String get hotelCheckRates => '요금 확인';

  @override
  String get hotelVisitWebsite => '웹사이트 방문';

  @override
  String get hotelLinkUnavailable => '이 숙박에 대한 예약 링크는 아직 사용할 수 없습니다.';

  @override
  String get hotelLinkOpenFailed => '링크를 열 수 없습니다. 브라우저를 확인하거나 다시 시도하세요.';

  @override
  String get hotelSave => '호텔 저장';

  @override
  String get hotelSaved => '저장됨';

  @override
  String get hotelDistanceTitle => '주요 지점까지의 거리';

  @override
  String get hotelCompareTitle => '숙박 비교';

  @override
  String get hotelCompareSubtitle => '나란히 컨시어지 보기 — 최대 3개 호텔.';

  @override
  String hotelCompareSelected(int count) {
    return '$count개 선택됨';
  }

  @override
  String get hotelComparePrice => '가격대';

  @override
  String get hotelCompareDriveImpact => '영향력 증대';

  @override
  String get hotelCompareNearby => '주변 하이라이트';

  @override
  String get hotelPriceBudget => '예산';

  @override
  String get hotelPriceModerate => '보통의';

  @override
  String get hotelPriceUpscale => '고급';

  @override
  String get hotelPriceLuxury => '사치';

  @override
  String get hotelTagCouples => '커플에게 가장 적합';

  @override
  String get hotelTagDisney => '디즈니에 가장 적합';

  @override
  String get hotelTagUniversal => '유니버설에 가장 적합';

  @override
  String get hotelTagLuxuryStaycation => '럭셔리 스테이케이션';

  @override
  String get hotelTagFamily => '가족 친화적';

  @override
  String get hotelTagQuiet => '조용한 탈출';

  @override
  String get hotelTagWalkableDining => '걷기 좋은 식사';

  @override
  String get hotelTagResort => '리조트 느낌';

  @override
  String get hotelTagBudget => '예산 친화적';

  @override
  String get hotelReasonMatchesMood => '여행 기분과 속도에 딱 맞습니다.';

  @override
  String get hotelReasonCloseStops => '타임라인에서 예정된 정류장에 가깝습니다.';

  @override
  String hotelReasonSavesDrive(String time) {
    return '일반 허브에 비해 운전 시간이 절약됩니다. 중앙에서 약 $time 정도 소요됩니다.';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return '잘못된 리조트에 과도한 지출을 하지 않고도 $range 편안한 지역에 적합합니다.';
  }

  @override
  String get hotelReasonBetterGroup => '그룹 유형과 에너지 수준에 더 적합합니다.';

  @override
  String get hotelReasonNearbyDining => '편안한 저녁을 위한 강력한 인근 식사.';

  @override
  String get hotelReasonLowStress => '리조트 스타일의 평온함 - 물류가 줄어들고 휴가가 늘어납니다.';

  @override
  String get hotelMatchAttractionsGeneral => '계획된 명소';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return '귀하의 $attractions 일정에 따라 $hotel은 운전 시간을 줄이고 저녁 시간을 편안하게 유지합니다.';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$hotel의 $neighborhood이 이번 여행의 느낌에 딱 맞습니다.';
  }

  @override
  String get hotelMatchBestForFamily => '공원 이용권을 희생하지 않고 수영장 이용을 원하는 가족.';

  @override
  String get hotelMatchBestForCouple => '테마파크의 혼란 없이 로맨스를 원하는 커플.';

  @override
  String get hotelMatchBestForGroup => '편안함, 접근성, 차분한 물류의 균형을 유지하는 그룹입니다.';

  @override
  String hotelMatchImpactDisney(String time) {
    return '더 짧은 디즈니 운행 — 집 문에서 공원까지 약 $time 정도 소요됩니다.';
  }

  @override
  String get hotelMatchImpactUniversal =>
      '유니버설 익스프레스 특전이나 수상 택시 이용으로 하루의 시간을 절약할 수 있습니다.';

  @override
  String get hotelMatchImpactWalkable =>
      '저녁 식사 장소까지 걸어가세요. 공원에서 긴 시간을 보낸 후 주차 스트레스가 줄어듭니다.';

  @override
  String hotelMatchImpactDefault(String time) {
    return '$time쯤에 평균 운전을 유지하여 하루의 흐름을 편안하게 유지합니다.';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget =>
      '프리미엄 리조트 가격 - 객실에 더 많은 예산을 책정하고 다른 곳에서는 더 적은 예산을 책정합니다.';

  @override
  String get hotelMatchTradeoffCarNeeded =>
      '어디든 걸어 다닐 수 있는 기반이 아닌 자동차나 공유 차량을 이용하게 됩니다.';

  @override
  String get hotelMatchTradeoffLessFamily =>
      '전용 가족 리조트보다 어린이 중심 편의 시설에 덜 중점을 둡니다.';

  @override
  String get hotelMatchTradeoffLessRomantic => '조용한 커플 휴양지보다 테마파크 에너지가 더 많습니다.';

  @override
  String get hotelMatchTradeoffDefault =>
      '모든 숙박에는 장단점이 있습니다. Luxora는 우선 순위로 이것을 선택했습니다.';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return '$neighborhood 주변의 식사 및 체험.';
  }

  @override
  String get mapHotelIntelBannerTitle => '올바른 본거지를 선택하세요';

  @override
  String get mapHotelIntelBannerBody =>
      '호텔은 운전 시간, 하루 흐름, 식사 장소를 결정합니다. Luxora는 예약에 대한 압박 없이 선택을 도와드립니다.';

  @override
  String get mapHotelIntelBannerCta => 'Hotel Intelligence 살펴보기';

  @override
  String get sponsorLuxoraRecommended => '룩소라 추천';

  @override
  String get sponsorBadgeFeaturedPartner => '주요 파트너';

  @override
  String get sponsorBadgeSponsored => '후원';

  @override
  String get sponsorBadgePromoted => '승격됨';

  @override
  String get sponsorBadgePartnerOffer => '파트너 제안';

  @override
  String get sponsorCtaVisitWebsite => '웹사이트 방문';

  @override
  String get sponsorCtaBookNow => '지금 예약하세요';

  @override
  String get sponsorCtaCheckRates => '요금 확인';

  @override
  String get sponsorCtaGetTickets => '티켓 받기';

  @override
  String get sponsorCtaViewOffer => '제안 보기';

  @override
  String get featuredStaysTitle => '추천 숙박';

  @override
  String get featuredStaysSubtitle => '파트너 배치 — Luxora의 유기적 호텔 매치 점수와는 별개입니다.';

  @override
  String get featuredExperiencesTitle => '주요 경험';

  @override
  String get featuredExperiencesSubtitle =>
      '기분에 맞는 추천 상품 — 항상 라벨이 지정되어 있으며 AI 순위로 위장되지 않습니다.';

  @override
  String get featuredDiningTitle => '추천 다이닝';

  @override
  String get featuredDiningSubtitle =>
      '파트너 레스토랑 Luxora는 귀하의 유기농 보석 목록이 독립적으로 유지됨을 강조합니다.';

  @override
  String get featuredTicketPartnersTitle => '주요 티켓 파트너';

  @override
  String get featuredTicketPartnersSubtitle =>
      '공인 파트너 제안 — 아래의 유기적 절감액과 비교해 보세요.';

  @override
  String get featuredCityHomeTitle => '주요 파트너';

  @override
  String get featuredCityHomeSubtitle =>
      '올랜도를 위한 유용한 파트너 옵션 - 명확하게 표시되어 있으며 AI가 선택할 때 결코 숨겨지지 않습니다.';

  @override
  String get dayFlowVibeFoodie => '미식가를 지향하는';

  @override
  String get dayFlowVibeNightlife => '밤문화';

  @override
  String get dayFlowVibePoolside => '풀사이드';

  @override
  String get dayFlowVibeAdventure => '모험심이 강한';

  @override
  String get dayFlowVibeCulture => '문화';

  @override
  String get onboardStep5Title => '룩소라의 심장부';

  @override
  String get onboardStep5Subtitle => '이번 여행이 어떤 느낌이기를 바라나요?';

  @override
  String get onboardTripFeelHint => '일몰 저녁 식사, 느린 아침, 파트너와의 웃음…';

  @override
  String get onboardStepNameEyebrow => '당신의 이야기는 이름으로 시작됩니다';

  @override
  String get onboardStepNameTitle => '이번 여행을 뭐라고 불러야 할까요?';

  @override
  String get onboardStepNameSubtitle =>
      'Luxora는 여러분의 분위기에 맞춰 제목을 만들거나 직접 입력할 수 있습니다.';

  @override
  String get onboardTripNameLuxora => 'Luxora의 이름을 지정해 보세요.';

  @override
  String get onboardTripNameYours => '이름을 지을게요';

  @override
  String get onboardTripNameHint => '우리의 봄 기념일 탈출…';

  @override
  String onboardTripNameSuggested(String name) {
    return 'Luxora가 제안합니다: $name';
  }

  @override
  String get conciergeTripNameLabel => '여행 이름';

  @override
  String get moodRomantic => '로맨틱';

  @override
  String get moodRelaxing => '편안한';

  @override
  String get moodAdventurous => '모험심이 강한';

  @override
  String get moodLuxurious => '고급스러운';

  @override
  String get moodFamily => '가족 유대감';

  @override
  String get moodSocial => '사회의';

  @override
  String get moodNature => '자연 중심';

  @override
  String get moodWellness => '웰빙 휴양지';

  @override
  String get moodFoodie => '미식가 체험';

  @override
  String get catHiddenGems => '숨겨진 보석';

  @override
  String get catLuxuryStay => '럭셔리 스테이케이션';

  @override
  String get catBeaches => '해변';

  @override
  String get catRooftop => '루프탑 다이닝';

  @override
  String get catSpas => '스파';

  @override
  String get catNightlife => '밤문화';

  @override
  String get catFamily => '가족';

  @override
  String get catEco => '생태 관광';

  @override
  String get catThemeParks => '테마파크';

  @override
  String get catRomantic => '낭만적인 휴가';

  @override
  String get catFood => '음식 체험';

  @override
  String get catSprings => '스프링스';

  @override
  String get catIslands => '섬 호핑';

  @override
  String get catInfluencer => '영향력 있는 사람';

  @override
  String get placeCatBeach => '해변';

  @override
  String get placeCatDining => '다이닝';

  @override
  String get placeCatNature => '자연';

  @override
  String get placeCatNightlife => '밤문화';

  @override
  String get placeCatWellness => '웰빙';

  @override
  String get placeCatFamily => '가족';

  @override
  String get placeCatSprings => '스프링스';

  @override
  String get placeCatRomantic => '로맨틱';

  @override
  String get placeCatAdventure => '모험';

  @override
  String get placeCatHotel => '호텔';

  @override
  String get styleLessCrowded => '덜 혼잡함';

  @override
  String get styleLuxurySubtle => '럭셔리하지만 화려하지 않은';

  @override
  String get styleHiddenLuxury => '숨겨진 럭셔리';

  @override
  String get styleWalkable => '가능하면 도보 가능';

  @override
  String get styleSlowMornings => '느린 아침';

  @override
  String get styleNoTraps => '관광객 함정 없음';

  @override
  String get styleNatureHeavy => '무거운 성격';

  @override
  String get styleNatureWellness => '자연 + 웰니스 전용';

  @override
  String get styleAestheticDining => '미적인 다이닝';

  @override
  String get styleFamilyEasy => '가족 친화적인 물류';

  @override
  String get paywallHeroEyebrow => '귀하의 개인 컨시어지';

  @override
  String get paywallHeroHeadline => '휴가를 낭비하지 마세요';

  @override
  String get paywallHeroSubheadline => 'Luxora는 당신이 즐길 수 있도록 여행을 계획합니다.';

  @override
  String get paywallEmotionalLine =>
      '당신은 이미 휴가에 수천 달러를 지출하고 있습니다. 경험을 우연에 맡기지 마십시오.';

  @override
  String paywallHeadlineCouples(String cityName) {
    return '완벽한 $cityName 휴가가 여기서 시작됩니다.';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return '$cityName에서 계획하는 시간을 줄이고 추억을 만드는 데 더 많은 시간을 투자하세요.';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return '$cityName을(를) 다르게 경험해 보세요.';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return '대부분의 관광객이 한 번도 보지 못한 $cityName을(를) 발견해 보세요.';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return '현지인처럼 $cityName을 맛보세요.';
  }

  @override
  String get paywallWhatYouUnlock => '당신이 잠금 해제하는 것';

  @override
  String get paywallFeatureAiConcierge => 'AI 컨시어지';

  @override
  String get paywallFeatureItineraries => '맞춤형 여행 일정';

  @override
  String get paywallFeatureHiddenGems => '숨겨진 보석';

  @override
  String get paywallFeatureHotelIntel => '호텔 인텔리전스';

  @override
  String get paywallFeatureTicketSavings => '스마트 티켓 절약';

  @override
  String get paywallFeatureWeatherConcierge => '날씨 컨시어지';

  @override
  String get paywallFeatureCrowdIntel => '군중 지능';

  @override
  String get paywallFeatureGpsNav => 'GPS 네비게이션';

  @override
  String get paywallFeatureLocalSecrets => '지역 비밀';

  @override
  String get paywallFeatureDining => '식사 추천';

  @override
  String get paywallFeatureUnlimitedPlanning => '무제한 도시 계획';

  @override
  String get paywallWhyTravelersUnlock => '여행자들이 Luxora를 잠금 해제하는 이유';

  @override
  String get paywallBenefitSaveTimeTitle => '시간 절약';

  @override
  String get paywallBenefitSaveTimeBody => '연구와 계획에 소요되는 시간을 건너뛰세요.';

  @override
  String get paywallBenefitSaveMoneyTitle => '돈을 절약하세요';

  @override
  String get paywallBenefitSaveMoneyBody => '티켓 절약, 현지 할인, 더 현명한 선택을 알아보세요.';

  @override
  String get paywallBenefitAvoidTrapsTitle => '관광객의 함정을 피하세요';

  @override
  String get paywallBenefitAvoidTrapsBody => '현지인들이 실제로 추천하는 체험을 찾아보세요.';

  @override
  String get paywallBenefitTravelSmarterTitle => '더 스마트하게 여행하세요';

  @override
  String get paywallBenefitTravelSmarterBody => '날씨, 군중, 여행 스타일에 따라 추천을 받아보세요.';

  @override
  String paywallValueStory(String cityName, String price) {
    return '플로리다 각 팩(올랜도 Disney·Universal 포함)은 $price에 잠금 해제됩니다. $cityName 전체 컨시어지: 일정, 숨은 명소, 호텔 정보, 무제한 AI 가이드.';
  }

  @override
  String get paywallRoiHook => '별로인 식사, 비싼 티켓, 낭비된 오후는 이 일회 잠금 해제보다 비쌉니다.';

  @override
  String get paywallPeaceOfMindTitle => '마음의 평화, 기본 포함';

  @override
  String get paywallPeaceOfMindBody =>
      '또 다른 구독이 아닙니다. 도착 전에 계획되고 현지에서도 지원받는 더 똑똑한 휴가를 구매하는 것입니다.';

  @override
  String get paywallLockedPreviewTitle => '컨시어지 안에서 기다리기';

  @override
  String get paywallLockedPreviewSubtitle => '잠금을 해제하여 여행에 맞는 경로와 비밀을 알아보세요.';

  @override
  String get paywallLockedDateNight => '로맨틱한 데이트, 야간 루트';

  @override
  String get paywallLockedHiddenLuxury => '숨겨진 럭셔리 경험';

  @override
  String get paywallLockedVipSecrets => 'VIP 지역 비밀';

  @override
  String get paywallLockedConciergeRecs => '컨시어지 추천';

  @override
  String get paywallLockedFamilyPlans => '가족 스트레스 없는 계획';

  @override
  String get paywallLockedWeatherReroute => '날씨 인식 경로 변경';

  @override
  String get paywallLockedHotelMatchmaker => '스마트 호텔 중매인';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return '$cityName 컨시어지 잠금 해제';
  }

  @override
  String get paywallOneTimePurchase => '일회성 구매';

  @override
  String get paywallNoSubscription => '구독 없음';

  @override
  String get paywallNoMonthlyFees => '월 수수료 없음';

  @override
  String paywallLifetimeAccess(String cityName) {
    return '평생 $cityName 액세스';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return '향후 $cityName 업데이트가 포함됨';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return '대부분의 $cityName 휴가 비용은 $minUsd~$maxUsd+입니다.';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price 일회성';
  }

  @override
  String get paywallLessThanDinner => '휴가 저녁 식사 비용보다 저렴합니다.';

  @override
  String get paywallSocialProofTitle => '룩소라를 잠금 해제한 여행자';

  @override
  String get paywallSocialProofHeading => '착륙 전부터 그만한 가치';

  @override
  String get paywallReview1 => '\"계획 시간을 절약했습니다.\"';

  @override
  String get paywallReview2 => '\"우리가 결코 발견하지 못했을 장소를 발견했습니다.\"';

  @override
  String get paywallReview3 => '\"숨겨진 보석만으로도 가치가 있습니다.\"';

  @override
  String paywallCtaUnlock(String cityName) {
    return '$cityName 컨시어지 잠금 해제';
  }

  @override
  String get paywallContinueExploring => '계속 탐색';

  @override
  String get paywallConciergePromise => '구독 없음 · 평생 도시 액세스';

  @override
  String get paywallRestorePurchases => '구매 복원';

  @override
  String get paywallRestorePreviewDisabled =>
      '미리보기 모드에서는 복원이 비활성화됩니다 — 전체 빌드에서 테스트하세요.';

  @override
  String get paywallPurchaseSuccess => '구매 완료 — 컨시어지가 잠금 해제되었습니다.';

  @override
  String get paywallPurchasePending => '구매를 완료하는 중…';

  @override
  String get paywallPurchaseFailed => '구매를 완료할 수 없습니다. 다시 시도하거나 구매를 복원하세요.';

  @override
  String get paywallPurchaseCanceled => '구매가 취소되었습니다.';

  @override
  String get paywallRestoreComplete => '구매가 복원되었습니다.';

  @override
  String get paywallRestoreNone =>
      '이 Apple ID 또는 Google 계정에 대한 이전 구매 내역이 없습니다.';

  @override
  String get paywallStoreUnavailable => '이 기기에서는 App Store 결제를 사용할 수 없습니다.';

  @override
  String get paywallProductUnavailable => '이 팩은 아직 매장에서 구매할 수 없습니다.';

  @override
  String get settingsUnlockConciergeTitle => '도시 컨시어지 잠금 해제';

  @override
  String get settingsUnlockConciergeSubtitle => '일회성 시티팩 — 구독이 아님';

  @override
  String get settingsOpenConciergeSubtitle => 'AI 컨시어지 탭을 엽니다.';

  @override
  String get weatherMiamiHumidityIndoor =>
      '오늘은 습도가 높습니다. 일찍 해변이나 수영장에 가보고 가장 더운 시간에는 Wynwood나 Brickell에 가서 실내 식사와 갤러리를 찾으세요.';

  @override
  String get weatherMiamiHeatAdvisory =>
      '더위 주의보 조건 - 야외 활동 사이에 가벼운 옷감, 수분 공급 및 그늘 휴식 시간.';

  @override
  String get weatherMiamiBeachMorning =>
      '모래 위의 강한 자외선 - 자외선 차단제, 모자, 정오 이전 해변 시간.';

  @override
  String get weatherMiamiBoatWind =>
      '바람이 강해지면 보트나 요트 활동을 재고해 보세요. 옥상 식사는 여전히 가능합니다.';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return '비가 올 예정입니다. 야외 계획을 $indoorSpot 또는 갤러리 시간으로 바꾸세요.';
  }

  @override
  String get weatherMiamiSunsetWaterfront =>
      '일몰이 강하게 보입니다. 해안가나 옥상에서 동쪽에서 서쪽으로 바라볼 수 있습니다.';

  @override
  String get miamiBeachIntelTitle => '비치 인텔리전스';

  @override
  String miamiBeachBestTime(String time) {
    return '가장 좋은 시간: $time';
  }

  @override
  String get miamiBeachFamilyScore => '가족';

  @override
  String get miamiBeachCrowdScore => '군중';

  @override
  String get miamiBeachPhotoScore => '사진';

  @override
  String get miamiBeachRomanceScore => '로맨스';

  @override
  String get miamiBeachSunsetScore => '일몰';

  @override
  String miamiBeachParking(String level) {
    return '주차: $level';
  }

  @override
  String get miamiNightlifeTitle => '나이트라이프 컨시어지';

  @override
  String miamiNightlifeDressCode(String code) {
    return '드레스 코드: $code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return '최적의 도착 시간: $time';
  }

  @override
  String get miamiNightlifeReservation => '예약 권장';

  @override
  String get miamiMoodRoutesTitle => '마이애미 무드 루트';

  @override
  String get tampaBayMoodRoutesTitle => '탬파베이 무드 루트';

  @override
  String get stAugustineMoodRoutesTitle => '세인트오거스틴 무드 루트';

  @override
  String get naplesMoodRoutesTitle => '네이플스 무드 루트';

  @override
  String get destin30aMoodRoutesTitle => '데스틴 & 30A 무드 루트';

  @override
  String get vegasMoodRoutesTitle => '라스베이거스 무드 루트';

  @override
  String miamiMoodRouteStart(String time) {
    return '$time쯤에 시작하세요';
  }

  @override
  String get keysWaterIntelTitle => '키 워터 인텔리전스';

  @override
  String keysWaterBestTime(String time) {
    return '최적의 기간: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return '물: $note';
  }

  @override
  String get keysWaterSnorkelScore => '스노클';

  @override
  String get keysWaterDivingScore => '잠수';

  @override
  String get keysWaterBoatingScore => '보트';

  @override
  String get keysWaterFishingScore => '물고기';

  @override
  String get keysWaterWindScore => '바람';

  @override
  String get keysWaterSunsetScore => '일몰';

  @override
  String get keysWaterCrowdScore => '군중';

  @override
  String get keysMoodRoutesTitle => '키스 아일랜드 노선';

  @override
  String keysMoodRouteStart(String time) {
    return '$time에 시작하세요';
  }

  @override
  String get paywallHeadlineMiamiDefault => '마이애미를 다르게 경험해보세요';

  @override
  String get paywallHeadlineMiamiWeekend => '마이애미 주말을 낭비하지 마세요';

  @override
  String get paywallOrlandoAddonsHeading => '테마파크 팩';

  @override
  String get paywallOrlandoBaseIncludes =>
      '올랜도 잠금 해제에는 식사, 숨겨진 보석, 호텔 및 공원 외 경험이 포함됩니다. 디즈니와 유니버설 테마파크 팩을 함께 추가하세요.';

  @override
  String get paywallAddonThemeParksTitle => '디즈니 & 유니버설 팩';

  @override
  String get paywallAddonThemeParksSubtitle =>
      '월트 디즈니 월드와 유니버설 올랜도 — 모든 공원, 상품, 경로, 군중 정보를 한 번에 잠금 해제할 수 있습니다.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return '$packName 잠금 해제 · $price';
  }

  @override
  String get paywallAddonUnlocked => '잠금 해제됨';

  @override
  String get paywallAddonRequiresOrlando => '먼저 올랜도를 잠금 해제해야 합니다.';

  @override
  String paywallUnlockAddonPack(String packName) {
    return '$packName 잠금 해제';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return '$packName 잠금 해제';
  }

  @override
  String get orlandoThemeParksPromptTitle => '올랜도의 디즈니와 유니버설을 잠금 해제하시겠습니까?';

  @override
  String get orlandoThemeParksPromptBody =>
      '월트 디즈니 월드와 유니버설 올랜도의 테마파크 팩을 추가하세요. 모든 공원, 티켓 거래, 경로, 군중 정보를 한 번에 잠금 해제할 수 있습니다.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return '잠금 해제 · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => '지금은 아님';

  @override
  String get onboardV2Eyebrow => '당신의 완벽한 여행을 디자인해 보세요';

  @override
  String get onboardV2StepTravelerEyebrow => '1단계';

  @override
  String get onboardV2StepTravelerTitle => '누구와 함께 여행하시나요?';

  @override
  String get onboardV2StepTravelerSubtitle =>
      'Luxora는 직원들에게 숙박, 식사, 보행을 맞춤 제공합니다.';

  @override
  String get onboardV2ChildrenLabel => '여행하는 어린이?';

  @override
  String get onboardV2StepStyleEyebrow => '2단계';

  @override
  String get onboardV2StepStyleTitle => '당신은 어떤 종류의 여행을 찾고 있나요?';

  @override
  String get onboardV2StepStyleSubtitle => '당신을 흥분시키는 모든 것을 선택하십시오.';

  @override
  String get onboardV2StepHotelEyebrow => '3단계';

  @override
  String get onboardV2StepHotelTitle => '어떤 유형의 숙소에 머물고 싶나요?';

  @override
  String get onboardV2StepHotelSubtitle => '부티크 보석과 리조트 아이콘을 매칭해 드립니다.';

  @override
  String get onboardV2HotelBudgetLabel => '호텔 예산';

  @override
  String get onboardV2HotelAmenitiesLabel => '필수 편의시설';

  @override
  String get onboardV2StepFoodEyebrow => '4단계';

  @override
  String get onboardV2StepFoodTitle => '어떤 유형의 레스토랑을 즐기시나요?';

  @override
  String get onboardV2StepFoodSubtitle => '요리와 식사 스타일 — 좋아하는 것을 모두 선택하세요.';

  @override
  String get onboardV2CuisineLabel => '요리 종류';

  @override
  String get onboardV2DiningStyleLabel => '식사 스타일';

  @override
  String get onboardV2StepPaceEyebrow => '5단계';

  @override
  String get onboardV2StepPaceTitle => '하루를 어떻게 계획하시겠습니까?';

  @override
  String get onboardV2StepPaceSubtitle => '편안한 아침 또는 빡빡한 모험 중 원하는 것을 선택하세요.';

  @override
  String get onboardV2PaceRelaxedTitle => '편안한';

  @override
  String get onboardV2PaceRelaxedBody => '하루에 2~3개의 활동';

  @override
  String get onboardV2PaceBalancedTitle => '균형 잡힌';

  @override
  String get onboardV2PaceBalancedBody => '하루에 4~5개의 활동';

  @override
  String get onboardV2PacePackedTitle => '포장됨';

  @override
  String get onboardV2PacePackedBody => '매일을 극대화하라';

  @override
  String get onboardV2StepGoalsEyebrow => '6단계';

  @override
  String get onboardV2StepGoalsTitle => '이번 여행에서 가장 중요한 것은 무엇인가요?';

  @override
  String get onboardV2StepGoalsSubtitle => '최대 5개의 우선순위를 선택하세요.';

  @override
  String get onboardV2StepExperienceEyebrow => '7단계';

  @override
  String get onboardV2StepExperienceTitle => '어떤 경험을 즐기시겠습니까?';

  @override
  String get onboardV2StepExperienceSubtitle => '우리는 이것을 귀하의 여행 일정에 포함시킬 것입니다.';

  @override
  String get onboardV2StepAvoidEyebrow => '8단계';

  @override
  String get onboardV2StepAvoidTitle => '무엇을 피하고 싶습니까?';

  @override
  String get onboardV2StepAvoidSubtitle => 'Luxora는 여행에 지장을 초래하는 요소를 제거합니다.';

  @override
  String get onboardV2StepEmotionEyebrow => '9단계';

  @override
  String get onboardV2StepEmotionTitle => '무엇이 이번 여행을 성공적으로 느껴지게 만들까요?';

  @override
  String get onboardV2StepEmotionSubtitle => '하나의 기본 감정을 선택하십시오.';

  @override
  String get onboardV2StepSummaryEyebrow => 'LUXORA';

  @override
  String onboardV2StepSummaryTitle(String name) {
    return '완벽해요, $name님.';
  }

  @override
  String get onboardV2StepSummarySubtitle =>
      '어떤 여행자인지 조금 알게 되었어요.\n\n이제 선호에 맞는 장소, 경험, 레스토랑, 숨은 명소를 추천할게요.\n\n모든 추천은 당신만을 위한 것입니다.\n\n무엇을 발견할 수 있을지 봐요.';

  @override
  String get onboardSummaryHotels => '호텔';

  @override
  String get onboardSummaryRestaurants => '레스토랑';

  @override
  String get onboardSummaryHiddenGems => '숨겨진 보석';

  @override
  String get onboardSummaryExperiences => '경험담';

  @override
  String get onboardSummaryHotelDefault => '귀하의 예산에 맞춰 엄선된 숙박';

  @override
  String onboardSummaryHotelType(String type) {
    return '$type 숙박';
  }

  @override
  String get onboardSummaryRooftopDining => '루프탑 식사 경험';

  @override
  String onboardSummaryCuisine(String cuisine) {
    return '$cuisine 즐겨찾기';
  }

  @override
  String onboardSummaryPace(String pace) {
    return '$pace 일일 속도';
  }

  @override
  String get onboardSummaryRomantic => '낭만적인 일몰 체험';

  @override
  String onboardSummaryEmotion(String emotion) {
    return '$emotion 중심 여행';
  }

  @override
  String get onboardSummaryPremiumGems => '프리미엄 숨겨진 보석';

  @override
  String get agendaSuggestionsForYou => '당신을 위해 선택';

  @override
  String get agendaSuggestionsAlternates => '또한 훌륭합니다';

  @override
  String get agendaSuggestionsBrowseAll => '모두 찾아보기';

  @override
  String get onboardPrefTravelerSolo => '독주';

  @override
  String get onboardPrefTravelerCouple => '커플';

  @override
  String get onboardPrefTravelerFamily => '가족';

  @override
  String get onboardPrefTravelerFriends => '친구';

  @override
  String get onboardPrefTravelerBusiness => '사업';

  @override
  String get onboardPrefChildrenNone => '어린이 없음';

  @override
  String get onboardPrefChildrenToddlers => '유아';

  @override
  String get onboardPrefChildrenElementary => '초등학교 연령';

  @override
  String get onboardPrefChildrenTeenagers => '청소년';

  @override
  String get onboardPrefStyleLuxury => '사치';

  @override
  String get onboardPrefStyleRelaxation => '기분 전환';

  @override
  String get onboardPrefStyleAdventure => '모험';

  @override
  String get onboardPrefStyleThemeParks => '테마파크';

  @override
  String get onboardPrefStyleFoodie => '미식가';

  @override
  String get onboardPrefStyleNightlife => '밤문화';

  @override
  String get onboardPrefStyleRomance => '로맨스';

  @override
  String get onboardPrefStyleShopping => '쇼핑';

  @override
  String get onboardPrefStyleBeaches => '해변';

  @override
  String get onboardPrefStyleWellness => '웰빙';

  @override
  String get onboardPrefStyleNature => '자연';

  @override
  String get onboardPrefStylePhotography => '사진술';

  @override
  String get onboardPrefStyleHiddenGems => '숨겨진 보석';

  @override
  String get onboardPrefStyleFamilyActivities => '가족 활동';

  @override
  String get onboardPrefStyleLocalExperiences => '현지 체험';

  @override
  String get onboardPrefStyleEntertainment => '오락';

  @override
  String get onboardPrefHotelLuxuryResort => '럭셔리 리조트';

  @override
  String get onboardPrefHotelBoutique => '부티크 호텔';

  @override
  String get onboardPrefHotelFamilyResort => '패밀리 리조트';

  @override
  String get onboardPrefHotelBudgetFriendly => '예산 친화적';

  @override
  String get onboardPrefHotelAdultsOnly => '성인 전용';

  @override
  String get onboardPrefHotelSpaResort => '스파 리조트';

  @override
  String get onboardPrefHotelBeachfront => '해변가';

  @override
  String get onboardPrefHotelDowntown => '도심';

  @override
  String get onboardPrefHotelWalkable => '도보 가능 지역';

  @override
  String get onboardPrefHotelThemeParkArea => '테마파크 지역';

  @override
  String get onboardPrefHotelModern => '모던 호텔';

  @override
  String get onboardPrefHotelHistoric => '히스토릭 호텔';

  @override
  String get onboardPrefBudgetOne => '\$';

  @override
  String get onboardPrefBudgetTwo => '\$\$';

  @override
  String get onboardPrefBudgetThree => '\$\$\$';

  @override
  String get onboardPrefBudgetFour => '\$\$\$\$';

  @override
  String get onboardPrefAmenityPool => '수영장';

  @override
  String get onboardPrefAmenitySpa => '온천';

  @override
  String get onboardPrefAmenityGym => '체육관';

  @override
  String get onboardPrefAmenityBreakfast => '무료 아침 식사';

  @override
  String get onboardPrefAmenityOceanView => '오션뷰';

  @override
  String get onboardPrefAmenityBalcony => '발코니';

  @override
  String get onboardPrefAmenityKitchen => '주방';

  @override
  String get onboardPrefAmenityShuttle => '셔틀 서비스';

  @override
  String get onboardPrefAmenityPetFriendly => '애완동물 친화적';

  @override
  String get onboardPrefCuisineAmerican => '미국 사람';

  @override
  String get onboardPrefCuisineItalian => '이탈리아 사람';

  @override
  String get onboardPrefCuisineMexican => '멕시코 인';

  @override
  String get onboardPrefCuisineSeafood => '해산물';

  @override
  String get onboardPrefCuisineSteakhouse => '스테이크하우스';

  @override
  String get onboardPrefCuisineSushi => '스시';

  @override
  String get onboardPrefCuisineCuban => '쿠바 사람';

  @override
  String get onboardPrefCuisineMediterranean => '지중해';

  @override
  String get onboardPrefCuisineAsian => '아시아 사람';

  @override
  String get onboardPrefCuisineBbq => '바베큐';

  @override
  String get onboardPrefCuisineFineDining => '고급 식사';

  @override
  String get onboardPrefCuisineLocalFavorites => '지역 즐겨찾기';

  @override
  String get onboardPrefCuisineFoodTrucks => '푸드트럭';

  @override
  String get onboardPrefCuisineRooftop => '루프탑 다이닝';

  @override
  String get onboardPrefCuisineBrunch => '브런치';

  @override
  String get onboardPrefCuisineDessert => '디저트';

  @override
  String get onboardPrefDiningQuick => '퀵서비스';

  @override
  String get onboardPrefDiningCasual => '캐주얼 다이닝';

  @override
  String get onboardPrefDiningFamily => '가족 친화적';

  @override
  String get onboardPrefDiningDateNight => '데이트 나이트';

  @override
  String get onboardPrefDiningFine => '고급 식사';

  @override
  String get onboardPrefDiningWaterfront => '해안가';

  @override
  String get onboardPrefDiningHiddenGems => '숨겨진 보석';

  @override
  String get onboardPrefDiningLocal => '지역 즐겨찾기';

  @override
  String get onboardPrefGoalMakeMemories => '추억을 만드세요';

  @override
  String get onboardPrefGoalSaveMoney => '돈을 절약하세요';

  @override
  String get onboardPrefGoalAvoidCrowds => '군중을 피하세요';

  @override
  String get onboardPrefGoalLuxury => '럭셔리한 경험';

  @override
  String get onboardPrefGoalBestFood => '최고의 음식';

  @override
  String get onboardPrefGoalHiddenGems => '숨겨진 보석';

  @override
  String get onboardPrefGoalRelaxation => '기분 전환';

  @override
  String get onboardPrefGoalAdventure => '모험';

  @override
  String get onboardPrefGoalBestPhotos => '최고의 사진';

  @override
  String get onboardPrefGoalFamilyTime => '가족 시간';

  @override
  String get onboardPrefGoalRomance => '로맨스';

  @override
  String get onboardPrefGoalNightlife => '밤문화';

  @override
  String get onboardPrefGoalLocal => '현지 체험';

  @override
  String get onboardPrefGoalStressFree => '스트레스 없는 계획';

  @override
  String get onboardPrefExpBoatTours => '보트 투어';

  @override
  String get onboardPrefExpSunsetCruises => '선셋 크루즈';

  @override
  String get onboardPrefExpAirboat => '에어보트 투어';

  @override
  String get onboardPrefExpThemeParks => '테마파크';

  @override
  String get onboardPrefExpMuseums => '박물관';

  @override
  String get onboardPrefExpLiveShows => '라이브 쇼';

  @override
  String get onboardPrefExpSpas => '스파';

  @override
  String get onboardPrefExpShopping => '쇼핑';

  @override
  String get onboardPrefExpWaterParks => '워터파크';

  @override
  String get onboardPrefExpGolf => '골프';

  @override
  String get onboardPrefExpFishing => '어업';

  @override
  String get onboardPrefExpKayaking => '카약';

  @override
  String get onboardPrefExpSnorkeling => '스노클링';

  @override
  String get onboardPrefExpRooftopBars => '루프탑 바';

  @override
  String get onboardPrefExpNightclubs => '나이트클럽';

  @override
  String get onboardPrefExpWildlife => '야생동물 체험';

  @override
  String get onboardPrefExpFoodTours => '푸드 투어';

  @override
  String get onboardPrefExpScenicDrives => '경치 좋은 드라이브';

  @override
  String get onboardPrefAvoidCrowds => '군중';

  @override
  String get onboardPrefAvoidLongLines => '긴 줄';

  @override
  String get onboardPrefAvoidExpensiveRestaurants => '비싼 레스토랑';

  @override
  String get onboardPrefAvoidWalking => '장거리 걷기';

  @override
  String get onboardPrefAvoidNightlife => '밤문화';

  @override
  String get onboardPrefAvoidDriving => '운전';

  @override
  String get onboardPrefAvoidTouristTraps => '관광객의 함정';

  @override
  String get onboardPrefAvoidEarlyMornings => '이른 아침';

  @override
  String get onboardPrefAvoidLateNights => '심야';

  @override
  String get onboardPrefAvoidFamilyAttractions => '가족 여행';

  @override
  String get onboardPrefAvoidThemeParks => '테마파크';

  @override
  String get onboardPrefEmotionRelaxed => '편안한';

  @override
  String get onboardPrefEmotionExcited => '흥분한';

  @override
  String get onboardPrefEmotionAdventurous => '모험심이 강한';

  @override
  String get onboardPrefEmotionRomantic => '로맨틱';

  @override
  String get onboardPrefEmotionLuxurious => '고급스러운';

  @override
  String get onboardPrefEmotionFamilyFocused => '가족 중심';

  @override
  String get onboardPrefEmotionMemorable => '기억에 남는';

  @override
  String get onboardPrefEmotionStressFree => '스트레스 프리';

  @override
  String get onboardPrefEmotionInspiring => '영감을 주는';

  @override
  String get onboardPrefPaceSlow => '편안한';

  @override
  String get onboardPrefPaceBalanced => '균형 잡힌';

  @override
  String get onboardPrefPacePacked => '포장됨';

  @override
  String get onboardSummaryHiddenGemsInsight => '숨겨진 현지 레스토랑과 보석';

  @override
  String get onboardBuildFailedHint =>
      '귀하의 기본 설정을 저장했지만 여행 일정에 잠시 시간이 더 필요합니다. 끌어서 의제를 새로 고치거나 컨시어지를 엽니다.';

  @override
  String get onboardV2ChildrenSubtitle => '해당하는 연령층을 모두 선택하세요.';

  @override
  String get onboardTravelerNameEyebrow => '중요한 것 먼저';

  @override
  String get onboardTravelerNameTitle => 'Luxora는 당신을 뭐라고 불러야 할까요?';

  @override
  String get onboardTravelerNameSubtitle =>
      '이름이면 충분합니다. Luxora는 채팅할 때 이름을 사용합니다.';

  @override
  String get onboardTravelerNameLabel => '당신의 이름';

  @override
  String get onboardTravelerNameHint => '예를 들어 마리아';

  @override
  String conciergeWelcomeNamed(String name) {
    return '환영합니다, $name 님. 감정적으로 지능적인 플로리다의 동반자입니다.\n\n아래에서 프롬프트를 선택하거나 여행으로 만들고 싶은 느낌을 설명하세요.';
  }

  @override
  String conciergeWelcomeWarmNamed(String name) {
    return '$name 님, 저는 관광지 체크리스트가 아니라 여러분이 원하는 느낌에 따라 플로리다를 형성하기 위해 왔습니다. 오늘 당신은 무엇을 갈망하고 있습니까?';
  }

  @override
  String get onboardWelcomeEyebrow => 'LUXORA';

  @override
  String get onboardWelcomeTitle => '안녕하세요, Luxora예요.';

  @override
  String get onboardWelcomeTagline => '당신만의 여행 컨시어지.';

  @override
  String get onboardWelcomeBody =>
      '놀라운 장소 발견, 관광객 함정 피하기, 오래 기억할 휴가 만들기를 도와드려요.\n\n잊지 못할 여행을 계획해 봐요.';

  @override
  String get onboardWelcomeCta => '여행 시작하기';

  @override
  String get onboardLuxoraGuideBody =>
      '이제부터 여행의 모든 단계를 함께할게요.\n\n숨은 명소, 훌륭한 음식, 잊을 수 없는 경험, 또는 스트레스 없는 휴가 — 제가 함께합니다.';

  @override
  String get onboardLuxoraReplyClosing => '함께 완벽한 모험을 만들어 봐요.';

  @override
  String onboardBuildingTitle(String name) {
    return '멋진 선택이에요, $name님.';
  }

  @override
  String get onboardBuildingBody =>
      '여행 스타일, 관심사, 페이스, 식사 선호, 휴가 목표에 맞춰 맞춤 일정을 만들고 있어요.\n\n잠시 시간이 걸릴 수 있습니다.';

  @override
  String get onboardBuildingTagline => '좋은 휴가는 우연히 온다.\n\n위대한 휴가는 계획에서 온다.';

  @override
  String get onboardItineraryReadyTitle => '모험이 준비됐어요.';

  @override
  String get onboardItineraryReadyBody =>
      '설명해 주신 여행에 맞는 경험, 레스토랑, 명소, 숨은 보석을 신중히 골랐어요.\n\n물론 언제든 조정할 수 있어요.\n\n최고의 휴가는 진행되며 변합니다.';

  @override
  String weatherRerouteLuxoraIntro(String name) {
    return '$name님, 오늘 일정 일부에 날씨 영향이 있을 수 있어요.';
  }

  @override
  String get weatherRerouteLuxoraClosing => '때로는 예상치 못한 일이 최고의 추억을 만듭니다.';

  @override
  String rightNowLuxoraIntro(String name) {
    return '$name님, 위치, 현재 날씨, 선호를 바탕으로 — 지금이라면 이걸 추천해요.';
  }

  @override
  String get rightNowLuxoraClosing => '믿어 보세요.\n\n정말 마음에 들 거예요.';

  @override
  String paywallPersonalPitch(String name, String cityName) {
    return '$name님, 맞춤 휴가 계획이 이미 형태를 갖추고 있어요.\n\n1일차 준비 완료.\n\n나머지 여정이 기다립니다.\n\n$cityName Concierge를 잠금 해제해 전체 일정, 숨은 명소, 로컬 시크릿, 날씨 인텔리전스, 무제한 컨시어지를 이용하세요.\n\n잊지 못할 휴가로 만들어요.';
  }

  @override
  String get onboardLuxoraReplyEyebrow => '룩소라';

  @override
  String onboardLuxoraReplyTitle(String name) {
    return '만나서 반가워요, $name 님.';
  }

  @override
  String onboardLuxoraGuideNamed(String name) {
    return '이제부터 여행의 모든 단계를 함께할게요.\n\n숨은 명소, 훌륭한 음식, 잊을 수 없는 경험, 또는 스트레스 없는 휴가 — 제가 함께합니다.';
  }

  @override
  String get onboardLuxoraItineraryPromise => '함께 완벽한 모험을 만들어 봐요.';

  @override
  String get onboardReturningEyebrow => '다시 오신 것을 환영합니다';

  @override
  String onboardReturningTitle(String name) {
    return '다시 오신 것을 환영합니다, $name님.';
  }

  @override
  String get onboardReturningTitleGeneric => '다시 오신 것을 환영합니다.';

  @override
  String get onboardReturningSubtitle =>
      '모험을 이어갈 준비가 되셨나요?\n\n선호, 즐겨찾는 장소, 여행 계획을 저장해 두었어요. 이어서 시작해요.\n\n오늘 무엇이 기다리는지 봐요.';

  @override
  String get todayPlanSectionTitle => '오늘의 계획';

  @override
  String get todayNextActivityLabel => '다음';

  @override
  String get todayStaysDiningSection => '숙박 및 다이닝 추천';

  @override
  String get todayStaysDiningCollapsedHint => '호텔 및 레스토랑 아이디어 - 펼치려면 탭하세요.';

  @override
  String get todayPlanDetailsTitle => '전체 일정';

  @override
  String todayPlanStopCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count회입니다',
      one: '1 stop today',
    );
    return '$_temp0';
  }

  @override
  String todayDayHeading(int day) {
    return '$day일차';
  }

  @override
  String get todayHappeningNowLabel => '진행 중';

  @override
  String get todayPlanComplete => '오늘 일정이 완료되었습니다';

  @override
  String todayStartsIn(String duration) {
    return '$duration 후 시작';
  }

  @override
  String get todayRainRerouteTitle => '날씨 경로 변경';

  @override
  String get todayExtrasSection => '티켓 및 공유';

  @override
  String get todayExtrasCollapsedHint => '특가, 공유 카드 등';

  @override
  String freemiumVacationTitle(String cityName) {
    return '$cityName 휴가';
  }

  @override
  String get freemiumDay1Ready => '✓ 1일차 준비됨';

  @override
  String get freemiumUnlockFullPlan => '전체 휴가 계획 잠금 해제';

  @override
  String freemiumLockedDayConcierge(int day) {
    return '$day일차 · 컨시어지 최적화';
  }

  @override
  String get freemiumLockedDayGems => '3일차 · 숨은 보석 루트';

  @override
  String get freemiumLockedDayWeather => '4일차 · 날씨 대응 계획';

  @override
  String get freemiumLockedDayDeparture => '5일차 · 출발 전략';

  @override
  String freemiumConciergeRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '무료 질문 $count개 남음',
      one: '무료 질문 1개 남음',
    );
    return '$_temp0';
  }

  @override
  String get freemiumConciergeLimitReached =>
      '무료 컨시어지 한도 도달 — 무제한 계획을 위해 잠금 해제.';

  @override
  String freemiumLockedHotels(int count) {
    return '🔒 $count개 이상의 추가 호텔';
  }

  @override
  String freemiumLockedRestaurants(int count) {
    return '🔒 $count개 이상의 추가 레스토랑';
  }

  @override
  String freemiumLockedGems(int count) {
    return '🔒 $count개 이상의 숨은 보석';
  }

  @override
  String freemiumLockedSecrets(int count) {
    return '🔒 $count개 이상의 로컬 시크릿';
  }

  @override
  String freemiumLockedExperiences(int count) {
    return '🔒 $count개 이상의 체험';
  }

  @override
  String get freemiumLockedAttractions => '🔒 추가 명소 이용 가능';

  @override
  String freemiumUnlockExplore(String cityName) {
    return '계속 탐색하려면 $cityName Concierge 잠금 해제.';
  }

  @override
  String freemiumUnlockConcierge(String cityName) {
    return '$cityName Concierge 잠금 해제';
  }

  @override
  String freemiumHeadlineDayTwoPlus(String cityName) {
    return '다음 날짜가 준비됐습니다 — $cityName 전체 계획 잠금 해제.';
  }

  @override
  String get freemiumHeadlineConciergeLimit => '무제한 컨시어지로 계획을 계속하세요.';

  @override
  String freemiumHeadlineHotels(String cityName) {
    return '모든 숙소 추천을 위해 $cityName Concierge 잠금 해제.';
  }

  @override
  String freemiumHeadlineRestaurants(String cityName) {
    return '$cityName 전체 레스토랑 컬렉션 잠금 해제.';
  }

  @override
  String get freemiumHeadlineGems => '로컬 즐겨찾기와 숨은 보석이 기다립니다.';

  @override
  String get freemiumHeadlineSecrets => '현지인의 시간·주차 비밀 잠금 해제.';

  @override
  String freemiumHeadlineExperiences(String cityName) {
    return '$cityName 전역의 큐레이션 체험 잠금 해제.';
  }

  @override
  String get freemiumHeadlineAttractions => '전체 명소 컬렉션 잠금 해제.';

  @override
  String get freemiumHeadlineHotelMatchmaker =>
      '모든 숙소를 비교하려면 Hotel Intelligence 잠금 해제.';

  @override
  String get freemiumHeadlineFullItinerary => '전체 휴가 계획 잠금 해제.';

  @override
  String get freemiumLocalSecretsTitle => '로컬 시크릿';

  @override
  String get freemiumLocalSecretsSubtitle => '현지인이 지키는 시간, 주차, 전망 스팟.';

  @override
  String get onboardNeedChoiceHint => '계속하려면 최소 한 가지를 선택해 주세요.';
}
