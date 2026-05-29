// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => '设置';

  @override
  String get appearance => '外观';

  @override
  String get dark_mode => '深色模式';

  @override
  String get light_mode => '浅色模式';

  @override
  String get language => '语言';

  @override
  String get settings_language_picker_note => '更改会立即生效。';

  @override
  String get settings_regions_coming_title => '国家与城市';

  @override
  String get settings_regions_coming_subtitle => '主页枢纽和城市包即将推出。';

  @override
  String get commonSoon => '即将推出';

  @override
  String get commonContinue => '继续';

  @override
  String get commonNew => '新内容';

  @override
  String get commonRoadmap => '路线图';

  @override
  String get commonClose => '关闭';

  @override
  String get commonCancel => '取消';

  @override
  String get commonDelete => '删除';

  @override
  String get settingsStartOverSubtitle => '从零开始规划新行程';

  @override
  String get navConcierge => '礼宾';

  @override
  String get navTimeline => '行程';

  @override
  String get navMap => '地图';

  @override
  String get navGems => '秘境';

  @override
  String get navFeed => '动态';

  @override
  String get navTrips => '旅行';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => '礼宾';

  @override
  String conciergeTripFeel(String feel) {
    return '旅行氛围：“$feel”';
  }

  @override
  String get conciergeWelcome =>
      '欢迎来到 Luxora，你的佛罗里达情绪智能旅伴。\n\n选择下方提示，或描述你希望这趟旅行带来的感觉。';

  @override
  String get conciergeQuickPrompts => '快速提示';

  @override
  String get conciergeRemembering => '为本次旅行记住';

  @override
  String get conciergeStyleMemory => '风格记忆';

  @override
  String get conciergeInputHint => '描述你希望这趟旅行带来的感觉…';

  @override
  String get conciergePromptRomantic => '浪漫度假';

  @override
  String get conciergePromptWellness => '身心重启';

  @override
  String get conciergePromptFamily => '家庭魔法';

  @override
  String get conciergePromptHiddenLuxury => '隐秘奢华';

  @override
  String get conciergePromptFoodie => '美食冒险';

  @override
  String get conciergePromptSoftLuxury => '柔和奢华逃离';

  @override
  String get conciergePromptAdventure => '冒险模式';

  @override
  String get conciergePromptDisney => '夜色迪士尼';

  @override
  String get discoverSearchHint => '搜索目的地…';

  @override
  String get discoverSearchTitle => '查找目的地';

  @override
  String get discoverFromOrlando => '从奥兰多出发';

  @override
  String get discoverSearchScopeAll => '正在搜索佛罗里达全目录';

  @override
  String discoverSearchScopeRadius(String radius) {
    return '奥兰多 $radius 范围内';
  }

  @override
  String get discoverSearchEmpty =>
      '此范围内没有匹配项。试试更短的名称，在地图或动态中扩大距离，或搜索“海滩”“Disney”“泉水”。';

  @override
  String get discoverFilterAll => '全部';

  @override
  String get discoverFilterHotels => '酒店';

  @override
  String get discoverFilterRestaurants => '餐厅';

  @override
  String get discoverFilterDestinations => '景点';

  @override
  String get discoverPopularInRadius => '你范围内的热门';

  @override
  String get discoverTrySearching => '试着搜索';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count 个目的地 · 奥兰多 $radius 范围内';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count 个目的地 · 全佛罗里达';
  }

  @override
  String get radius25 => '25 mi';

  @override
  String get radius50 => '50 mi';

  @override
  String get radius100 => '100 mi';

  @override
  String get radiusAllFlorida => '全佛罗里达';

  @override
  String get radiusDesc25 => '奥兰多核心区周边一日游';

  @override
  String get radiusDesc50 => '泉水、海岸一日游、太空海岸';

  @override
  String get radiusDesc100 => '坦帕湾、代托纳、更远的墨西哥湾';

  @override
  String get radiusDescAll => '群岛、迈阿密及全州亮点';

  @override
  String get feedBadge => '实时发现';

  @override
  String get feedTitle => '体验动态';

  @override
  String get feedSubtitle => '此刻正在发生的事：热门地点、新开业、创作者精选、季节路线和实时更新。';

  @override
  String get feedPillTrending => '热门';

  @override
  String get feedPillNewOpenings => '新开业';

  @override
  String get feedPillCreator => '创作者精选';

  @override
  String get feedPillLive => '实时更新';

  @override
  String get feedEmptyHint => '此范围内没有动态卡片。试试 50 mi 或全佛罗里达，查看墨西哥湾海岸和群岛亮点。';

  @override
  String get gemsBadge => '内行精选';

  @override
  String get gemsTitle => '隐藏秘境';

  @override
  String get gemsSubtitle => '当地人珍藏的秘密发现：特别之处、最佳时间、人潮程度，以及明信片上找不到的建议。';

  @override
  String get gemsPillHidden => '隐藏地点';

  @override
  String get gemsPillLocal => '本地限定';

  @override
  String get gemsPillInsider => '内行建议';

  @override
  String get gemsPillCrowd => '人潮情报';

  @override
  String get gemsEmptyHint => '此范围内暂时没有秘境。扩大到 50 mi 或更远，发现泉水和太空海岸秘密。';

  @override
  String get gemsSearchHint => '搜索隐藏秘境和目的地…';

  @override
  String get gemLocalSecret => '本地秘密';

  @override
  String get gemWhySpecial => '特别之处';

  @override
  String get gemBestTime => '最佳前往时间';

  @override
  String get gemCrowdLevel => '人潮程度';

  @override
  String get gemInsiderTip => '内行提示';

  @override
  String get gemLocalNote => '本地限定备注';

  @override
  String get mapBadge => 'AI 地图';

  @override
  String get mapTitle => '你的智能路线';

  @override
  String get mapSubtitle => '为你精选一天的标记：金色菱形是秘境，青色标记是今日行程，金线是情绪路线。';

  @override
  String get mapPlanDayTitle => '规划我的一天';

  @override
  String get mapPlanDaySuggested => '根据你的旅行心情推荐——收藏地点即可个性化定制。';

  @override
  String get mapPlanDayEmpty => '收藏目的地（♥），Luxora 会从你的奥兰多基地生成优化路线——少开车，多体验。';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count 站 · $miles · 车程 $time';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return '从 $hotel 出发';
  }

  @override
  String get mapAiPowers => 'AI 地图能力';

  @override
  String get mapNavLayerTitle => 'AI 导航层（下一步）';

  @override
  String get mapNavLayerSubtitle => '不止发现，还能实时判断某个停靠点现在是否值得去。';

  @override
  String get mapBookingTitle => '无缝预订（合作伙伴）';

  @override
  String get mapCapMoodTitle => '按心情规划路线';

  @override
  String get mapCapMoodDesc => '匹配浪漫、疗愈、家庭或冒险的路径，而不只是最短车程。';

  @override
  String get mapCapDriveTitle => '车程时间优化';

  @override
  String get mapCapDriveDesc => '智能排序，让你把时间花在感受上，而不是堵在亮点之间。';

  @override
  String get mapCapWeatherTitle => '天气感知建议';

  @override
  String get mapCapWeatherDesc => '雨天备用路线，以及海滩、屋顶和泉水的实时窗口。';

  @override
  String get mapCapSunsetTitle => '此刻最佳日落';

  @override
  String get mapCapSunsetDesc => '根据天空和人潮模式，找出未来 90 分钟黄金时刻最美的位置。';

  @override
  String get mapCapCrowdTitle => '人潮预测';

  @override
  String get mapCapCrowdDesc => '在你抵达前，知道公园、泉水和爆红地点什么时候会安静下来。';

  @override
  String get mapCapGemsTitle => '附近隐藏秘境';

  @override
  String get mapCapGemsDesc => '沿路线浮现内行标记，而不只是十大游客站点。';

  @override
  String get mapCapPersonalTitle => '路线个性化';

  @override
  String get mapCapPersonalDesc => '你的旅行氛围、节奏和预算会实时重塑地图。';

  @override
  String get mapFutureCrowdTitle => '实时人潮热度';

  @override
  String get mapFutureCrowdDesc => '泉水、公园和爆红屋顶的实时密度：现在值得去吗？';

  @override
  String get mapFutureParkingTitle => '停车难度';

  @override
  String get mapFutureParkingDesc => '出发前的阻力评分：代客泊车、车库，或最合适的网约车上下车点。';

  @override
  String get mapFutureTrafficTitle => '驾驶阻力评分';

  @override
  String get mapFutureTrafficDesc => '按压力加权的路线，不只看分钟数，也看车程感受。';

  @override
  String get mapFutureRerouteTitle => '即时改线';

  @override
  String get mapFutureRerouteDesc => '天气变化或人潮激增？轻点一下重塑当天剩余行程。';

  @override
  String affiliateReserve(String category) {
    return '预订 · $category · 高端合作伙伴（即将推出）';
  }

  @override
  String get affiliateHotels => '酒店与宅度假';

  @override
  String get affiliateExperiences => '体验与导览';

  @override
  String get affiliateRestaurants => '餐厅预订';

  @override
  String get affiliateThemeParks => '主题公园门票';

  @override
  String get affiliateDayPasses => 'ResortPass / 日票';

  @override
  String get affiliateCarRentals => '租车';

  @override
  String get affiliateWellness => '康养预订';

  @override
  String get tripsBadge => '收藏集';

  @override
  String get tripsTitle => '已保存旅行';

  @override
  String get tripsSubtitle => '点按旅行查看实时快照：下一个时刻、天气、日落和行程。';

  @override
  String get tripsFooter => '旅行封面来自心情目录 · Supabase 同步第 2 阶段';

  @override
  String get tripsPlanNew => '规划新行程';

  @override
  String get tripsEmptyTitle => '还没有已保存的行程';

  @override
  String get tripsEmptyBody => '规划你的第一个行程，它将显示在这里，随时可以再次查看。';

  @override
  String get tripsDeleteTitle => '删除行程？';

  @override
  String tripsDeleteBody(String title) {
    return '这会将“$title”从你保存的行程中移除。此操作无法撤销。';
  }

  @override
  String get tripsDeleted => '行程已删除';

  @override
  String get tripsLiveWeather => '实时天气';

  @override
  String get tripsNextUp => '接下来';

  @override
  String get tripsSunsetWindow => '日落窗';

  @override
  String get tripsTimelineSnapshot => '时间轴快照';

  @override
  String get tripsOpenTimeline => '打开完整的时间线';

  @override
  String get itineraryBadge => '你的行程';

  @override
  String get itineraryTagline => '每个时刻相连：期待感已内置，压力被留在外面。';

  @override
  String itineraryDayTab(int day, String label) {
    return '第 $day 天 · $label';
  }

  @override
  String get detailWhySpecial => '特别之处';

  @override
  String get detailBestTime => '最佳前往时间';

  @override
  String get detailInsiderTips => '内行建议';

  @override
  String get detailReserve => '预订体验';

  @override
  String get detailReserveSoon => '预订合作伙伴即将上线。';

  @override
  String get detailNearbyGems => '附近秘境';

  @override
  String get detailDuration => '时长';

  @override
  String get detailPractical => '实用细节';

  @override
  String get detailCostRange => '成本范围';

  @override
  String get detailBestFor => '最适合';

  @override
  String get detailVibeMatch => '氛围匹配';

  @override
  String get detailCrowd => '人潮';

  @override
  String get detailPrice => '价格';

  @override
  String get detailLocation => '位置';

  @override
  String get detailGetDirections => '获取路线';

  @override
  String get detailParkMap => '园区地图';

  @override
  String get detailViewOnMap => '在地图上查看';

  @override
  String get detailMapsError => '无法在此设备上打开地图。';

  @override
  String get detailGoogleMaps => '谷歌地图';

  @override
  String get detailAppleMaps => '苹果地图';

  @override
  String get detailOpenInMaps => '在地图中打开';

  @override
  String detailDriveFromOrlando(String time) {
    return '距奥兰多车程 $time';
  }

  @override
  String get detailSaveToItinerary => '保存到行程';

  @override
  String get detailSaved => '已保存';

  @override
  String get detailSavedSnack => '已保存到你的行程';

  @override
  String get detailRemovedSnack => '已从你的行程中移除';

  @override
  String get detailSetHomeBase => '设为大本营';

  @override
  String get detailHomeBaseActive => '你的行程大本营';

  @override
  String get detailHomeBaseHint => '你的一日路线从这里出发并返回。';

  @override
  String get detailHomeBaseSetSnack => '已设为你的行程大本营';

  @override
  String get detailHomeBaseClearedSnack => '已清除大本营';

  @override
  String get detailMenuTitle => '菜单精选';

  @override
  String get detailMenuDisclaimer => '精选推荐——完整菜单和价格以店内为准。';

  @override
  String get detailMenuComingSoon => '我们仍在整理这份菜单。在此期间，请在线查看最新菜单和价格。';

  @override
  String get detailViewMenuOnline => '在线查看菜单';

  @override
  String get photoClose => '关闭';

  @override
  String get photoViewDestination => '查看目的地';

  @override
  String get photoBy => '摄影：';

  @override
  String get photoOn => '在';

  @override
  String milesFromOrlando(String distance) {
    return '距奥兰多 $distance';
  }

  @override
  String get landingBadge => '佛罗里达 · 奥兰多 MVP';

  @override
  String get landingTitle1 => '假期';

  @override
  String get landingTitle2 => '已经开始。';

  @override
  String get landingSubtitle =>
      'Luxora AI 是你的情绪智能礼宾：隐藏秘境、屋顶日落，以及在你打包前就令人难忘的时刻。';

  @override
  String get landingBegin => '开始旅程';

  @override
  String get landingTalk => '和 Luxora 对话';

  @override
  String get landingWhy => '我们为何打造它';

  @override
  String get storyTitle => '我们的故事';

  @override
  String get storyHeroBadge => '精心打造';

  @override
  String get storyHeroCreator => 'Luxora AI 创始人';

  @override
  String get storyHeroSubtitle => '佛罗里达·情感至上的旅行';

  @override
  String get storyHeading => '我们为何构建 Luxora';

  @override
  String get storyProblemLead => '我们意识到，计划佛罗里达/奥兰多旅行是令人惊讶的支离破碎和难以承受。';

  @override
  String get storyJumpingBetween => '人们通常会在之间跳跃';

  @override
  String get storyProblemTail => '......最终仍然有通用的旅游计划。';

  @override
  String get storyDifferentLead => '我们想要打造一些不同的东西。';

  @override
  String get storyNotPlannerTitle => '不仅仅是旅行规划师';

  @override
  String get storyNotPlannerBody => '情感至上的人工智能旅行伴侣。';

  @override
  String get storyInsteadOfAsking => '而不是问';

  @override
  String get storyAppAsks => '该应用程序询问';

  @override
  String get storyInsteadQuestion => '“我该去哪里？”';

  @override
  String get storyFeelQuestion => '“你希望这次旅行有什么感觉？”';

  @override
  String get storyMoodBuildLine => '然后人工智能围绕这种情绪构建个性化体验。';

  @override
  String get storyFloridaFirstTitle => '为什么首先是佛罗里达/奥兰多？';

  @override
  String get storyFloridaFirstLead => '奥兰多是一个完美的测试市场：';

  @override
  String get storyVisionTitle => '我们的愿景';

  @override
  String get storyVisionLead => '结合：';

  @override
  String get storyVisionCard => '因此，该应用程序感觉更接近豪华的人工智能礼宾服务，而不是另一个无聊的行程工具。';

  @override
  String get storyLongTermTitle => '长期机会';

  @override
  String get storySourceGoogleMaps => '谷歌地图';

  @override
  String get storySourceTikTok => '抖音';

  @override
  String get storySourceInstagram => 'Instagram 卷轴';

  @override
  String get storySourceTravelBlogs => '旅游博客';

  @override
  String get storySourceRestaurantApps => '餐厅应用程序';

  @override
  String get storySourceWeatherApps => '天气应用程序';

  @override
  String get storySourceTicketSites => '票务网站';

  @override
  String get storySourceTop10 => '随机“奥兰多 10 佳”文章';

  @override
  String get storyBulletMarket => '旅游市场巨大';

  @override
  String get storyBulletAudience => '家庭、情侣、豪华旅行者和健康旅行者';

  @override
  String get storyBulletOptions => '数不胜数的餐厅、度假村、隐藏的瑰宝、主题公园、温泉和夜生活';

  @override
  String get storyBulletRepeat => '高重复访问行为';

  @override
  String get storyBulletLogisticsGap => '大多数旅行应用程序专注于物流，而不是体验设计';

  @override
  String get storyPillarAiItinerary => 'AI行程生成';

  @override
  String get storyPillarMoodPlanning => '基于心情的旅行计划';

  @override
  String get storyPillarLiveDiscovery => '实时发现和热门体验';

  @override
  String get storyPillarHiddenGems => '隐藏的当地宝石';

  @override
  String get storyPillarRouting => '智能路由';

  @override
  String get storyPillarWeatherSunset => '天气和日落情报';

  @override
  String get storyPillarPremiumUx => '高级美学用户体验';

  @override
  String get storyOpportunityMultilingual => '多语言扩展';

  @override
  String get storyOpportunityAffiliate => '附属机构和预订合作伙伴';

  @override
  String get storyOpportunityInventory => '餐厅、体验和门票';

  @override
  String get storyOpportunitySubscriptions => '高级订阅';

  @override
  String get storyOpportunityScale => '可扩展到佛罗里达州以外 → 稍后扩展到其他目的地';

  @override
  String get landingValues => '回忆 · 情绪 · 逃离 · 连接';

  @override
  String get landingRegionBadge => '首发地区';

  @override
  String get landingRegionTitle => '奥兰多与佛罗里达，为感受而精选';

  @override
  String get onboardFinish => '认识你的礼宾';

  @override
  String get onboardStep1Title => '梦想最先降落的地方';

  @override
  String get onboardStep1Subtitle => '你要去哪里？';

  @override
  String get onboardDestination => '目的地';

  @override
  String get onboardRegion => '地区';

  @override
  String get onboardStep2Title => '该感受自由了';

  @override
  String get onboardStep2Subtitle => '你的逃离何时开始？';

  @override
  String get onboardBudget => '旅行预算（USD）';

  @override
  String get onboardStep3Title => '谁一起书写故事';

  @override
  String get onboardStep3Subtitle => '谁和你同行？';

  @override
  String get onboardTravelers => '旅行者';

  @override
  String get onboardStep4Title => '你的节奏';

  @override
  String get onboardStep4Subtitle => '你希望每天如何展开？';

  @override
  String get onboardNightlife => '夜生活兴趣';

  @override
  String get onboardFoodie => '美食热情';

  @override
  String get onboardPoolside => '泳池与休闲';

  @override
  String get onboardAdventure => '探险与户外';

  @override
  String get onboardCulture => '文化与观光';

  @override
  String get dayFlowSubtitle => '围绕你想要的感受来安排的一天，而不是一张清单。';

  @override
  String get dayFlowMorning => '早晨';

  @override
  String get dayFlowMidday => '中午';

  @override
  String get dayFlowAfternoon => '下午';

  @override
  String get dayFlowEvening => '傍晚';

  @override
  String get dayFlowNight => '夜晚';

  @override
  String get dayFlowReasonMorningPool => '慢慢开始——在一天开始前先去泳池或水疗。';

  @override
  String get dayFlowReasonMorningCalm => '以轻松的方式开启一天，奠定基调。';

  @override
  String get dayFlowReasonMiddayAdventure => '精力最充沛的时段——趁状态好去尽情探险。';

  @override
  String get dayFlowReasonMiddayCulture => '在最明亮的日光下观光。';

  @override
  String get dayFlowReasonMiddayIcon => '一天中的招牌时刻。';

  @override
  String get dayFlowReasonAfternoonDowntime => '下午放松，恢复精力。';

  @override
  String get dayFlowReasonAfternoonGem => '远离人群的隐藏宝地。';

  @override
  String get dayFlowReasonEveningDining => '一天中的主餐——你的美食之选。';

  @override
  String get dayFlowReasonNightOut => '最后的精彩——夜晚出游。';

  @override
  String get dayFlowVibeFoodie => '美食优先';

  @override
  String get dayFlowVibeNightlife => '夜生活';

  @override
  String get dayFlowVibePoolside => '泳池';

  @override
  String get dayFlowVibeAdventure => '探险';

  @override
  String get dayFlowVibeCulture => '文化';

  @override
  String get onboardStep5Title => 'Luxora 的核心';

  @override
  String get onboardStep5Subtitle => '你希望这趟旅行带来什么感觉？';

  @override
  String get onboardTripFeelHint => '日落晚餐、慢悠悠的早晨、和伴侣一起大笑…';

  @override
  String get moodRomantic => '浪漫';

  @override
  String get moodRelaxing => '放松';

  @override
  String get moodAdventurous => '冒险';

  @override
  String get moodLuxurious => '奢华';

  @override
  String get moodFamily => '家庭联结';

  @override
  String get moodSocial => '社交';

  @override
  String get moodNature => '自然导向';

  @override
  String get moodWellness => '康养静修';

  @override
  String get moodFoodie => '美食体验';

  @override
  String get catHiddenGems => '隐藏秘境';

  @override
  String get catLuxuryStay => '奢华宅度假';

  @override
  String get catBeaches => '海滩';

  @override
  String get catRooftop => '屋顶用餐';

  @override
  String get catSpas => '水疗';

  @override
  String get catNightlife => '夜生活';

  @override
  String get catFamily => '家庭';

  @override
  String get catEco => '生态旅游';

  @override
  String get catThemeParks => '主题公园';

  @override
  String get catRomantic => '浪漫出游';

  @override
  String get catFood => '美食体验';

  @override
  String get catSprings => '泉水';

  @override
  String get catIslands => '跳岛';

  @override
  String get catInfluencer => '适合出片';

  @override
  String get placeCatBeach => '海滩';

  @override
  String get placeCatDining => '餐饮';

  @override
  String get placeCatNature => '自然';

  @override
  String get placeCatNightlife => '夜生活';

  @override
  String get placeCatWellness => '康养';

  @override
  String get placeCatFamily => '家庭';

  @override
  String get placeCatSprings => '泉水';

  @override
  String get placeCatRomantic => '浪漫';

  @override
  String get placeCatAdventure => '冒险';

  @override
  String get placeCatHotel => '酒店';

  @override
  String get styleLessCrowded => '人更少';

  @override
  String get styleLuxurySubtle => '奢华但不张扬';

  @override
  String get styleHiddenLuxury => '隐秘奢华';

  @override
  String get styleWalkable => '尽量可步行';

  @override
  String get styleSlowMornings => '慢节奏早晨';

  @override
  String get styleNoTraps => '避开游客陷阱';

  @override
  String get styleNatureHeavy => '自然为主';

  @override
  String get styleNatureWellness => '只要自然与康养';

  @override
  String get styleAestheticDining => '高颜值餐饮';

  @override
  String get styleFamilyEasy => '适合家庭的轻松动线';
}
