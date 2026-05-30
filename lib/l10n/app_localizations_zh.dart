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
  String get settingsThemeIntro => '电影感奢华或清晰易读——选择适合您一天的风格。';

  @override
  String get settingsThemeSectionLuxury => '电影感奢华';

  @override
  String get settingsThemeSectionReadable => '清晰易读';

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
  String get commonLive => '居住';

  @override
  String get commonClose => '关闭';

  @override
  String get commonCancel => '取消';

  @override
  String get commonDelete => '删除';

  @override
  String get settingsStartOverSubtitle => '从零开始全新的旅程';

  @override
  String get navConcierge => '礼宾';

  @override
  String get navDiscover => '发现';

  @override
  String get navMap => '地图';

  @override
  String get navTrips => '旅行';

  @override
  String get navMore => '更多的';

  @override
  String get navTimeline => '行程';

  @override
  String get navGems => '秘境';

  @override
  String get navFeed => '动态';

  @override
  String get navTicketSavings => '储蓄';

  @override
  String get navStays => '住宿';

  @override
  String get morePageTitle => '更多的';

  @override
  String get morePageSubtitle => '旅行工具、帐户和偏好 — 专为轻松访问而精心设计。';

  @override
  String get moreSectionTravelTools => '旅行工具';

  @override
  String get moreSectionAccount => '帐户';

  @override
  String get moreSectionApp => '应用程序';

  @override
  String get moreCardHotelsSub => '智能保持与您的心情相匹配';

  @override
  String get moreCardGemsSub => '知情人发现当地人守卫';

  @override
  String get moreCardTicketsSub => '比较授权合作伙伴节省的费用';

  @override
  String get moreCardWeatherSub => '预测日指导';

  @override
  String get moreCardProfileTitle => '行程简介';

  @override
  String get moreCardProfileSub => '谁旅行，应该有什么感觉';

  @override
  String get moreCardFavoritesSub => '您已添加书签的目的地';

  @override
  String get moreCardNotificationsTitle => '通知';

  @override
  String get moreCardNotificationsSub => '行程提醒和礼宾服务更新';

  @override
  String get moreCardSettingsSub => '主题、城市包和偏好';

  @override
  String get moreCardAboutSub => '我们为何构建 Luxora';

  @override
  String get moreCardHelpSub => '指南和礼宾支持';

  @override
  String get moreCardCityPacksSub => '解锁目的地礼宾服务';

  @override
  String get moreCardPartnersSub => '特色合作伙伴体验';

  @override
  String get moreCardItinerarySub => '您每日的黄金之旅';

  @override
  String get savedFavoritesTitle => '已保存的收藏夹';

  @override
  String get savedFavoritesEmpty => '在地图或提要上为目的地添加书签 - 它们将显示在此处。';

  @override
  String get helpCenterTitle => '帮助中心';

  @override
  String get helpCenterBody => '发送电子邮件至 support@luxora.ai 获取礼宾帮助。应用内指南即将推出。';

  @override
  String get notificationsComingSoon => '旅行通知将在未来的更新中发布。';

  @override
  String get partnerOffersTitle => '合作伙伴优惠';

  @override
  String get ticketSavingsTitle => '智能门票节省';

  @override
  String get ticketSavingsBadgeLabel => '超值优惠';

  @override
  String get ticketSavingsSubtitle =>
      'Luxora 提供授权经销商、捆绑销售和促销活动，让您感觉自己像一名奢侈品顾问，而不是一个优惠券网站。';

  @override
  String ticketSavingsBadge(int percent) {
    return '节省 $percent%';
  }

  @override
  String get ticketOfficialPrice => '官方的';

  @override
  String get ticketDiscountPrice => '卢克索拉价格';

  @override
  String ticketSaveAmount(String amount) {
    return '节省$amount';
  }

  @override
  String get ticketSaveAmountLabel => '储蓄';

  @override
  String ticketSavePerTicket(String amount) {
    return '每张票您可以节省 $amount。';
  }

  @override
  String ticketFamilySave(String amount) {
    return '预计家庭储蓄：$amount。';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return '预计家庭储蓄：$amount。';
  }

  @override
  String ticketSource(String source) {
    return '来源：$source';
  }

  @override
  String ticketExpires(String date) {
    return '优惠截止日期：$date';
  }

  @override
  String get ticketBetterOption => 'Luxora 找到了更好的选择。';

  @override
  String get ticketOverpaying => '您可能以门票价格多付了钱。';

  @override
  String get ticketRecommendedSavings => '建议节省';

  @override
  String get ticketCalculatorTitle => '潜在的节省';

  @override
  String get ticketFilterLabel => '筛选';

  @override
  String get ticketFilterAll => '全部';

  @override
  String get ticketFilterThemeParks => '主题公园';

  @override
  String get ticketFilterAttractions => '景点';

  @override
  String get ticketFilterTours => '旅游';

  @override
  String get ticketFilterDining => '用餐体验';

  @override
  String get ticketFilterWaterParks => '水上乐园';

  @override
  String get ticketFilterFamily => '家庭活动';

  @override
  String get ticketFilterEntertainment => '娱乐';

  @override
  String get ticketSortLabel => '排序方式';

  @override
  String get ticketSortHighestSavings => '最高节省';

  @override
  String get ticketSortMostPopular => '最受欢迎';

  @override
  String get ticketSortFamilyFriendly => '适合家庭入住';

  @override
  String get ticketSortLuxury => '奢华体验';

  @override
  String get ticketSortClosest => '离我最近的';

  @override
  String get ticketDealsSectionTitle => '授权交易';

  @override
  String ticketDealsPricesAsOf(String date) {
    return '价格更新于 $date';
  }

  @override
  String get ticketDealsRefreshFailed => '无法刷新价格 — 显示缓存优惠。';

  @override
  String get ticketDealsUpdating => '正在更新价格…';

  @override
  String get ticketNoDeals => '此过滤器中没有优惠 - 尝试其他类别。';

  @override
  String get ticketConfidenceHigh => '高置信度';

  @override
  String get ticketConfidenceVerified => '已验证经销商';

  @override
  String get ticketConfidenceLimited => '限时';

  @override
  String get ticketAiInsightTitle => '卢克索拉推荐';

  @override
  String get ticketInsightDisneyPass =>
      '根据您的行程，3 天华特迪士尼世界通票代替单日门票可为您的家人节省约 120 美元。';

  @override
  String get ticketInsightUniversalCombo =>
      '您的计划包括环球影城——对于大多数家庭来说，一张 2 个园区的门票比单独购买几天要好。';

  @override
  String get ticketInsightSeaworldCombo =>
      '您路线上的海洋世界 - Aquatica 组合通常胜过两个单独的门票。';

  @override
  String get ticketInsightGeneric =>
      'Luxora 将节省的费用与您行程中的停留点进行匹配 - 在登机口购买之前进行比较。';

  @override
  String get ticketInsightMiamiCulture =>
      '文化在你的计划中停止——本周，Vizcaya 和 PAMM 合作伙伴的优惠可能会超过门禁价格。';

  @override
  String get ticketInsightMiamiEverglades => '您行程中的大沼泽地日——早上的汽船班次通常在周中更便宜。';

  @override
  String get ticketInsightMiamiWynwood =>
      '温伍德 (Wynwood) 在您的路线上 — 一场带导游的艺术漫步之旅比步行摊位的价格更优惠。';

  @override
  String get ticketItineraryMatchTitle => '行程储蓄支票';

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
  String get conciergeGreetingMorning => '早上好。';

  @override
  String get conciergeGreetingAfternoon => '下午好。';

  @override
  String get conciergeGreetingEvening => '晚上好。';

  @override
  String get conciergeWelcomeWarm =>
      '我来这里是为了按照您想要的感觉塑造佛罗里达——而不是一张景点清单。今天你想吃什么？';

  @override
  String get conciergeRefineStyle => '完善我的风格';

  @override
  String get conciergeRecallReturning => '欢迎回来。';

  @override
  String conciergeRecallStyle(String prefs) {
    return '我记得你喜欢$prefs。';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return '你希望这次旅行有“$feel”的感觉。';
  }

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
  String discoverFromHub(String hub) {
    return '来自$hub';
  }

  @override
  String get discoverSearchScopeAll => '正在搜索佛罗里达全目录';

  @override
  String discoverSearchScopeRadius(String radius) {
    return '奥兰多 $radius 范围内';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return '在 $hub 的 $radius 内';
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
  String get discoverFilterDestinations => '目的地';

  @override
  String get discoverPopularInRadius => '你范围内的热门';

  @override
  String get discoverTrySearching => '试着搜索';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count 个目的地 · 奥兰多 $radius 范围内';
  }

  @override
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return '$count 个目的地 · 在 $hub 的 $radius 范围内';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count 个目的地 · 全佛罗里达';
  }

  @override
  String get radius25 => '25 英里';

  @override
  String get radius50 => '50 英里';

  @override
  String get radius100 => '100 英里';

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
  String get radiusDesc25Miami => '南海滩、布里克尔和核心社区';

  @override
  String get radiusDesc50Miami => '温伍德、椰林、比斯坎湾';

  @override
  String get radiusDesc100Miami => '大沼泽地、劳德代尔堡、南佛罗里达州深处';

  @override
  String get radiusDescAllMiami => '佛罗里达群岛步道和全州亮点';

  @override
  String get radiusDesc25Keys => '拉哥岛、伊斯拉莫拉达及北部礁带';

  @override
  String get radiusDesc50Keys => '马拉松、大松岛及中部群岛海滩';

  @override
  String get radiusDesc100Keys => '贯穿基韦斯特的全线海外公路';

  @override
  String get radiusDescAllKeys => '全岛链及一日游水域';

  @override
  String get feedBadge => '实时发现';

  @override
  String get feedTitle => '体验动态';

  @override
  String get feedSubtitle => '此刻正在发生的事：热门地点、新开业、创作者精选、季节路线和实时更新。';

  @override
  String get feedSubtitleFamily =>
      'Family-friendly picks for your crew — parks, easy wins, and moments that land with kids (and parents).';

  @override
  String get feedPillTrending => '热门';

  @override
  String get feedPillNewOpenings => '新开业';

  @override
  String get feedPillCreator => '创作者精选';

  @override
  String get feedPillLive => '实时更新';

  @override
  String get feedMoodPrompt => '您想要感觉如何？';

  @override
  String get feedMoodPromptFamily => '今天家人想怎么过？';

  @override
  String get feedMoodAll => '一切';

  @override
  String get feedMoodFamily => '亲子魔法';

  @override
  String get feedMoodRomantic => '浪漫的';

  @override
  String get feedMoodCalm => '冷静的';

  @override
  String get feedMoodAdventurous => '喜欢冒险';

  @override
  String get feedMoodPampered => '养尊处优';

  @override
  String get feedMoodSocial => '嗡嗡声';

  @override
  String get feedMoodFoodie => '美食家';

  @override
  String get feedFamilyMoodHint =>
      'Theme parks, character meals, and easy parent wins — filtered for family tags.';

  @override
  String get feedEmptyHint => '此范围内没有动态卡片。试试 50 mi 或全佛罗里达，查看墨西哥湾海岸和群岛亮点。';

  @override
  String get feedEmptyHintFamily =>
      'No family-tagged cards in this radius — try Adventurous or Everything, or widen the radius.';

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
  String get gemsMatchedBadge => '你的风格';

  @override
  String gemsMatchedNote(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个宝石与您的风格匹配',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
  }

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
  String get mapPlanDayTitle => '今日行程';

  @override
  String get mapPlanDaySuggested => '根据您的旅行心情推荐 - 为地点添加书签，使其成为您的旅行心情。';

  @override
  String get mapPlanDayEmpty =>
      '为目的地添加书签 (♥)，Luxora 会构建一条从您的奥兰多枢纽出发的优化路线 — 最少的驾驶，最多的感受。';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count 站 · $miles · $time 车程';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return '从$hotel出发';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return '距上一站 $miles · 驾车 $time';
  }

  @override
  String get mapCrowdLevelQuiet => '安静的';

  @override
  String get mapCrowdLevelModerate => '缓和';

  @override
  String get mapCrowdLevelBusy => '忙碌的';

  @override
  String get mapCrowdLevelPacked => '包装好的';

  @override
  String mapCrowdAtStop(String level) {
    return '人群：$level';
  }

  @override
  String get mapParkingLevelEasy => '容易';

  @override
  String get mapParkingLevelModerate => '适中';

  @override
  String get mapParkingLevelDifficult => '困难';

  @override
  String get mapParkingLevelLimited => '有限 · 请早到';

  @override
  String mapParkingAtStop(String level) {
    return '停车：$level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return '驾驶负担：$score/90';
  }

  @override
  String get mapRerouteButton => '更改路线以安排更平静的停靠点';

  @override
  String mapRerouteApplied(int count) {
    return '日数调整 — $count 个停靠站更换为人流量较少的站点。';
  }

  @override
  String get mapRerouteNone => '你的路线看起来已经很平静了。';

  @override
  String get mapRerouteRainHint => '可能会下雨——点击重新路由进行室内备份。';

  @override
  String get dayFlowSwapTitle => '更改此站';

  @override
  String dayFlowSwapSubtitle(String current) {
    return 'Tell Luxora what you\'d rather do instead of $current.';
  }

  @override
  String get dayFlowSwapTemplate => '我在想更像这样的…';

  @override
  String get dayFlowSwapHint =>
      'e.g. a quiet park this morning, or seafood for dinner';

  @override
  String get dayFlowSwapApply => '更新我的行程';

  @override
  String get dayFlowSwapViewPlace => 'View current stop';

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
  String get dayFlowSwapHoldSpeak => '按住说话';

  @override
  String get dayFlowSwapListening => '正在聆听…';

  @override
  String get rightNowButton => '我们现在应该做什么？';

  @override
  String get rightNowEmpty => '您的半径范围内还没有强大的时刻 - 扩大发现或为一些最喜欢的书签添加书签。';

  @override
  String get rightNowResultTitle => '现在';

  @override
  String get rightNowTapForDetails => '点击查看详情';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return '您距$minutes 还需 $district 分钟。天气非常好 — 在$place 喝杯咖啡，然后在人群到来（$crowd 人群）之前漫步 $walkArea。';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return '您距$minutes 还需 $district 分钟。天空看起来很棒 - 趁人群仍是 $crowd 时前往 $place。';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return '黄金时段即将到来 — 大约 $minutes 分钟后出发前往$place（日落时分$crowd）。';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return '雷达上有雨 — $minutes 分钟到达舒适的室内地点：$place。';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return '午睡窗外的平静 — 距离$minutes轻松的家庭重置还有$place分钟。';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return '约会之夜的能量 — 距离高峰期还有 $minutes 分钟到达$place。';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return '安静的窗口 — 距离$minutes还有 $place 分钟（现在有$crowd）。';
  }

  @override
  String get goldenHourTitle => '黄金时段';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return '在$time（$minutes分钟车程）出发前往$place — 日落前约 15 分钟到达。';
  }

  @override
  String get goldenHourKindBeach => '海滩夕阳窗';

  @override
  String get goldenHourKindRooftop => '屋顶黄金时段';

  @override
  String get goldenHourKindScenic => '风景摄影时机';

  @override
  String get vacationScoreTitle => '假期分数';

  @override
  String vacationScoreSubtitle(int score) {
    return '今天感觉像是$score/100 的一天。';
  }

  @override
  String get onboardOccasionLabel => '什么场合？';

  @override
  String get occasionGeneral => '只是探索';

  @override
  String get occasionAnniversary => '周年纪念日';

  @override
  String get occasionHoneymoon => '蜜月';

  @override
  String get occasionDateNight => '约会之夜';

  @override
  String get occasionProposal => '求婚之旅';

  @override
  String get occasionFamily => '有孩子的家庭';

  @override
  String get occasionDisneyAdventure => '迪士尼冒险';

  @override
  String get occasionUniversalAdventure => '环球冒险';

  @override
  String get localSecretTitle => '当地秘密';

  @override
  String get localSecretWinterParkParkAvenue => '当地人躲进书店后面的小巷庭院——没有路牌。';

  @override
  String get localSecretWorldFoodTrucks => '点的是每日捕获的海鲜，而不是汉堡——远处窗口的队伍移动得更快。';

  @override
  String get localSecretWekiwaSprings => '下午 2 点后请跳过主木板路 — 北步道入口保持安静。';

  @override
  String get localSecretDisneySpringsParking =>
      '最好的停车位是橙色车库——沿着码头一侧走，而不是在主入口处。';

  @override
  String get localSecretLakeEolaSunset => '当天空变成金色时，面向圆形剧场一侧拍摄天鹅照片。';

  @override
  String get localSecretMiamiWynwoodAlley =>
      '穿过 Panther Coffee 后面的装货巷——当地人在没有主线人群的情况下拍摄壁画。';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      '首先在橱窗购物车上买咖啡——当你拿着 Cortadito 时，边线的常客就会打开。';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      '跳过主要的露台高峰——从东花园进入，逆时针沿着红树林木板路行走。';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      '早上 7 点，鲁穆斯 (Lummus) 面向东 — 装饰艺术粉彩在早午餐人群到来之前闪闪发光。';

  @override
  String get localSecretMiamiPantherAlley =>
      '在窗口点餐，顺时针沿着小巷行走——早上 8:45 时，最好的壁画光线照射在绿松石色的墙壁上。';

  @override
  String get momentsTitle => '卢克索拉时刻';

  @override
  String get momentsSubtitle => '寻找一种感觉——而不是一个地方。';

  @override
  String get momentFeelRelaxed => '感觉轻松';

  @override
  String get momentImpressSpouse => '给我的配偶留下深刻印象';

  @override
  String get momentPerfectSunset => '完美的日落';

  @override
  String get momentFamilyMemory => '家族记忆';

  @override
  String get momentLuxuryValue => '奢华而不超支';

  @override
  String get momentPromptRelaxed => '我想在接下来的几个小时里感到完全放松——缓慢、美丽、没有人群。';

  @override
  String get momentPromptImpressSpouse => '今晚我想用一些浪漫和意想不到的东西给我的配偶留下深刻的印象。';

  @override
  String get momentPromptPerfectSunset => '我想要完美的佛罗里达日落时刻 - 我们应该在哪里以及什么时候离开？';

  @override
  String get momentPromptFamilyMemory => '我想要一个难忘的家庭时刻，对父母来说很轻松，对孩子来说却很神奇。';

  @override
  String get momentPromptLuxuryValue => '我想要一种不用花很多钱就能感觉特别的奢华。';

  @override
  String get visualShareImageButton => '分享图片卡';

  @override
  String get tripStoryTitle => '你的旅行故事';

  @override
  String tripStoryHeading(String title) {
    return '$title — 你的佛罗里达故事';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return '你是为了$moods而来的。';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return '本章：$title。';
  }

  @override
  String get tripStoryBeatClosing => '卢克索拉塑造了那些时刻——你经历了它们。';

  @override
  String get tripsOpenStory => '你的故事';

  @override
  String get conciergeVoiceHold => '按住说话';

  @override
  String get conciergeVoiceSoon => '请允许麦克风，以便 Luxora 能听你说。';

  @override
  String get conciergeVoiceListening => 'Luxora 正在聆听…';

  @override
  String get conciergeVoiceSpeaking => 'Luxora 正在说话…';

  @override
  String get conciergeVoiceRelease => '松开发送';

  @override
  String get conciergeVoiceSend => '发送给 Luxora';

  @override
  String get conciergeVoiceProcessing => '正在发送给 Luxora…';

  @override
  String get conciergeVoiceNoSpeech => '没听清——按住说话，说完再松开。';

  @override
  String get conciergeVoicePreviewFailed => '无法播放预览。请检查音量后重试。';

  @override
  String get conciergeVoiceUnavailable => '此设备不支持语音。';

  @override
  String get conciergeVoiceSettingsTitle => 'Luxora 语音';

  @override
  String get conciergeVoiceSettingsSubtitle => '选择口音、音色和语速 — 使用您设备的系统语音。';

  @override
  String get conciergeVoiceRateLabel => '语速';

  @override
  String get conciergeVoiceRateSlow => '慢';

  @override
  String get conciergeVoiceRateNatural => '自然';

  @override
  String get conciergeVoiceRateFast => '快';

  @override
  String get conciergeVoicePreview => '试听语音';

  @override
  String get conciergeVoicePreviewSample => '你好 — 我是 Luxora。告诉我你希望这次旅行是什么感觉。';

  @override
  String get conciergeVoiceDeviceNote =>
      'Download more voices in iPhone Settings → Accessibility → Spoken Content → Voices. Return here and tap Refresh.';

  @override
  String get conciergeVoiceDeviceSection => 'Voices on this iPhone';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'Includes voices you downloaded — tap one to use it for Luxora.';

  @override
  String get conciergeVoiceRefreshList => 'Refresh voice list';

  @override
  String get conciergeVoiceShowAllLanguages => 'Show all languages';

  @override
  String get conciergeVoiceOpenSettings => 'Open iPhone voice settings';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      'No voices found — download packs in Settings, then refresh.';

  @override
  String get conciergeVoicePresetSection => '快速人设';

  @override
  String get conciergeVoiceRegionRecommended => '推荐';

  @override
  String get conciergeVoiceRegionEnglish => '英语';

  @override
  String get conciergeVoiceRegionRussian => '俄语';

  @override
  String get conciergeVoiceRegionSpanish => '西班牙语';

  @override
  String get conciergeVoiceRegionFrench => '法语';

  @override
  String get conciergeVoiceRegionGerman => '德语';

  @override
  String get conciergeVoiceRegionOther => '其他';

  @override
  String get conciergeVoicePresetMatchApp => '匹配应用语言 · 女声';

  @override
  String get conciergeVoicePresetEnUsF => '美式 · 女声';

  @override
  String get conciergeVoicePresetEnUsM => '美式 · 男声';

  @override
  String get conciergeVoicePresetEnGbF => '英式 · 女声';

  @override
  String get conciergeVoicePresetEnGbM => '英式 · 男声';

  @override
  String get conciergeVoicePresetRuF => '俄语 · 女声';

  @override
  String get conciergeVoicePresetRuM => '俄语 · 男声';

  @override
  String get conciergeVoicePresetEsF => '西语 · 女声';

  @override
  String get conciergeVoicePresetEsM => '西语 · 男声';

  @override
  String get conciergeVoicePresetFrF => '法语 · 女声';

  @override
  String get conciergeVoicePresetFrM => '法语 · 男声';

  @override
  String get conciergeVoicePresetDeF => '德语 · 女声';

  @override
  String get conciergeVoicePresetDeM => '德语 · 男声';

  @override
  String get conciergeThinking => 'Luxora 正在思考…';

  @override
  String get conciergeAiError => '无法连接 Luxora。请检查网络后重试。';

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
  String get mapAiPowers => 'AI 地图能力';

  @override
  String get mapNavLayerTitle => '站点摩擦智能';

  @override
  String get mapNavLayerSubtitle => '日程中的人流、停车与驾驶压力 — 加一键改线。';

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
  String get mapFutureCrowdTitle => '人流展望';

  @override
  String get mapFutureCrowdDesc => 'Plan my day 每站从安静到拥挤的预测窗口。';

  @override
  String get mapFutureParkingTitle => '停车展望';

  @override
  String get mapFutureParkingDesc => '出发前对代客泊车、车库与到达摩擦的估算。';

  @override
  String get mapFutureTrafficTitle => 'Drive friction score';

  @override
  String get mapFutureTrafficDesc => '日程每段路程的压力分 — 不只是分钟数。';

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
  String get tripsPlanNew => '计划新的旅行';

  @override
  String get tripsEmptyTitle => '尚未保存行程';

  @override
  String get tripsEmptyBody => '计划您的第一次旅行，它会出现在这里，供您随时重游。';

  @override
  String get tripsDeleteTitle => '删除行程？';

  @override
  String tripsDeleteBody(String title) {
    return '这将从您保存的行程中删除“$title”。此操作无法撤消。';
  }

  @override
  String get tripsDeleted => '行程已删除';

  @override
  String get tripsEditDates => '行程日期';

  @override
  String get tripsSaveDates => '保存日期';

  @override
  String get tripsDatesUpdated => '日期已更新';

  @override
  String get tripsDatesFlexible => '日期待定';

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
  String get tripsShare => '分享';

  @override
  String get shareItineraryFooter => '与 Luxora 一起计划——您高情商的佛罗里达伴侣。';

  @override
  String shareSubject(String title) {
    return '我的$title';
  }

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
  String get detailTravelIntelTitle => '行程摩擦展望';

  @override
  String get detailTravelIntelSubtitle => '按类别、时间与距离预测 — 非实时传感器。';

  @override
  String detailCrowdOutlook(String level) {
    return '人流：$level';
  }

  @override
  String detailParkingOutlook(String level) {
    return '停车：$level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return '驾驶负担：$score/90';
  }

  @override
  String get detailPrice => '价格';

  @override
  String get detailLocation => '位置';

  @override
  String get detailGetDirections => '获取路线';

  @override
  String get detailParkMap => '公园地图';

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
    return '从奥兰多出发 $time 车程';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '从$time出发的$hub车程';
  }

  @override
  String get detailSaveToItinerary => '保存至行程';

  @override
  String get detailSaved => '已保存';

  @override
  String get detailSavedSnack => '已保存至您的行程';

  @override
  String get detailRemovedSnack => '已从您的行程中删除';

  @override
  String get detailSetHomeBase => '设置为大本营';

  @override
  String get detailHomeBaseActive => '您的旅行大本营';

  @override
  String get detailHomeBaseHint => '您一天的路线从这里开始和结束。';

  @override
  String get detailHomeBaseSetSnack => '设为您的旅行大本营';

  @override
  String get detailHomeBaseClearedSnack => '基地已清除';

  @override
  String get detailMenuTitle => '菜单亮点';

  @override
  String get detailMenuDisclaimer => '精选亮点 - 完整菜单和价格可能因场地而异。';

  @override
  String get detailMenuComingSoon => '我们仍在策划这个菜单。同时在线查看最新菜单和价格。';

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
  String milesFromHub(String distance, String hub) {
    return '距$distance的$hub';
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
  String get onboardCityLabel => '选择您的城市';

  @override
  String get onboardCityUnlockNote =>
      '每个目的地都有独立的礼宾解锁 — 按城市一次性购买。奥兰多主题公园为一个套餐（迪士尼和环球影城一起）。';

  @override
  String get landingCityLabel => '您要去哪里？';

  @override
  String get paywallSwitchCity => '目的地';

  @override
  String get cityPickerUnlocked => '已解锁';

  @override
  String cityPickerUnlockPrice(String price) {
    return '解锁 $price';
  }

  @override
  String get cityPickerThemeParksSubtitle => '奥兰多附加包 · 迪士尼和环球影城一起';

  @override
  String get onboardStep2Title => '该感受自由了';

  @override
  String get onboardStep2Subtitle => '你的逃离何时开始？';

  @override
  String get onboardStartDateLabel => '开始日期';

  @override
  String get onboardEndDateLabel => '结束日期';

  @override
  String get onboardPickDate => '点击选择';

  @override
  String get onboardSelectStartDate => '选择开始日期';

  @override
  String get onboardSelectEndDate => '选择结束日期';

  @override
  String get onboardDatesHint => '可随时在「行程」标签页中修改。';

  @override
  String get onboardStepBudgetTitle => '轻松规划';

  @override
  String get onboardStepBudgetSubtitle => '这次旅行适合的预算是？';

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
  String get onboardPoolside => '池畔和休息时间';

  @override
  String get onboardAdventure => '探险与户外';

  @override
  String get onboardCulture => '文化与观光';

  @override
  String get dayFlowSubtitle => '这一天是围绕您想要的感受而设计的，而不是一张清单。';

  @override
  String get dayFlowMorning => '早晨';

  @override
  String get dayFlowMidday => '正午';

  @override
  String get dayFlowAfternoon => '下午';

  @override
  String get dayFlowEvening => '晚上';

  @override
  String get dayFlowNight => '夜晚';

  @override
  String get dayFlowReasonMorningPool => '在一天开始之前，在池畔或水疗中心慢慢放松。';

  @override
  String get dayFlowReasonMorningCalm => '温和的开始定下基调。';

  @override
  String get dayFlowReasonMiddayAdventure => '精力充沛的时间——趁你精力充沛的时候来一次大冒险。';

  @override
  String get dayFlowReasonMiddayCulture => '趁着灯光明亮的时候游览。';

  @override
  String get dayFlowReasonMiddayIcon => '当天的签名时刻。';

  @override
  String get dayFlowReasonAfternoonDowntime => '下午休息充电。';

  @override
  String get dayFlowReasonAfternoonGem => '远离人群的隐藏宝石。';

  @override
  String get dayFlowReasonEveningDining => '当天的美食 — 您的美食家之选。';

  @override
  String get dayFlowReasonNightOut => '最后的光芒——一个夜晚。';

  @override
  String weatherToday(String place) {
    return '现在在$place';
  }

  @override
  String weatherSunset(String time) {
    return '日落$time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% 几率下雨 — 带上薄薄的一层。';
  }

  @override
  String get weatherConditionClear => '清除';

  @override
  String get weatherConditionPartlyCloudy => '多云';

  @override
  String get weatherConditionCloudy => '多云';

  @override
  String get weatherConditionFog => '多雾路段';

  @override
  String get weatherConditionDrizzle => '细雨';

  @override
  String get weatherConditionRain => '雨';

  @override
  String get weatherConditionSnow => '雪';

  @override
  String get weatherConditionThunder => '雷暴';

  @override
  String get weatherConciergeTitle => '天气礼宾部';

  @override
  String get weatherConciergeTapHint => '点击即可获取旅行感知预报';

  @override
  String get weatherConciergeAdviceTitle => '卢克索拉 天气建议';

  @override
  String weatherFeelsLike(String temp) {
    return '感觉就像$temp';
  }

  @override
  String get weatherHumidity => '湿度';

  @override
  String get weatherWind => '风';

  @override
  String weatherWindValue(String dir, int speed) {
    return '$dir，速度为 $speed 英里/小时';
  }

  @override
  String get weatherUv => '紫外线指数';

  @override
  String get weatherCloudCover => '云层覆盖';

  @override
  String get weatherVisibility => '能见度';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$miles 英里';
  }

  @override
  String weatherSunrise(String time) {
    return '日出$time';
  }

  @override
  String get weatherStatRain => '雨';

  @override
  String get weatherWhatToBring => '今天要带什么';

  @override
  String get weatherPlanImpact => '对您的计划的影响';

  @override
  String get weatherHourlyTitle => '每小时展望';

  @override
  String get weatherHourlyUnavailable => '数据加载时将出现每小时预测。';

  @override
  String get weatherLiveRadar => '实时雷达';

  @override
  String get weatherRadarComingSoon => '实时雷达即将推出。';

  @override
  String get weatherRadarPlay => '播放循环';

  @override
  String get weatherRadarPause => '暂停循环';

  @override
  String get weatherRadarTapToExpand => '点击全屏查看';

  @override
  String get weatherRadarNow => '现在';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return '$minutes 分钟前';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes 分钟';
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
  String get shareMapPreviewCaption => '地图预览 · 在 Luxora 中打开以获取实时路线';

  @override
  String get weatherMapOverlays => '地图叠加';

  @override
  String get weatherOverlayPrecip => '沉淀';

  @override
  String get weatherOverlayTemp => '温度';

  @override
  String get weatherOverlayWind => '风';

  @override
  String get weatherOverlayCloud => '云层覆盖';

  @override
  String get weatherComingSoon => '即将推出';

  @override
  String get weatherAdjustDay => '根据天气调整我的一天';

  @override
  String get weatherBestOutdoorWindow => '最佳户外窗户';

  @override
  String get weatherRainWindow => '可能会下雨';

  @override
  String get weatherSunsetRec => '日落推荐';

  @override
  String weatherOutdoorAtRisk(int count) {
    return '$count 个室外站点可能会受到影响';
  }

  @override
  String get weatherIndoorBackup => '室内备份想法';

  @override
  String get weatherAdviceLightJacket => '今晚带一件薄外套。';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return '在$time之前计划户外活动。';
  }

  @override
  String get weatherAdviceHighUv => '今天紫外线很高——带上防晒霜，避免中午长时间直接暴露在阳光下。';

  @override
  String get weatherAdviceRainLater => '今天晚些时候，降雨风险会增加，因此请将室内体验移至下午。';

  @override
  String get weatherAdviceWindBeach => '今天，风可能会使海滩或乘船活动变得不太舒适。';

  @override
  String get weatherAdviceGreatSunset => '今晚的日落条件非常好——考虑一下屋顶晚餐或湖边散步。';

  @override
  String get weatherAdviceDefault => '天空看起来很容易控制——按照你的计划进行，并在手边准备一层薄层。';

  @override
  String weatherSunsetRecRooftop(String time) {
    return '$time 附近天空晴朗 — 屋顶晚餐或湖边散步可能会闪闪发光。';
  }

  @override
  String get weatherPackSunscreen => '防晒霜';

  @override
  String get weatherPackSunglasses => '太阳镜';

  @override
  String get weatherPackUmbrella => '伞';

  @override
  String get weatherPackLightJacket => '轻便夹克';

  @override
  String get weatherPackShoes => '舒适的鞋子';

  @override
  String get weatherPackWater => '水瓶';

  @override
  String get weatherPackHat => '帽子';

  @override
  String get weatherPackPoncho => '雨披';

  @override
  String get weatherPackSwimwear => '泳装';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return '$time 之后降雨风险上升。考虑提前移动 $outdoorStop 并保存 $indoorStop 以供稍后使用。';
  }

  @override
  String weatherImpactHeat(String time) {
    return '正午高温 — 在 $time 之前计划户外散步。';
  }

  @override
  String get weatherImpactClear => '今天早上的天空看起来很适合你的户外计划。';

  @override
  String weatherImpactMixed(int count) {
    return '今天，$count 个室外站点可能需要调整时间。';
  }

  @override
  String get weatherImpactNoPlanRain => '雨是其中的一部分——首先用室内锚来度过你的一天。';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return '最好的室外窗户看起来是在炎热或阵雨形成之前的 $start–$end。';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      '天气看起来很稳定 - 当您准备好按顺序停靠时，请点击“计划我的一天”。';

  @override
  String get weatherImpactIndoorFallback => '水疗中心或博物馆';

  @override
  String get hotelIntelBadge => '酒店情报';

  @override
  String get hotelIntelTitle => '找到你的基地';

  @override
  String get hotelIntelSubtitle => 'Luxora 会根据您想要的旅行选择适合您一天的住宿，而不是预订网格。';

  @override
  String get hotelDiscoveryTitle => '为奥兰多策划';

  @override
  String get hotelMatchmakerTeaser => '告诉卢克索拉您的旅行风格，并通过诚实的权衡获得礼宾精选的三种住宿。';

  @override
  String get hotelMatchmakerCta => 'AI酒店红娘';

  @override
  String get hotelMatchmakerTitle => '酒店红娘';

  @override
  String get hotelMatchmakerSubtitle => '分享您的旅行方式 — Luxora 推荐您在哪里度过美好时光。';

  @override
  String get hotelMatchmakerRun => '查找我最喜欢的 3 家住宿';

  @override
  String get hotelMatchBudget => '预算舒适区';

  @override
  String get hotelMatchTravelers => '旅行者';

  @override
  String get hotelMatchAdults => '成年人';

  @override
  String get hotelMatchKids => '孩子们';

  @override
  String get hotelMatchAttractions => '您清单上的景点';

  @override
  String get hotelMatchLuxuryLevel => '想要的奢华程度';

  @override
  String get hotelMatchTransport => '出行';

  @override
  String get hotelTransportCar => '租车';

  @override
  String get hotelTransportRideshare => '共乘';

  @override
  String get hotelTransportShuttle => '度假村班车';

  @override
  String get hotelTransportWalkable => '适合步行的街区';

  @override
  String get hotelMatchResultsTitle => '您最喜欢的 3 场比赛';

  @override
  String hotelMatchWhyTitle(int score) {
    return '比赛得分 $score';
  }

  @override
  String get hotelMatchBestForLabel => '最适合：';

  @override
  String get hotelMatchItineraryLabel => '行程：';

  @override
  String get hotelMatchTradeoffsLabel => '权衡：';

  @override
  String get hotelMatchNearbyLabel => '附近：';

  @override
  String get hotelLuxoraScore => '卢克索拉';

  @override
  String get hotelHomeBaseBadge => '基地';

  @override
  String get hotelScoreLuxury => '奢华';

  @override
  String get hotelScoreFamily => '家庭';

  @override
  String get hotelScoreRomance => '浪漫';

  @override
  String get hotelScoreWalkability => '走';

  @override
  String get hotelWhyRecommendTitle => '为什么 Luxora 推荐这个';

  @override
  String get hotelItineraryImpactTitle => '这如何塑造你的日子';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return '从集线器出发的粗略行驶时间：$driveTime。旅行摩擦分数：$friction/90（越低越平静）。';
  }

  @override
  String get hotelAddHomeBase => '添加为基地';

  @override
  String get hotelHomeBaseActive => '基地活动';

  @override
  String get hotelViewOnMap => '在地图上查看';

  @override
  String get hotelGetDirections => '获取路线';

  @override
  String get hotelCheckRates => '查看价格';

  @override
  String get hotelVisitWebsite => '访问网站';

  @override
  String get hotelLinkUnavailable => '此住宿的预订链接尚不可用。';

  @override
  String get hotelLinkOpenFailed => '无法打开链接 — 请在浏览器中重试。';

  @override
  String get hotelSave => '保存酒店';

  @override
  String get hotelSaved => '已保存';

  @override
  String get hotelDistanceTitle => '到关键地点的距离';

  @override
  String get hotelCompareTitle => '比较住宿';

  @override
  String get hotelCompareSubtitle => '并排礼宾视图 — 最多三家酒店。';

  @override
  String hotelCompareSelected(int count) {
    return '已选择 $count 个';
  }

  @override
  String get hotelComparePrice => '价格范围';

  @override
  String get hotelCompareDriveImpact => '推动影响';

  @override
  String get hotelCompareNearby => '附近亮点';

  @override
  String get hotelPriceBudget => '预算';

  @override
  String get hotelPriceModerate => '缓和';

  @override
  String get hotelPriceUpscale => '高档';

  @override
  String get hotelPriceLuxury => '奢华';

  @override
  String get hotelTagCouples => '最适合情侣';

  @override
  String get hotelTagDisney => '最适合迪士尼';

  @override
  String get hotelTagUniversal => '最适合环球';

  @override
  String get hotelTagLuxuryStaycation => '豪华住宿';

  @override
  String get hotelTagFamily => '适合家庭入住';

  @override
  String get hotelTagQuiet => '安静的逃离';

  @override
  String get hotelTagWalkableDining => '适合步行就餐';

  @override
  String get hotelTagResort => '度假村的感觉';

  @override
  String get hotelTagBudget => '预算友好';

  @override
  String get hotelReasonMatchesMood => '符合您的旅行心情和节奏。';

  @override
  String get hotelReasonCloseStops => '接近您时间表上的计划停靠点。';

  @override
  String hotelReasonSavesDrive(String time) {
    return '与通用枢纽相比可节省行驶时间 — 距中心约 $time。';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return '适合 $range 舒适区，不会在错误的度假村上超支。';
  }

  @override
  String get hotelReasonBetterGroup => '更适合您的团体类型和能量水平。';

  @override
  String get hotelReasonNearbyDining => '附近有很多餐厅，让您度过轻松的夜晚。';

  @override
  String get hotelReasonLowStress => '度假村式的平静——更少的后勤工作，更多的假期。';

  @override
  String get hotelMatchAttractionsGeneral => '您计划的景点';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return '$hotel 根据您的$attractions 行程，缩短行车时间，让夜晚轻松度过。';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$neighborhood 的 $hotel 符合您想要的这次旅行的感觉。';
  }

  @override
  String get hotelMatchBestForFamily => '想要享受泳池时光而又不想牺牲公园使用权的家庭。';

  @override
  String get hotelMatchBestForCouple => '想要浪漫而又不想主题公园混乱的情侣。';

  @override
  String get hotelMatchBestForGroup => '团体平衡舒适性、便利性和平静的后勤。';

  @override
  String hotelMatchImpactDisney(String time) {
    return '较短的迪士尼线路 — 从您家门口到公园大约需要 $time。';
  }

  @override
  String get hotelMatchImpactUniversal => '环球快车福利或水上出租车服务可以节省您一天的时间。';

  @override
  String get hotelMatchImpactWalkable => '步行去吃晚饭——在公园度过漫长的一天后，可以减少停车压力。';

  @override
  String hotelMatchImpactDefault(String time) {
    return '将平均驾驶时间保持在 $time 左右，以便您的一天流程保持轻松。';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget => '高级度假村定价——房间预算更多，其他地方预算更少。';

  @override
  String get hotelMatchTradeoffCarNeeded => '您将依赖汽车或拼车服务，而不是步行到任何地方的基地。';

  @override
  String get hotelMatchTradeoffLessFamily => '与专门的家庭度假村相比，较少关注以儿童为中心的设施。';

  @override
  String get hotelMatchTradeoffLessRomantic => '主题公园的活力比安静的情侣休养地还要多。';

  @override
  String get hotelMatchTradeoffDefault => '每次住宿都会有一些权衡——Luxora 选择了这里作为您的首要任务。';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return '$neighborhood 周围的餐饮和体验。';
  }

  @override
  String get mapHotelIntelBannerTitle => '选择合适的基地';

  @override
  String get mapHotelIntelBannerBody =>
      '您的酒店决定了驾车时间、日间流量以及就餐地点。 Luxora 可帮助您挑选 — 无预订压力。';

  @override
  String get mapHotelIntelBannerCta => '探索酒店智能';

  @override
  String get sponsorLuxoraRecommended => '卢克索拉推荐';

  @override
  String get sponsorBadgeFeaturedPartner => '特色合作伙伴';

  @override
  String get sponsorBadgeSponsored => '赞助';

  @override
  String get sponsorBadgePromoted => '晋升';

  @override
  String get sponsorBadgePartnerOffer => '合作伙伴优惠';

  @override
  String get sponsorCtaVisitWebsite => '访问网站';

  @override
  String get sponsorCtaBookNow => '立即预订';

  @override
  String get sponsorCtaCheckRates => '查看价格';

  @override
  String get sponsorCtaGetTickets => '获取门票';

  @override
  String get sponsorCtaViewOffer => '查看报价';

  @override
  String get featuredStaysTitle => '特色住宿';

  @override
  String get featuredStaysSubtitle => '合作伙伴安置 — 与 Luxora 的有机酒店比赛分数分开。';

  @override
  String get featuredExperiencesTitle => '特色体验';

  @override
  String get featuredExperiencesSubtitle => '根据您的心情推荐的推荐 — 始终贴上标签，从不伪装成 AI 排名。';

  @override
  String get featuredDiningTitle => '特色餐饮';

  @override
  String get featuredDiningSubtitle => 'Luxora 合作餐厅的亮点 — 您的有机宝石清单保持独立。';

  @override
  String get featuredTicketPartnersTitle => '精选票务合作伙伴';

  @override
  String get featuredTicketPartnersSubtitle => '授权合作伙伴提供的优惠 — 与下面的自然节省进行比较。';

  @override
  String get featuredCityHomeTitle => '特色合作伙伴';

  @override
  String get featuredCityHomeSubtitle => '奥兰多有用的合作伙伴选项 - 清晰标记，绝不会隐藏为人工智能选择。';

  @override
  String get dayFlowVibeFoodie => '美食家前卫';

  @override
  String get dayFlowVibeNightlife => '夜生活';

  @override
  String get dayFlowVibePoolside => '池畔';

  @override
  String get dayFlowVibeAdventure => '喜欢冒险';

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

  @override
  String get paywallHeroEyebrow => '您的私人礼宾服务';

  @override
  String get paywallHeroHeadline => '不要浪费你的假期';

  @override
  String get paywallHeroSubheadline => 'Luxora 计划了这次旅行，以便您可以享受它。';

  @override
  String get paywallEmotionalLine => '您已经在假期上花费了数千美元。不要把体验留给机会。';

  @override
  String paywallHeadlineCouples(String cityName) {
    return '您的完美$cityName度假之旅从这里开始。';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return '花更少的时间规划，花更多的时间在 $cityName 留下美好回忆。';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return '以不同的方式体验$cityName。';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return '探索大多数游客从未见过的$cityName。';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return '像当地人一样品尝$cityName。';
  }

  @override
  String get paywallWhatYouUnlock => '你解锁什么';

  @override
  String get paywallFeatureAiConcierge => '人工智能礼宾';

  @override
  String get paywallFeatureItineraries => '个性化行程';

  @override
  String get paywallFeatureHiddenGems => '隐藏的宝石';

  @override
  String get paywallFeatureHotelIntel => '酒店情报';

  @override
  String get paywallFeatureTicketSavings => '智能门票节省';

  @override
  String get paywallFeatureWeatherConcierge => '天气礼宾部';

  @override
  String get paywallFeatureCrowdIntel => '群体情报';

  @override
  String get paywallFeatureGpsNav => 'GPS导航';

  @override
  String get paywallFeatureLocalSecrets => '当地秘密';

  @override
  String get paywallFeatureDining => '餐饮推荐';

  @override
  String get paywallFeatureUnlimitedPlanning => '无限的城市规划';

  @override
  String get paywallWhyTravelersUnlock => '为什么旅行者解锁卢克索拉';

  @override
  String get paywallBenefitSaveTimeTitle => '节省时间';

  @override
  String get paywallBenefitSaveTimeBody => '跳过数小时的研究和规划。';

  @override
  String get paywallBenefitSaveMoneyTitle => '省钱';

  @override
  String get paywallBenefitSaveMoneyBody => '了解门票优惠、本地优惠和更明智的选择。';

  @override
  String get paywallBenefitAvoidTrapsTitle => '避免旅游陷阱';

  @override
  String get paywallBenefitAvoidTrapsBody => '寻找当地人真正推荐的体验。';

  @override
  String get paywallBenefitTravelSmarterTitle => '更智慧的旅行';

  @override
  String get paywallBenefitTravelSmarterBody => '根据天气、人群和您的旅行方式获取建议。';

  @override
  String get paywallLockedPreviewTitle => '在礼宾部等候';

  @override
  String get paywallLockedPreviewSubtitle => '解锁以揭示为您的旅行量身定制的路线和秘密。';

  @override
  String get paywallLockedDateNight => '浪漫约会之夜路线';

  @override
  String get paywallLockedHiddenLuxury => '隐藏的奢华体验';

  @override
  String get paywallLockedVipSecrets => 'VIP 本地秘密';

  @override
  String get paywallLockedConciergeRecs => '礼宾建议';

  @override
  String get paywallLockedFamilyPlans => '家庭无压力计划';

  @override
  String get paywallLockedWeatherReroute => '天气感知重新路由';

  @override
  String get paywallLockedHotelMatchmaker => '智能酒店红娘';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return '解锁$cityName礼宾服务';
  }

  @override
  String get paywallOneTimePurchase => '一次性购买';

  @override
  String get paywallNoSubscription => '没有订阅';

  @override
  String get paywallNoMonthlyFees => '无月费';

  @override
  String paywallLifetimeAccess(String cityName) {
    return '终身使用 $cityName';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return '包含未来的 $cityName 更新';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return '大多数 $cityName 假期费用为 $minUsd–$maxUsd+';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price一次';
  }

  @override
  String get paywallLessThanDinner => '比一顿假期晚餐的费用还要少。';

  @override
  String get paywallSocialProofTitle => '解锁卢克索拉的旅行者';

  @override
  String get paywallReview1 => '“节省了我们数小时的计划时间。”';

  @override
  String get paywallReview2 => '“发现了我们永远不会发现的地方。”';

  @override
  String get paywallReview3 => '“仅为了隐藏的宝石就值得了。”';

  @override
  String paywallCtaUnlock(String cityName) {
    return '解锁$cityName礼宾服务';
  }

  @override
  String get paywallContinueExploring => '继续探索';

  @override
  String get paywallConciergePromise => '一次性购买·私人礼宾·无需订阅';

  @override
  String get settingsUnlockConciergeTitle => '解锁城市礼宾服务';

  @override
  String get settingsUnlockConciergeSubtitle => '一次性城市包——不是订阅';

  @override
  String get settingsOpenConciergeSubtitle => '打开 AI 礼宾标签页';

  @override
  String get weatherMiamiHumidityIndoor =>
      '今天湿度高。早点去海滩或泳池，然后在最热的时候前往温伍德或布里克尔的室内餐厅和画廊。';

  @override
  String get weatherMiamiHeatAdvisory => '炎热建议条件——轻质织物、保湿和户外停留之间的遮阳休息。';

  @override
  String get weatherMiamiBeachMorning => '沙滩上有强烈的紫外线——涂防晒霜、戴帽子，中午之前的海滩时间。';

  @override
  String get weatherMiamiBoatWind => '风力增强——重新考虑乘船或游艇活动；屋顶用餐可能仍然有效。';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return '前方有雨 — 将户外计划改为 $indoorSpot 或画廊时间。';
  }

  @override
  String get weatherMiamiSunsetWaterfront => '日落看起来很强烈——海滨或屋顶可以看到东西向的景色。';

  @override
  String get miamiBeachIntelTitle => '海滩情报';

  @override
  String miamiBeachBestTime(String time) {
    return '最佳时间：$time';
  }

  @override
  String get miamiBeachFamilyScore => '家庭';

  @override
  String get miamiBeachCrowdScore => '人群';

  @override
  String get miamiBeachPhotoScore => '照片';

  @override
  String get miamiBeachRomanceScore => '浪漫';

  @override
  String get miamiBeachSunsetScore => '日落';

  @override
  String miamiBeachParking(String level) {
    return '停车场：$level';
  }

  @override
  String get miamiNightlifeTitle => '夜生活礼宾部';

  @override
  String miamiNightlifeDressCode(String code) {
    return '着装要求：$code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return '最佳到达时间：$time';
  }

  @override
  String get miamiNightlifeReservation => '建议预订';

  @override
  String get miamiMoodRoutesTitle => '迈阿密风情路线';

  @override
  String miamiMoodRouteStart(String time) {
    return '在 $time 左右开始';
  }

  @override
  String get keysWaterIntelTitle => '群岛水域情报';

  @override
  String keysWaterBestTime(String time) {
    return '最佳时段：$time';
  }

  @override
  String keysWaterTemp(String note) {
    return '水温：$note';
  }

  @override
  String get keysWaterSnorkelScore => '浮潜';

  @override
  String get keysWaterDivingScore => '潜水';

  @override
  String get keysWaterBoatingScore => '乘船';

  @override
  String get keysWaterFishingScore => '钓鱼';

  @override
  String get keysWaterWindScore => '风力';

  @override
  String get keysWaterSunsetScore => '日落';

  @override
  String get keysWaterCrowdScore => '人流';

  @override
  String get keysMoodRoutesTitle => '群岛主题路线';

  @override
  String keysMoodRouteStart(String time) {
    return '开始 $time';
  }

  @override
  String get paywallHeadlineMiamiDefault => '体验不同的迈阿密';

  @override
  String get paywallHeadlineMiamiWeekend => '不要浪费你的迈阿密周末';

  @override
  String get paywallOrlandoAddonsHeading => '主题公园套餐';

  @override
  String get paywallOrlandoBaseIncludes =>
      '奥兰多解锁包括餐饮、隐藏宝石、酒店和园外体验。添加主题公园套餐，迪士尼和环球影城一起解锁。';

  @override
  String get paywallAddonThemeParksTitle => '迪士尼和环球影城套餐';

  @override
  String get paywallAddonThemeParksSubtitle =>
      '华特迪士尼世界和奥兰多环球影城 — 所有园区、优惠、路线和人流情报一次解锁。';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return '解锁$packName · $price';
  }

  @override
  String get paywallAddonUnlocked => '已解锁';

  @override
  String get paywallAddonRequiresOrlando => '需先解锁奥兰多';

  @override
  String paywallUnlockAddonPack(String packName) {
    return '解锁$packName';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return '解锁$packName';
  }

  @override
  String get orlandoThemeParksPromptTitle => '为奥兰多解锁迪士尼和环球影城？';

  @override
  String get orlandoThemeParksPromptBody =>
      '添加 Walt Disney World 和 Universal Orlando 主题公园套餐 — 所有园区、门票优惠、路线和人流情报一次解锁。';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return '解锁 · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => '以后再说';
}
