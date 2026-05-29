// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => '設定';

  @override
  String get appearance => '外観';

  @override
  String get dark_mode => 'ダークモード';

  @override
  String get light_mode => 'ライトモード';

  @override
  String get language => '言語';

  @override
  String get settings_language_picker_note => '変更はすぐに適用されます。';

  @override
  String get settings_regions_coming_title => '国と都市';

  @override
  String get settings_regions_coming_subtitle => 'ホームハブパックとシティパックは近日発売予定です。';

  @override
  String get commonSoon => 'すぐ';

  @override
  String get commonContinue => '続く';

  @override
  String get commonNew => '新しい';

  @override
  String get commonRoadmap => 'ロードマップ';

  @override
  String get commonLive => 'ライブ';

  @override
  String get commonClose => '閉じる';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonDelete => '削除';

  @override
  String get settingsStartOverSubtitle => 'ゼロから新しい旅を計画';

  @override
  String get navConcierge => 'コンシェルジュ';

  @override
  String get navTimeline => 'タイムライン';

  @override
  String get navMap => '地図';

  @override
  String get navGems => '宝石';

  @override
  String get navFeed => '餌';

  @override
  String get navTrips => '旅行';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'コンシェルジュ';

  @override
  String conciergeTripFeel(String feel) {
    return '旅の気分: 「$feel」';
  }

  @override
  String get conciergeWelcome =>
      'Luxora へようこそ – 感情的に知的なフロリダの仲間です。\n\n以下のプロンプトを選択するか、旅行で作りたい雰囲気を説明してください。';

  @override
  String get conciergeQuickPrompts => 'クイックプロンプト';

  @override
  String get conciergeRemembering => 'この旅の思い出に';

  @override
  String get conciergeStyleMemory => 'スタイルメモリー';

  @override
  String get conciergeInputHint => '旅行で感じてほしいことを説明してください…';

  @override
  String get conciergeGreetingMorning => 'おはようございます。';

  @override
  String get conciergeGreetingAfternoon => 'こんにちは。';

  @override
  String get conciergeGreetingEvening => 'こんばんは。';

  @override
  String get conciergeWelcomeWarm =>
      '名所のリストではなく、どう感じたいかに合わせてフロリダを形づくります。今日はどんな気分ですか？';

  @override
  String get conciergeRefineStyle => 'スタイルを調整';

  @override
  String get conciergeRecallReturning => 'おかえりなさい。';

  @override
  String conciergeRecallStyle(String prefs) {
    return '$prefsがお好みでしたね。';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'そして、この旅では「$feel」を感じたいとのことでした。';
  }

  @override
  String get conciergePromptRomantic => 'ロマンチックな休暇';

  @override
  String get conciergePromptWellness => 'ウェルネスリセット';

  @override
  String get conciergePromptFamily => 'ファミリーマジック';

  @override
  String get conciergePromptHiddenLuxury => '隠れた贅沢';

  @override
  String get conciergePromptFoodie => 'グルメの冒険';

  @override
  String get conciergePromptSoftLuxury => 'ソフトで贅沢なエスケープ';

  @override
  String get conciergePromptAdventure => 'アドベンチャーモード';

  @override
  String get conciergePromptDisney => 'ディズニーアフターダーク';

  @override
  String get discoverSearchHint => '目的地を検索…';

  @override
  String get discoverSearchTitle => '目的地を探す';

  @override
  String get discoverFromOrlando => 'オーランドから';

  @override
  String get discoverSearchScopeAll => 'フロリダ州全体をカタログで検索';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'オーランドの$radius以内';
  }

  @override
  String get discoverSearchEmpty =>
      'この範囲内に一致するものはありません。名前を短くするか、マップまたはフィードで距離チップを広げるか、「ビーチ」、「ディズニー」、または「泉」を検索してください。';

  @override
  String get discoverFilterAll => 'すべて';

  @override
  String get discoverFilterHotels => 'ホテル';

  @override
  String get discoverFilterRestaurants => 'レストラン';

  @override
  String get discoverFilterDestinations => '名所';

  @override
  String get discoverPopularInRadius => 'あなたの半径内で人気のある';

  @override
  String get discoverTrySearching => '検索してみてください';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count か所の目的地 · オーランドから $radius 以内';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count 件の目的地 · フロリダ州すべて';
  }

  @override
  String get radius25 => '40マイル';

  @override
  String get radius50 => '50マイル';

  @override
  String get radius100 => '100マイル';

  @override
  String get radiusAllFlorida => 'すべてのフロリダ';

  @override
  String get radiusDesc25 => 'オーランドコア周辺の日帰り旅行';

  @override
  String get radiusDesc50 => '泉、海岸日帰り旅行、スペース コースト';

  @override
  String get radiusDesc100 => 'タンパベイ、デイトナ、湾奥深く';

  @override
  String get radiusDescAll => 'マイアミ州キーズ、州全体のハイライト';

  @override
  String get feedBadge => 'ライブディスカバリー';

  @override
  String get feedTitle => 'エクスペリエンスフィード';

  @override
  String get feedSubtitle =>
      '今何が動いているのか - トレンドのスポット、新規オープン、クリエイターのおすすめ、季節限定のルート、最新情報。';

  @override
  String get feedPillTrending => 'トレンド';

  @override
  String get feedPillNewOpenings => '新規出店';

  @override
  String get feedPillCreator => 'クリエイターのおすすめ';

  @override
  String get feedPillLive => 'ライブアップデート';

  @override
  String get feedMoodPrompt => 'どんな気分になりたい？';

  @override
  String get feedMoodAll => 'すべて';

  @override
  String get feedMoodRomantic => 'ロマンチック';

  @override
  String get feedMoodCalm => '穏やか';

  @override
  String get feedMoodAdventurous => '冒険';

  @override
  String get feedMoodPampered => '贅沢';

  @override
  String get feedMoodSocial => 'にぎやか';

  @override
  String get feedMoodFoodie => 'グルメ';

  @override
  String get feedEmptyHint =>
      'この半径内にはフィード カードはありません。メキシコ湾岸とキーズのハイライトについては、50 マイルまたはオール フロリダをお試しください。';

  @override
  String get gemsBadge => 'インサイダーキュレーション';

  @override
  String get gemsTitle => '隠された宝石';

  @override
  String get gemsSubtitle =>
      '地元の人が守っている秘密の発見 - なぜ特別なのか、いつ行くべきか、混雑具合、はがきには載っていないヒントなど。';

  @override
  String get gemsPillHidden => '隠れた場所';

  @override
  String get gemsPillLocal => 'ローカルのみ';

  @override
  String get gemsPillInsider => '内部情報';

  @override
  String get gemsPillCrowd => 'クラウドインテリジェンス';

  @override
  String get gemsEmptyHint =>
      'この半径内にはまだ宝石はありません。泉やスペース コーストの秘密については、50 マイル以上に広げてください。';

  @override
  String get gemsSearchHint => '隠された宝石や目的地を検索…';

  @override
  String get gemLocalSecret => 'ローカルシークレット';

  @override
  String get gemsMatchedBadge => 'あなた向け';

  @override
  String gemsMatchedNote(int count) {
    return 'あなたのスタイルに合う$count件';
  }

  @override
  String get gemWhySpecial => 'なぜ特別なのか';

  @override
  String get gemBestTime => '行くのに最適な時期';

  @override
  String get gemCrowdLevel => '群衆レベル';

  @override
  String get gemInsiderTip => '内部情報';

  @override
  String get gemLocalNote => '現地限定メモ';

  @override
  String get mapBadge => 'AIマップ';

  @override
  String get mapTitle => 'あなたのインテリジェントなルート';

  @override
  String get mapSubtitle =>
      '厳選した 1 日のピン — ゴールドのダイヤモンドは宝石、シアンのマーカーは今日のタイムライン、ゴールドのラインはムードルートです。';

  @override
  String get mapPlanDayTitle => '一日をプランニング';

  @override
  String get mapPlanDaySuggested => '旅のムードからの提案です。場所をブックマークして自分仕様に。';

  @override
  String get mapPlanDayEmpty =>
      '行き先をブックマーク（♥）すると、Luxora がオーランドの拠点から最適なルートを作成します。移動は少なく、感動は多く。';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$countか所 · $miles · 車で$time';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return '$hotel から出発';
  }

  @override
  String get mapCrowdLevelQuiet => '静か';

  @override
  String get mapCrowdLevelModerate => '普通';

  @override
  String get mapCrowdLevelBusy => '混雑';

  @override
  String get mapCrowdLevelPacked => '大混雑';

  @override
  String mapCrowdAtStop(String level) {
    return '混雑度: $level';
  }

  @override
  String get mapRerouteButton => '静かな立ち寄り先にルート変更';

  @override
  String mapRerouteApplied(int count) {
    return 'プランを調整 — $count か所を混雑の少ない場所に変更しました。';
  }

  @override
  String get mapRerouteNone => 'このルートはすでに落ち着いています。';

  @override
  String get mapRerouteRainHint => '雨の可能性 — 屋内プランへルート変更できます。';

  @override
  String get mapAiPowers => 'AI マップの力';

  @override
  String get mapNavLayerTitle => 'AI ナビゲーション層 (次)';

  @override
  String get mapNavLayerSubtitle => '発見を超えて - 今すぐ立ち寄る価値があるかどうかについての生きた情報。';

  @override
  String get mapBookingTitle => 'シームレスな予約（パートナー）';

  @override
  String get mapCapMoodTitle => '気分ベースのルート';

  @override
  String get mapCapMoodDesc => '単にドライブ時間が短いだけではなく、ロマンチック、健康、家族、または冒険に合った小道です。';

  @override
  String get mapCapDriveTitle => '運転時間の最適化';

  @override
  String get mapCapDriveDesc =>
      'スマートなシーケンスにより、ハイライト間の渋滞に巻き込まれずに、時間を感じながら過ごすことができます。';

  @override
  String get mapCapWeatherTitle => '天候に応じた提案';

  @override
  String get mapCapWeatherDesc => '雨のバックアップルートと、ビーチ、屋上、泉のライブウィンドウ。';

  @override
  String get mapCapSunsetTitle => '今が最高の夕日';

  @override
  String get mapCapSunsetDesc => '空と群衆のパターンに基づいて、次の 90 分間でゴールデンアワーが最もよく当たる場所。';

  @override
  String get mapCapCrowdTitle => '混雑予測';

  @override
  String get mapCapCrowdDesc => '公園、泉、流行のスポットが到着する前に静かになるとき。';

  @override
  String get mapCapGemsTitle => '近くの隠れた宝石';

  @override
  String get mapCapGemsDesc =>
      'トップ 10 の観光スポットだけでなく、あなたのルートに沿ってインサイダー ピンが表示されました。';

  @override
  String get mapCapPersonalTitle => 'ルートのパーソナライゼーション';

  @override
  String get mapCapPersonalDesc => '旅行の気分、ペース、予算に応じて地図がリアルタイムで再形成されます。';

  @override
  String get mapFutureCrowdTitle => 'ライブの観客の熱気';

  @override
  String get mapFutureCrowdDesc =>
      '泉、公園、ウイルスが蔓延する屋上のリアルタイムの密度 - 今すぐに価値があるでしょうか?';

  @override
  String get mapFutureParkingTitle => '駐車の困難さ';

  @override
  String get mapFutureParkingDesc =>
      'コミットする前の摩擦スコア - 係員付きサービス、ガレージ、またはライドシェアのスイート スポット。';

  @override
  String get mapFutureTrafficTitle => 'ドライブフリクションスコア';

  @override
  String get mapFutureTrafficDesc =>
      'ストレスを加重したルーティング — 単なる分ではなく、ドライブの感触を考慮します。';

  @override
  String get mapFutureRerouteTitle => '自発的な再ルート';

  @override
  String get mapFutureRerouteDesc => '天候の変化か、それとも観客の急増か？ワンタップで一日の残りの時間を作り直します。';

  @override
  String affiliateReserve(String category) {
    return '予約 · $category · プレミアム パートナー (近日中に)';
  }

  @override
  String get affiliateHotels => 'ホテルとステイケーション';

  @override
  String get affiliateExperiences => '体験＆ツアー';

  @override
  String get affiliateRestaurants => 'レストランの予約';

  @override
  String get affiliateThemeParks => 'テーマパークのチケット';

  @override
  String get affiliateDayPasses => 'リゾートパス / 一日パス';

  @override
  String get affiliateCarRentals => 'レンタカー';

  @override
  String get affiliateWellness => 'ウェルネスの予約';

  @override
  String get tripsBadge => 'コレクション';

  @override
  String get tripsTitle => '保存された旅行';

  @override
  String get tripsSubtitle =>
      '旅行をタップすると、次の瞬間、天気、日没、タイムラインなどのライブスナップショットが表示されます。';

  @override
  String get tripsFooter => 'ムードカタログからの旅行カバー · Supabase 同期フェーズ 2';

  @override
  String get tripsPlanNew => '新しい旅を計画する';

  @override
  String get tripsEmptyTitle => '保存された旅はまだありません';

  @override
  String get tripsEmptyBody => '最初の旅を計画すると、ここに表示され、いつでも見返せます。';

  @override
  String get tripsDeleteTitle => '旅を削除しますか？';

  @override
  String tripsDeleteBody(String title) {
    return '「$title」を保存した旅から削除します。元に戻せません。';
  }

  @override
  String get tripsDeleted => '旅を削除しました';

  @override
  String get tripsLiveWeather => 'ライブ天気';

  @override
  String get tripsNextUp => '次は';

  @override
  String get tripsSunsetWindow => '夕焼けの窓';

  @override
  String get tripsTimelineSnapshot => 'タイムラインのスナップショット';

  @override
  String get tripsOpenTimeline => '完全なタイムラインを開く';

  @override
  String get tripsShare => '共有';

  @override
  String get shareItineraryFooter => 'Luxora —— 感情を理解するフロリダの相棒 —— と一緒にプランニング。';

  @override
  String shareSubject(String title) {
    return '私の$title';
  }

  @override
  String get itineraryBadge => 'あなたのタイムライン';

  @override
  String get itineraryTagline => 'あらゆる瞬間がつながり、期待が高まり、ストレスがなくなりました。';

  @override
  String itineraryDayTab(int day, String label) {
    return '日 $day · $label';
  }

  @override
  String get detailWhySpecial => 'なぜ特別なのか';

  @override
  String get detailBestTime => '旅行に最適な時期';

  @override
  String get detailInsiderTips => 'インサイダー ヒント';

  @override
  String get detailReserve => '体験予約';

  @override
  String get detailReserveSoon => '予約パートナーは近日公開予定です。';

  @override
  String get detailNearbyGems => '近くの宝石';

  @override
  String get detailDuration => '間隔';

  @override
  String get detailPractical => '実践的な詳細';

  @override
  String get detailCostRange => 'コスト範囲';

  @override
  String get detailBestFor => 'こんな方に最適';

  @override
  String get detailVibeMatch => 'バイブマッチ';

  @override
  String get detailCrowd => '群衆';

  @override
  String get detailPrice => '価格';

  @override
  String get detailLocation => '位置';

  @override
  String get detailGetDirections => 'ルートを表示';

  @override
  String get detailParkMap => 'パークマップ';

  @override
  String get detailViewOnMap => '地図で見る';

  @override
  String get detailMapsError => 'この端末で地図を開けませんでした。';

  @override
  String get detailGoogleMaps => 'Google マップ';

  @override
  String get detailAppleMaps => 'Apple マップ';

  @override
  String get detailOpenInMaps => '地図で開く';

  @override
  String detailDriveFromOrlando(String time) {
    return 'オーランドから車で$time';
  }

  @override
  String get detailSaveToItinerary => '旅程に保存';

  @override
  String get detailSaved => '保存済み';

  @override
  String get detailSavedSnack => '旅程に保存しました';

  @override
  String get detailRemovedSnack => '旅程から削除しました';

  @override
  String get detailSetHomeBase => '拠点に設定';

  @override
  String get detailHomeBaseActive => '旅の拠点';

  @override
  String get detailHomeBaseHint => '1日のルートはここから始まり、ここで終わります。';

  @override
  String get detailHomeBaseSetSnack => '旅の拠点に設定しました';

  @override
  String get detailHomeBaseClearedSnack => '拠点を解除しました';

  @override
  String get detailMenuTitle => 'メニューのハイライト';

  @override
  String get detailMenuDisclaimer => 'おすすめの一部です。実際のメニューや価格は店舗により異なる場合があります。';

  @override
  String get detailMenuComingSoon => 'このメニューはまだ準備中です。最新のメニューと価格はオンラインでご確認ください。';

  @override
  String get detailViewMenuOnline => 'オンラインでメニューを見る';

  @override
  String get photoClose => '近い';

  @override
  String get photoViewDestination => '目的地を表示';

  @override
  String get photoBy => '写真提供者';

  @override
  String get photoOn => 'の上';

  @override
  String milesFromOrlando(String distance) {
    return 'オーランドから$distance';
  }

  @override
  String get landingBadge => 'フロリダ・オーランド MVP';

  @override
  String get landingTitle1 => '休暇';

  @override
  String get landingTitle2 => 'すでに始まっています。';

  @override
  String get landingSubtitle =>
      'Luxora AI は、あなたの感情的に知的なコンシェルジュです。隠れた宝石、屋上での夕日、そして荷物をまとめる前から忘れられない気分になる瞬間を提供します。';

  @override
  String get landingBegin => '旅を始めましょう';

  @override
  String get landingTalk => 'ルクソラと話す';

  @override
  String get landingWhy => 'これを構築する理由';

  @override
  String get storyTitle => '私たちの物語';

  @override
  String get storyHeroBadge => '意図を持って構築';

  @override
  String get storyHeroCreator => 'クリエイター、Luxora AI';

  @override
  String get storyHeroSubtitle => 'フロリダ・感動ファースト旅行';

  @override
  String get storyHeading => '私たちが Luxora を構築する理由';

  @override
  String get storyProblemLead =>
      'フロリダ/オーランドへの旅行の計画は、驚くほど細分化されており、膨大な作業であることがわかりました。';

  @override
  String get storyJumpingBetween => '人々は通常、間を飛び越えます';

  @override
  String get storyProblemTail => '…それでも結局はありきたりな観光プランになってしまいます。';

  @override
  String get storyDifferentLead => '私たちは何か違うものを作りたいと思っています。';

  @override
  String get storyNotPlannerTitle => 'ただの旅行プランナーではない';

  @override
  String get storyNotPlannerBody => '感情優先の AI 旅行コンパニオン。';

  @override
  String get storyInsteadOfAsking => '尋ねる代わりに';

  @override
  String get storyAppAsks => 'アプリが尋ねる';

  @override
  String get storyInsteadQuestion => '「どこに行けばいいですか？」';

  @override
  String get storyFeelQuestion => '「今回の旅はどんな感じにしたいですか？」';

  @override
  String get storyMoodBuildLine => 'その後、AI がその気分に基づいてパーソナライズされたエクスペリエンスを構築します。';

  @override
  String get storyFloridaFirstTitle => 'なぜフロリダとオーランドが最初なのでしょうか?';

  @override
  String get storyFloridaFirstLead => 'オーランドは完璧なテスト市場です。';

  @override
  String get storyVisionTitle => '私たちのビジョン';

  @override
  String get storyVisionLead => '組み合わせる：';

  @override
  String get storyVisionCard =>
      'そのため、このアプリは、退屈な旅程作成ツールではなく、高級 AI コンシェルジュに近いものであると感じられます。';

  @override
  String get storyLongTermTitle => '長期的なチャンス';

  @override
  String get storySourceGoogleMaps => 'Googleマップ';

  @override
  String get storySourceTikTok => 'TikTok';

  @override
  String get storySourceInstagram => 'インスタグラムリール';

  @override
  String get storySourceTravelBlogs => '旅行ブログ';

  @override
  String get storySourceRestaurantApps => 'レストランアプリ';

  @override
  String get storySourceWeatherApps => '天気アプリ';

  @override
  String get storySourceTicketSites => 'チケットウェブサイト';

  @override
  String get storySourceTop10 => 'ランダムな「オーランド トップ 10」記事';

  @override
  String get storyBulletMarket => '巨大な観光市場';

  @override
  String get storyBulletAudience => '家族連れ、カップル、贅沢な旅行者、ウェルネス旅行者';

  @override
  String get storyBulletOptions => '数え切れないほどのレストラン、リゾート、隠れた名所、テーマパーク、温泉、ナイトライフ';

  @override
  String get storyBulletRepeat => '高いリピート訪問行動';

  @override
  String get storyBulletLogisticsGap =>
      'ほとんどの旅行アプリはエクスペリエンス デザインではなく、物流に重点を置いています';

  @override
  String get storyPillarAiItinerary => 'AIによる旅程生成';

  @override
  String get storyPillarMoodPlanning => '気分に基づいた旅行計画';

  @override
  String get storyPillarLiveDiscovery => 'ライブ発見とトレンド体験';

  @override
  String get storyPillarHiddenGems => '隠れた地元の宝石';

  @override
  String get storyPillarRouting => 'スマートなルーティング';

  @override
  String get storyPillarWeatherSunset => '天気と日没のインテリジェンス';

  @override
  String get storyPillarPremiumUx => 'プレミアムな美的UX';

  @override
  String get storyOpportunityMultilingual => '多言語展開';

  @override
  String get storyOpportunityAffiliate => 'アフィリエイトと予約パートナーシップ';

  @override
  String get storyOpportunityInventory => 'レストラン、体験、チケット';

  @override
  String get storyOpportunitySubscriptions => 'プレミアムサブスクリプション';

  @override
  String get storyOpportunityScale => 'フロリダを超えて拡張可能 → 後で他の目的地へ';

  @override
  String get landingValues => '思い出・感情・逃避・つながり';

  @override
  String get landingRegionBadge => '打ち上げ地域';

  @override
  String get landingRegionTitle => 'オーランドとフロリダ — 気分に合わせて厳選';

  @override
  String get onboardFinish => 'コンシェルジュに会いましょう';

  @override
  String get onboardStep1Title => '夢が最初に着く場所';

  @override
  String get onboardStep1Subtitle => 'どこに向かっているのですか？';

  @override
  String get onboardDestination => '行き先';

  @override
  String get onboardRegion => '地域';

  @override
  String get onboardStep2Title => '自由を感じる時間';

  @override
  String get onboardStep2Subtitle => '逃亡はいつ始まりますか？';

  @override
  String get onboardBudget => '旅行予算 (USD)';

  @override
  String get onboardStep3Title => 'ストーリーを共有する人';

  @override
  String get onboardStep3Subtitle => '誰が一緒に旅行しますか?';

  @override
  String get onboardTravelers => '旅行者';

  @override
  String get onboardStep4Title => 'あなたのリズム';

  @override
  String get onboardStep4Subtitle => '日々はどのように流れるべきでしょうか？';

  @override
  String get onboardNightlife => 'ナイトライフへの興味';

  @override
  String get onboardFoodie => '食通の情熱';

  @override
  String get onboardPoolside => 'プールとくつろぎ';

  @override
  String get onboardAdventure => '冒険とアウトドア';

  @override
  String get onboardCulture => '文化と観光';

  @override
  String get dayFlowSubtitle => 'やることリストではなく、どう感じたいかで形づくる一日。';

  @override
  String get dayFlowMorning => '朝';

  @override
  String get dayFlowMidday => '昼';

  @override
  String get dayFlowAfternoon => '午後';

  @override
  String get dayFlowEvening => '夕方';

  @override
  String get dayFlowNight => '夜';

  @override
  String get dayFlowReasonMorningPool => 'ゆっくり始めましょう。一日が始まる前にプールやスパで。';

  @override
  String get dayFlowReasonMorningCalm => '穏やかな始まりで一日の流れを整えます。';

  @override
  String get dayFlowReasonMiddayAdventure => 'エネルギーがピークの時間帯。元気なうちに大きな冒険を。';

  @override
  String get dayFlowReasonMiddayCulture => '日差しが明るいうちに観光を。';

  @override
  String get dayFlowReasonMiddayIcon => '一日のハイライト。';

  @override
  String get dayFlowReasonAfternoonDowntime => '午後はゆっくり休んで充電を。';

  @override
  String get dayFlowReasonAfternoonGem => '人混みを離れた隠れた名所。';

  @override
  String get dayFlowReasonEveningDining => '一日のメインの食事。あなたのグルメな選択。';

  @override
  String get dayFlowReasonNightOut => '最後のきらめき。夜のお出かけ。';

  @override
  String weatherToday(String place) {
    return '$placeの現在';
  }

  @override
  String weatherSunset(String time) {
    return '日の入り $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '降水確率$percent% — 羽織るものを持って。';
  }

  @override
  String get weatherConditionClear => '晴れ';

  @override
  String get weatherConditionPartlyCloudy => '晴れ時々曇り';

  @override
  String get weatherConditionCloudy => '曇り';

  @override
  String get weatherConditionFog => '霧';

  @override
  String get weatherConditionDrizzle => '霧雨';

  @override
  String get weatherConditionRain => '雨';

  @override
  String get weatherConditionSnow => '雪';

  @override
  String get weatherConditionThunder => '雷雨';

  @override
  String get dayFlowVibeFoodie => 'グルメ志向';

  @override
  String get dayFlowVibeNightlife => 'ナイトライフ';

  @override
  String get dayFlowVibePoolside => 'プール';

  @override
  String get dayFlowVibeAdventure => 'アドベンチャー';

  @override
  String get dayFlowVibeCulture => 'カルチャー';

  @override
  String get onboardStep5Title => 'ルクソラの中心部';

  @override
  String get onboardStep5Subtitle => 'この旅行をどんな気分にしたいですか?';

  @override
  String get onboardTripFeelHint => '夕日が沈むディナー、ゆっくりとした朝、パートナーとの笑い…。';

  @override
  String get moodRomantic => 'ロマンチック';

  @override
  String get moodRelaxing => 'リラックス';

  @override
  String get moodAdventurous => '冒険好き';

  @override
  String get moodLuxurious => '豪華な';

  @override
  String get moodFamily => '家族の絆';

  @override
  String get moodSocial => '社交';

  @override
  String get moodNature => '自然重視';

  @override
  String get moodWellness => 'ウェルネス リトリート';

  @override
  String get moodFoodie => 'グルメ体験';

  @override
  String get catHiddenGems => '隠れた宝石';

  @override
  String get catLuxuryStay => '贅沢なステイケーション';

  @override
  String get catBeaches => 'ビーチ';

  @override
  String get catRooftop => '屋上ダイニング';

  @override
  String get catSpas => 'スパ';

  @override
  String get catNightlife => 'ナイトライフ';

  @override
  String get catFamily => '家族';

  @override
  String get catEco => 'エコツーリズム';

  @override
  String get catThemeParks => 'テーマパーク';

  @override
  String get catRomantic => 'ロマンチックな休暇';

  @override
  String get catFood => '食体験';

  @override
  String get catSprings => 'スプリングス';

  @override
  String get catIslands => 'アイランドホッピング';

  @override
  String get catInfluencer => 'インフルエンサーにふさわしい';

  @override
  String get placeCatBeach => 'ビーチ';

  @override
  String get placeCatDining => 'ダイニング';

  @override
  String get placeCatNature => '自然';

  @override
  String get placeCatNightlife => 'ナイトライフ';

  @override
  String get placeCatWellness => 'ウェルネス';

  @override
  String get placeCatFamily => '家族';

  @override
  String get placeCatSprings => 'スプリングス';

  @override
  String get placeCatRomantic => 'ロマンチック';

  @override
  String get placeCatAdventure => 'アドベンチャー';

  @override
  String get placeCatHotel => 'ホテル';

  @override
  String get styleLessCrowded => '混雑が少ない';

  @override
  String get styleLuxurySubtle => '高級だけど派手さはない';

  @override
  String get styleHiddenLuxury => '隠れた贅沢';

  @override
  String get styleWalkable => '可能であれば歩いて行ける';

  @override
  String get styleSlowMornings => 'ゆっくりとした朝';

  @override
  String get styleNoTraps => '観光客の罠はありません';

  @override
  String get styleNatureHeavy => '自然が重い';

  @override
  String get styleNatureWellness => '自然 + ウェルネスのみ';

  @override
  String get styleAestheticDining => 'エステティックダイニング';

  @override
  String get styleFamilyEasy => '家族で使いやすい物流';
}
