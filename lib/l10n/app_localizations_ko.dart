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
  String get commonLive => '라이브';

  @override
  String get commonClose => '닫기';

  @override
  String get commonCancel => '취소';

  @override
  String get commonDelete => '삭제';

  @override
  String get settingsStartOverSubtitle => '처음부터 새로운 여행을 시작하세요';

  @override
  String get navConcierge => '관리인';

  @override
  String get navTimeline => '타임라인';

  @override
  String get navMap => '지도';

  @override
  String get navGems => '보석';

  @override
  String get navFeed => '밥을 먹이다';

  @override
  String get navTrips => '여행';

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
  String get conciergeGreetingAfternoon => '좋은 오후예요.';

  @override
  String get conciergeGreetingEvening => '좋은 저녁이에요.';

  @override
  String get conciergeWelcomeWarm =>
      '명소 목록이 아니라, 어떤 기분을 원하는지에 맞춰 플로리다를 설계해 드릴게요. 오늘은 무엇이 끌리세요?';

  @override
  String get conciergeRefineStyle => '내 스타일 다듬기';

  @override
  String get conciergeRecallReturning => '다시 오셨네요.';

  @override
  String conciergeRecallStyle(String prefs) {
    return '$prefs을(를) 좋아하셨던 걸 기억해요.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return '그리고 이번 여행이 “$feel” 느낌이길 원하셨죠.';
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
  String get discoverSearchScopeAll => '카탈로그에서 모든 플로리다 검색';

  @override
  String discoverSearchScopeRadius(String radius) {
    return '올랜도를 중심으로 $radius 이내';
  }

  @override
  String get discoverSearchEmpty =>
      '이 반경에는 일치하는 항목이 없습니다. 더 짧은 이름을 사용하거나 지도 또는 피드에서 거리 칩을 넓히거나 \'해변\', \'디즈니\' 또는 \'봄\'을 검색하세요.';

  @override
  String get discoverFilterAll => '전체';

  @override
  String get discoverFilterHotels => '호텔';

  @override
  String get discoverFilterRestaurants => '레스토랑';

  @override
  String get discoverFilterDestinations => '명소';

  @override
  String get discoverPopularInRadius => '해당 반경에서 인기 있음';

  @override
  String get discoverTrySearching => '검색해 보세요';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '목적지 $count개 · 올랜도 $radius 이내';
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
  String get feedMoodPrompt => '어떤 기분을 원하세요?';

  @override
  String get feedMoodAll => '전체';

  @override
  String get feedMoodRomantic => '로맨틱';

  @override
  String get feedMoodCalm => '차분함';

  @override
  String get feedMoodAdventurous => '모험적';

  @override
  String get feedMoodPampered => '호사';

  @override
  String get feedMoodSocial => '활기찬';

  @override
  String get feedMoodFoodie => '미식';

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
  String get gemsMatchedBadge => '내 취향';

  @override
  String gemsMatchedNote(int count) {
    return '내 취향에 맞는 $count곳';
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
  String get mapPlanDayTitle => '내 하루 계획하기';

  @override
  String get mapPlanDaySuggested =>
      '여행 무드를 바탕으로 제안했어요 — 장소를 즐겨찾기해 나만의 일정으로 만드세요.';

  @override
  String get mapPlanDayEmpty =>
      '목적지를 즐겨찾기(♥)하면 Luxora가 올랜도 허브에서 출발하는 최적 경로를 만듭니다. 운전은 적게, 감동은 크게.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count곳 · $miles · 차로 $time';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return '$hotel에서 출발';
  }

  @override
  String get mapCrowdLevelQuiet => '한산';

  @override
  String get mapCrowdLevelModerate => '보통';

  @override
  String get mapCrowdLevelBusy => '혼잡';

  @override
  String get mapCrowdLevelPacked => '매우 혼잡';

  @override
  String mapCrowdAtStop(String level) {
    return '혼잡도: $level';
  }

  @override
  String get mapRerouteButton => '더 한산한 경유지로 경로 변경';

  @override
  String mapRerouteApplied(int count) {
    return '일정 조정 — $count곳을 덜 붐비는 곳으로 바꿨습니다.';
  }

  @override
  String get mapRerouteNone => '이 경로는 이미 여유로워 보입니다.';

  @override
  String get mapRerouteRainHint => '비 가능성 — 실내 대안으로 경로를 바꿔 보세요.';

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
  String get tripsPlanNew => '새 여행 계획하기';

  @override
  String get tripsEmptyTitle => '아직 저장된 여행이 없습니다';

  @override
  String get tripsEmptyBody => '첫 여행을 계획하면 여기에 표시되어 언제든 다시 볼 수 있습니다.';

  @override
  String get tripsDeleteTitle => '여행을 삭제할까요?';

  @override
  String tripsDeleteBody(String title) {
    return '저장된 여행에서 “$title”을(를) 삭제합니다. 되돌릴 수 없습니다.';
  }

  @override
  String get tripsDeleted => '여행이 삭제되었습니다';

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
  String get tripsShare => '공유';

  @override
  String get shareItineraryFooter => '감성 지능형 플로리다 동반자 Luxora와 함께 계획했어요.';

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
  String get detailPrice => '가격';

  @override
  String get detailLocation => '위치';

  @override
  String get detailGetDirections => '길찾기';

  @override
  String get detailParkMap => '파크 맵';

  @override
  String get detailViewOnMap => '지도에서 보기';

  @override
  String get detailMapsError => '이 기기에서 지도를 열 수 없습니다.';

  @override
  String get detailGoogleMaps => 'Google 지도';

  @override
  String get detailAppleMaps => 'Apple 지도';

  @override
  String get detailOpenInMaps => '지도에서 열기';

  @override
  String detailDriveFromOrlando(String time) {
    return '올랜도에서 차로 $time';
  }

  @override
  String get detailSaveToItinerary => '일정에 저장';

  @override
  String get detailSaved => '저장됨';

  @override
  String get detailSavedSnack => '일정에 저장했습니다';

  @override
  String get detailRemovedSnack => '일정에서 삭제했습니다';

  @override
  String get detailSetHomeBase => '베이스로 설정';

  @override
  String get detailHomeBaseActive => '여행 베이스';

  @override
  String get detailHomeBaseHint => '하루 경로가 이곳에서 시작하고 끝납니다.';

  @override
  String get detailHomeBaseSetSnack => '여행 베이스로 설정했습니다';

  @override
  String get detailHomeBaseClearedSnack => '베이스를 해제했습니다';

  @override
  String get detailMenuTitle => '메뉴 하이라이트';

  @override
  String get detailMenuDisclaimer =>
      '대표 메뉴 일부입니다. 전체 메뉴와 가격은 매장에 따라 다를 수 있습니다.';

  @override
  String get detailMenuComingSoon =>
      '이 메뉴는 아직 준비 중입니다. 그동안 최신 메뉴와 가격은 온라인에서 확인하세요.';

  @override
  String get detailViewMenuOnline => '온라인에서 메뉴 보기';

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
  String get onboardPoolside => '수영장과 휴식';

  @override
  String get onboardAdventure => '모험과 야외 활동';

  @override
  String get onboardCulture => '문화와 관광';

  @override
  String get dayFlowSubtitle => '할 일 목록이 아니라, 어떤 기분을 원하는지에 맞춰 짠 하루.';

  @override
  String get dayFlowMorning => '아침';

  @override
  String get dayFlowMidday => '정오';

  @override
  String get dayFlowAfternoon => '오후';

  @override
  String get dayFlowEvening => '저녁';

  @override
  String get dayFlowNight => '밤';

  @override
  String get dayFlowReasonMorningPool => '천천히 시작하세요 — 하루가 시작되기 전 수영장이나 스파에서.';

  @override
  String get dayFlowReasonMorningCalm => '하루의 분위기를 잡아주는 부드러운 시작.';

  @override
  String get dayFlowReasonMiddayAdventure => '에너지가 최고조인 시간 — 컨디션이 좋을 때 큰 모험을.';

  @override
  String get dayFlowReasonMiddayCulture => '햇살이 밝을 때 즐기는 관광.';

  @override
  String get dayFlowReasonMiddayIcon => '하루의 하이라이트.';

  @override
  String get dayFlowReasonAfternoonDowntime => '재충전을 위한 오후의 휴식.';

  @override
  String get dayFlowReasonAfternoonGem => '인파를 벗어난 숨은 명소.';

  @override
  String get dayFlowReasonEveningDining => '하루의 메인 식사 — 당신의 미식 선택.';

  @override
  String get dayFlowReasonNightOut => '마지막 빛 — 밤 나들이.';

  @override
  String weatherToday(String place) {
    return '지금 $place';
  }

  @override
  String weatherSunset(String time) {
    return '일몰 $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '강수 확률 $percent% — 얇은 겉옷을 챙기세요.';
  }

  @override
  String get weatherConditionClear => '맑음';

  @override
  String get weatherConditionPartlyCloudy => '부분적으로 흐림';

  @override
  String get weatherConditionCloudy => '흐림';

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
  String get dayFlowVibeFoodie => '미식 중심';

  @override
  String get dayFlowVibeNightlife => '나이트라이프';

  @override
  String get dayFlowVibePoolside => '수영장';

  @override
  String get dayFlowVibeAdventure => '모험적인';

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
}
