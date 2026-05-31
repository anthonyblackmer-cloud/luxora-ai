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
  String get settingsThemeIntro =>
      '高級感のある映画のようなもの、またはすっきりとした読みやすさ — あなたの一日にぴったりのものをお選びください。';

  @override
  String get settingsThemeSectionLuxury => '贅沢な映画のような';

  @override
  String get settingsThemeSectionReadable => 'クリーンで読みやすい';

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
  String get commonClose => '近い';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonDelete => '消去';

  @override
  String get settingsStartOverSubtitle => '新たな旅を一から始める';

  @override
  String get navConcierge => 'コンシェルジュ';

  @override
  String get navAgenda => '今日';

  @override
  String get navDiscover => '発見する';

  @override
  String get navMap => '地図';

  @override
  String get navTrips => '旅行';

  @override
  String get navMore => 'もっと';

  @override
  String get navRestaurants => 'レストラン';

  @override
  String get navTimeline => 'タイムライン';

  @override
  String get agendaTabItinerary => '日数';

  @override
  String get agendaTabRestaurants => 'レストラン';

  @override
  String get restaurantsPageTitle => 'レストラン';

  @override
  String get restaurantsPageSubtitle =>
      'Luxora が知っているレストランを閲覧する — お気に入りを保存するか、コンシェルジュに今夜の食事を選んでもらいましょう。';

  @override
  String get restaurantsConciergePick => '私のためにレストランを選んでください';

  @override
  String restaurantsConciergePickDone(String name) {
    return '$name を保存しました — コンシェルジュに旅行に追加するよう依頼してください。';
  }

  @override
  String restaurantsSavedCount(int count) {
    return '旅行のために $count 個保存しました';
  }

  @override
  String get restaurantsEmptyHint => '探索範囲内にレストランはありません。地図上の範囲を広げてください。';

  @override
  String get moreCardRestaurantsSub => 'レストランを閲覧し、コンシェルジュに選んでもらいましょう';

  @override
  String get agendaHotelSuggestionsTitle => 'どこに泊まるか';

  @override
  String agendaHotelSuggestionsSubtitle(int budget) {
    return 'AI があなたの ~$budget 米ドルの旅行予算に合わせて調整します。タップするとすべてのオプションが表示されます。';
  }

  @override
  String agendaHotelTopPick(String name) {
    return '最有力候補: $name';
  }

  @override
  String get agendaStayDropdownHint => 'ホテルを選択してください';

  @override
  String get agendaDiningDropdownHint => 'レストランを選択してください';

  @override
  String get agendaDaySelectLabel => 'どの日';

  @override
  String get agendaDayDiningTitle => '今夜どこで食べるか';

  @override
  String agendaDayDiningSubtitle(int budget, String tier) {
    return '今日のプランに基づいた ~$budget 米ドルの予算 ($tier の食事) の提案。';
  }

  @override
  String get agendaDiningNearStops => '今日の停留所付近';

  @override
  String get agendaDiningFitsBudget => '旅行の予算に合わせて';

  @override
  String get agendaDiningMatchesDay => '今日の雰囲気にマッチ';

  @override
  String get agendaDiningFoodiePick => 'グルメなお気に入り';

  @override
  String get browseCatRecommended => '推奨';

  @override
  String get browseCatDisneyHotels => 'ディズニーエリア';

  @override
  String get browseCatBudgetFriendly => '予算に優しい';

  @override
  String get browseCatUpscaleLuxury => '高級感と高級感';

  @override
  String get browseCatUniversalHotels => 'ユニバーサルエリア';

  @override
  String get browseCatThemeParkDining => 'テーマパークでの食事';

  @override
  String get browseCatUpscaleDining => '高級＆高級レストラン';

  @override
  String get browseSearchAllHotels => 'ホテルの完全なカタログを検索…';

  @override
  String get browseSearchAllRestaurants => 'レストランの完全なカタログを検索…';

  @override
  String get browseCategoryEmpty => 'このカテゴリに一致する半径はありません。検索するか、範囲を広げて検索してください。';

  @override
  String get browseFullCatalogHint =>
      'Luxora が知っているすべてのホテルとレストランの完全なカタログについては、上の検索を使用してください。';

  @override
  String get agendaPageSubtitle => '私は今何をしているのでしょうか？';

  @override
  String get navGems => '宝石';

  @override
  String get navFeed => '餌';

  @override
  String get navTicketSavings => '貯蓄';

  @override
  String get navStays => '宿泊';

  @override
  String get morePageTitle => 'もっと';

  @override
  String get morePageSubtitle => '旅行ツール、アカウント、設定 - 落ち着いてアクセスできるように厳選されています。';

  @override
  String get moreSectionTravelTools => 'トラベルツール';

  @override
  String get moreSectionAccount => 'アカウント';

  @override
  String get moreSectionApp => 'アプリ';

  @override
  String get moreCardHotelsSub => '気分に合わせてインテリジェントに滞在';

  @override
  String get moreCardGemsSub => '地元住民の警備員が内部関係者を発見';

  @override
  String get moreCardTicketsSub => '認定パートナーの節約額を比較する';

  @override
  String get moreCardWeatherSub => '予報を考慮した日のガイダンス';

  @override
  String get moreCardProfileTitle => '旅行プロフィール';

  @override
  String get moreCardProfileSub => '誰が旅行するのか、どのように感じるべきなのか';

  @override
  String get moreCardFavoritesSub => 'ブックマークした目的地';

  @override
  String get moreCardNotificationsTitle => '通知';

  @override
  String get moreCardNotificationsSub => '旅行アラートとコンシェルジュの最新情報';

  @override
  String get moreCardSettingsSub => 'テーマ、都市パック、環境設定';

  @override
  String get moreCardAboutSub => '私たちが Luxora を構築する理由';

  @override
  String get moreCardHelpSub => 'ガイドとコンシェルジュによるサポート';

  @override
  String get moreCardCityPacksSub => '目的地コンシェルジュのロックを解除する';

  @override
  String get moreCardPartnersSub => '注目のパートナー エクスペリエンス';

  @override
  String get moreCardItinerarySub => '日々の黄金の逃避行';

  @override
  String get moreCardDiscoverSub => 'トレンドの食事、体験、ライブ発見';

  @override
  String get savedFavoritesTitle => '保存されたお気に入り';

  @override
  String get savedFavoritesEmpty => '地図またはフィード上の目的地をブックマークします。それらはここに表示されます。';

  @override
  String get helpCenterTitle => 'ヘルプセンター';

  @override
  String get helpCenterBody =>
      'コンシェルジュのサポートについては、support@luxora.ai に電子メールを送信してください。アプリ内ガイドは近日公開予定です。';

  @override
  String get notificationsComingSoon => '旅行通知は将来のアップデートで提供される予定です。';

  @override
  String get partnerOffersTitle => 'パートナーのオファー';

  @override
  String get ticketSavingsTitle => '賢くチケットを節約';

  @override
  String get ticketSavingsBadgeLabel => 'プレミアム割引';

  @override
  String get ticketSavingsSubtitle =>
      'Luxora では、認定再販業者、バンドル、プロモーションを表示するので、クーポン サイトではなく、高級アドバイザーのような気分になれます。';

  @override
  String ticketSavingsBadge(int percent) {
    return '$percent% を節約';
  }

  @override
  String get ticketOfficialPrice => '正式';

  @override
  String get ticketDiscountPrice => 'ルクソラ 価格';

  @override
  String ticketSaveAmount(String amount) {
    return '$amount を節約';
  }

  @override
  String get ticketSaveAmountLabel => '貯蓄';

  @override
  String ticketSavePerTicket(String amount) {
    return 'チケットごとに $amount を節約できます。';
  }

  @override
  String ticketFamilySave(String amount) {
    return '家族の推定貯蓄額: $amount。';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return '家族の推定貯蓄額: $amount。';
  }

  @override
  String ticketSource(String source) {
    return '出典: $source';
  }

  @override
  String ticketExpires(String date) {
    return '$date までのオファー';
  }

  @override
  String get ticketBetterOption => 'Luxora はより良い選択肢を見つけました。';

  @override
  String get ticketOverpaying => 'ゲートプライスで払い過ぎている可能性があります。';

  @override
  String get ticketRecommendedSavings => '推奨される割引が利用可能';

  @override
  String get ticketCalculatorTitle => '潜在的な節約効果';

  @override
  String get ticketFilterLabel => 'フィルター';

  @override
  String get ticketFilterAll => '全て';

  @override
  String get ticketFilterThemeParks => 'テーマパーク';

  @override
  String get ticketFilterAttractions => 'アトラクション';

  @override
  String get ticketFilterTours => 'ツアー';

  @override
  String get ticketFilterDining => '食事体験';

  @override
  String get ticketFilterWaterParks => 'ウォーターパーク';

  @override
  String get ticketFilterFamily => '家族のアクティビティ';

  @override
  String get ticketFilterEntertainment => 'エンターテインメント';

  @override
  String get ticketSortLabel => '並べ替え';

  @override
  String get ticketSortHighestSavings => '最高の節約効果';

  @override
  String get ticketSortMostPopular => '最も人気のある';

  @override
  String get ticketSortFamilyFriendly => 'ファミリー向け';

  @override
  String get ticketSortLuxury => '贅沢な体験';

  @override
  String get ticketSortClosest => '私に一番近い';

  @override
  String get ticketDealsSectionTitle => '正規取引';

  @override
  String ticketDealsPricesAsOf(String date) {
    return '$date 時点の価格';
  }

  @override
  String get ticketDealsRefreshFailed => '価格を更新できませんでした - キャッシュされた取引を表示しています。';

  @override
  String get ticketDealsUpdating => '価格を更新中…';

  @override
  String get ticketNoDeals => 'このフィルターには取引がありません。別のカテゴリをお試しください。';

  @override
  String get ticketConfidenceHigh => '高い信頼性';

  @override
  String get ticketConfidenceVerified => '認証済み再販業者';

  @override
  String get ticketConfidenceLimited => '期間限定';

  @override
  String get ticketAiInsightTitle => 'ルクソラのおすすめ';

  @override
  String get ticketInsightDisneyPass =>
      '旅程に基づいて、1 日チケットの代わりに 3 日間のウォルト ディズニー ワールド パスを購入すると、家族は約 120 米ドルを節約できる可能性があります。';

  @override
  String get ticketInsightUniversalCombo =>
      'プランにはユニバーサルが含まれています。ほとんどの家族にとって、2 つのパークのチケットは別々に購入するよりも優れています。';

  @override
  String get ticketInsightSeaworldCombo =>
      'ルート上のシーワールド — アクアティカのコンボは、2 回の入場よりも優れていることがよくあります。';

  @override
  String get ticketInsightGeneric =>
      'Luxora は、旅程の目的地に応じて割引額を節約します。ゲートで購入する前に比較してください。';

  @override
  String get ticketInsightMiamiCulture =>
      'あなたのプランでは文化が止まります - 今週、ビスカヤと PAMM パートナーのオファーがゲート価格を上回る可能性があります。';

  @override
  String get ticketInsightMiamiEverglades =>
      '旅程にエバーグレーズの日が含まれている場合、午前中のエアボートのスロットは週半ばに安くなることがよくあります。';

  @override
  String get ticketInsightMiamiWynwood =>
      'ルート上のウィンウッド — ガイド付きアート ウォークはウォークアップ ブースの価格よりも優れています。';

  @override
  String get ticketItineraryMatchTitle => '旅程節約小切手';

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
  String get conciergeGreetingMorning => 'おはよう。';

  @override
  String get conciergeGreetingAfternoon => 'こんにちは。';

  @override
  String get conciergeGreetingEvening => 'こんばんは。';

  @override
  String get conciergeWelcomeWarm =>
      '私がここにいるのは、観光スポットのチェックリストではなく、あなたが感じたいようにフロリダを形作るためです。今日は何が食べたいですか？';

  @override
  String get conciergeRefineStyle => '自分のスタイルを洗練する';

  @override
  String get conciergeRecallReturning => 'おかえり。';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'あなたが $prefs を好きだったことを覚えています。';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'そして、この旅行を「$feel」と感じてもらいたいと考えました。';
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
  String discoverFromHub(String hub) {
    return '$hub から';
  }

  @override
  String get discoverSearchScopeAll => 'フロリダ州全体をカタログで検索';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'オーランドの$radius以内';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return '$radiusの$hub以内';
  }

  @override
  String get discoverSearchEmpty =>
      'この範囲内に一致するものはありません。名前を短くするか、マップまたはフィードで距離チップを広げるか、「ビーチ」、「ディズニー」、または「泉」を検索してください。';

  @override
  String get discoverFilterAll => '全て';

  @override
  String get discoverFilterHotels => 'ホテル';

  @override
  String get discoverFilterRestaurants => 'レストラン';

  @override
  String get discoverFilterDestinations => '目的地';

  @override
  String get discoverPopularInRadius => 'あなたの半径内で人気のある';

  @override
  String get discoverTrySearching => '検索してみてください';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count か所の目的地 · オーランドから $radius 以内';
  }

  @override
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return '$count 件の目的地 · $hub の $radius 以内';
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
  String get radiusDesc25Miami => 'サウスビーチ、ブリッケル、および中心地区';

  @override
  String get radiusDesc50Miami => 'ウィンウッド、ココナッツ グローブ、キー ビスケーン';

  @override
  String get radiusDesc100Miami => 'エバーグレーズ、フォートローダーデール、南フロリダ奥地';

  @override
  String get radiusDescAllMiami => 'フロリダキーズのトレイルと州全体のハイライト';

  @override
  String get radiusDesc25Keys => 'キー ラーゴ、イスラモラダ、アッパー リーフ コリドー';

  @override
  String get radiusDesc50Keys => 'マラソン、ビッグ パイン、ミドル キーズのビーチ';

  @override
  String get radiusDesc100Keys => 'キーウェストを通る海外高速道路全線';

  @override
  String get radiusDescAllKeys => '列島全体と日帰り海域';

  @override
  String get feedBadge => 'ライブディスカバリー';

  @override
  String get feedTitle => 'エクスペリエンスフィード';

  @override
  String get feedSubtitle =>
      '今何が動いているのか - トレンドのスポット、新規オープン、クリエイターのおすすめ、季節限定のルート、最新情報。';

  @override
  String get feedSubtitleFamily =>
      '乗組員のための家族向けの選択肢 - 公園、簡単な勝利、子供たち (および両親) と一緒に着陸する瞬間。';

  @override
  String get feedPillTrending => 'トレンド';

  @override
  String get feedPillNewOpenings => '新規出店';

  @override
  String get feedPillCreator => 'クリエイターのおすすめ';

  @override
  String get feedPillLive => 'ライブアップデート';

  @override
  String get feedMoodPrompt => 'どのように感じたいですか?';

  @override
  String get feedMoodPromptFamily => '乗組員にとって今日はどう感じるべきでしょうか?';

  @override
  String get feedMoodAll => 'すべて';

  @override
  String get feedMoodFamily => 'ファミリーマジック';

  @override
  String get feedMoodRomantic => 'ロマンチック';

  @override
  String get feedMoodCalm => '落ち着いた';

  @override
  String get feedMoodAdventurous => '冒険好き';

  @override
  String get feedMoodPampered => '甘やかされた';

  @override
  String get feedMoodSocial => 'ブザー音';

  @override
  String get feedMoodFoodie => '食通';

  @override
  String get feedFamilyMoodHint =>
      'テーマ パーク、キャラクターの食事、簡単な保護者向けの特典 — ファミリー タグでフィルタリングされています。';

  @override
  String get feedEmptyHint =>
      'この半径内にはフィード カードはありません。メキシコ湾岸とキーズのハイライトについては、50 マイルまたはオール フロリダをお試しください。';

  @override
  String get feedEmptyHintFamily =>
      'この範囲内にはファミリータグ付きのカードはありません。Adventurous または Everything を試すか、範囲を広げてください。';

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
  String get gemsMatchedBadge => 'あなたのスタイル';

  @override
  String gemsMatchedNote(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個の宝石があなたのスタイルに一致しました',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
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
  String get mapPlanDayTitle => '一日の計画を立てる';

  @override
  String get mapPlanDaySuggested => '旅の気分に合わせておすすめの場所をブックマークして自分だけの場所にしましょう。';

  @override
  String get mapPlanDayEmpty =>
      '目的地をブックマーク (♥) すると、Luxora がオーランドのハブから最適化されたルートを構築します。運転は最小限で、気分は最高です。';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count 回停車 · $miles · $time ドライブ';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return '$hotelから出発';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return '前回の目的地から $time ドライブ · $miles';
  }

  @override
  String get mapCrowdLevelQuiet => '静かな';

  @override
  String get mapCrowdLevelModerate => '適度';

  @override
  String get mapCrowdLevelBusy => '忙しい';

  @override
  String get mapCrowdLevelPacked => '詰め込まれた';

  @override
  String mapCrowdAtStop(String level) {
    return '群衆: $level';
  }

  @override
  String get mapParkingLevelEasy => '簡単';

  @override
  String get mapParkingLevelModerate => '適度';

  @override
  String get mapParkingLevelDifficult => '難しい';

  @override
  String get mapParkingLevelLimited => '限定・早めに到着';

  @override
  String mapParkingAtStop(String level) {
    return '駐車場: $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return 'ドライブの摩擦: $score/90';
  }

  @override
  String get mapRerouteButton => 'より穏やかに停車できるようルートを変更する';

  @override
  String mapRerouteApplied(int count) {
    return '日を調整 — $count か所の停留所を混雑が少ないものに交換しました。';
  }

  @override
  String get mapRerouteNone => 'あなたのルートはすでに穏やかに見えます。';

  @override
  String get mapRerouteRainHint =>
      '雨が降る可能性があります。屋内バックアップの場合は「ルート変更」をタップしてください。';

  @override
  String get dayFlowSwapTitle => 'この停留所を変更します';

  @override
  String dayFlowSwapSubtitle(String current) {
    return '$current の代わりに何をしたいかを Luxora に伝えてください。';
  }

  @override
  String get dayFlowSwapTemplate => 'もっと次のようなことを考えていました…';

  @override
  String get dayFlowSwapHint => '例えば今朝は静かな公園、または夕食はシーフード';

  @override
  String get dayFlowSwapApply => '私の一日を更新してください';

  @override
  String get dayFlowSwapViewPlace => '現在の停留所を表示する';

  @override
  String dayFlowSwapSuccess(String newStop, String phase) {
    return '更新 — $newStop が $phase の停留所になりました。';
  }

  @override
  String get dayFlowSwapNoMatch => '近くに一致するものが見つかりませんでした。より具体的にしてみてください。';

  @override
  String get dayFlowSwapTapToChange => 'この停留所を変更します';

  @override
  String get dayFlowSwapHoldSpeak => '押し続けて話す';

  @override
  String get dayFlowSwapListening => 'リスニング…';

  @override
  String get rightNowButton => '私たちは今何をすべきでしょうか？';

  @override
  String get rightNowEmpty =>
      'まだあなたの周囲に強烈な瞬間はありません。お気に入りをいくつか見つけたり、ブックマークしたりしてください。';

  @override
  String get rightNowResultTitle => '今すぐ';

  @override
  String get rightNowTapForDetails => 'タップすると詳細が表示されます';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return '$minutesまでは$district 分です。天気は完璧です。$place でコーヒーを飲み、群衆が到着する前に ($crowd 人の群衆)、$walkArea を散策してください。';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return '$minutesまでは$district 分です。空はとてもいい感じです — 人がまだ $crowd であるうちに $place に向かいましょう。';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return 'ゴールデンタイムが近づいています。約 $minutes 分後に $place に向けて出発します (日没までに $crowd )。';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return 'レーダーでは雨が降っています — 居心地の良い屋内の場所: $minutes まで $place 分です。';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return '昼寝のような静けさ — $minutes で家族が簡単にリセットできるまで、あと $place 分です。';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return 'デートの夜のエネルギー — ラッシュの $minutes までは $place 分です。';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return '静かな窓 — $minutes まで $place 分です (現在 $crowd 人)。';
  }

  @override
  String get goldenHourTitle => 'ゴールデンアワー';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return '$time までに出発（車で $minutes 分）、$place に向けて出発します。日没の約 15 分前に到着します。';
  }

  @override
  String get goldenHourKindBeach => 'ビーチの夕日の窓';

  @override
  String get goldenHourKindRooftop => '屋上のゴールデンアワー';

  @override
  String get goldenHourKindScenic => '風景撮影のタイミング';

  @override
  String get vacationScoreTitle => '休暇スコア';

  @override
  String vacationScoreSubtitle(int score) {
    return '今日は $score/100 のような一日のようです。';
  }

  @override
  String get onboardOccasionLabel => 'どういう機会ですか？';

  @override
  String get onboardThemeParksOccasionHint =>
      'ディズニーとユニバーサルのロックを解除して、以下のテーマパークのイベントを追加します。これらのチップは購入後すぐに表示されます。';

  @override
  String get occasionGeneral => 'ただ探索するだけ';

  @override
  String get occasionAnniversary => '周年';

  @override
  String get occasionHoneymoon => 'ハネムーン';

  @override
  String get occasionDateNight => 'デートの夜';

  @override
  String get occasionProposal => 'プロポーズ旅行';

  @override
  String get occasionFamily => 'お子様連れのご家族';

  @override
  String get occasionDisneyAdventure => 'ディズニーアドベンチャー';

  @override
  String get occasionUniversalAdventure => 'ユニバーサルアドベンチャー';

  @override
  String get localSecretTitle => 'ローカルシークレット';

  @override
  String get localSecretWinterParkParkAvenue =>
      '地元の人々は本屋の裏手にある路地の中庭に逃げ込んでいますが、道路標識はありません。';

  @override
  String get localSecretWorldFoodTrucks =>
      'ハンバーガーではなく、その日獲れたものを注文してください。列は、遠い窓口ほど早く進みます。';

  @override
  String get localSecretWekiwaSprings => '午後 2 時以降はメインの遊歩道を避けてください。北の登山口は静かです。';

  @override
  String get localSecretDisneySpringsParking =>
      '最適な駐車場はオレンジ色のガレージです。正面玄関を急いで歩くのではなく、マリーナ側を歩いてください。';

  @override
  String get localSecretLakeEolaSunset => '空が金色に染まる中、円形劇場側を向いて白鳥の写真を撮りましょう。';

  @override
  String get localSecretMiamiWynwoodAlley =>
      'パンサー コーヒーの裏にある積み込み路地を通り抜けます。地元の人々は、メインの観客を避けて壁画を撮影しています。';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      'まずウィンドウ カートでカフェシートを購入します。コルタディートを持っていると、サイドライン ベンチの常連客が席を開きます。';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      'メインテラスのラッシュを避けて、東の庭園から入り、マングローブの遊歩道を反時計回りに歩きましょう。';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      '午前 7 時にルムス通りで東に向かいましょう。ブランチを楽しむ人々が到着する前に、アールデコ調のパステルカラーが輝きます。';

  @override
  String get localSecretMiamiPantherAlley =>
      '窓際で注文し、路地を時計回りに歩きます。午前 8 時 45 分に壁画の光がターコイズ色の壁に当たるのが最高です。';

  @override
  String get momentsTitle => 'ルクソラの瞬間';

  @override
  String get momentsSubtitle => '場所ではなく、感覚を探してください。';

  @override
  String get momentFeelRelaxed => 'リラックスした気分になれます';

  @override
  String get momentImpressSpouse => '配偶者に好印象を与える';

  @override
  String get momentPerfectSunset => '完璧な夕日';

  @override
  String get momentFamilyMemory => '家族の思い出';

  @override
  String get momentLuxuryValue => '浪費せずに贅沢を';

  @override
  String get momentPromptRelaxed =>
      'これから数時間、ゆっくりと、美しく、混雑せずに完全にリラックスしたいと思っています。';

  @override
  String get momentPromptImpressSpouse => '今夜はロマンチックで予想外のことで配偶者を感動させたいと思っています。';

  @override
  String get momentPromptPerfectSunset =>
      '完璧なフロリダの日没の瞬間を過ごしたいのですが、どこにいて、いつ出発すればよいでしょうか?';

  @override
  String get momentPromptFamilyMemory =>
      '親にとっては優しく、子供にとっては魔法のような、思い出に残る家族のひとときを過ごしたいと思っています。';

  @override
  String get momentPromptLuxuryValue => 'お金をかけずに特別な贅沢をしたい。';

  @override
  String get visualShareImageButton => '画像カードを共有する';

  @override
  String get tripStoryTitle => 'あなたの旅の物語';

  @override
  String tripStoryHeading(String title) {
    return '$title — あなたのフロリダの物語';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return 'あなたは$moodsを求めて来たのです。';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return 'この章: $title。';
  }

  @override
  String get tripStoryBeatClosing => 'Luxora はその瞬間を形作り、あなたはその瞬間を生きました。';

  @override
  String get tripsOpenStory => 'あなたの物語';

  @override
  String get conciergeVoiceHold => '押し続けて話す';

  @override
  String get conciergeVoiceSoon =>
      '音声コンシェルジュが間もなく登場します。今のところは、瞬間をタップするか、感じたいことを入力してください。';

  @override
  String get conciergeVoiceListening => 'ルクソラが聞いています…';

  @override
  String get conciergeVoiceSpeaking => 'ルクソラが話している…';

  @override
  String get conciergeVoiceRelease => 'リリースして送信する';

  @override
  String get conciergeVoiceSend => 'ルクソラに送る';

  @override
  String get conciergeVoiceProcessing => 'ルクソラに送信中…';

  @override
  String get conciergeVoiceNoSpeech =>
      '私はそれを聞き取れませんでした - ボタンを押したまま話し、そして放してください。';

  @override
  String get conciergeVoicePreviewFailed =>
      'プレビューを再生できませんでした。音量を確認して、もう一度お試しください。';

  @override
  String get conciergeVoiceUnavailable => 'このデバイスでは音声を利用できません。';

  @override
  String get conciergeVoiceSettingsTitle => 'ルクソラの声';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Luxora が話すときにどのように聞こえるか (アクセント、トーン、ペース) を選択します。デバイスの内蔵音声を使用します。';

  @override
  String get conciergeVoiceRateLabel => '話すペース';

  @override
  String get conciergeVoiceRateSlow => '遅い';

  @override
  String get conciergeVoiceRateNatural => '自然';

  @override
  String get conciergeVoiceRateFast => '速い';

  @override
  String get conciergeVoicePreview => 'プレビュー音声';

  @override
  String get conciergeVoicePreviewSample =>
      'こんにちは — 私はルクソラです。この旅行をどのように感じたいか教えてください。';

  @override
  String get conciergeVoiceDeviceNote =>
      'iPhoneの設定→アクセシビリティ→音声コンテンツ→音声でさらに音声をダウンロードします。ここに戻って「更新」をタップします。';

  @override
  String get conciergeVoiceDeviceSection => 'このiPhoneの音声';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'ダウンロードした音声が含まれています。Luxora で使用するには、1 つをタップします。';

  @override
  String get conciergeVoiceRefreshList => 'ボイスリストを更新';

  @override
  String get conciergeVoiceShowAllLanguages => 'すべての言語を表示';

  @override
  String get conciergeVoiceOpenSettings => 'iPhoneの音声設定を開く';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      '音声が見つかりません — 設定でパックをダウンロードしてから更新してください。';

  @override
  String get conciergeVoicePresetSection => 'クイックペルソナ';

  @override
  String get conciergeVoiceRegionRecommended => '推奨';

  @override
  String get conciergeVoiceRegionEnglish => '英語';

  @override
  String get conciergeVoiceRegionRussian => 'ロシア';

  @override
  String get conciergeVoiceRegionSpanish => 'スペイン語';

  @override
  String get conciergeVoiceRegionFrench => 'フランス語';

  @override
  String get conciergeVoiceRegionGerman => 'ドイツ語';

  @override
  String get conciergeVoiceRegionOther => '他の';

  @override
  String get conciergeVoicePresetMatchApp => 'マッチングアプリ言語・女性';

  @override
  String get conciergeVoicePresetEnUsF => 'アメリカ人・女性';

  @override
  String get conciergeVoicePresetEnUsM => 'アメリカ人・男性';

  @override
  String get conciergeVoicePresetEnGbF => 'イギリス人・女性';

  @override
  String get conciergeVoicePresetEnGbM => 'イギリス人・男性';

  @override
  String get conciergeVoicePresetRuF => 'ロシア人・女性';

  @override
  String get conciergeVoicePresetRuM => 'ロシア人・男性';

  @override
  String get conciergeVoicePresetEsF => 'スペイン人・女性';

  @override
  String get conciergeVoicePresetEsM => 'スペイン人・男性';

  @override
  String get conciergeVoicePresetFrF => 'フランス人・女性';

  @override
  String get conciergeVoicePresetFrM => 'フランス人・男性';

  @override
  String get conciergeVoicePresetDeF => 'ドイツ人・女性';

  @override
  String get conciergeVoicePresetDeM => 'ドイツ人・男性';

  @override
  String get conciergeThinking => 'ルクソラは考えている…';

  @override
  String get conciergeItinerarySynced =>
      'これを予定表に追加しました。同じ停留所が地図上にあり、共有する準備ができています。';

  @override
  String get conciergeAgendaUpdatedSnack => 'あなたの予定はマップと予定表で準備完了です';

  @override
  String get conciergeAgendaSyncFailed =>
      'マップとアジェンダが更新されませんでした。明確なリクエストを 1 つ試してください。たとえば、4 日間のディズニーとユニバーサル旅行を計画してください。';

  @override
  String get conciergeViewAgendaOnMap => '議題を見る';

  @override
  String get conciergeAgendaDealsIntro =>
      '公認のチケット取引と予定の停留所を一致させました。ゲートで購入する前に比較してください。';

  @override
  String get conciergeAgendaDealsSnack => 'あなたの予定に合わせたチケット取引';

  @override
  String get conciergeViewTicketDeals => 'お得な情報を見る';

  @override
  String ticketAgendaMatchLine(String stop, String amount, String source) {
    return '$stop · $source 経由で $amount を節約できる見込み';
  }

  @override
  String ticketAgendaStopsSummary(int count) {
    return 'あなたの予定にある $count か所の停留所には、パートナーの特典があります。ゲートで購入する前に、正規の特典を比較してください。';
  }

  @override
  String ticketAgendaStopsSavings(String amount) {
    return 'EST（東部基準時。家族の貯蓄 · $amount';
  }

  @override
  String get ticketBrowseAgendaDeals => '予定に合わせたセールを閲覧 →';

  @override
  String get conciergeFreshThread =>
      'あなたの予定は地図と予定表にあります。このチャットをアーカイブして、その日を微調整したり、取引を見つけたり、何か新しいことを質問したりして、新たに始めました。';

  @override
  String get conciergeThreadArchivedSnack =>
      'チャットはアーカイブされました — 新しいスレッドが開始されました';

  @override
  String get conciergeNewConversationTooltip => '新しい会話';

  @override
  String get itinerarySameAsMapAgenda =>
      '今日のコンシェルジュ プラン — 地図にも固定されています。以下の日のカードを共有してください。';

  @override
  String get conciergeTicketsFoundIntro =>
      'あなたの旅行に適した正規のチケット取引を見つけました。直接リンクについては、「アジェンダでチケットを予約」をタップしてください:';

  @override
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  ) {
    return '• $title: $source 経由の $price ($savings を節約)';
  }

  @override
  String get conciergeTicketsTimelineHint =>
      'アジェンダ上の一致する各ストップには、再販業者リンクを含むチケットの予約ボタンが表示されます。';

  @override
  String itineraryBookTickets(String amount) {
    return 'チケットを予約する · $amount を節約';
  }

  @override
  String get itineraryOpenTicketDeal => 'チケットを予約する';

  @override
  String conciergeTripSaved(String title) {
    return '「$title」を旅行に保存しました — いつでも [旅行] タブを開いて再度アクセスしてください。';
  }

  @override
  String conciergeTripSavedWithStops(String title, int count) {
    return '$count 件のエクスペリエンスを含む「$title」をタイムラインに保存しました。';
  }

  @override
  String conciergeSavedTripsIntro(int count) {
    return '$count 件の旅行を保存しました:';
  }

  @override
  String conciergeSavedTripLine(String title, String dates, String status) {
    return '• $title ($dates) — $status';
  }

  @override
  String get conciergeSavedTripsEmpty =>
      '保存された旅行はまだありません。何か計画を立ててから「旅行を保存」と言ってください。';

  @override
  String get conciergeSavedTripsHint => '[旅行] タブを開いて、カードを表示、共有、または日付を編集します。';

  @override
  String get conciergeAiError => '今はルクソラに行けません。接続を確認して、もう一度試してください。';

  @override
  String get conciergeAiErrorVoice => '申し訳ありませんが、今 Luxora のコンシェルジュに接続できませんでした。';

  @override
  String get conciergeAiNotConfigured =>
      'Luxora のライブ コンシェルジュはこのビルドではまだ接続されていません。Supabase URL と anon キーをアプリに組み込み、エッジ機能をデプロイする必要があります。地図と旅程は引き続き機能します。セットアップについては docs/CONCIERGE_AI.md を参照してください。';

  @override
  String get conciergeAiOpenAiNotReady =>
      'Luxora はあなたの声を聞きましたが、コンシェルジュの脳はまだオンラインになっていません。エッジ機能 (bright-processor) の Supabase シークレットに OPENAI_API_KEY を設定して、再試行してください。';

  @override
  String conciergeAiFunctionNotFound(String function) {
    return 'Luxora はコンシェルジュ エッジ機能「$function」を見つけられませんでした。 Supabase にデプロイするか、このビルドの SUPABASE_CONCIERGE_FUNCTION を修正してください。';
  }

  @override
  String get conciergeAiAuthFailed =>
      'Luxora は Supabase で認証できませんでした。SUPABASE_ANON_KEY がプロジェクトと一致していることを再確認してください。';

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
  String get tripsPlanNew => '新しい旅行を計画する';

  @override
  String get tripsEmptyTitle => '保存された旅行はまだありません';

  @override
  String get tripsEmptyBody => '初めての旅行を計画するとここに表示され、いつでも再訪できます。';

  @override
  String get tripsDeleteTitle => '旅行を削除しますか?';

  @override
  String tripsDeleteBody(String title) {
    return 'これにより、保存された旅行から「$title」が削除されます。これを元に戻すことはできません。';
  }

  @override
  String get tripsDeleted => '旅行が削除されました';

  @override
  String get tripsEditDates => '旅行日程';

  @override
  String get tripsSaveDates => '日付を保存する';

  @override
  String get tripsDatesUpdated => '旅行日程を更新しました';

  @override
  String get tripsDatesFlexible => '日付は柔軟です';

  @override
  String get tripsLiveWeather => 'ライブ天気';

  @override
  String get tripsNextUp => '次は';

  @override
  String get tripsSunsetWindow => '夕焼けの窓';

  @override
  String get tripsTimelineSnapshot => 'タイムラインのスナップショット';

  @override
  String get tripsOpenAgenda => '全ての議題を開く';

  @override
  String get tripsOpenTimeline => '完全なタイムラインを開く';

  @override
  String get tripsShare => '共有';

  @override
  String get shareItineraryFooter => '感情的に知的なフロリダのパートナーである Luxora と計画しました。';

  @override
  String get shareCardCta => 'ルクソラで計画を立てましょう';

  @override
  String get shareCardDownloadHint =>
      'iOS および Android で無料 · luxora.ai/download';

  @override
  String shareCardShareMessage(String title, String url) {
    return '$title\n\nLuxora AI を使用して計画 - 感情的にインテリジェントなフロリダ旅行。\nアプリを入手: $url';
  }

  @override
  String get conciergeLocalTryPlanning =>
      '旅行をどのように感じてほしいかを教えてください — 例: 「温泉とグルメを楽しみながら、リラックスした 2 日間のオーランド旅行を計画しましょう。」あなたのデバイス上で実際のアジェンダを作成します (クラウドは必要ありません)。';

  @override
  String conciergeLocalPlanBuilt(String city, int count) {
    return '私はあなたの $city 日を構築しました — $count か所の停留所を気分と運転時間に基づいて並べました。アジェンダまたはマップを開いてルートを確認します。';
  }

  @override
  String get conciergeLocalNoIntent =>
      '希望する雰囲気を説明してください。または「オーランドでの 1 日の計画を立ててください」と言えば、デバイス上で実際のルートを作成します。';

  @override
  String get ticketConciergeIntelBadge => 'コンシェルジュ・インテリジェンス';

  @override
  String get ticketConciergeIntelAgenda => '一般的なクーポン リストではなく、予定に合わせて停止します。';

  @override
  String get agendaFixAfternoonRain => '雨が降ってきた — 午後の準備を整える';

  @override
  String agendaRainRerouteDone(int count, int score) {
    return '午後更新 — $count 個の停留所が屋内に移動しました。休暇スコア $score/100。';
  }

  @override
  String get agendaRainRerouteNone => 'あなたの計画はこの天気ではすでに機能しています。';

  @override
  String get cloudTripsTitle => 'クラウドバックアップ';

  @override
  String get cloudTripsSubtitle =>
      '保存した旅行は、サインインするとデバイス間で同期されます。これは都市のロック解除に含まれます。';

  @override
  String get cloudTripsMoreSubSignedOut => '保存した旅行をバックアップするにはサインインしてください';

  @override
  String cloudTripsMoreSubSignedIn(String email) {
    return '$email としてサインインしました';
  }

  @override
  String get cloudTripsMoreSubSyncing => '同期中…';

  @override
  String get cloudTripsUnlockRequired => 'シティパックのロックを解除してクラウドバックアップを有効にします';

  @override
  String get cloudTripsUnlockCta => 'コンシェルジュのロックを解除する';

  @override
  String get cloudTripsEmailHint => '電子メールアドレス';

  @override
  String get cloudTripsSendCode => 'サインインコードを送信する';

  @override
  String get cloudTripsCodeHint => 'メールに記載された6桁のコード';

  @override
  String get cloudTripsVerify => '確認してサインインする';

  @override
  String get cloudTripsCodeSent => 'メールでサインイン コードを確認してください';

  @override
  String get cloudTripsSignOut => 'サインアウト';

  @override
  String get cloudTripsSyncNow => '今すぐ同期する';

  @override
  String get cloudTripsSyncSuccess => '旅行が同期されました';

  @override
  String get cloudTripsSyncError => '同期に失敗しました - もう一度試してください';

  @override
  String get cloudTripsBannerTitle => '旅行をバックアップ';

  @override
  String get cloudTripsBannerBody => 'サインインして、新しい携帯電話またはタブレットで旅行を復元します。';

  @override
  String get cloudTripsBannerCta => 'クラウドバックアップを設定する';

  @override
  String get cloudTripsNotConfigured => 'クラウドバックアップにはSupabaseが必要です（開発セットアップ）';

  @override
  String get paywallFeatureCloudBackup => 'クラウドトリップバックアップ';

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
  String get detailTravelIntelTitle => '旅行摩擦の見通し';

  @override
  String get detailTravelIntelSubtitle => 'ライブセンサーではなく、カテゴリ、時間、距離から予測されます。';

  @override
  String detailCrowdOutlook(String level) {
    return '群衆: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return '駐車場: $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return 'ドライブの摩擦: $score/90';
  }

  @override
  String get detailPrice => '価格';

  @override
  String get detailLocation => '位置';

  @override
  String get detailGetDirections => '道順を調べる';

  @override
  String get detailParkMap => '園内マップ';

  @override
  String get detailViewOnMap => '地図で見る';

  @override
  String get detailMapsError => 'このデバイスではマップを開けませんでした。';

  @override
  String get detailGoogleMaps => 'Googleマップ';

  @override
  String get detailAppleMaps => 'アップルマップ';

  @override
  String get detailOpenInMaps => 'マップで開く';

  @override
  String detailDriveFromOrlando(String time) {
    return 'オーランドから車で $time';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '$timeから車で $hub';
  }

  @override
  String get detailSaveToItinerary => '旅程に保存';

  @override
  String get detailSaved => '保存されました';

  @override
  String get detailSavedSnack => '旅程に保存されました';

  @override
  String get detailRemovedSnack => '旅程から削除されました';

  @override
  String get detailSetHomeBase => 'ホームベースとして設定する';

  @override
  String get detailHomeBaseActive => 'あなたの旅行のホームベース';

  @override
  String get detailHomeBaseHint => 'あなたの一日のルートはここで始まり、ここで終わります。';

  @override
  String get detailHomeBaseSetSnack => '旅行のホームベースとして設定する';

  @override
  String get detailHomeBaseClearedSnack => 'ホームベースクリア';

  @override
  String get detailMenuTitle => 'メニューのハイライト';

  @override
  String get detailMenuDisclaimer => '厳選されたハイライト — 全メニューと価格は会場によって異なる場合があります。';

  @override
  String get detailMenuComingSoon =>
      'このメニューはまだ検討中です。それまでの間、最新のメニューと価格をオンラインでご覧ください。';

  @override
  String get detailViewMenuOnline => 'メニューをオンラインで見る';

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
  String milesFromHub(String distance, String hub) {
    return '$distanceからの$hub';
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
  String get onboardBuilding => '旅行を組み立てる…';

  @override
  String get onboardStep1Title => '夢が最初に着く場所';

  @override
  String get onboardStep1Subtitle => 'どこに向かっているのですか？';

  @override
  String get onboardDestination => '行き先';

  @override
  String get onboardRegion => '地域';

  @override
  String get onboardCityLabel => 'あなたの都市を選択してください';

  @override
  String get onboardCityUnlockNote =>
      '各目的地には独自のコンシェルジュによるロック解除があり、都市ごとに 1 回のみ購入できます。';

  @override
  String get landingCityLabel => 'どこに行くの？';

  @override
  String get paywallSwitchCity => '行き先';

  @override
  String get cityPickerUnlocked => 'ロック解除済み';

  @override
  String cityPickerUnlockPrice(String price) {
    return '$priceのロックを解除する';
  }

  @override
  String get cityPickerThemeParksSubtitle => 'オーランド アドオン · ディズニーとユニバーサルを一緒に';

  @override
  String get onboardStep2Title => '自由を感じる時間';

  @override
  String get onboardStep2Subtitle => '逃亡はいつ始まりますか？';

  @override
  String get onboardStartDateLabel => '開始日';

  @override
  String get onboardEndDateLabel => '終了日';

  @override
  String get onboardPickDate => 'タップして選択してください';

  @override
  String get onboardSelectStartDate => '開始日を選択してください';

  @override
  String get onboardSelectEndDate => '終了日を選択してください';

  @override
  String get onboardDatesHint => 'これらは [旅行] タブでいつでも変更できます。';

  @override
  String get onboardStepBudgetTitle => '簡単に計画を立てる';

  @override
  String get onboardStepBudgetSubtitle => 'この逃避には何が適切だと感じますか?';

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
  String get onboardPoolside => 'プールサイドとダウンタイム';

  @override
  String get onboardAdventure => '冒険とアウトドア';

  @override
  String get onboardCulture => '文化・観光';

  @override
  String get dayFlowSubtitle => 'チェックリストではなく、自分がどう感じたいかを中心に一日を形作ります。';

  @override
  String get dayFlowMorning => '朝';

  @override
  String get dayFlowMidday => '正午';

  @override
  String get dayFlowAfternoon => '午後';

  @override
  String get dayFlowEvening => '夕方';

  @override
  String get dayFlowNight => '夜';

  @override
  String get dayFlowReasonMorningPool => '一日が始まる前に、プールサイドやスパでゆっくりとおくつろぎください。';

  @override
  String get dayFlowReasonMorningCalm => 'トーンを設定する穏やかなスタート。';

  @override
  String get dayFlowReasonMiddayAdventure => 'エネルギーのピーク時間 — 元気なうちに大冒険。';

  @override
  String get dayFlowReasonMiddayCulture => '明るいうちに観光。';

  @override
  String get dayFlowReasonMiddayIcon => 'その日の代表的な瞬間。';

  @override
  String get dayFlowReasonAfternoonDowntime => '午後は充電のための休憩時間。';

  @override
  String get dayFlowReasonAfternoonGem => '人混みから離れた隠れた宝石。';

  @override
  String get dayFlowReasonEveningDining => 'その日の食事 - グルメなあなたが選ぶもの。';

  @override
  String get dayFlowReasonNightOut => '最後の輝き、夜の外出。';

  @override
  String weatherToday(String place) {
    return 'ただいま $place にいます';
  }

  @override
  String weatherSunset(String time) {
    return '日没 $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% の降水確率 — 薄手のものを用意してください。';
  }

  @override
  String get weatherConditionClear => 'クリア';

  @override
  String get weatherConditionPartlyCloudy => '所により曇り';

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
  String get weatherConciergeTitle => 'お天気コンシェルジュ';

  @override
  String get weatherConciergeTapHint => 'タップすると旅行を意識した天気予報が表示されます';

  @override
  String get weatherConciergeAdviceTitle => 'ルクソラの天気予報';

  @override
  String weatherFeelsLike(String temp) {
    return '$temp のような感じ';
  }

  @override
  String get weatherHumidity => '湿度';

  @override
  String get weatherWind => '風';

  @override
  String weatherWindValue(String dir, int speed) {
    return '$dir、時速 $speed マイル';
  }

  @override
  String get weatherUv => '紫外線指数';

  @override
  String get weatherCloudCover => '雲量';

  @override
  String get weatherVisibility => '可視性';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$milesマイル';
  }

  @override
  String weatherSunrise(String time) {
    return '日の出 $time';
  }

  @override
  String get weatherStatRain => '雨';

  @override
  String get weatherWhatToBring => '今日持っていくもの';

  @override
  String get weatherPlanImpact => '計画への影響';

  @override
  String get weatherHourlyTitle => '1時間ごとの見通し';

  @override
  String get weatherHourlyUnavailable => 'データを読み込むと、時間ごとの予報が表示されます。';

  @override
  String get weatherLiveRadar => 'ライブレーダー';

  @override
  String get weatherRadarComingSoon => 'ライブレーダーは近日公開予定です。';

  @override
  String get weatherRadarPlay => 'ループ再生';

  @override
  String get weatherRadarPause => 'ループを一時停止する';

  @override
  String get weatherRadarTapToExpand => 'タップすると全画面表示になります';

  @override
  String get weatherRadarNow => '今';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return '$minutes 分前';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes分';
  }

  @override
  String get weatherRadarStepBack => '前のフレーム';

  @override
  String get weatherRadarStepForward => '後のフレーム';

  @override
  String get weatherRadarJumpNow => '今';

  @override
  String get weatherRadarJump1h => '−1時間';

  @override
  String get weatherRadarJump2h => '−2時間';

  @override
  String get weatherRadarJump30m => '+30分';

  @override
  String get weatherRadarSpeedSlow => '遅い';

  @override
  String get weatherRadarSpeedNormal => '普通';

  @override
  String get weatherRadarSpeedFast => '速い';

  @override
  String get weatherRadarLoopNote =>
      'レーダー ループ: 過去約 2 時間 (10 分単位)、および利用可能な場合は短距離ナウキャスト (4 時間の予報ではありません)。';

  @override
  String get shareMapPreviewCaption => '地図のプレビュー · Luxora で開くとライブルートが表示されます';

  @override
  String get shareRadarPreviewCaption => 'ライブドップラーレーダー · フルループでルクソラでオープン';

  @override
  String get weatherMapOverlays => '地図オーバーレイ';

  @override
  String get weatherOverlayPrecip => '降水量';

  @override
  String get weatherOverlayTemp => '温度';

  @override
  String get weatherOverlayWind => '風';

  @override
  String get weatherOverlayCloud => '雲量';

  @override
  String get weatherComingSoon => '近日公開';

  @override
  String get weatherAdjustDay => '天気に合わせて一日を調整する';

  @override
  String get weatherBestOutdoorWindow => '最高の屋外窓';

  @override
  String get weatherRainWindow => '雨が降る可能性があります';

  @override
  String get weatherSunsetRec => 'サンセットのおすすめ';

  @override
  String weatherOutdoorAtRisk(int count) {
    return '$count か所の屋外停留所が影響を受ける可能性があります';
  }

  @override
  String get weatherIndoorBackup => '屋内バックアップのアイデア';

  @override
  String get weatherAdviceLightJacket => '今晩は薄手のジャケットをご持参ください。';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return '$time までに屋外アクティビティを計画してください。';
  }

  @override
  String get weatherAdviceHighUv =>
      '今日は紫外線が強いので、日焼け止めを持参し、日中に長時間直射日光にさらされるのを避けてください。';

  @override
  String get weatherAdviceRainLater => '今日は後半に雨の危険性が高まるため、屋内での体験は午後に変更してください。';

  @override
  String get weatherAdviceWindBeach =>
      '今日は風が強く、ビーチやボートでのアクティビティが快適ではなくなる可能性があります。';

  @override
  String get weatherAdviceGreatSunset =>
      '今夜は素晴らしい夕焼けの状態です。屋上でのディナーや湖の散歩を検討してください。';

  @override
  String get weatherAdviceDefault => '空は扱いやすそうです。計画に従って、薄手のレイヤーを手元に置いておきましょう。';

  @override
  String weatherSunsetRecRooftop(String time) {
    return '$time 付近は晴れています。屋上でのディナーや湖の散歩が映えるかもしれません。';
  }

  @override
  String get weatherPackSunscreen => '日焼け止め';

  @override
  String get weatherPackSunglasses => 'サングラス';

  @override
  String get weatherPackUmbrella => '傘';

  @override
  String get weatherPackLightJacket => 'ライトジャケット';

  @override
  String get weatherPackShoes => '快適な靴';

  @override
  String get weatherPackWater => '水筒';

  @override
  String get weatherPackHat => '帽子';

  @override
  String get weatherPackPoncho => 'ポンチョ';

  @override
  String get weatherPackSwimwear => '水着';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return '$time 以降、降雨の危険性が高まります。 $outdoorStop を早めに移動し、$indoorStop を後で保存しておくことを検討してください。';
  }

  @override
  String weatherImpactHeat(String time) {
    return '猛暑の日中 — $time 前に屋外散歩を計画してください。';
  }

  @override
  String get weatherImpactClear => '今朝はアウトドアの計画に適した空模様です。';

  @override
  String weatherImpactMixed(int count) {
    return '今日は $count か所の屋外停留所でタイミングの調整が必要になる可能性があります。';
  }

  @override
  String get weatherImpactNoPlanRain =>
      '雨が降る可能性があります。まず屋内アンカーを使用して 1 日を組み立てましょう。';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return '熱やにわか雨が発生する前に、屋外の窓は $start ～ $end の状態が最適です。';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      '天気は安定しているようです。立ち寄る場所を順番に決める準備ができたら、「今日の計画」をタップします。';

  @override
  String get weatherImpactIndoorFallback => 'スパや美術館';

  @override
  String get hotelIntelBadge => 'ホテルインテリジェンス';

  @override
  String get hotelIntelTitle => 'ホームベースを探す';

  @override
  String get hotelIntelSubtitle =>
      'Luxora は、希望する旅行に基づいて、予約グリッドではなく、あなたの一日を形作る滞在を選択します。';

  @override
  String get hotelDiscoveryTitle => 'オーランドのために厳選';

  @override
  String get hotelMatchmakerTeaser =>
      'Luxora にあなたの旅行スタイルを伝えて、コンシェルジュが選んだ 3 つの滞在を正直な条件でご予約ください。';

  @override
  String get hotelMatchmakerCta => 'AIホテル仲人';

  @override
  String get hotelMatchmakerTitle => 'ホテルの仲人';

  @override
  String get hotelMatchmakerSubtitle => '旅行方法を共有する — Luxora は、一日を過ごす場所を推奨します。';

  @override
  String get hotelMatchmakerRun => 'トップ 3 の滞在を探す';

  @override
  String get hotelMatchBudget => '予算に余裕のあるコンフォートゾーン';

  @override
  String get hotelMatchTravelers => '旅行者';

  @override
  String get hotelMatchAdults => '大人';

  @override
  String get hotelMatchKids => 'キッズ';

  @override
  String get hotelMatchAttractions => 'リストにある観光スポット';

  @override
  String get hotelMatchLuxuryLevel => '求められる高級感のレベル';

  @override
  String get hotelMatchTransport => '移動方法';

  @override
  String get hotelTransportCar => 'レンタカー';

  @override
  String get hotelTransportRideshare => 'ライドシェア';

  @override
  String get hotelTransportShuttle => 'リゾートシャトル';

  @override
  String get hotelTransportWalkable => '歩きやすい近所';

  @override
  String get hotelMatchResultsTitle => '上位 3 試合';

  @override
  String hotelMatchWhyTitle(int score) {
    return '試合スコア $score';
  }

  @override
  String get hotelMatchBestForLabel => '以下に最適:';

  @override
  String get hotelMatchItineraryLabel => '旅程：';

  @override
  String get hotelMatchTradeoffsLabel => 'トレードオフ:';

  @override
  String get hotelMatchNearbyLabel => '近く：';

  @override
  String get hotelLuxoraScore => 'ルクソラ';

  @override
  String get hotelHomeBaseBadge => 'ホームベース';

  @override
  String get hotelScoreLuxury => '贅沢';

  @override
  String get hotelScoreFamily => '家族';

  @override
  String get hotelScoreRomance => 'ロマンス';

  @override
  String get hotelScoreWalkability => '歩く';

  @override
  String get hotelWhyRecommendTitle => 'Luxora がこれを推奨する理由';

  @override
  String get hotelItineraryImpactTitle => 'これがあなたの日々をどのように形作るか';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return 'ハブからのおよそのドライブ: $driveTime。移動摩擦スコア: $friction/90 (値が低いほど穏やかです)。';
  }

  @override
  String get hotelAddHomeBase => 'ホームベースとして追加';

  @override
  String get hotelHomeBaseActive => 'ホームベースアクティブ';

  @override
  String get hotelViewOnMap => '地図で見る';

  @override
  String get hotelGetDirections => '道順を調べる';

  @override
  String get hotelCheckRates => '料金を確認する';

  @override
  String get hotelVisitWebsite => 'ウェブサイトにアクセス';

  @override
  String get hotelLinkUnavailable => 'この滞在では予約リンクがまだ利用できません。';

  @override
  String get hotelLinkOpenFailed => 'リンクを開けませんでした。ブラウザを確認するか、もう一度試してください。';

  @override
  String get hotelSave => 'ホテルを保存';

  @override
  String get hotelSaved => '保存されました';

  @override
  String get hotelDistanceTitle => '主要スポットまでの距離';

  @override
  String get hotelCompareTitle => '滞在を比較する';

  @override
  String get hotelCompareSubtitle => 'コンシェルジュによる横並びビュー - 最大 3 つのホテル。';

  @override
  String hotelCompareSelected(int count) {
    return '$count 個が選択されました';
  }

  @override
  String get hotelComparePrice => '価格帯';

  @override
  String get hotelCompareDriveImpact => '影響を与える';

  @override
  String get hotelCompareNearby => '近くの見どころ';

  @override
  String get hotelPriceBudget => '予算';

  @override
  String get hotelPriceModerate => '適度';

  @override
  String get hotelPriceUpscale => '高級感のある';

  @override
  String get hotelPriceLuxury => '贅沢';

  @override
  String get hotelTagCouples => 'カップルに最適';

  @override
  String get hotelTagDisney => 'ディズニーに最適';

  @override
  String get hotelTagUniversal => 'ユニバーサルに最適';

  @override
  String get hotelTagLuxuryStaycation => '贅沢なステイケーション';

  @override
  String get hotelTagFamily => 'ファミリー向け';

  @override
  String get hotelTagQuiet => '静かな逃避行';

  @override
  String get hotelTagWalkableDining => '歩きやすいダイニング';

  @override
  String get hotelTagResort => 'リゾート気分';

  @override
  String get hotelTagBudget => '予算に優しい';

  @override
  String get hotelReasonMatchesMood => '旅の気分やペースに合わせて。';

  @override
  String get hotelReasonCloseStops => 'タイムライン上の計画された停車地に近い。';

  @override
  String hotelReasonSavesDrive(String time) {
    return '一般的なハブと比較して、中心から約 $time 分の運転時間を節約します。';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return '間違ったリゾートに浪費することなく、$range の快適ゾーンに適合します。';
  }

  @override
  String get hotelReasonBetterGroup => 'グループのタイプとエネルギーレベルにより適しています。';

  @override
  String get hotelReasonNearbyDining => '気軽に夜を楽しめる近くのおいしいレストラン。';

  @override
  String get hotelReasonLowStress => 'リゾート スタイルの静けさ - 物流を減らし、より多くの休暇を。';

  @override
  String get hotelMatchAttractionsGeneral => '予定しているアトラクション';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return '$attractions の旅程に基づいて、$hotel は車での移動時間を短縮し、夜の過ごしやすさを確保します。';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$neighborhood の $hotel は、この旅行の感じ方にぴったりです。';
  }

  @override
  String get hotelMatchBestForFamily => '公園へのアクセスを犠牲にすることなく、プールで一日を楽しみたい家族。';

  @override
  String get hotelMatchBestForCouple => 'テーマパークのような混乱のないロマンスを望んでいるカップル。';

  @override
  String get hotelMatchBestForGroup => '快適さ、アクセス、そして穏やかな物流のバランスをとったグループ。';

  @override
  String hotelMatchImpactDisney(String time) {
    return 'ディズニーの運行距離は短くなります。自宅からパークまでは約 $time です。';
  }

  @override
  String get hotelMatchImpactUniversal =>
      'ユニバーサル エクスプレスの特典や水上タクシーの利用で、一日の時間を有効活用できます。';

  @override
  String get hotelMatchImpactWalkable =>
      '夕食まで歩いて行けます。長時間公園で過ごした後の駐車ストレスが軽減されます。';

  @override
  String hotelMatchImpactDefault(String time) {
    return '平均運転時間を $time 前後に保つことで、一日の流れをリラックスした状態に保ちます。';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget =>
      'プレミアム リゾート価格 — 部屋には多くの予算を設定し、他の場所では予算を抑えます。';

  @override
  String get hotelMatchTradeoffCarNeeded =>
      'どこにでも歩いて行ける拠点ではなく、車やライドシェアに頼ることになります。';

  @override
  String get hotelMatchTradeoffLessFamily =>
      '家族向けのリゾートほど、子供向けのアメニティには重点が置かれていません。';

  @override
  String get hotelMatchTradeoffLessRomantic =>
      '静かなカップルの隠れ家よりも、テーマパークのようなエネルギーがあふれています。';

  @override
  String get hotelMatchTradeoffDefault =>
      'すべての滞在にはトレードオフがあります。Luxora はこれを優先事項として最初に選びました。';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return '$neighborhood周辺での食事と体験。';
  }

  @override
  String get mapHotelIntelBannerTitle => '適切なホームベースを選択する';

  @override
  String get mapHotelIntelBannerBody =>
      'ホテルによって、車での移動時間、一日の流れ、食事場所が決まります。 Luxora は、予約にプレッシャーをかけることなく、商品選びをお手伝いします。';

  @override
  String get mapHotelIntelBannerCta => 'ホテル インテリジェンスを探索する';

  @override
  String get sponsorLuxoraRecommended => 'ルクソラ推奨';

  @override
  String get sponsorBadgeFeaturedPartner => '注目のパートナー';

  @override
  String get sponsorBadgeSponsored => 'スポンサー付き';

  @override
  String get sponsorBadgePromoted => '昇格';

  @override
  String get sponsorBadgePartnerOffer => 'パートナーオファー';

  @override
  String get sponsorCtaVisitWebsite => 'ウェブサイトにアクセス';

  @override
  String get sponsorCtaBookNow => '今すぐ予約する';

  @override
  String get sponsorCtaCheckRates => '料金を確認する';

  @override
  String get sponsorCtaGetTickets => 'チケットを入手する';

  @override
  String get sponsorCtaViewOffer => 'オファーを見る';

  @override
  String get featuredStaysTitle => '注目の滞在';

  @override
  String get featuredStaysSubtitle =>
      'パートナー プレースメント — Luxora のオーガニック ホテル マッチ スコアとは別のものです。';

  @override
  String get featuredExperiencesTitle => '注目の体験';

  @override
  String get featuredExperiencesSubtitle =>
      '気分に合わせておすすめのアイテムをプロモートします。常にラベルが付けられ、AI ランクに偽装されることはありません。';

  @override
  String get featuredDiningTitle => '注目のダイニング';

  @override
  String get featuredDiningSubtitle =>
      'パートナー レストラン Luxora がハイライトする — あなたのオーガニック宝石リストは独立しています。';

  @override
  String get featuredTicketPartnersTitle => '注目のチケットパートナー';

  @override
  String get featuredTicketPartnersSubtitle =>
      '認定パートナーのオファー — 以下のオーガニック節約額と比較してください。';

  @override
  String get featuredCityHomeTitle => '注目のパートナー';

  @override
  String get featuredCityHomeSubtitle =>
      'オーランドにとって役立つパートナー オプション — AI が選択するように明確にマークされ、決して隠されることはありません。';

  @override
  String get dayFlowVibeFoodie => '食通';

  @override
  String get dayFlowVibeNightlife => 'ナイトライフ';

  @override
  String get dayFlowVibePoolside => 'プールサイド';

  @override
  String get dayFlowVibeAdventure => '冒険好き';

  @override
  String get dayFlowVibeCulture => '文化';

  @override
  String get onboardStep5Title => 'ルクソラの中心部';

  @override
  String get onboardStep5Subtitle => 'この旅行をどんな気分にしたいですか?';

  @override
  String get onboardTripFeelHint => '夕日が沈むディナー、ゆっくりとした朝、パートナーとの笑い…。';

  @override
  String get onboardStepNameEyebrow => 'あなたの物語は名前から始まります';

  @override
  String get onboardStepNameTitle => 'この旅行を何と呼べばいいでしょうか？';

  @override
  String get onboardStepNameSubtitle =>
      'Luxora では、あなたの雰囲気からタイトルを作成したり、独自のタイトルを入力したりできます。';

  @override
  String get onboardTripNameLuxora => 'ルクソーラに名前を付けましょう';

  @override
  String get onboardTripNameYours => '名前をつけておきます';

  @override
  String get onboardTripNameHint => '春の記念日の脱出…';

  @override
  String onboardTripNameSuggested(String name) {
    return 'Luxora は次のように提案します: $name';
  }

  @override
  String get conciergeTripNameLabel => '旅行名';

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

  @override
  String get paywallHeroEyebrow => 'あなたの専属コンシェルジュ';

  @override
  String get paywallHeroHeadline => '休暇を無駄にしないでください';

  @override
  String get paywallHeroSubheadline => 'Luxora は旅行を楽しめるように計画します。';

  @override
  String get paywallEmotionalLine => 'あなたはすでに休暇に何千ドルも費やしています。経験を偶然に任せないでください。';

  @override
  String paywallHeadlineCouples(String cityName) {
    return '$cityName での完璧な休暇はここから始まります。';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return '$cityName での計画に費やす時間を減らし、思い出作りに多くの時間を費やしましょう。';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return '$cityName を今までとは違う体験にしてください。';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return 'ほとんどの観光客が見たことのない $cityName を発見してください。';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return '地元の情報通のように $cityName を味わいましょう。';
  }

  @override
  String get paywallWhatYouUnlock => 'ロックを解除するもの';

  @override
  String get paywallFeatureAiConcierge => 'AIコンシェルジュ';

  @override
  String get paywallFeatureItineraries => 'パーソナライズされた旅程';

  @override
  String get paywallFeatureHiddenGems => '隠された宝石';

  @override
  String get paywallFeatureHotelIntel => 'ホテルインテリジェンス';

  @override
  String get paywallFeatureTicketSavings => '賢くチケットを節約';

  @override
  String get paywallFeatureWeatherConcierge => 'お天気コンシェルジュ';

  @override
  String get paywallFeatureCrowdIntel => 'クラウドインテリジェンス';

  @override
  String get paywallFeatureGpsNav => 'GPSナビゲーション';

  @override
  String get paywallFeatureLocalSecrets => 'ローカルの秘密';

  @override
  String get paywallFeatureDining => 'おすすめのダイニング';

  @override
  String get paywallFeatureUnlimitedPlanning => '無制限の都市計画';

  @override
  String get paywallWhyTravelersUnlock => '旅行者がルクソラのロックを解除する理由';

  @override
  String get paywallBenefitSaveTimeTitle => '時間を節約する';

  @override
  String get paywallBenefitSaveTimeBody => '何時間もかかる調査や計画を省略できます。';

  @override
  String get paywallBenefitSaveMoneyTitle => 'お金を節約する';

  @override
  String get paywallBenefitSaveMoneyBody => 'チケットの節約、地元のお得な情報、賢い選択を見つけてください。';

  @override
  String get paywallBenefitAvoidTrapsTitle => '観光客の罠を回避する';

  @override
  String get paywallBenefitAvoidTrapsBody => '地元の人が実際におすすめする体験を見つけてください。';

  @override
  String get paywallBenefitTravelSmarterTitle => 'よりスマートに旅行';

  @override
  String get paywallBenefitTravelSmarterBody =>
      '天気、混雑状況、旅行スタイルに基づいておすすめ情報を入手します。';

  @override
  String get paywallLockedPreviewTitle => 'コンシェルジュの中でお待ちしています';

  @override
  String get paywallLockedPreviewSubtitle =>
      'ロックを解除すると、あなたの旅行に合わせたルートと秘密が明らかになります。';

  @override
  String get paywallLockedDateNight => 'ロマンチックなデートナイトルート';

  @override
  String get paywallLockedHiddenLuxury => '隠れた贅沢な体験';

  @override
  String get paywallLockedVipSecrets => 'VIP ローカルの秘密';

  @override
  String get paywallLockedConciergeRecs => 'コンシェルジュのおすすめ';

  @override
  String get paywallLockedFamilyPlans => 'ファミリーストレスフリープラン';

  @override
  String get paywallLockedWeatherReroute => '天候に応じたルート変更';

  @override
  String get paywallLockedHotelMatchmaker => 'スマートホテル仲人';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return '$cityName コンシェルジュのロックを解除する';
  }

  @override
  String get paywallOneTimePurchase => '1回限りの購入';

  @override
  String get paywallNoSubscription => '購読なし';

  @override
  String get paywallNoMonthlyFees => '月額料金なし';

  @override
  String paywallLifetimeAccess(String cityName) {
    return '生涯 $cityName アクセス';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return '今後の $cityName のアップデートが含まれます';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return 'ほとんどの $cityName の休暇の費用は $minUsd～$maxUsd+';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price 1 回';
  }

  @override
  String get paywallLessThanDinner => '休暇のディナーの費用よりも安くなります。';

  @override
  String get paywallSocialProofTitle => 'ルクソラのロックを解除した旅行者';

  @override
  String get paywallReview1 => '「計画に費やす時間を節約できました。」';

  @override
  String get paywallReview2 => '「私たちが決して発見できなかった場所を見つけました。」';

  @override
  String get paywallReview3 => '「隠された宝石だけでも価値があります。」';

  @override
  String paywallCtaUnlock(String cityName) {
    return '$cityName コンシェルジュのロックを解除する';
  }

  @override
  String get paywallContinueExploring => '探検を続ける';

  @override
  String get paywallConciergePromise =>
      '1 回限りの購入 · パーソナル コンシェルジュ · サブスクリプションなし';

  @override
  String get paywallRestorePurchases => '購入したものを復元する';

  @override
  String get paywallPurchaseSuccess => '購入が完了しました - コンシェルジュのロックが解除されました。';

  @override
  String get paywallPurchasePending => '購入を完了しています…';

  @override
  String get paywallPurchaseFailed => '購入を完了できませんでした。もう一度試すか、購入を復元してください。';

  @override
  String get paywallPurchaseCanceled => '購入はキャンセルされました。';

  @override
  String get paywallRestoreComplete => '購入が復元されました。';

  @override
  String get paywallRestoreNone =>
      'この Apple ID または Google アカウントで以前に購入したものは見つかりませんでした。';

  @override
  String get paywallStoreUnavailable => 'このデバイスでは App Store での課金は利用できません。';

  @override
  String get paywallProductUnavailable => 'このパックはまだストアでは入手できません。';

  @override
  String get settingsUnlockConciergeTitle => 'シティコンシェルジュのロックを解除する';

  @override
  String get settingsUnlockConciergeSubtitle =>
      '1 回限りのシティ パック — サブスクリプションではありません';

  @override
  String get settingsOpenConciergeSubtitle => 'AI コンシェルジュ タブを開く';

  @override
  String get weatherMiamiHumidityIndoor =>
      '今日は湿度が高いですね。早めにビーチやプールに行き、最も暑い時間帯にはウィンウッドやブリッケルで屋内ダイニングやギャラリーを楽しみましょう。';

  @override
  String get weatherMiamiHeatAdvisory =>
      '暑さに関する注意喚起の条件 — 軽い生地、水分補給、屋外での休憩の間に日よけを休憩すること。';

  @override
  String get weatherMiamiBeachMorning =>
      '砂浜では強い紫外線が降り注ぐため、日焼け止めを塗り、帽子をかぶって、正午前のビーチタイムを過ごします。';

  @override
  String get weatherMiamiBoatWind =>
      '風が強い - ボートやヨットのアクティビティを再考してください。屋上ダイニングはまだ営業できるかもしれない。';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return '雨が降りそうなので、屋外の予定を $indoorSpot やギャラリーの時間に変更してください。';
  }

  @override
  String get weatherMiamiSunsetWaterfront =>
      '夕日が強く見えます。ウォーターフロントまたは東から西の景色を望む屋上です。';

  @override
  String get miamiBeachIntelTitle => 'ビーチインテリジェンス';

  @override
  String miamiBeachBestTime(String time) {
    return 'ベストタイム: $time';
  }

  @override
  String get miamiBeachFamilyScore => '家族';

  @override
  String get miamiBeachCrowdScore => '群衆';

  @override
  String get miamiBeachPhotoScore => '写真';

  @override
  String get miamiBeachRomanceScore => 'ロマンス';

  @override
  String get miamiBeachSunsetScore => '日没';

  @override
  String miamiBeachParking(String level) {
    return '駐車場: $level';
  }

  @override
  String get miamiNightlifeTitle => 'ナイトライフ コンシェルジュ';

  @override
  String miamiNightlifeDressCode(String code) {
    return 'ドレスコード: $code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return '最高の到着時間: $time';
  }

  @override
  String get miamiNightlifeReservation => '予約をお勧めします';

  @override
  String get miamiMoodRoutesTitle => 'マイアミ ムード ルート';

  @override
  String miamiMoodRouteStart(String time) {
    return '$time 頃から開始';
  }

  @override
  String get keysWaterIntelTitle => 'キーズウォーターインテリジェンス';

  @override
  String keysWaterBestTime(String time) {
    return '最適なウィンドウ: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return '水: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'スノーケル';

  @override
  String get keysWaterDivingScore => 'ダイビング';

  @override
  String get keysWaterBoatingScore => 'ボート';

  @override
  String get keysWaterFishingScore => '魚';

  @override
  String get keysWaterWindScore => '風';

  @override
  String get keysWaterSunsetScore => '日没';

  @override
  String get keysWaterCrowdScore => '群衆';

  @override
  String get keysMoodRoutesTitle => 'キーズ島のルート';

  @override
  String keysMoodRouteStart(String time) {
    return '$timeを開始';
  }

  @override
  String get paywallHeadlineMiamiDefault => 'マイアミを一味違った体験してみませんか';

  @override
  String get paywallHeadlineMiamiWeekend => 'マイアミの週末を無駄にしないでください';

  @override
  String get paywallOrlandoAddonsHeading => 'テーマパークパック';

  @override
  String get paywallOrlandoBaseIncludes =>
      'オーランドのロック解除には、食事、隠れた宝石、ホテル、公園以外の体験が含まれます。ディズニーとユニバーサルのテーマパーク パックを一緒に追加します。';

  @override
  String get paywallAddonThemeParksTitle => 'ディズニー＆ユニバーサルパック';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'ウォルト ディズニー ワールドとユニバーサル オーランド — すべてのパーク、セール、ルート、混雑情報を 1 回のロック解除で利用できます。';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return '$packName · $price のロックを解除します';
  }

  @override
  String get paywallAddonUnlocked => 'ロック解除済み';

  @override
  String get paywallAddonRequiresOrlando => '最初にオーランドのロックを解除する必要があります';

  @override
  String paywallUnlockAddonPack(String packName) {
    return '$packName のロックを解除する';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return '$packName のロックを解除する';
  }

  @override
  String get orlandoThemeParksPromptTitle => 'オーランドのディズニーとユニバーサルのロックを解除しますか?';

  @override
  String get orlandoThemeParksPromptBody =>
      'ウォルト ディズニー ワールドとユニバーサル オーランドのテーマ パーク パックを追加すると、すべてのパーク、チケット取引、ルート、混雑情報が 1 回のロックで解除されます。';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'ロックを解除 · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => '今じゃない';

  @override
  String get onboardV2Eyebrow => 'あなたの完璧な旅行をデザインしましょう';

  @override
  String get onboardV2StepTravelerEyebrow => 'ステップ1';

  @override
  String get onboardV2StepTravelerTitle => '誰と一緒に旅行していますか?';

  @override
  String get onboardV2StepTravelerSubtitle =>
      'Luxora は、クルーに合わせて宿泊、食事、ペース調整を行います。';

  @override
  String get onboardV2ChildrenLabel => 'お子様が旅行中ですか？';

  @override
  String get onboardV2StepStyleEyebrow => 'ステップ2';

  @override
  String get onboardV2StepStyleTitle => 'どのような旅行をお探しですか?';

  @override
  String get onboardV2StepStyleSubtitle => '自分がワクワクするものをすべて選んでください。';

  @override
  String get onboardV2StepHotelEyebrow => 'ステップ3';

  @override
  String get onboardV2StepHotelTitle => 'どのようなタイプの場所に滞在したいですか?';

  @override
  String get onboardV2StepHotelSubtitle => 'ブティックの逸品とリゾートのアイコンを組み合わせます。';

  @override
  String get onboardV2HotelBudgetLabel => 'ホテルの予算';

  @override
  String get onboardV2HotelAmenitiesLabel => '必須のアメニティ';

  @override
  String get onboardV2StepFoodEyebrow => 'ステップ4';

  @override
  String get onboardV2StepFoodTitle => 'どのような種類のレストランが好きですか?';

  @override
  String get onboardV2StepFoodSubtitle => '料理とダイニング スタイル - 好きなものをすべてお選びください。';

  @override
  String get onboardV2CuisineLabel => '料理の種類';

  @override
  String get onboardV2DiningStyleLabel => 'ダイニングスタイル';

  @override
  String get onboardV2StepPaceEyebrow => 'ステップ5';

  @override
  String get onboardV2StepPaceTitle => '一日の計画をどのように立てますか？';

  @override
  String get onboardV2StepPaceSubtitle => 'リラックスした朝も、充実した冒険も、あなた次第です。';

  @override
  String get onboardV2PaceRelaxedTitle => 'リラックスした';

  @override
  String get onboardV2PaceRelaxedBody => '1 日あたり 2 ～ 3 つのアクティビティ';

  @override
  String get onboardV2PaceBalancedTitle => 'バランスのとれた';

  @override
  String get onboardV2PaceBalancedBody => '1 日あたり 4 ～ 5 つのアクティビティ';

  @override
  String get onboardV2PacePackedTitle => '詰め込まれた';

  @override
  String get onboardV2PacePackedBody => '毎日を最大限に活用する';

  @override
  String get onboardV2StepGoalsEyebrow => 'ステップ6';

  @override
  String get onboardV2StepGoalsTitle => 'この旅行で最も重要なことは何ですか?';

  @override
  String get onboardV2StepGoalsSubtitle => '最大 5 つの優先順位を選択します。';

  @override
  String get onboardV2StepExperienceEyebrow => 'ステップ7';

  @override
  String get onboardV2StepExperienceTitle => 'どのような体験をしてみたいですか？';

  @override
  String get onboardV2StepExperienceSubtitle => 'これらをあなたの旅程に織り込みます。';

  @override
  String get onboardV2StepAvoidEyebrow => 'ステップ8';

  @override
  String get onboardV2StepAvoidTitle => '避けたいものは何ですか?';

  @override
  String get onboardV2StepAvoidSubtitle => 'Luxora は、旅行に無駄なものを一切排除します。';

  @override
  String get onboardV2StepEmotionEyebrow => 'ステップ9';

  @override
  String get onboardV2StepEmotionTitle => 'この旅行が成功したと感じられるものは何ですか?';

  @override
  String get onboardV2StepEmotionSubtitle => '主な感情を 1 つ選択してください。';

  @override
  String get onboardV2StepSummaryEyebrow => 'コンシェルジュによるプレビュー';

  @override
  String get onboardV2StepSummaryTitle => 'あなたの選択に基づいて、Luxora が推奨するのは';

  @override
  String get onboardV2StepSummarySubtitle => '私たちは今、あなたの完璧な旅行を構築中です。';

  @override
  String get onboardSummaryHotels => 'ホテル';

  @override
  String get onboardSummaryRestaurants => 'レストラン';

  @override
  String get onboardSummaryHiddenGems => '隠れた宝石';

  @override
  String get onboardSummaryExperiences => '体験談';

  @override
  String get onboardSummaryHotelDefault => '予算に合わせて厳選された滞在';

  @override
  String onboardSummaryHotelType(String type) {
    return '$type 滞在';
  }

  @override
  String get onboardSummaryRooftopDining => '屋上でのダイニング体験';

  @override
  String onboardSummaryCuisine(String cuisine) {
    return '$cuisine のお気に入り';
  }

  @override
  String onboardSummaryPace(String pace) {
    return '$pace の 1 日のペース';
  }

  @override
  String get onboardSummaryRomantic => 'ロマンチックな夕日体験';

  @override
  String onboardSummaryEmotion(String emotion) {
    return '$emotion に焦点を当てた旅';
  }

  @override
  String get onboardSummaryPremiumGems => 'プレミアムな隠れた逸品';

  @override
  String get agendaSuggestionsForYou => 'あなたのために選ばれました';

  @override
  String get agendaSuggestionsAlternates => 'こちらも素晴らしい';

  @override
  String get agendaSuggestionsBrowseAll => 'すべて閲覧する';

  @override
  String get onboardPrefTravelerSolo => 'ソロ';

  @override
  String get onboardPrefTravelerCouple => 'カップル';

  @override
  String get onboardPrefTravelerFamily => '家族';

  @override
  String get onboardPrefTravelerFriends => '友達';

  @override
  String get onboardPrefTravelerBusiness => '仕事';

  @override
  String get onboardPrefChildrenNone => '子供はいません';

  @override
  String get onboardPrefChildrenToddlers => '幼児';

  @override
  String get onboardPrefChildrenElementary => '小学生';

  @override
  String get onboardPrefChildrenTeenagers => 'ティーンエイジャー';

  @override
  String get onboardPrefStyleLuxury => '贅沢';

  @override
  String get onboardPrefStyleRelaxation => 'リラクゼーション';

  @override
  String get onboardPrefStyleAdventure => 'アドベンチャー';

  @override
  String get onboardPrefStyleThemeParks => 'テーマパーク';

  @override
  String get onboardPrefStyleFoodie => '食通';

  @override
  String get onboardPrefStyleNightlife => 'ナイトライフ';

  @override
  String get onboardPrefStyleRomance => 'ロマンス';

  @override
  String get onboardPrefStyleShopping => '買い物';

  @override
  String get onboardPrefStyleBeaches => 'ビーチ';

  @override
  String get onboardPrefStyleWellness => 'ウェルネス';

  @override
  String get onboardPrefStyleNature => '自然';

  @override
  String get onboardPrefStylePhotography => '写真';

  @override
  String get onboardPrefStyleHiddenGems => '隠された宝石';

  @override
  String get onboardPrefStyleFamilyActivities => '家族向けアクティビティ';

  @override
  String get onboardPrefStyleLocalExperiences => '地元の体験';

  @override
  String get onboardPrefStyleEntertainment => 'エンターテインメント';

  @override
  String get onboardPrefHotelLuxuryResort => 'ラグジュアリーリゾート';

  @override
  String get onboardPrefHotelBoutique => 'ブティックホテル';

  @override
  String get onboardPrefHotelFamilyResort => 'ファミリーリゾート';

  @override
  String get onboardPrefHotelBudgetFriendly => '予算に優しい';

  @override
  String get onboardPrefHotelAdultsOnly => '大人限定';

  @override
  String get onboardPrefHotelSpaResort => 'スパリゾート';

  @override
  String get onboardPrefHotelBeachfront => 'ビーチフロント';

  @override
  String get onboardPrefHotelDowntown => 'ダウンタウン';

  @override
  String get onboardPrefHotelWalkable => '歩きやすいエリア';

  @override
  String get onboardPrefHotelThemeParkArea => 'テーマパークエリア';

  @override
  String get onboardPrefHotelModern => 'モダンなホテル';

  @override
  String get onboardPrefHotelHistoric => '歴史あるホテル';

  @override
  String get onboardPrefBudgetOne => '\$';

  @override
  String get onboardPrefBudgetTwo => '\$\$';

  @override
  String get onboardPrefBudgetThree => '\$\$\$';

  @override
  String get onboardPrefBudgetFour => '\$\$\$\$';

  @override
  String get onboardPrefAmenityPool => 'プール';

  @override
  String get onboardPrefAmenitySpa => 'スパ';

  @override
  String get onboardPrefAmenityGym => 'ジム';

  @override
  String get onboardPrefAmenityBreakfast => '無料の朝食';

  @override
  String get onboardPrefAmenityOceanView => 'オーシャンビュー';

  @override
  String get onboardPrefAmenityBalcony => 'バルコニー';

  @override
  String get onboardPrefAmenityKitchen => '台所';

  @override
  String get onboardPrefAmenityShuttle => 'シャトルサービス';

  @override
  String get onboardPrefAmenityPetFriendly => 'ペット可';

  @override
  String get onboardPrefCuisineAmerican => 'アメリカ人';

  @override
  String get onboardPrefCuisineItalian => 'イタリア語';

  @override
  String get onboardPrefCuisineMexican => 'メキシコ人';

  @override
  String get onboardPrefCuisineSeafood => 'シーフード';

  @override
  String get onboardPrefCuisineSteakhouse => 'ステーキハウス';

  @override
  String get onboardPrefCuisineSushi => '寿司';

  @override
  String get onboardPrefCuisineCuban => 'キューバ人';

  @override
  String get onboardPrefCuisineMediterranean => '地中海料理';

  @override
  String get onboardPrefCuisineAsian => 'アジア人';

  @override
  String get onboardPrefCuisineBbq => 'バーベキュー';

  @override
  String get onboardPrefCuisineFineDining => '高級ダイニング';

  @override
  String get onboardPrefCuisineLocalFavorites => '地元のお気に入り';

  @override
  String get onboardPrefCuisineFoodTrucks => 'フードトラック';

  @override
  String get onboardPrefCuisineRooftop => '屋上ダイニング';

  @override
  String get onboardPrefCuisineBrunch => 'ブランチ';

  @override
  String get onboardPrefCuisineDessert => 'デザート';

  @override
  String get onboardPrefDiningQuick => 'クイックサービス';

  @override
  String get onboardPrefDiningCasual => 'カジュアルダイニング';

  @override
  String get onboardPrefDiningFamily => 'ファミリー向け';

  @override
  String get onboardPrefDiningDateNight => 'デートナイト';

  @override
  String get onboardPrefDiningFine => '高級ダイニング';

  @override
  String get onboardPrefDiningWaterfront => 'ウォーターフロント';

  @override
  String get onboardPrefDiningHiddenGems => '隠された宝石';

  @override
  String get onboardPrefDiningLocal => '地元のお気に入り';

  @override
  String get onboardPrefGoalMakeMemories => '思い出を作る';

  @override
  String get onboardPrefGoalSaveMoney => 'お金を節約する';

  @override
  String get onboardPrefGoalAvoidCrowds => '混雑を避ける';

  @override
  String get onboardPrefGoalLuxury => '贅沢な体験';

  @override
  String get onboardPrefGoalBestFood => '最高の食べ物';

  @override
  String get onboardPrefGoalHiddenGems => '隠された宝石';

  @override
  String get onboardPrefGoalRelaxation => 'リラクゼーション';

  @override
  String get onboardPrefGoalAdventure => 'アドベンチャー';

  @override
  String get onboardPrefGoalBestPhotos => 'ベストフォト';

  @override
  String get onboardPrefGoalFamilyTime => '家族の時間';

  @override
  String get onboardPrefGoalRomance => 'ロマンス';

  @override
  String get onboardPrefGoalNightlife => 'ナイトライフ';

  @override
  String get onboardPrefGoalLocal => '地元の体験';

  @override
  String get onboardPrefGoalStressFree => 'ストレスフリーなプランニング';

  @override
  String get onboardPrefExpBoatTours => 'ボートツアー';

  @override
  String get onboardPrefExpSunsetCruises => 'サンセットクルーズ';

  @override
  String get onboardPrefExpAirboat => 'エアボートツアー';

  @override
  String get onboardPrefExpThemeParks => 'テーマパーク';

  @override
  String get onboardPrefExpMuseums => '美術館・博物館';

  @override
  String get onboardPrefExpLiveShows => 'ライブショー';

  @override
  String get onboardPrefExpSpas => 'スパ';

  @override
  String get onboardPrefExpShopping => '買い物';

  @override
  String get onboardPrefExpWaterParks => 'ウォーターパーク';

  @override
  String get onboardPrefExpGolf => 'ゴルフ';

  @override
  String get onboardPrefExpFishing => '釣り';

  @override
  String get onboardPrefExpKayaking => 'カヤック';

  @override
  String get onboardPrefExpSnorkeling => 'シュノーケリング';

  @override
  String get onboardPrefExpRooftopBars => 'ルーフトップバー';

  @override
  String get onboardPrefExpNightclubs => 'ナイトクラブ';

  @override
  String get onboardPrefExpWildlife => '野生動物体験';

  @override
  String get onboardPrefExpFoodTours => 'グルメツアー';

  @override
  String get onboardPrefExpScenicDrives => '風光明媚なドライブコース';

  @override
  String get onboardPrefAvoidCrowds => '群衆';

  @override
  String get onboardPrefAvoidLongLines => '長い行列';

  @override
  String get onboardPrefAvoidExpensiveRestaurants => '高価なレストラン';

  @override
  String get onboardPrefAvoidWalking => '長距離を歩く';

  @override
  String get onboardPrefAvoidNightlife => 'ナイトライフ';

  @override
  String get onboardPrefAvoidDriving => '運転';

  @override
  String get onboardPrefAvoidTouristTraps => 'ツーリスト・トラップ';

  @override
  String get onboardPrefAvoidEarlyMornings => '早朝';

  @override
  String get onboardPrefAvoidLateNights => '深夜';

  @override
  String get onboardPrefAvoidFamilyAttractions => '家族向けアトラクション';

  @override
  String get onboardPrefAvoidThemeParks => 'テーマパーク';

  @override
  String get onboardPrefEmotionRelaxed => 'リラックスした';

  @override
  String get onboardPrefEmotionExcited => '興奮した';

  @override
  String get onboardPrefEmotionAdventurous => '冒険好き';

  @override
  String get onboardPrefEmotionRomantic => 'ロマンチック';

  @override
  String get onboardPrefEmotionLuxurious => '豪華な';

  @override
  String get onboardPrefEmotionFamilyFocused => '家族中心';

  @override
  String get onboardPrefEmotionMemorable => '思い出に残る';

  @override
  String get onboardPrefEmotionStressFree => 'ストレスフリー';

  @override
  String get onboardPrefEmotionInspiring => '感動する';

  @override
  String get onboardPrefPaceSlow => 'リラックスした';

  @override
  String get onboardPrefPaceBalanced => 'バランスのとれた';

  @override
  String get onboardPrefPacePacked => '詰め込まれた';

  @override
  String get onboardSummaryHiddenGemsInsight => '地元の隠れたレストランと逸品';

  @override
  String get onboardBuildFailedHint =>
      'あなたの設定を保存しましたが、旅程を作成するにはもう少し時間がかかります。プルしてアジェンダを更新するか、コンシェルジュを開きます。';

  @override
  String get onboardV2ChildrenSubtitle => '該当する年齢層をすべて選択してください。';

  @override
  String get onboardTravelerNameEyebrow => 'まず最初に';

  @override
  String get onboardTravelerNameTitle => 'ルクソラは何と呼べばいいでしょうか？';

  @override
  String get onboardTravelerNameSubtitle =>
      '下の名前だけで十分です。Luxora はチャット時にその名前を使用します。';

  @override
  String get onboardTravelerNameLabel => 'あなたの名前';

  @override
  String get onboardTravelerNameHint => '例えばマリア';

  @override
  String conciergeWelcomeNamed(String name) {
    return 'ようこそ、$name — 感情的に知的なフロリダの仲間です。\n\n以下のプロンプトを選択するか、旅行で作りたい雰囲気を説明してください。';
  }

  @override
  String conciergeWelcomeWarmNamed(String name) {
    return '$name さん、私はフロリダをあなたがどう感じたいかを形作るためにここにいます。観光スポットのチェックリストではありません。今日は何が食べたいですか？';
  }

  @override
  String get onboardLuxoraReplyEyebrow => 'ルクソラ';

  @override
  String onboardLuxoraReplyTitle(String name) {
    return '初めまして、$name。';
  }

  @override
  String onboardLuxoraGuideNamed(String name) {
    return '$name さん、私はあなたをガイドし、あなたとあなたの家族にとって完璧な休暇や冒険を作るお手伝いをします。';
  }

  @override
  String get onboardLuxoraItineraryPromise =>
      'ここでの作業が完了したら、選択したすべてのものから旅程を作成します。後で何かを変更したい場合は、[コンシェルジュ] タブを開いて編集内容を教えてください。私はいつでも聞いています。';

  @override
  String get todayPlanSectionTitle => '今日の予定';

  @override
  String get todayNextActivityLabel => '次へ';

  @override
  String get todayStaysDiningSection => '宿泊と食事のおすすめ';

  @override
  String get todayStaysDiningCollapsedHint => 'ホテルとレストランのアイデア — タップして展開します';

  @override
  String get todayPlanDetailsTitle => '全スケジュール';

  @override
  String todayPlanStopCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count つ今日停止します',
      one: '1 stop today',
    );
    return '$_temp0';
  }

  @override
  String get todayRainRerouteTitle => '雨天のルート変更';

  @override
  String get todayExtrasSection => 'チケットと共有';

  @override
  String get todayExtrasCollapsedHint => 'セール、カードの共有など';
}
