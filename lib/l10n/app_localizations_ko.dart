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
  String get settingsThemeIntro => '시네마틱 럭셔리 또는 깔끔한 가독성 — 하루에 맞는 스타일을 선택하세요.';

  @override
  String get settingsThemeSectionLuxury => '시네마틱 럭셔리';

  @override
  String get settingsThemeSectionReadable => '깔끔하고 읽기 쉬운';

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
  String get navDiscover => '발견하다';

  @override
  String get navMap => '지도';

  @override
  String get navTrips => '여행';

  @override
  String get navMore => '더';

  @override
  String get navTimeline => '타임라인';

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
  String get ticketDealsRefreshFailed => '가격을 새로고침할 수 없습니다 — 캐시된 혜택을 표시합니다.';

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
  String get radiusDesc25Keys => '키 라르고, 이슬라모라다 및 북부 리프 회랑';

  @override
  String get radiusDesc50Keys => '마라톤, 빅 파인 및 중부 키스 해변';

  @override
  String get radiusDesc100Keys => '키 웨스트까지 전체 오버시즈 하이웨이';

  @override
  String get radiusDescAllKeys => '전체 섬 체인과 당일치기 수역';

  @override
  String get feedBadge => '실시간 검색';

  @override
  String get feedTitle => '경험 피드';

  @override
  String get feedSubtitle =>
      '현재 인기 있는 장소, 인기 명소, 새로운 오프닝, 크리에이터 추천, 시즌별 경로, 실시간 업데이트 등이 있습니다.';

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
  String get feedMoodAll => '모든 것';

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
  String get feedEmptyHint =>
      '이 반경에는 피드 카드가 없습니다. 걸프 해안과 키스 하이라이트를 보려면 50마일 또는 All Florida를 시도해 보세요.';

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
  String get mapParkingLevelEasy => '쉬움';

  @override
  String get mapParkingLevelModerate => '보통';

  @override
  String get mapParkingLevelDifficult => '어려움';

  @override
  String get mapParkingLevelLimited => '제한적 · 일찍 도착';

  @override
  String mapParkingAtStop(String level) {
    return '주차: $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return '운전 부담: $score/90';
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
  String get mapRerouteRainHint => '비가 올 가능성이 높습니다. 실내 백업을 위해 경로 재설정을 탭하세요.';

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
  String get conciergeThinking => 'Luxora가 생각 중…';

  @override
  String get conciergeAiError => 'Luxora에 연결할 수 없습니다. 연결을 확인하고 다시 시도하세요.';

  @override
  String get conciergeAiNotConfigured =>
      '라이브 컨시어지는 Supabase + OpenAI가 필요합니다. SUPABASE_URL과 SUPABASE_ANON_KEY를 로컬 config에 추가하고 concierge-chat edge function을 배포하세요 — docs/CONCIERGE_AI.md.';

  @override
  String get mapAiPowers => 'AI 지도의 힘';

  @override
  String get mapNavLayerTitle => '정류장 마찰 인텔';

  @override
  String get mapNavLayerSubtitle => '일정의 혼잡·주차·운전 스트ress — 원탭 재경로 포함.';

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
  String get mapFutureCrowdTitle => '혼잡 전망';

  @override
  String get mapFutureCrowdDesc => 'Plan my day 각 정류장의 한산~만원 예측 구간.';

  @override
  String get mapFutureParkingTitle => '주차 전망';

  @override
  String get mapFutureParkingDesc => '출발 전 발렛·주차장·도착 마찰 추정.';

  @override
  String get mapFutureTrafficTitle => 'Drive friction score';

  @override
  String get mapFutureTrafficDesc => '일정 각 구간의 스트레스 점수 — 시간만이 아님.';

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
  String get tripsLiveWeather => '실시간 날씨';

  @override
  String get tripsNextUp => '다음은';

  @override
  String get tripsSunsetWindow => '일몰창';

  @override
  String get tripsTimelineSnapshot => '타임라인 스냅샷';

  @override
  String get tripsOpenTimeline => '전체 타임라인 열기';

  @override
  String get tripsShare => '공유하다';

  @override
  String get shareItineraryFooter => '감정적으로 지능적인 플로리다 동반자인 Luxora와 함께 계획하세요.';

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
  String get detailTravelIntelTitle => '여행 마찰 전망';

  @override
  String get detailTravelIntelSubtitle => '카테고리·시간·거리 기반 예측 — 실시간 센서 없음.';

  @override
  String detailCrowdOutlook(String level) {
    return '혼잡: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return '주차: $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return '운전 부담: $score/90';
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
  String get landingBegin => '여행을 시작하세요';

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
  String get onboardStep1Title => '꿈이 먼저 닿는 곳';

  @override
  String get onboardStep1Subtitle => '어디로 가시나요?';

  @override
  String get onboardDestination => '목적지';

  @override
  String get onboardRegion => '지역';

  @override
  String get onboardCityLabel => '도시 선택';

  @override
  String get onboardCityUnlockNote =>
      '각 목적지마다 전용 컨시어지 잠금 해제 — 도시당 일회성 구매. 올랜도 테마파크는 하나의 팩(Disney와 Universal 함께)입니다.';

  @override
  String get landingCityLabel => '어디로 가시나요?';

  @override
  String get paywallSwitchCity => '목적지';

  @override
  String get cityPickerUnlocked => '잠금 해제됨';

  @override
  String cityPickerUnlockPrice(String price) {
    return '$price 잠금 해제';
  }

  @override
  String get cityPickerThemeParksSubtitle => '올랜도 애드온 · Disney와 Universal 함께';

  @override
  String get onboardStep2Title => '자유로움을 느끼는 시간';

  @override
  String get onboardStep2Subtitle => '탈출은 언제 시작되나요?';

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
  String get weatherRadarPlay => '루프 재생';

  @override
  String get weatherRadarPause => '루프 일시정지';

  @override
  String get weatherRadarTapToExpand => '탭하여 전체 화면';

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
  String get hotelLinkUnavailable => '이 숙소의 예약 링크를 아직 사용할 수 없습니다.';

  @override
  String get hotelLinkOpenFailed => '링크를 열 수 없습니다 — 브라우저에서 다시 시도하세요.';

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
  String get paywallConciergePromise => '일회성 구매 · 개인 컨시어지 · 구독 없음';

  @override
  String get settingsUnlockConciergeTitle => '도시 컨시어지 잠금 해제';

  @override
  String get settingsUnlockConciergeSubtitle => '일회성 시티팩 — 구독이 아님';

  @override
  String get settingsOpenConciergeSubtitle => 'AI 컨시어지 탭 열기';

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
  String miamiMoodRouteStart(String time) {
    return '$time쯤에 시작하세요';
  }

  @override
  String get keysWaterIntelTitle => '키스 수역 인텔리전스';

  @override
  String keysWaterBestTime(String time) {
    return '최적 시간: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return '수온: $note';
  }

  @override
  String get keysWaterSnorkelScore => '스노클';

  @override
  String get keysWaterDivingScore => '다이빙';

  @override
  String get keysWaterBoatingScore => '보트';

  @override
  String get keysWaterFishingScore => '낚시';

  @override
  String get keysWaterWindScore => '바람';

  @override
  String get keysWaterSunsetScore => '일몰';

  @override
  String get keysWaterCrowdScore => '혼잡';

  @override
  String get keysMoodRoutesTitle => '키스 섬 루트';

  @override
  String keysMoodRouteStart(String time) {
    return '시작 $time';
  }

  @override
  String get paywallHeadlineMiamiDefault => '마이애미를 다르게 경험해보세요';

  @override
  String get paywallHeadlineMiamiWeekend => '마이애미 주말을 낭비하지 마세요';

  @override
  String get paywallOrlandoAddonsHeading => '테마파크 팩';

  @override
  String get paywallOrlandoBaseIncludes =>
      '올랜도 잠금 해제에는 다이닝, 숨은 보석, 호텔, 파크 외 경험이 포함됩니다. Disney와 Universal을 함께 위한 테마파크 팩 추가.';

  @override
  String get paywallAddonThemeParksTitle => 'Disney & Universal 팩';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World와 Universal Orlando — 모든 파크, 딜, 루트, 혼잡 intel을 한 번에.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return '$packName 잠금 해제 · $price';
  }

  @override
  String get paywallAddonUnlocked => '잠금 해제됨';

  @override
  String get paywallAddonRequiresOrlando => '먼저 올랜도 잠금 해제 필요';

  @override
  String paywallUnlockAddonPack(String packName) {
    return '$packName 잠금 해제';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return '$packName 잠금 해제';
  }

  @override
  String get orlandoThemeParksPromptTitle =>
      'Orlando용 Disney & Universal을 잠금 해제할까요?';

  @override
  String get orlandoThemeParksPromptBody =>
      'Walt Disney World와 Universal Orlando를 위한 테마파크 팩 추가 — 모든 파크, 티켓 딜, 루트, 혼잡 intel을 한 번에.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return '잠금 해제 · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => '나중에';
}
