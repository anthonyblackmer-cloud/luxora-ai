// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get appearance => 'उपस्थिति';

  @override
  String get settingsThemeIntro =>
      'सिनेमाई डार्क या रिसॉर्ट लाइट — अपनी यात्रा का मूड चुनें।';

  @override
  String get settingsThemeLabel => 'थीम';

  @override
  String get themeGoldenEmber => 'Golden Ember';

  @override
  String get themeGoldenEmberMood => 'गर्म अल्ट्रा-लक्ज़री';

  @override
  String get themeMidnightAmethyst => 'Midnight Amethyst';

  @override
  String get themeMidnightAmethystMood => 'रहस्यमय और विशेष';

  @override
  String get themeEmeraldHaven => 'Emerald Haven';

  @override
  String get themeEmeraldHavenMood => 'शांत उष्णकटिबंधीय विलासिता';

  @override
  String get themeRivieraWhite => 'Riviera White';

  @override
  String get themeRivieraWhiteMood => 'शानदार लक्ज़री ट्रैवल मैगज़ीन';

  @override
  String get themeCoastalGlass => 'Coastal Glass';

  @override
  String get themeCoastalGlassMood => 'साफ प्रीमियम छुट्टी ऊर्जा';

  @override
  String get themeChampagneLuxe => 'Champagne Luxe';

  @override
  String get themeChampagneLuxeMood => 'निजी कॉन्सierge की शान';

  @override
  String get themeBlackCard => 'Black Card';

  @override
  String get themeBlackCardMood => 'प्राइवेट एविएशन प्रतिष्ठा';

  @override
  String get settingsThemeSectionLuxury => 'लक्जरी सिनेमाई';

  @override
  String get settingsThemeSectionReadable => 'स्वच्छ एवं पठनीय';

  @override
  String get settingsMapSkinSection => 'मानचित्र आधार';

  @override
  String get settingsMapSkinIntro => 'मानचित्र टैब पर टाइल्स का रूप चुनें।';

  @override
  String get mapSkinVoyager => 'Voyager';

  @override
  String get mapSkinVoyagerMood => 'हल्के रंग — पार्क, पानी, सड़कें';

  @override
  String get mapSkinOsm => 'OpenStreetMap';

  @override
  String get mapSkinOsmMood => 'क्लासिक, प्राकृतिक रंग';

  @override
  String get mapSkinCartoLight => 'Carto Light';

  @override
  String get mapSkinCartoLightMood => 'न्यूनतम और उज्ज्वल';

  @override
  String get mapSkinCartoDark => 'Carto Dark';

  @override
  String get mapSkinCartoDarkMood => 'रात के अनुकूल आधार';

  @override
  String get mapSkinMapboxStreets => 'Mapbox Streets';

  @override
  String get mapSkinMapboxStreetsMood => 'समृद्ध विवरण, यात्रा ऐप जैसा';

  @override
  String get mapSkinMapboxOutdoors => 'Mapbox Outdoors';

  @override
  String get mapSkinMapboxOutdoorsMood => 'हरियाली और भू-आकृति पर जोर';

  @override
  String get dark_mode => 'डार्क मोड';

  @override
  String get light_mode => 'लाइट मोड';

  @override
  String get language => 'भाषा';

  @override
  String get settings_language_picker_note => 'परिवर्तन तुरंत लागू होते हैं.';

  @override
  String get settings_regions_coming_title => 'देश और शहर';

  @override
  String get settings_regions_coming_subtitle =>
      'होम हब और सिटी पैक - जल्द ही आ रहे हैं।';

  @override
  String get commonSoon => 'जल्द ही';

  @override
  String get commonContinue => 'जारी रखना';

  @override
  String get commonNew => 'नया';

  @override
  String get commonRoadmap => 'रोडमैप';

  @override
  String get commonLive => 'रहना';

  @override
  String get commonClose => 'बंद करना';

  @override
  String get commonCancel => 'रद्द करना';

  @override
  String get commonDelete => 'मिटाना';

  @override
  String get settingsStartOverSubtitle => 'नए सिरे से एक नई यात्रा शुरू करें';

  @override
  String get navConcierge => 'दरबान';

  @override
  String get navAgenda => 'आज';

  @override
  String get navDiscover => 'खोज करना';

  @override
  String get navMap => 'मानचित्र';

  @override
  String get navTrips => 'ट्रिप्स';

  @override
  String get navMore => 'अधिक';

  @override
  String get navRestaurants => 'रेस्टोरेंट';

  @override
  String get navTimeline => 'समय';

  @override
  String get agendaTabItinerary => 'दिन';

  @override
  String get agendaTabRestaurants => 'रेस्टोरेंट';

  @override
  String get restaurantsPageTitle => 'रेस्टोरेंट';

  @override
  String get restaurantsPageSubtitle =>
      'भोजन ब्राउज़ करें लक्सोरा जानता है - पसंदीदा सहेजें या दरबान को आज रात का भोजन चुनने दें।';

  @override
  String get restaurantsConciergePick => 'मेरे लिए एक रेस्तरां चुनें';

  @override
  String restaurantsConciergePickDone(String name) {
    return 'सहेजा गया $name - दरबान से इसे अपनी यात्रा में जोड़ने के लिए कहें।';
  }

  @override
  String restaurantsSavedCount(int count) {
    return 'आपकी यात्रा के लिए $count सहेजी गई';
  }

  @override
  String get restaurantsEmptyHint =>
      'आपके खोजे गए दायरे में कोई रेस्तरां नहीं - मानचित्र पर दायरा बढ़ाएं।';

  @override
  String get moreCardRestaurantsSub =>
      'भोजन ब्राउज़ करें और द्वारपाल को आपके लिए चयन करने दें';

  @override
  String get agendaHotelSuggestionsTitle => 'कहाँ रहा जाए';

  @override
  String agendaHotelSuggestionsSubtitle(int budget) {
    return 'AI आपके ~$budget USD ट्रिप बजट से मेल खाता है - सभी विकल्प देखने के लिए टैप करें।';
  }

  @override
  String agendaHotelTopPick(String name) {
    return 'शीर्ष चयन: $name';
  }

  @override
  String get agendaStayDropdownHint => 'एक होटल चुनें';

  @override
  String get agendaDiningDropdownHint => 'एक रेस्तरां चुनें';

  @override
  String get agendaDaySelectLabel => 'जिस दिन';

  @override
  String get agendaDayDiningTitle => 'आज रात कहाँ खाना है';

  @override
  String agendaDayDiningSubtitle(int budget, String tier) {
    return 'आज की योजना के आधार पर आपके ~$budget USD बजट ($tier भोजन) के लिए सुझाव।';
  }

  @override
  String get agendaDiningNearStops => 'आज के स्टॉप के पास';

  @override
  String get agendaDiningFitsBudget => 'आपकी यात्रा के बजट में फिट बैठता है';

  @override
  String get agendaDiningMatchesDay => 'आज के माहौल से मेल खाता है';

  @override
  String get agendaDiningFoodiePick => 'खाने के शौकीन पसंदीदा';

  @override
  String get browseCatRecommended => 'अनुशंसित';

  @override
  String get browseCatDisneyHotels => 'डिज़्नी क्षेत्र';

  @override
  String get browseCatBudgetFriendly => 'बजट अनुकूल';

  @override
  String get browseCatUpscaleLuxury => 'उच्चस्तरीय एवं विलासितापूर्ण';

  @override
  String get browseCatUniversalHotels => 'सार्वभौमिक क्षेत्र';

  @override
  String get browseCatThemeParkDining => 'थीम पार्क भोजनालय';

  @override
  String get browseCatUpscaleDining => 'उच्च स्तरीय एवं बढ़िया भोजन';

  @override
  String get browseSearchAllHotels => 'संपूर्ण होटल सूची खोजें...';

  @override
  String get browseSearchAllRestaurants => 'रेस्तरां की पूरी सूची खोजें...';

  @override
  String get browseCategoryEmpty =>
      'आपके दायरे के लिए इस श्रेणी में कोई मेल नहीं खाता - खोजने का प्रयास करें या खोज को विस्तृत करें।';

  @override
  String get browseFullCatalogHint =>
      'संपूर्ण कैटलॉग के लिए ऊपर खोज का उपयोग करें - प्रत्येक होटल और रेस्तरां लक्सोरा जानता है।';

  @override
  String get agendaPageSubtitle => 'मैं अभी क्या कर रहा हूँ?';

  @override
  String get navGems => 'रत्न';

  @override
  String get navFeed => 'खिलाना';

  @override
  String get navTicketSavings => 'बचत';

  @override
  String get navStays => 'रिहाइश';

  @override
  String get morePageTitle => 'अधिक';

  @override
  String get morePageSubtitle =>
      'यात्रा उपकरण, खाता और प्राथमिकताएँ - शांत पहुँच के लिए क्यूरेट किया गया।';

  @override
  String get moreSectionTravelTools => 'यात्रा उपकरण';

  @override
  String get moreSectionAccount => 'खाता';

  @override
  String get moreSectionApp => 'अनुप्रयोग';

  @override
  String get moreCardHotelsSub => 'बुद्धिमान आपके मूड के अनुरूप रहता है';

  @override
  String get moreCardGemsSub =>
      'अंदरूनी सूत्रों की खोज, स्थानीय लोग पहरा देते हैं';

  @override
  String get moreCardTicketsSub => 'अधिकृत भागीदार बचत की तुलना करें';

  @override
  String get moreCardWeatherSub => 'पूर्वानुमान-जागरूक दिन मार्गदर्शन';

  @override
  String get moreCardProfileTitle => 'यात्रा प्रोफ़ाइल';

  @override
  String get moreCardProfileSub =>
      'कौन यात्रा करता है, उसे कैसा महसूस होना चाहिए';

  @override
  String get moreCardFavoritesSub => 'आपके द्वारा बुकमार्क किए गए गंतव्य';

  @override
  String get moreCardNotificationsTitle => 'सूचनाएं';

  @override
  String get moreCardNotificationsSub => 'यात्रा अलर्ट और द्वारपाल अद्यतन';

  @override
  String get moreCardSettingsSub => 'थीम, शहर पैक और प्राथमिकताएँ';

  @override
  String get moreCardAboutSub => 'हम लक्ज़ोरा का निर्माण क्यों कर रहे हैं?';

  @override
  String get moreCardHelpSub => 'मार्गदर्शक और द्वारपाल सहायता';

  @override
  String get moreCardCityPacksSub => 'गंतव्य दरबानों को अनलॉक करें';

  @override
  String get moreCardPartnersSub => 'विशेष साझेदार अनुभव';

  @override
  String get moreCardItinerarySub => 'आपका दिन-ब-दिन सुनहरा पलायन';

  @override
  String get moreCardDiscoverSub => 'ट्रेंडिंग डाइनिंग, अनुभव और लाइव डिस्कवरी';

  @override
  String get savedFavoritesTitle => 'पसंदीदा सहेजा गया';

  @override
  String get savedFavoritesEmpty =>
      'मानचित्र या फ़ीड पर गंतव्यों को बुकमार्क करें - वे यहां दिखाई देंगे।';

  @override
  String get helpCenterTitle => 'सहायता केंद्र';

  @override
  String get helpCenterBody =>
      'द्वारपाल सहायता के लिए support@luxora.ai पर ईमेल करें। इन-ऐप गाइड जल्द ही आ रहे हैं।';

  @override
  String get notificationsComingSoon =>
      'यात्रा सूचनाएं भविष्य के अपडेट में आ रही हैं।';

  @override
  String get partnerOffersTitle => 'पार्टनर ऑफर करता है';

  @override
  String get ticketSavingsTitle => 'स्मार्ट टिकट बचत';

  @override
  String get ticketSavingsBadgeLabel => 'प्रीमियम बचत';

  @override
  String get ticketSavingsSubtitle =>
      'लक्सोरा अधिकृत पुनर्विक्रेताओं, बंडलों और प्रचारों को पेश करता है ताकि आप एक लक्जरी सलाहकार की तरह महसूस करें - कूपन साइट नहीं।';

  @override
  String ticketSavingsBadge(int percent) {
    return '$percent% बचाएं';
  }

  @override
  String get ticketOfficialPrice => 'अधिकारी';

  @override
  String get ticketDiscountPrice => 'लक्सोरा कीमत';

  @override
  String ticketSaveAmount(String amount) {
    return '$amount सहेजें';
  }

  @override
  String get ticketSaveAmountLabel => 'बचत';

  @override
  String ticketSavePerTicket(String amount) {
    return 'आप प्रति टिकट $amount बचा सकते हैं।';
  }

  @override
  String ticketFamilySave(String amount) {
    return 'अनुमानित पारिवारिक बचत: $amount.';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return 'अनुमानित पारिवारिक बचत: $amount.';
  }

  @override
  String ticketSource(String source) {
    return 'स्रोत: $source';
  }

  @override
  String ticketExpires(String date) {
    return 'ऑफर $date तक';
  }

  @override
  String get ticketBetterOption => 'लक्सोरा को एक बेहतर विकल्प मिल गया।';

  @override
  String get ticketOverpaying =>
      'हो सकता है कि आप गेट मूल्य पर अधिक भुगतान कर रहे हों।';

  @override
  String get ticketRecommendedSavings => 'अनुशंसित बचत उपलब्ध है';

  @override
  String get ticketCalculatorTitle => 'संभावित बचत';

  @override
  String get ticketFilterLabel => 'फ़िल्टर';

  @override
  String get ticketFilterAll => 'सभी';

  @override
  String get ticketFilterThemeParks => 'थीम पार्क';

  @override
  String get ticketFilterAttractions => 'आकर्षण';

  @override
  String get ticketFilterTours => 'टूर्स';

  @override
  String get ticketFilterDining => 'भोजन के अनुभव';

  @override
  String get ticketFilterWaterParks => 'जल पार्क';

  @override
  String get ticketFilterFamily => 'पारिवारिक गतिविधियाँ';

  @override
  String get ticketFilterEntertainment => 'मनोरंजन';

  @override
  String get ticketSortLabel => 'इसके अनुसार क्रमबद्ध करें';

  @override
  String get ticketSortHighestSavings => 'सबसे ज्यादा बचत';

  @override
  String get ticketSortMostPopular => 'सबसे लोकप्रिय';

  @override
  String get ticketSortFamilyFriendly => 'परिवार के अनुकूल';

  @override
  String get ticketSortLuxury => 'विलासितापूर्ण अनुभव';

  @override
  String get ticketSortClosest => 'मेरे सबसे करीब';

  @override
  String get ticketDealsSectionTitle => 'अधिकृत सौदे';

  @override
  String ticketDealsPricesAsOf(String date) {
    return 'कीमतें $date तक';
  }

  @override
  String get ticketDealsRefreshFailed =>
      'कीमतें ताज़ा नहीं की जा सकीं - कैश्ड डील दिखाई जा रही हैं।';

  @override
  String get ticketDealsUpdating => 'कीमतें अपडेट हो रही हैं...';

  @override
  String get ticketNoDeals =>
      'इस फ़िल्टर में कोई डील नहीं - दूसरी श्रेणी आज़माएँ।';

  @override
  String get ticketConfidenceHigh => 'उच्च आत्मविश्वास';

  @override
  String get ticketConfidenceVerified => 'सत्यापित पुनर्विक्रेता';

  @override
  String get ticketConfidenceLimited => 'सीमित समय';

  @override
  String get ticketAiInsightTitle => 'लक्सोरा अनुशंसा';

  @override
  String get ticketInsightDisneyPass =>
      'आपके यात्रा कार्यक्रम के आधार पर, एक दिन के टिकट के बजाय 3-दिवसीय वॉल्ट डिज़्नी वर्ल्ड पास आपके परिवार को लगभग 120 USD बचा सकता है।';

  @override
  String get ticketInsightUniversalCombo =>
      'आपकी योजना में यूनिवर्सल शामिल है - 2-पार्क टिकट अधिकांश परिवारों के लिए अलग-अलग दिनों की खरीदारी को मात देता है।';

  @override
  String get ticketInsightSeaworldCombo =>
      'आपके मार्ग पर सीवर्ल्ड - एक्वाटिका कॉम्बो अक्सर दो अलग-अलग प्रवेशों को मात देता है।';

  @override
  String get ticketInsightGeneric =>
      'लक्सोरा ने आपके यात्रा कार्यक्रम के स्टॉप से ​​​​बचत का मिलान किया - गेट पर खरीदने से पहले तुलना करें।';

  @override
  String get ticketInsightMiamiCulture =>
      'संस्कृति आपकी योजना पर रुक जाती है - विजकाया और PAMM पार्टनर ऑफर इस सप्ताह गेट प्राइसिंग को मात दे सकते हैं।';

  @override
  String get ticketInsightMiamiEverglades =>
      'आपके यात्रा कार्यक्रम में एवरग्लेड्स डे - सुबह के एयरबोट स्लॉट अक्सर सप्ताह के मध्य में सस्ते होते हैं।';

  @override
  String get ticketInsightMiamiWynwood =>
      'आपके मार्ग पर Wynwood - एक निर्देशित आर्ट वॉक वॉक-अप बूथ मूल्य निर्धारण को मात दे सकता है।';

  @override
  String get ticketItineraryMatchTitle => 'यात्रा कार्यक्रम बचत जांच';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'दरबान';

  @override
  String conciergeTripFeel(String feel) {
    return 'यात्रा का अनुभव: \"$feel\"';
  }

  @override
  String get conciergeWelcome =>
      'लक्सोरा में आपका स्वागत है - आपका भावनात्मक रूप से बुद्धिमान फ्लोरिडा साथी।\n\nनीचे एक संकेत चुनें, या उस भावना का वर्णन करें जिसे आप अपनी यात्रा में पैदा करना चाहते हैं।';

  @override
  String get conciergeQuickPrompts => 'त्वरित संकेत';

  @override
  String get conciergeRemembering => 'इस यात्रा के लिए याद कर रहा हूँ';

  @override
  String get conciergeStyleMemory => 'शैली स्मृति';

  @override
  String get conciergeInputHint =>
      'उस भावना का वर्णन करें जो आप अपनी यात्रा में पैदा करना चाहते हैं…';

  @override
  String get conciergeGreetingMorning => 'शुभ प्रभात।';

  @override
  String get conciergeGreetingAfternoon => 'शुभ दोपहर।';

  @override
  String get conciergeGreetingEvening => 'शुभ संध्या।';

  @override
  String get conciergeWelcomeWarm =>
      'मैं यहां फ्लोरिडा को आकार देने के लिए आया हूं कि आप कैसा महसूस करना चाहते हैं - दर्शनीय स्थलों की चेकलिस्ट नहीं। आज आप क्या चाह रहे हैं?';

  @override
  String get conciergeRefineStyle => 'मेरी शैली को परिष्कृत करें';

  @override
  String get conciergeRecallReturning => 'वापसी पर स्वागत है।';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'मुझे याद है आपको $prefs पसंद है।';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'और आप चाहते थे कि यह यात्रा महसूस हो: \"$feel\"।';
  }

  @override
  String get conciergePromptRomantic => 'रोमांटिक गेटवे';

  @override
  String get conciergePromptWellness => 'कल्याण रीसेट';

  @override
  String get conciergePromptFamily => 'पारिवारिक जादू';

  @override
  String get conciergePromptHiddenLuxury => 'छुपी हुई विलासिता';

  @override
  String get conciergePromptFoodie => 'खाने के शौकीन साहसिक';

  @override
  String get conciergePromptSoftLuxury => 'नरम लक्जरी पलायन';

  @override
  String get conciergePromptAdventure => 'साहसिक मोड';

  @override
  String get conciergePromptDisney => 'डिज़्नी आफ्टर-डार्क';

  @override
  String get discoverSearchHint => 'गंतव्य खोजें…';

  @override
  String get discoverSearchTitle => 'एक गंतव्य खोजें';

  @override
  String get discoverFromOrlando => 'ऑरलैंडो से';

  @override
  String discoverFromHub(String hub) {
    return '$hub से';
  }

  @override
  String get discoverSearchScopeAll =>
      'कैटलॉग में संपूर्ण फ्लोरिडा खोजा जा रहा है';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'ऑरलैंडो के $radius के भीतर';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return '$radius के $hub के भीतर';
  }

  @override
  String get discoverSearchEmpty =>
      'इस दायरे में कोई मिलान नहीं - एक छोटा नाम आज़माएं, मानचित्र या फ़ीड पर अपनी दूरी चिप को चौड़ा करें, या \"समुद्र तट\", \"डिज़नी\", या \"स्प्रिंग्स\" खोजें।';

  @override
  String get discoverFilterAll => 'सभी';

  @override
  String get discoverFilterHotels => 'होटल';

  @override
  String get discoverFilterRestaurants => 'रेस्टोरेंट';

  @override
  String get discoverFilterDestinations => 'स्थल';

  @override
  String get discoverPopularInRadius => 'आपके दायरे में लोकप्रिय';

  @override
  String get discoverTrySearching => 'खोजने का प्रयास करें';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return 'गंतव्यों की $count · ऑरलैंडो के $radius के भीतर';
  }

  @override
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return '$count गंतव्य · $radius के $hub के भीतर';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count गंतव्य · सभी फ़्लोरिडा';
  }

  @override
  String get radius25 => '25 मील';

  @override
  String get radius50 => '50 मील';

  @override
  String get radius100 => '100 मील';

  @override
  String get radiusAllFlorida => 'सारा फ्लोरिडा';

  @override
  String get radiusDesc25 => 'ऑरलैंडो कोर के आसपास दिन की यात्राएँ';

  @override
  String get radiusDesc50 => 'झरने, तट दिवस यात्राएँ, अंतरिक्ष तट';

  @override
  String get radiusDesc100 => 'टाम्पा खाड़ी, डेटोना, गहरी खाड़ी';

  @override
  String get radiusDescAll => 'कीज़, मियामी, राज्यव्यापी मुख्य आकर्षण';

  @override
  String get radiusDesc25Miami => 'साउथ बीच, ब्रिकेल और मुख्य पड़ोस';

  @override
  String get radiusDesc50Miami => 'विनवुड, कोकोनट ग्रोव, की बिस्केन';

  @override
  String get radiusDesc100Miami =>
      'एवरग्लेड्स, फोर्ट लॉडरडेल, गहरा दक्षिण फ्लोरिडा';

  @override
  String get radiusDescAllMiami =>
      'फ़्लोरिडा कीज़ ट्रेल और राज्यव्यापी मुख्य आकर्षण';

  @override
  String get radiusDesc25Keys => 'की लार्गो, इस्लामोराडा, और ऊपरी रीफ कॉरिडोर';

  @override
  String get radiusDesc50Keys => 'मैराथन, बिग पाइन और मध्य कीज़ समुद्र तट';

  @override
  String get radiusDesc100Keys => 'की वेस्ट के माध्यम से पूर्ण विदेशी राजमार्ग';

  @override
  String get radiusDescAllKeys => 'संपूर्ण द्वीप श्रृंखला और दिन-यात्रा जल';

  @override
  String get feedBadge => 'लाइव खोज';

  @override
  String get feedTitle => 'अनुभव फ़ीड';

  @override
  String get feedSubtitle =>
      'अभी क्या चल रहा है - ट्रेंडिंग स्पॉट, नए उद्घाटन, निर्माता की पसंद, मौसमी मार्ग और लाइव अपडेट।';

  @override
  String get feedSubtitleFamily =>
      'आपके दल के लिए परिवार-अनुकूल चयन - पार्क, आसान जीत, और बच्चों (और माता-पिता) के साथ बिताए गए क्षण।';

  @override
  String get feedPillTrending => 'रुझान';

  @override
  String get feedPillNewOpenings => 'नये उद्घाटन';

  @override
  String get feedPillCreator => 'निर्माता चुनता है';

  @override
  String get feedPillLive => 'लाइव अपडेट';

  @override
  String get feedMoodPrompt => 'आप कैसा महसूस करना चाहते हैं?';

  @override
  String get feedMoodPromptFamily =>
      'आज का दिन आपके दल के लिए कैसा महसूस होना चाहिए?';

  @override
  String get feedMoodAll => 'सब कुछ';

  @override
  String get feedMoodFamily => 'पारिवारिक जादू';

  @override
  String get feedMoodRomantic => 'प्रेम प्रसंगयुक्त';

  @override
  String get feedMoodCalm => 'शांत';

  @override
  String get feedMoodAdventurous => 'साहसी';

  @override
  String get feedMoodPampered => 'लाड़ प्यार';

  @override
  String get feedMoodSocial => 'गूंज';

  @override
  String get feedMoodFoodie => 'खाने का शौकीन';

  @override
  String get vibeSunsetReady => 'सूर्यास्त';

  @override
  String get vibeViral => 'वायरल';

  @override
  String get vibeFamilyApproved => 'परिवार';

  @override
  String get vibeHiddenGem => 'छिपा हीरा';

  @override
  String get vibeRainSafe => 'बारिश-सुरक्षित';

  @override
  String get vibeDateNight => 'डेट नाइट';

  @override
  String get vibeNightVibe => 'रात का माहौल';

  @override
  String get vibeFoodie => 'फ़ूडी';

  @override
  String get vibeLuxury => 'लक्ज़री';

  @override
  String get vibeTrending => 'ट्रेंडिंग';

  @override
  String get vibeLive => 'लाइव';

  @override
  String get vibeSeasonal => 'मौसमी';

  @override
  String get vibeLocalPick => 'स्थानीय';

  @override
  String get vibeAdventure => 'साहसिक';

  @override
  String get vibeWellness => 'वेलनेस';

  @override
  String get vibeBeachDay => 'बीच डे';

  @override
  String get vibeLuxoraPick => 'Luxora पसंद';

  @override
  String get mapLayersTitle => 'मानचित्र परत';

  @override
  String get mapLayerAll => 'सभी';

  @override
  String get mapLayerGems => 'रत्न';

  @override
  String get mapLayerNight => 'रात';

  @override
  String get mapLayerDateNight => 'डेट';

  @override
  String get mapLayerWeather => 'बेहतर मौसम';

  @override
  String get mapLayerItinerary => 'यात्रा कार्यक्रम';

  @override
  String get mapExpandMap => 'मानचित्र बड़ा करें';

  @override
  String get mapFullscreenTitle => 'मानचित्र';

  @override
  String get mapCloseFullscreen => 'मानचित्र बंद करें';

  @override
  String get mapItineraryDayLabel => 'इस दिन का कार्यक्रम दिखाएँ';

  @override
  String get mapItineraryCurrentDay => 'वर्तमान दिन';

  @override
  String get feedFamilyMoodHint =>
      'थीम पार्क, चरित्र भोजन, और आसान अभिभावक जीत - पारिवारिक टैग के लिए फ़िल्टर किए गए।';

  @override
  String get feedEmptyHint =>
      'इस दायरे में कोई फ़ीड कार्ड नहीं - खाड़ी तट और कीज़ हाइलाइट्स के लिए 50 मील या ऑल फ़्लोरिडा का प्रयास करें।';

  @override
  String get feedEmptyHintFamily =>
      'इस दायरे में कोई परिवार-टैग कार्ड नहीं - एडवेंचरस या एवरीथिंग आज़माएं, या दायरा बढ़ाएं।';

  @override
  String get gemsBadge => 'इनसाइडर क्यूरेशन';

  @override
  String get gemsTitle => 'छुपे हुए रत्न';

  @override
  String get gemsSubtitle =>
      'गुप्त खोजों पर स्थानीय लोग नजर रखते हैं - यह विशेष क्यों है, कब जाना है, इसमें कितनी भीड़ होती है, और युक्तियाँ जो आपको पोस्टकार्ड पर नहीं मिलेंगी।';

  @override
  String get gemsPillHidden => 'छुपे हुए स्थान';

  @override
  String get gemsPillLocal => 'स्थानीय केवल';

  @override
  String get gemsPillInsider => 'अंदरूनी सूत्र युक्तियाँ';

  @override
  String get gemsPillCrowd => 'भीड़ बुद्धि';

  @override
  String get gemsEmptyHint =>
      'इस दायरे में अभी तक कोई रत्न नहीं है - झरनों और अंतरिक्ष तट के रहस्यों के लिए इसे 50 मील या उससे अधिक तक बढ़ाया गया है।';

  @override
  String get gemsSearchHint => 'छिपे हुए रत्न और गंतव्य खोजें...';

  @override
  String get gemLocalSecret => 'स्थानीय रहस्य';

  @override
  String get gemsMatchedBadge => 'आपकी शैली';

  @override
  String gemsMatchedNote(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count रत्न आपकी शैली से मेल खाते हैं',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
  }

  @override
  String get gemWhySpecial => 'यह खास क्यों है?';

  @override
  String get gemBestTime => 'जाने का सबसे अच्छा समय';

  @override
  String get gemCrowdLevel => 'भीड़ का स्तर';

  @override
  String get gemInsiderTip => 'अंदरूनी सूत्र टिप';

  @override
  String get gemLocalNote => 'केवल स्थानीय नोट';

  @override
  String get mapBadge => 'एआई मानचित्र';

  @override
  String get mapTitle => 'आपका बुद्धिमान मार्ग';

  @override
  String get mapSubtitle =>
      'आपके चयनित दिन के लिए पिन - सोने के हीरे रत्न हैं, सियान मार्कर आज की समयरेखा हैं, सोने की रेखा मूड मार्ग है।';

  @override
  String get mapPlanDayTitle => 'मेरे दिन की योजना बनाएं';

  @override
  String get mapPlanDaySuggested =>
      'आपकी यात्रा के मूड के अनुसार सुझाए गए स्थान - इसे अपना बनाने के लिए स्थानों को बुकमार्क करें।';

  @override
  String get mapPlanDayEmpty =>
      'गंतव्यों को बुकमार्क करें (♥) और लक्सोरा आपके ऑरलैंडो हब से एक अनुकूलित मार्ग बनाता है - सबसे कम ड्राइविंग, सबसे अधिक अहसास।';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count रुकती है · $miles · $time ड्राइव';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return '$hotel से शुरू';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return 'पिछले पड़ाव से $time ड्राइव · $miles';
  }

  @override
  String get mapCrowdLevelQuiet => 'शांत';

  @override
  String get mapCrowdLevelModerate => 'मध्यम';

  @override
  String get mapCrowdLevelBusy => 'व्यस्त';

  @override
  String get mapCrowdLevelPacked => 'पैक्ड';

  @override
  String mapCrowdAtStop(String level) {
    return 'भीड़: $level';
  }

  @override
  String get mapParkingLevelEasy => 'आसान';

  @override
  String get mapParkingLevelModerate => 'मध्यम';

  @override
  String get mapParkingLevelDifficult => 'कठिन';

  @override
  String get mapParkingLevelLimited => 'सीमित · जल्दी पहुंचें';

  @override
  String mapParkingAtStop(String level) {
    return 'पार्किंग: $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return 'ड्राइव घर्षण: $score/90';
  }

  @override
  String get mapRerouteButton => 'शांत पड़ावों के लिए मार्ग पुनः बदलें';

  @override
  String mapRerouteApplied(int count) {
    return 'दिन समायोजित - हल्की भीड़ के लिए $count स्टॉप की अदला-बदली की गई।';
  }

  @override
  String get mapRerouteNone => 'आपका मार्ग पहले से ही शांत दिखता है.';

  @override
  String get mapRerouteRainHint =>
      'चिंता न करें — मैंने पास में विकल्प ढूँढ लिए हैं ताकि आपका दिन सुखद और तनाव-मुक्त रहे।';

  @override
  String get dayFlowSwapTitle => 'इस रोक को बदलो';

  @override
  String dayFlowSwapSubtitle(String current) {
    return 'लक्सोरा को बताएं कि आप $current के बजाय क्या करना चाहेंगे।';
  }

  @override
  String get dayFlowSwapTemplate => 'मैं कुछ और सोच रहा था जैसे...';

  @override
  String get dayFlowSwapHint =>
      'जैसे आज सुबह एक शांत पार्क, या रात के खाने के लिए समुद्री भोजन';

  @override
  String get dayFlowSwapApply => 'मेरा दिन अपडेट करें';

  @override
  String get dayFlowSwapViewPlace => 'वर्तमान स्टॉप देखें';

  @override
  String dayFlowSwapSuccess(String newStop, String phase) {
    return 'अपडेट किया गया - $newStop अब आपका $phase स्टॉप है।';
  }

  @override
  String get dayFlowSwapNoMatch =>
      'आस-पास कोई मिलान नहीं मिल सका - अधिक विशिष्ट होने का प्रयास करें।';

  @override
  String get dayFlowSwapTapToChange => 'इस रोक को बदलो';

  @override
  String get dayFlowSwapHoldSpeak => 'बोलने के लिए रुकें';

  @override
  String get dayFlowSwapListening => 'सुनना…';

  @override
  String get rightNowButton => 'हमें अभी क्या करना चाहिए?';

  @override
  String get rightNowEmpty =>
      'आपके दायरे में अभी तक कोई मजबूत क्षण नहीं है - कुछ पसंदीदा खोजें या बुकमार्क करें।';

  @override
  String get rightNowResultTitle => 'अभी';

  @override
  String get rightNowTapForDetails => 'विवरण के लिए टैप करें';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return 'आप $minutes से $district मिनट की दूरी पर हैं। मौसम उत्तम है - $place पर कॉफ़ी लें, फिर भीड़ आने से पहले $walkArea टहलें ($crowd भीड़)।';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return 'आप $minutes से $district मिनट की दूरी पर हैं। आसमान बहुत अच्छा लग रहा है - $place की ओर बढ़ें जबकि भीड़ अभी भी $crowd ही है।';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return 'स्वर्णिम समय आ रहा है - लगभग $minutes मिनट में $place (सूर्यास्त तक $crowd) के लिए प्रस्थान करें।';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return 'रडार पर बारिश - आरामदायक इनडोर पिक के लिए $minutes मिनट: $place।';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return 'झपकी-खिड़की शांत - $minutes पर एक आसान पारिवारिक रीसेट के लिए $place मिनट।';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return 'दिनांक-रात की ऊर्जा - भीड़ से पहले $minutes तक $place मिनट।';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return 'शांत खिड़की - $minutes तक $place मिनट (अभी $crowd)।';
  }

  @override
  String get goldenHourTitle => 'सुनहरे घंटे';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return '$time के लिए $minutes ($place मिनट की ड्राइव) से निकलें - सूर्यास्त से ~15 मिनट पहले पहुंचें।';
  }

  @override
  String get goldenHourKindBeach => 'समुद्रतट सूर्यास्त खिड़की';

  @override
  String get goldenHourKindRooftop => 'छत पर सुनहरा घंटा';

  @override
  String get goldenHourKindScenic => 'दर्शनीय फोटोग्राफी का समय';

  @override
  String get vacationScoreTitle => 'अवकाश स्कोर';

  @override
  String vacationScoreSubtitle(int score) {
    return 'आज का दिन $score/100 जैसा लगता है।';
  }

  @override
  String get onboardOccasionLabel => 'मौका क्या है?';

  @override
  String get onboardThemeParksOccasionHint =>
      'नीचे थीम-पार्क अवसरों को जोड़ने के लिए डिज़्नी और यूनिवर्सल को अनलॉक करें - आप खरीदारी के तुरंत बाद उन चिप्स को देखेंगे।';

  @override
  String get occasionGeneral => 'बस तलाश कर रहा हूँ';

  @override
  String get occasionAnniversary => 'सालगिरह';

  @override
  String get occasionHoneymoon => 'सुहाग रात';

  @override
  String get occasionDateNight => 'तिथि रात';

  @override
  String get occasionProposal => 'प्रस्ताव यात्रा';

  @override
  String get occasionFamily => 'बच्चों वाला परिवार';

  @override
  String get occasionDisneyAdventure => 'डिज्नी साहसिक';

  @override
  String get occasionUniversalAdventure => 'सार्वभौमिक साहसिक कार्य';

  @override
  String get localSecretTitle => 'स्थानीय रहस्य';

  @override
  String get localSecretWinterParkParkAvenue =>
      'स्थानीय लोग किताबों की दुकान के पीछे गली के आंगन में छिप गए - सड़क का कोई संकेत नहीं।';

  @override
  String get localSecretWorldFoodTrucks =>
      'दैनिक कैच का ऑर्डर करें, बर्गर का नहीं - दूर की खिड़की पर लाइन तेजी से चलती है।';

  @override
  String get localSecretWekiwaSprings =>
      'दोपहर 2 बजे के बाद मुख्य बोर्डवॉक छोड़ दें - उत्तरी ट्रेलहेड शांत रहता है।';

  @override
  String get localSecretDisneySpringsParking =>
      'सबसे अच्छी पार्किंग नारंगी गैराज है - मरीना की ओर चलें, मुख्य प्रवेश द्वार की ओर नहीं।';

  @override
  String get localSecretLakeEolaSunset =>
      'जैसे ही आकाश सुनहरा हो जाता है, हंस की तस्वीरों के लिए एम्फीथिएटर की ओर मुख करें।';

  @override
  String get localSecretMiamiWynwoodAlley =>
      'पैंथर कॉफ़ी के पीछे लोडिंग गली के माध्यम से बत्तख - स्थानीय लोग मुख्य लाइन की भीड़ के बिना भित्ति चित्र बनाते हैं।';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      'पहले विंडो कार्ट पर कैफ़ेसिटो खरीदें - जब आप कॉर्टैडिटो पकड़ रहे हों तो साइडलाइन बेंच नियमित रूप से खुलते हैं।';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      'मुख्य छत की भीड़ को छोड़ें - पूर्वी बगीचे से प्रवेश करें और मैंग्रोव बोर्डवॉक पर वामावर्त चलें।';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      'लुम्मस पर सुबह 7 बजे पूर्व की ओर मुख करें - ब्रंच भीड़ के आने से पहले आर्ट डेको पेस्टल चमकते हैं।';

  @override
  String get localSecretMiamiPantherAlley =>
      'खिड़की पर ऑर्डर करें, गली में दक्षिणावर्त चलें - सबसे अच्छा भित्ति प्रकाश सुबह 8:45 बजे फ़िरोज़ा दीवार से टकराता है।';

  @override
  String get localSecretTampaBayRiverwalkParking =>
      'Whiting Street गैरेज का उपयोग करें — घाट के पास बंद रास्तों से बचने के लिए नदी के किनारे दक्षिण चलें।';

  @override
  String get localSecretTampaBayClearwaterSunset =>
      'Pier 60 की भीड़ छोड़ें — सूर्यास्त से 40 मिनट पहले Sand Key पहुँचें।';

  @override
  String get localSecretTampaBayDaliGarden =>
      'दोपहर की अंतिम एंट्री बुक करें — पूर्वी garden overlook बिना भीड़ के पुल की रोशनी पकड़ता है।';

  @override
  String get localSecretTampaBayPierTiming =>
      'सप्ताह के दिन शाम 4 बजे pier entry — weekend stroller traffic के बिना sunset।';

  @override
  String get localSecretTampaBayYborCourtyard =>
      'Cuban sandwich to-go — 8 PM के बाद locals जो side street courtyard इस्तेमाल करते हैं वहाँ खाएँ।';

  @override
  String get localSecretTampaBaySpongeDocks =>
      'पहले dock पर lunch, फिर sponge boats — weekday 1 PM के बाद tours कम होते हैं।';

  @override
  String get localSecretVegasBellagioFountains =>
      'शो से 15 मिनट पहले बीच वाली घास पर खड़े रहें — सामने की रेल नृत्य दृश्य रोकती है।';

  @override
  String get localSecretVegasFremontTiming =>
      'कार्यदिवस रात 9 बजे canopy के नीचे — शनिवार भीड़ के बिना पूरा Viva Vision।';

  @override
  String get localSecretVegasCaesarsEntrance =>
      'पार्किंग गैरेज कनेक्टर — डिनर समय Strip भीड़ से बचें।';

  @override
  String get localSecretVegasVenetianWalk =>
      'दोपहर में छत वाले नहर वॉक — AC के साथ Strip पार без गर्मी चेतावनी।';

  @override
  String get nycMoodRoutesTitle => 'न्यू यॉर्क मूड रूट';

  @override
  String get localSecretNycTimesSquareStrategy =>
      '7वीं एवेन्यू की गलियों से प्रवेश — चौराहे की भीड़ से बचें, Broadway दृश्य बनाए रखें।';

  @override
  String get localSecretNycObservationDeck =>
      'सूर्यास्त से पहले अंतिम स्लॉट बुक करें — दोपहर की कतार के बिना सुनहरी रोशनी।';

  @override
  String get localSecretNycCentralParkEntrance =>
      '72nd Street ट्रांसवर्स — Columbus Circle भीड़ के बिना Bethesda तक तेज़ रास्ता।';

  @override
  String get localSecretNycBroadwayTickets =>
      'TKTS सुबह की लाइन जल्दी खुलती है — rush सीटें पर्यटक दरों से बेहतर।';

  @override
  String get localSecretNycBrooklynBridgePhoto =>
      'Washington Street DUMBO सुबह 8 बजे — टूर समूहों से पहले खाली cobblestone फ्रेम।';

  @override
  String get localSecretNycFerryGoldenHour =>
      'सूर्यास्त पर Staten Island फेरी — टूर बोट शुल्क के बिना मुफ्त बंदरगाह लूप।';

  @override
  String get momentsTitle => 'लक्सोरा क्षण';

  @override
  String get momentsSubtitle => 'एक भावना की खोज करें - एक जगह की नहीं।';

  @override
  String get momentFeelRelaxed => 'आराम महसूस करें';

  @override
  String get momentImpressSpouse => 'मेरे जीवनसाथी को प्रभावित करें';

  @override
  String get momentPerfectSunset => 'उत्तम सूर्यास्त';

  @override
  String get momentFamilyMemory => 'पारिवारिक स्मृति';

  @override
  String get momentLuxuryValue => 'अधिक खर्च किए बिना विलासिता';

  @override
  String get momentPromptRelaxed =>
      'मैं अगले कुछ घंटों के लिए पूरी तरह से आराम महसूस करना चाहता हूं - धीमा, सुंदर, कोई भीड़ नहीं।';

  @override
  String get momentPromptImpressSpouse =>
      'मैं आज रात अपने जीवनसाथी को किसी रोमांटिक और अप्रत्याशित चीज़ से प्रभावित करना चाहता हूँ।';

  @override
  String get momentPromptPerfectSunset =>
      'मैं फ़्लोरिडा में सूर्यास्त का सर्वोत्तम क्षण चाहता हूँ - हमें कहाँ होना चाहिए और हमें कब निकलना चाहिए?';

  @override
  String get momentPromptFamilyMemory =>
      'मैं एक यादगार पारिवारिक पल चाहता हूं जो माता-पिता के लिए आसान हो और बच्चों के लिए जादुई हो।';

  @override
  String get momentPromptLuxuryValue =>
      'मैं ऐसी विलासिता चाहता हूं जो बहुत अधिक खर्च किए बिना विशेष लगे।';

  @override
  String get visualShareImageButton => 'छवि कार्ड साझा करें';

  @override
  String get tripStoryTitle => 'आपकी यात्रा की कहानी';

  @override
  String tripStoryHeading(String title) {
    return '$title - आपकी फ़्लोरिडा कहानी';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return 'आप मूड के लिए आए हैं।';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return 'यह अध्याय: $title.';
  }

  @override
  String get tripStoryBeatClosing =>
      'लक्सोरा ने क्षणों को आकार दिया - आपने उन्हें जीया।';

  @override
  String get tripsOpenStory => 'आपकी कहानी';

  @override
  String get conciergeVoiceHold => 'बोलने के लिए रुकें';

  @override
  String get conciergeVoiceSoon =>
      'वॉयस कंसीयज जल्द ही आ रहा है - अभी के लिए, एक क्षण टैप करें या टाइप करें कि आप कैसा महसूस करना चाहते हैं।';

  @override
  String get conciergeVoiceListening => 'लक्सोरा सुन रहा है...';

  @override
  String get conciergeVoiceSpeaking => 'लक्सोरा बोल रही है...';

  @override
  String get conciergeVoiceRelease => 'भेजने के लिए जारी करें';

  @override
  String get conciergeVoiceSend => 'लक्सोरा को भेजें';

  @override
  String get conciergeVoiceProcessing => 'लक्सोरा भेजा जा रहा है...';

  @override
  String get conciergeVoiceNoSpeech =>
      'मैं उसे समझ नहीं पाया - बटन दबाए रखें, बोलें, फिर छोड़ें।';

  @override
  String get conciergeVoicePreviewFailed =>
      'पूर्वावलोकन नहीं चलाया जा सका. अपना वॉल्यूम जांचें और पुनः प्रयास करें।';

  @override
  String get conciergeVoiceUnavailable => 'इस डिवाइस पर आवाज़ उपलब्ध नहीं है.';

  @override
  String get conciergeVoiceSettingsTitle => 'लक्सोरा आवाज';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'चुनें कि जब लक्सोरा बोलती है तो उसकी आवाज़ कैसी होगी - उच्चारण, स्वर और गति। आपके डिवाइस की अंतर्निहित आवाज़ों का उपयोग करता है।';

  @override
  String get conciergeVoiceRateLabel => 'बोलने की गति';

  @override
  String get conciergeVoiceRateSlow => 'धीमा';

  @override
  String get conciergeVoiceRateNatural => 'प्राकृतिक';

  @override
  String get conciergeVoiceRateFast => 'तेज़';

  @override
  String get conciergeVoicePreview => 'आवाज का पूर्वावलोकन करें';

  @override
  String get conciergeVoicePreviewSample =>
      'नमस्ते - मैं लक्सोरा हूं। मुझे बताएं कि आप इस यात्रा को कैसा महसूस कराना चाहते हैं।';

  @override
  String get conciergeVoiceDeviceNote =>
      'iPhone सेटिंग्स → एक्सेसिबिलिटी → बोली जाने वाली सामग्री → वॉयस में अधिक आवाजें डाउनलोड करें। यहां लौटें और रिफ्रेश पर टैप करें।';

  @override
  String get conciergeVoiceDeviceSection => 'इस iPhone पर आवाज़ें';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'इसमें आपके द्वारा डाउनलोड की गई आवाजें शामिल हैं - लक्सोरा के लिए इसका उपयोग करने के लिए एक पर टैप करें।';

  @override
  String get conciergeVoiceRefreshList => 'ध्वनि सूची ताज़ा करें';

  @override
  String get conciergeVoiceShowAllLanguages => 'सभी भाषाएँ दिखाएँ';

  @override
  String get conciergeVoiceOpenSettings => 'iPhone वॉयस सेटिंग खोलें';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      'कोई आवाज नहीं मिली - सेटिंग्स में पैक डाउनलोड करें, फिर रीफ्रेश करें।';

  @override
  String get conciergeVoicePresetSection => 'त्वरित व्यक्तित्व';

  @override
  String get conciergeVoiceRegionRecommended => 'अनुशंसित';

  @override
  String get conciergeVoiceRegionEnglish => 'अंग्रेज़ी';

  @override
  String get conciergeVoiceRegionRussian => 'रूसी';

  @override
  String get conciergeVoiceRegionSpanish => 'स्पैनिश';

  @override
  String get conciergeVoiceRegionFrench => 'फ़्रेंच';

  @override
  String get conciergeVoiceRegionGerman => 'जर्मन';

  @override
  String get conciergeVoiceRegionOther => 'अन्य';

  @override
  String get conciergeVoicePresetMatchApp => 'ऐप की भाषा से मिलान करें · महिला';

  @override
  String get conciergeVoicePresetEnUsF => 'अमेरिकी · महिला';

  @override
  String get conciergeVoicePresetEnUsM => 'अमेरिकी · पुरुष';

  @override
  String get conciergeVoicePresetEnGbF => 'ब्रिटिश · महिला';

  @override
  String get conciergeVoicePresetEnGbM => 'ब्रिटिश · पुरुष';

  @override
  String get conciergeVoicePresetRuF => 'रूसी · स्त्री';

  @override
  String get conciergeVoicePresetRuM => 'रूसी · पुरुष';

  @override
  String get conciergeVoicePresetEsF => 'स्पैनिश · स्त्री';

  @override
  String get conciergeVoicePresetEsM => 'स्पैनिश · पुरुष';

  @override
  String get conciergeVoicePresetFrF => 'फ़्रेंच · महिला';

  @override
  String get conciergeVoicePresetFrM => 'फ़्रेंच · पुरुष';

  @override
  String get conciergeVoicePresetDeF => 'जर्मन · स्त्री';

  @override
  String get conciergeVoicePresetDeM => 'जर्मन · पुरुष';

  @override
  String get conciergeThinking => 'लक्सोरा सोच रही है...';

  @override
  String get conciergeItinerarySynced =>
      'मैंने इसे आपके एजेंडे में जोड़ दिया है - मानचित्र पर वही स्टॉप, साझा करने के लिए तैयार हैं।';

  @override
  String get conciergeAgendaUpdatedSnack =>
      'आपका एजेंडा मानचित्र और एजेंडा पर तैयार है';

  @override
  String get conciergeAgendaSyncFailed =>
      'मानचित्र व एजेंडा अपडेट नहीं हुआ। उदाहरण के लिए, एक स्पष्ट अनुरोध आज़माएँ: 4-दिवसीय डिज़्नी और यूनिवर्सल यात्रा की योजना बनाएं।';

  @override
  String get conciergeViewAgendaOnMap => 'एजेंडा देखें';

  @override
  String get conciergeAgendaDealsIntro =>
      'मैंने आपके एजेंडे में स्टॉप के लिए अधिकृत टिकट सौदों का मिलान किया है - गेट पर खरीदने से पहले तुलना करें:';

  @override
  String get conciergeAgendaDealsSnack =>
      'टिकट सौदे आपके एजेंडे से मेल खाते हैं';

  @override
  String get conciergeViewTicketDeals => 'सौदे देखें';

  @override
  String ticketAgendaMatchLine(String stop, String amount, String source) {
    return '$stop · अनुमानित रूप से $amount के माध्यम से $source बचाएं';
  }

  @override
  String ticketAgendaStopsSummary(int count) {
    return 'आपके एजेंडे में $count स्टॉप में साझेदार सौदे हैं - गेट पर खरीदने से पहले अधिकृत प्रस्तावों की तुलना करें।';
  }

  @override
  String ticketAgendaStopsSavings(String amount) {
    return 'ईएसटी। पारिवारिक बचत · $amount';
  }

  @override
  String get ticketBrowseAgendaDeals =>
      'अपने एजेंडे के लिए सौदे ब्राउज़ करें →';

  @override
  String get conciergeFreshThread =>
      'आपका एजेंडा मानचित्र और एजेंडा पर है. मैंने इस चैट को संग्रहीत कर लिया है और नए सिरे से शुरुआत की है - दिन में बदलाव करें, सौदे खोजें, या कुछ नया पूछें।';

  @override
  String get conciergeThreadArchivedSnack =>
      'चैट संग्रहीत - ताज़ा थ्रेड शुरू हुआ';

  @override
  String get conciergeNewConversationTooltip => 'नई बातचीत';

  @override
  String get itinerarySameAsMapAgenda =>
      'आज की द्वारपाल योजना - मानचित्र पर भी पिन की गई। नीचे दिवस कार्ड साझा करें।';

  @override
  String get conciergeTicketsFoundIntro =>
      'मुझे आपकी यात्रा के लिए अधिकृत टिकट सौदे मिले - सीधे लिंक के लिए एजेंडा पर टिकट बुक करें पर टैप करें:';

  @override
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  ) {
    return '• $title: $source के माध्यम से $price ($savings बचाएं)';
  }

  @override
  String get conciergeTicketsTimelineHint =>
      'एजेंडा पर प्रत्येक मिलान स्टॉप में अब पुनर्विक्रेता लिंक के साथ टिकट बुक करें बटन है।';

  @override
  String itineraryBookTickets(String amount) {
    return 'टिकट बुक करें · $amount बचाएं';
  }

  @override
  String get itineraryOpenTicketDeal => 'टिकट बनाओ';

  @override
  String conciergeTripSaved(String title) {
    return 'आपकी यात्राओं में \"$title\" सहेजा गया - इसे दोबारा देखने के लिए किसी भी समय ट्रिप्स टैब खोलें।';
  }

  @override
  String conciergeTripSavedWithStops(String title, int count) {
    return 'आपकी टाइमलाइन पर $title अनुभवों के साथ \"$count\" सहेजा गया।';
  }

  @override
  String conciergeSavedTripsIntro(int count) {
    return 'आपके पास सहेजी गई यात्राएं $count हैं:';
  }

  @override
  String conciergeSavedTripLine(String title, String dates, String status) {
    return '• $title ($dates) — $status';
  }

  @override
  String get conciergeSavedTripsEmpty =>
      'आपके पास अभी तक कोई भी यात्रा सहेजी नहीं गई है - मुझसे कुछ योजना बनाने के लिए कहें, फिर कहें \"मेरी यात्रा सहेजें।\"';

  @override
  String get conciergeSavedTripsHint =>
      'कार्ड देखने, साझा करने या तिथियाँ संपादित करने के लिए यात्राएँ टैब खोलें।';

  @override
  String get conciergeAiError =>
      'मैं अभी लक्सोरा नहीं पहुँच सका। अपना कनेक्शन जांचें और पुनः प्रयास करें।';

  @override
  String get conciergeAiErrorVoice =>
      'क्षमा करें - मैं अभी लक्सोरा के दरबान से संपर्क नहीं कर सका।';

  @override
  String get conciergeAiNotConfigured =>
      'लक्सोरा के लाइव कंसीयज को अभी तक इस बिल्ड पर वायर्ड नहीं किया गया है - सुपाबेस यूआरएल और एनॉन कुंजी को ऐप में बेक किया जाना चाहिए, और एज फ़ंक्शन को तैनात किया जाना चाहिए। मानचित्र और यात्रा कार्यक्रम अभी भी काम करते हैं; सेटअप के लिए docs/CONCIERGE_AI.md देखें।';

  @override
  String get conciergeAiOpenAiNotReady =>
      'लक्सोरा ने आपकी बात सुनी, लेकिन द्वारपाल मस्तिष्क अभी तक ऑनलाइन नहीं है। एज फ़ंक्शन (उज्ज्वल-प्रोसेसर) के लिए सुपरबेस रहस्यों में OPENAI_API_KEY सेट करें, फिर पुनः प्रयास करें।';

  @override
  String conciergeAiFunctionNotFound(String function) {
    return 'लक्सोरा को कंसीयज एज फ़ंक्शन \"$function\" नहीं मिल सका। इसे सुपाबेस में तैनात करें या इस बिल्ड पर SUPABASE_CONCIERGE_FUNCTION को ठीक करें।';
  }

  @override
  String get conciergeAiAuthFailed =>
      'लक्सोरा सुपाबेस के साथ प्रमाणित नहीं कर सका - दोबारा जांचें कि SUPABASE_ANON_KEY आपके प्रोजेक्ट से मेल खाता है।';

  @override
  String get mapAiPowers => 'एआई मानचित्र शक्तियाँ';

  @override
  String get mapNavLayerTitle => 'एआई नेविगेशन परत (अगला)';

  @override
  String get mapNavLayerSubtitle =>
      'खोज से परे - इस समय रुकना उचित है या नहीं, इस पर लाइव इंटेलिजेंस।';

  @override
  String get mapBookingTitle => 'निर्बाध बुकिंग (साझेदार)';

  @override
  String get mapCapMoodTitle => 'मूड आधारित मार्ग';

  @override
  String get mapCapMoodDesc =>
      'ऐसे रास्ते जो रोमांटिक, स्वास्थ्य, परिवार या रोमांच से मेल खाते हों - न कि केवल सबसे कम समय की ड्राइव के समय से।';

  @override
  String get mapCapDriveTitle => 'ड्राइव-समय अनुकूलन';

  @override
  String get mapCapDriveDesc =>
      'स्मार्ट अनुक्रमण ताकि आप हाइलाइट्स के बीच ट्रैफ़िक में बैठे रहने के बजाय, महसूस करने में समय व्यतीत करें।';

  @override
  String get mapCapWeatherTitle => 'मौसम के प्रति जागरूक सुझाव';

  @override
  String get mapCapWeatherDesc =>
      'समुद्र तटों, छतों और झरनों के लिए वर्षा बैकअप मार्ग और लाइव विंडो।';

  @override
  String get mapCapSunsetTitle => 'अभी सबसे अच्छा सूर्यास्त';

  @override
  String get mapCapSunsetDesc =>
      'जहां आकाश और भीड़ के पैटर्न के आधार पर अगले 90 मिनट में गोल्डन ऑवर सबसे अच्छा होता है।';

  @override
  String get mapCapCrowdTitle => 'भीड़ की भविष्यवाणी';

  @override
  String get mapCapCrowdDesc =>
      'जब पार्क, झरने और वायरल स्पॉट शांत हो जाएं - आपके पहुंचने से पहले।';

  @override
  String get mapCapGemsTitle => 'आस-पास छुपे हुए रत्न';

  @override
  String get mapCapGemsDesc =>
      'आपके मार्ग में इनसाइडर पिन सामने आए - न कि केवल शीर्ष-10 पर्यटक स्टॉप।';

  @override
  String get mapCapPersonalTitle => 'मार्ग वैयक्तिकरण';

  @override
  String get mapCapPersonalDesc =>
      'आपकी यात्रा का अनुभव, गति और बजट वास्तविक समय में मानचित्र को नया आकार देते हैं।';

  @override
  String get mapFutureCrowdTitle => 'लाइव भीड़ गर्मी';

  @override
  String get mapFutureCrowdDesc =>
      'झरनों, पार्कों और वायरल छतों पर वास्तविक समय घनत्व - अभी इसके लायक है?';

  @override
  String get mapFutureParkingTitle => 'पार्किंग की कठिनाई';

  @override
  String get mapFutureParkingDesc =>
      'आपके प्रतिबद्ध होने से पहले घर्षण स्कोर - वैलेट, गेराज, या राइडशेयर स्वीट स्पॉट।';

  @override
  String get mapFutureTrafficTitle => 'ड्राइव घर्षण स्कोर';

  @override
  String get mapFutureTrafficDesc =>
      'तनाव-भारित रूटिंग - न केवल मिनट, बल्कि ड्राइव कैसा महसूस करेगी।';

  @override
  String get mapFutureRerouteTitle => 'स्वतःस्फूर्त पुनः मार्ग';

  @override
  String get mapFutureRerouteDesc =>
      'मौसम में बदलाव या भीड़ में बढ़ोतरी? अपने शेष दिन को नया आकार देने के लिए एक टैप।';

  @override
  String affiliateReserve(String category) {
    return 'रिज़र्व · $category · प्रीमियम पार्टनर (जल्द ही)';
  }

  @override
  String get affiliateHotels => 'होटल और ठहरने की जगहें';

  @override
  String get affiliateExperiences => 'अनुभव और पर्यटन';

  @override
  String get affiliateRestaurants => 'रेस्तरां आरक्षण';

  @override
  String get affiliateThemeParks => 'थीम पार्क टिकट';

  @override
  String get affiliateDayPasses => 'रिज़ॉर्टपास / दिन गुजरता है';

  @override
  String get affiliateCarRentals => 'कार का किराया';

  @override
  String get affiliateWellness => 'कल्याण बुकिंग';

  @override
  String get tripsBadge => 'संग्रह';

  @override
  String get tripsTitle => 'सहेजी गई यात्राएँ';

  @override
  String get tripsSubtitle =>
      'लाइव स्नैपशॉट के लिए यात्रा पर टैप करें - अगला पल, मौसम, सूर्यास्त और समयरेखा।';

  @override
  String get tripsFooter => 'मूड कैटलॉग से यात्रा कवर · सुपाबेस सिंक चरण 2';

  @override
  String get tripsPlanNew => 'नई यात्रा की योजना बनाएं';

  @override
  String get tripsEmptyTitle => 'अभी तक कोई सहेजी गई यात्रा नहीं';

  @override
  String get tripsEmptyBody =>
      'अपनी पहली यात्रा की योजना बनाएं और वह यहां दिखाई देगी, किसी भी समय दोबारा आने के लिए तैयार।';

  @override
  String get tripsDeleteTitle => 'यात्रा हटाएं?';

  @override
  String tripsDeleteBody(String title) {
    return 'यह आपकी सहेजी गई यात्राओं से \"$title\" हटा देता है। इसे पूर्ववत नहीं किया जा सकता.';
  }

  @override
  String get tripsDeleted => 'यात्रा हटा दी गई';

  @override
  String get tripsEditDates => 'यात्रा की तारीखें';

  @override
  String get tripsSaveDates => 'तारीखें सहेजें';

  @override
  String get tripsDatesUpdated => 'यात्रा की तारीखें अपडेट की गईं';

  @override
  String get tripsDatesFlexible => 'तारीखें लचीली हैं';

  @override
  String get tripsLiveWeather => 'लाइव मौसम';

  @override
  String get tripsNextUp => 'अगला';

  @override
  String get tripsSunsetWindow => 'सूर्यास्त खिड़की';

  @override
  String get tripsTimelineSnapshot => 'टाइमलाइन स्नैपशॉट';

  @override
  String get tripsOpenAgenda => 'पूरा एजेंडा खोलें';

  @override
  String get tripsOpenTimeline => 'पूर्ण टाइमलाइन खोलें';

  @override
  String get tripsShare => 'शेयर करना';

  @override
  String get shareItineraryFooter =>
      'लक्सोरा के साथ योजना बनाई गई - आपका भावनात्मक रूप से बुद्धिमान फ्लोरिडा साथी।';

  @override
  String get shareCardCta => 'लक्सोरा में अपनी योजना बनाएं';

  @override
  String get shareCardDownloadHint =>
      'आईओएस और एंड्रॉइड पर निःशुल्क · luxora.ai/download';

  @override
  String shareCardShareMessage(String title, String url) {
    return '$title\n\nलक्सोरा एआई के साथ योजना बनाई गई - भावनात्मक रूप से बुद्धिमान फ्लोरिडा यात्रा।\nऐप प्राप्त करें: $url';
  }

  @override
  String get conciergeLocalTryPlanning =>
      'मुझे बताएं कि आप यात्रा को कैसा महसूस कराना चाहते हैं - उदा. \"झरनों और भोजन के साथ आरामदेह 2-दिवसीय ऑरलैंडो यात्रा की योजना बनाएं।\" मैं आपके डिवाइस पर एक वास्तविक एजेंडा बनाऊंगा (क्लाउड की आवश्यकता नहीं)।';

  @override
  String conciergeLocalPlanBuilt(String city, int count) {
    return 'मैंने आपका $city दिन बनाया - $count मूड और ड्राइव के समय के आधार पर रुकना। अपना मार्ग देखने के लिए एजेंडा या मानचित्र खोलें।';
  }

  @override
  String get conciergeLocalNoIntent =>
      'आप जो भावना चाहते हैं उसका वर्णन करें - या कहें \"मेरे ऑरलैंडो दिवस की योजना बनाएं\" - और मैं डिवाइस पर एक वास्तविक मार्ग बनाऊंगा।';

  @override
  String get ticketConciergeIntelBadge => 'द्वारपाल बुद्धि';

  @override
  String get ticketConciergeIntelAgenda =>
      'आपके एजेंडा स्टॉप से ​​मिलान - सामान्य कूपन सूची नहीं।';

  @override
  String get agendaFixAfternoonRain => 'बारिश आ रही है - मेरी दोपहर ठीक करो';

  @override
  String agendaRainRerouteDone(int count, int score) {
    return 'दोपहर अद्यतन - $count स्टॉप को घर के अंदर ले जाया गया। अवकाश स्कोर $score/100.';
  }

  @override
  String get agendaRainRerouteNone =>
      'आपकी योजना इस मौसम के लिए पहले से ही काम करती है।';

  @override
  String get cloudTripsTitle => 'मेघ बैकअप';

  @override
  String get cloudTripsSubtitle =>
      'जब आप साइन इन करते हैं तो आपकी सहेजी गई यात्राएं सभी डिवाइसों में सिंक हो जाती हैं - किसी भी शहर अनलॉक के साथ शामिल होती हैं।';

  @override
  String get cloudTripsMoreSubSignedOut =>
      'सहेजी गई यात्राओं का बैकअप लेने के लिए साइन इन करें';

  @override
  String cloudTripsMoreSubSignedIn(String email) {
    return '$email के रूप में साइन इन किया गया';
  }

  @override
  String get cloudTripsMoreSubSyncing => 'सिंक हो रहा है...';

  @override
  String get cloudTripsUnlockRequired =>
      'क्लाउड बैकअप सक्षम करने के लिए सिटी पैक अनलॉक करें';

  @override
  String get cloudTripsUnlockCta => 'दरबान को अनलॉक करें';

  @override
  String get cloudTripsEmailHint => 'मेल पता';

  @override
  String get cloudTripsSendCode => 'साइन-इन कोड भेजें';

  @override
  String get cloudTripsCodeHint => 'ईमेल से 6 अंकीय कोड';

  @override
  String get cloudTripsVerify => 'सत्यापित करें और साइन इन करें';

  @override
  String get cloudTripsCodeSent => 'साइन-इन कोड के लिए अपना ईमेल जांचें';

  @override
  String get cloudTripsSignOut => 'साइन आउट';

  @override
  String get cloudTripsSyncNow => 'अभी सिंक करें';

  @override
  String get cloudTripsSyncSuccess => 'यात्राएँ समन्वयित हुईं';

  @override
  String get cloudTripsSyncError => 'समन्वयन विफल - पुनः प्रयास करें';

  @override
  String get cloudTripsBannerTitle => 'अपनी यात्राओं का बैकअप लें';

  @override
  String get cloudTripsBannerBody =>
      'नए फ़ोन या टैबलेट पर यात्राएँ बहाल करने के लिए साइन इन करें।';

  @override
  String get cloudTripsBannerCta => 'क्लाउड बैकअप सेट करें';

  @override
  String get cloudTripsNotConfigured =>
      'क्लाउड बैकअप के लिए सुपाबेस (डेव सेटअप) की आवश्यकता होती है';

  @override
  String get paywallFeatureCloudBackup => 'क्लाउड ट्रिप बैकअप';

  @override
  String shareSubject(String title) {
    return 'मेरा $title';
  }

  @override
  String get itineraryBadge => 'तुम्हारी टाइमलाइन';

  @override
  String get itineraryTagline =>
      'हर पल जुड़ा हुआ है - प्रत्याशा अंतर्निहित है, तनाव दूर है।';

  @override
  String itineraryDayTab(int day, String label) {
    return 'दिन $day · $label';
  }

  @override
  String get detailWhySpecial => 'यह विशेष क्यों है?';

  @override
  String get detailBestTime => 'जाने का सर्वोत्तम समय';

  @override
  String get detailInsiderTips => 'अंदरूनी सूत्र युक्तियाँ';

  @override
  String get detailReserve => 'अनुभव सुरक्षित रखें';

  @override
  String get detailReserveSoon => 'आरक्षण भागीदार जल्द ही आ रहे हैं।';

  @override
  String get detailNearbyGems => 'निकटवर्ती रत्न';

  @override
  String get detailDuration => 'अवधि';

  @override
  String get detailPractical => 'व्यावहारिक विवरण';

  @override
  String get detailCostRange => 'लागत सीमा';

  @override
  String get detailBestFor => 'के लिए सर्वोत्तम';

  @override
  String get detailVibeMatch => 'वाइब मैच';

  @override
  String get detailCrowd => 'भीड़';

  @override
  String get detailTravelIntelTitle => 'यात्रा घर्षण दृष्टिकोण';

  @override
  String get detailTravelIntelSubtitle =>
      'श्रेणी, समय और दूरी से भविष्यवाणी की जाती है - लाइव सेंसर से नहीं।';

  @override
  String detailCrowdOutlook(String level) {
    return 'भीड़: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return 'पार्किंग: $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return 'ड्राइव घर्षण: $score/90';
  }

  @override
  String get detailPrice => 'कीमत';

  @override
  String get detailLocation => 'जगह';

  @override
  String get detailGetDirections => 'दिशा - निर्देश प्राप्त करें';

  @override
  String get detailParkMap => 'पार्क का नक्शा';

  @override
  String get detailViewOnMap => 'मानचित्र पर देखें';

  @override
  String get detailMapsError => 'इस उपकरण पर मानचित्र नहीं खोले जा सके.';

  @override
  String get detailGoogleMaps => 'गूगल मैप्स';

  @override
  String get detailAppleMaps => 'एप्पल मानचित्र';

  @override
  String get detailOpenInMaps => 'मानचित्रों में खोलें';

  @override
  String detailDriveFromOrlando(String time) {
    return 'ऑरलैंडो से $time ड्राइव';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '$time $hub से ड्राइव करें';
  }

  @override
  String get detailSaveToItinerary => 'यात्रा कार्यक्रम में सहेजें';

  @override
  String get detailSaved => 'सहेजा गया';

  @override
  String get detailSavedSnack => 'आपके यात्रा कार्यक्रम में सहेजा गया';

  @override
  String get detailRemovedSnack => 'आपके यात्रा कार्यक्रम से हटा दिया गया';

  @override
  String get detailSetHomeBase => 'होम बेस के रूप में सेट करें';

  @override
  String get detailHomeBaseActive => 'आपकी यात्रा का घरेलू आधार';

  @override
  String get detailHomeBaseHint =>
      'आपके दिन का मार्ग यहीं से शुरू और समाप्त होता है।';

  @override
  String get detailHomeBaseSetSnack =>
      'अपनी यात्रा के घरेलू आधार के रूप में सेट करें';

  @override
  String get detailHomeBaseClearedSnack => 'गृह आधार साफ़ हो गया';

  @override
  String get detailMenuTitle => 'मेनू हाइलाइट्स';

  @override
  String get detailMenuDisclaimer =>
      'चयनित हाइलाइट्स - आयोजन स्थल पर पूरा मेनू और कीमतें भिन्न हो सकती हैं।';

  @override
  String get detailMenuComingSoon =>
      'हम अभी भी इस मेनू को क्यूरेट कर रहे हैं। इस बीच नवीनतम मेनू और कीमतें ऑनलाइन देखें।';

  @override
  String get detailViewMenuOnline => 'मेनू ऑनलाइन देखें';

  @override
  String get photoClose => 'बंद करना';

  @override
  String get photoViewDestination => 'गंतव्य देखें';

  @override
  String get photoBy => 'द्वारा तसवीर';

  @override
  String get photoOn => 'पर';

  @override
  String milesFromOrlando(String distance) {
    return 'ऑरलैंडो से $distance';
  }

  @override
  String milesFromHub(String distance, String hub) {
    return '$distance से $hub';
  }

  @override
  String get landingBadge => 'फ्लोरिडा · ऑरलैंडो एमवीपी';

  @override
  String get landingTitle1 => 'छुट्टियाँ';

  @override
  String get landingTitle2 => 'पहले ही शुरू हो चुका है.';

  @override
  String get landingSubtitle =>
      'लक्सोरा एआई आपकी भावनात्मक रूप से बुद्धिमान दरबान है - छिपे हुए रत्न, छत पर सूर्यास्त, और आपके पैक करने से पहले अविस्मरणीय महसूस करने के लिए डिज़ाइन किए गए क्षण।';

  @override
  String get landingBegin => 'मेरी यात्रा शुरू करें';

  @override
  String get landingTalk => 'लक्सोरा से बात करो';

  @override
  String get landingWhy => 'हम इसका निर्माण क्यों कर रहे हैं?';

  @override
  String get storyTitle => 'हमारी कहानी';

  @override
  String get storyHeroBadge => 'इरादे से बनाया गया';

  @override
  String get storyHeroCreator => 'निर्माता, लक्सोरा एआई';

  @override
  String get storyHeroSubtitle => 'फ़्लोरिडा · भावना-पहली यात्रा';

  @override
  String get storyHeading => 'हम लक्ज़ोरा का निर्माण क्यों कर रहे हैं?';

  @override
  String get storyProblemLead =>
      'हमने महसूस किया कि फ्लोरिडा/ऑरलैंडो यात्रा की योजना बनाना आश्चर्यजनक रूप से खंडित और बोझिल है।';

  @override
  String get storyJumpingBetween => 'लोग आमतौर पर बीच में कूद पड़ते हैं';

  @override
  String get storyProblemTail =>
      '...और फिर भी सामान्य पर्यटक योजनाओं के साथ समाप्त हो जाते हैं।';

  @override
  String get storyDifferentLead => 'हम कुछ अलग बनाना चाहते हैं.';

  @override
  String get storyNotPlannerTitle => 'सिर्फ एक यात्रा योजनाकार नहीं';

  @override
  String get storyNotPlannerBody => 'एक भावना-प्रथम एआई यात्रा साथी।';

  @override
  String get storyInsteadOfAsking => 'पूछने के बजाय';

  @override
  String get storyAppAsks => 'ऐप पूछता है';

  @override
  String get storyInsteadQuestion => '\"मेँ कहां जाऊं?\"';

  @override
  String get storyFeelQuestion =>
      '\"आप इस यात्रा को कैसा महसूस कराना चाहते हैं?\"';

  @override
  String get storyMoodBuildLine =>
      'फिर AI उस मनोदशा के इर्द-गिर्द एक वैयक्तिकृत अनुभव बनाता है।';

  @override
  String get storyFloridaFirstTitle => 'फ्लोरिडा/ऑरलैंडो पहले क्यों?';

  @override
  String get storyFloridaFirstLead => 'ऑरलैंडो एक आदर्श परीक्षण बाज़ार है:';

  @override
  String get storyVisionTitle => 'हमारा नज़रिया';

  @override
  String get storyVisionLead => 'मिलाना:';

  @override
  String get storyVisionCard =>
      'तो ऐप एक लक्जरी एआई कंसीयज के करीब महसूस करता है - एक और उबाऊ यात्रा कार्यक्रम उपकरण नहीं।';

  @override
  String get storyLongTermTitle => 'दीर्घकालिक अवसर';

  @override
  String get storySourceGoogleMaps => 'गूगल मैप्स';

  @override
  String get storySourceTikTok => 'टिकटोक';

  @override
  String get storySourceInstagram => 'इंस्टाग्राम रील्स';

  @override
  String get storySourceTravelBlogs => 'यात्रा ब्लॉग';

  @override
  String get storySourceRestaurantApps => 'रेस्टोरेंट ऐप्स';

  @override
  String get storySourceWeatherApps => 'मौसम ऐप्स';

  @override
  String get storySourceTicketSites => 'टिकट वेबसाइटें';

  @override
  String get storySourceTop10 => 'यादृच्छिक \"शीर्ष 10 ऑरलैंडो\" लेख';

  @override
  String get storyBulletMarket => 'विशाल पर्यटन बाज़ार';

  @override
  String get storyBulletAudience =>
      'परिवार, जोड़े, लक्जरी यात्री, और कल्याण यात्री';

  @override
  String get storyBulletOptions =>
      'अंतहीन रेस्तरां, रिसॉर्ट्स, छिपे हुए रत्न, थीम पार्क, झरने और नाइटलाइफ़';

  @override
  String get storyBulletRepeat => 'उच्च बार-बार आने का व्यवहार';

  @override
  String get storyBulletLogisticsGap =>
      'अधिकांश ट्रैवल ऐप्स लॉजिस्टिक्स पर ध्यान केंद्रित करते हैं - अनुभव डिजाइन पर नहीं';

  @override
  String get storyPillarAiItinerary => 'एआई यात्रा कार्यक्रम पीढ़ी';

  @override
  String get storyPillarMoodPlanning => 'मूड-आधारित यात्रा योजना';

  @override
  String get storyPillarLiveDiscovery => 'लाइव खोज और ट्रेंडिंग अनुभव';

  @override
  String get storyPillarHiddenGems => 'छिपे हुए स्थानीय रत्न';

  @override
  String get storyPillarRouting => 'स्मार्ट रूटिंग';

  @override
  String get storyPillarWeatherSunset => 'मौसम और सूर्यास्त की जानकारी';

  @override
  String get storyPillarPremiumUx => 'प्रीमियम सौंदर्यपरक UX';

  @override
  String get storyOpportunityMultilingual => 'बहुभाषी विस्तार';

  @override
  String get storyOpportunityAffiliate => 'संबद्ध एवं बुकिंग भागीदारी';

  @override
  String get storyOpportunityInventory => 'रेस्तरां, अनुभव और टिकट';

  @override
  String get storyOpportunitySubscriptions => 'प्रीमियम सदस्यताएँ';

  @override
  String get storyOpportunityScale =>
      'फ़्लोरिडा से आगे स्केलेबल → अन्य गंतव्य बाद में';

  @override
  String get landingValues => 'यादें · भावना · पलायन · संबंध';

  @override
  String get landingRegionBadge => 'लॉन्च क्षेत्र';

  @override
  String get landingRegionTitle =>
      'ऑरलैंडो और फ्लोरिडा - महसूस करने के लिए क्यूरेट किया गया';

  @override
  String get onboardFinish => 'अपने द्वारपाल से मिलें';

  @override
  String get onboardBuilding => 'आपका adventure बन रहा है…';

  @override
  String get onboardStep1Title => 'जहां सपने सबसे पहले उतरते हैं';

  @override
  String get onboardStep1Subtitle => 'आपकी मंज़िल किधर है?';

  @override
  String get onboardDestination => 'गंतव्य';

  @override
  String get onboardRegion => 'क्षेत्र';

  @override
  String get onboardCityLabel => 'अपना शहर चुनें';

  @override
  String get onboardCityUnlockNote =>
      'प्रत्येक गंतव्य का अपना द्वारपाल अनलॉक होता है - प्रति शहर एक बार की खरीदारी।';

  @override
  String get landingCityLabel => 'आप कहां जा रहे हैं?';

  @override
  String get paywallSwitchCity => 'गंतव्य';

  @override
  String get cityPickerUnlocked => 'अनलॉक किया';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'अनलॉक $price';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'ऑरलैंडो ऐड-ऑन · डिज़्नी और यूनिवर्सल एक साथ';

  @override
  String get onboardStep2Title => 'स्वतंत्र महसूस करने का समय';

  @override
  String get onboardStep2Subtitle => 'आपका पलायन कब शुरू होता है?';

  @override
  String get onboardStartDateLabel => 'आरंभ करने की तिथि';

  @override
  String get onboardEndDateLabel => 'अंतिम तिथि';

  @override
  String get onboardPickDate => 'चुनने के लिए टैप करें';

  @override
  String get onboardSelectStartDate => 'आरंभ तिथि चुनें';

  @override
  String get onboardSelectEndDate => 'अंतिम तिथि चुनें';

  @override
  String get onboardDatesHint =>
      'आप इन्हें अपने ट्रिप्स टैब से कभी भी बदल सकते हैं।';

  @override
  String get onboardStepBudgetTitle => 'आराम से योजना बनाएं';

  @override
  String get onboardStepBudgetSubtitle => 'इस पलायन के लिए क्या सही लगता है?';

  @override
  String get onboardBudget => 'यात्रा बजट (USD)';

  @override
  String get onboardStep3Title => 'कहानी कौन साझा करता है';

  @override
  String get onboardStep3Subtitle => 'आपके साथ कौन यात्रा कर रहा है?';

  @override
  String get onboardTravelers => 'यात्री';

  @override
  String get onboardStep4Title => 'आपकी लय';

  @override
  String get onboardStep4Subtitle => 'आपके दिन कैसे बीतने चाहिए?';

  @override
  String get onboardNightlife => 'रात्रिजीवन रुचि';

  @override
  String get onboardFoodie => 'खाने का शौक';

  @override
  String get onboardPoolside => 'पूलसाइड और डाउनटाइम';

  @override
  String get onboardAdventure => 'साहसिक और आउटडोर';

  @override
  String get onboardCulture => 'संस्कृति एवं दर्शनीय स्थल';

  @override
  String get dayFlowSubtitle =>
      'आप कैसा महसूस करना चाहते हैं इसके आधार पर एक दिन तय होता है - कोई चेकलिस्ट नहीं।';

  @override
  String get dayFlowMorning => 'सुबह';

  @override
  String get dayFlowMidday => 'दोपहर';

  @override
  String get dayFlowAfternoon => 'दोपहर';

  @override
  String get dayFlowEvening => 'शाम';

  @override
  String get dayFlowNight => 'रात';

  @override
  String get dayFlowReasonMorningPool =>
      'दिन शुरू होने से पहले धीरे-धीरे आराम करें - पूल के किनारे या स्पा में।';

  @override
  String get dayFlowReasonMorningCalm =>
      'माहौल सेट करने के लिए एक सौम्य शुरुआत.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'चरम ऊर्जा घंटे - जब आप तरोताजा हों तो बड़ा रोमांच।';

  @override
  String get dayFlowReasonMiddayCulture =>
      'रोशनी तेज होने पर दर्शनीय स्थलों की यात्रा करें।';

  @override
  String get dayFlowReasonMiddayIcon => 'दिन का हस्ताक्षर क्षण.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'रिचार्ज करने के लिए दोपहर का डाउनटाइम।';

  @override
  String get dayFlowReasonAfternoonGem => 'भीड़ से दूर एक छिपा हुआ रत्न।';

  @override
  String get dayFlowReasonEveningDining => 'दिन का भोजन - आपका पसंदीदा भोजन।';

  @override
  String get dayFlowReasonNightOut => 'एक आखिरी चमक - एक रात बाहर।';

  @override
  String weatherToday(String place) {
    return 'अभी $place में';
  }

  @override
  String weatherSunset(String time) {
    return 'सूर्यास्त $time';
  }

  @override
  String weatherRainNote(int percent) {
    return 'वर्षा की $percent% संभावना - एक हल्की परत पैक करें।';
  }

  @override
  String get weatherConditionClear => 'स्पष्ट';

  @override
  String get weatherConditionPartlyCloudy => 'आंशिक रूप से बादल छाएंगे';

  @override
  String get weatherConditionCloudy => 'बादलों से घिरा';

  @override
  String get weatherConditionFog => 'कोहरा';

  @override
  String get weatherConditionDrizzle => 'बूंदा बांदी';

  @override
  String get weatherConditionRain => 'बारिश';

  @override
  String get weatherConditionSnow => 'बर्फ';

  @override
  String get weatherConditionThunder => 'गरज के साथ वर्षा';

  @override
  String get weatherConciergeTitle => 'मौसम द्वारपाल';

  @override
  String get weatherConciergeTapHint =>
      'यात्रा-जागरूक पूर्वानुमान के लिए टैप करें';

  @override
  String get weatherConciergeAdviceTitle => 'लक्सोरा मौसम सलाह';

  @override
  String weatherFeelsLike(String temp) {
    return '$temp जैसा महसूस होता है';
  }

  @override
  String get weatherHumidity => 'नमी';

  @override
  String get weatherWind => 'हवा';

  @override
  String weatherWindValue(String dir, int speed) {
    return '$dir $speed मील प्रति घंटे पर';
  }

  @override
  String get weatherUv => 'यूवी सूचकांक';

  @override
  String get weatherCloudCover => 'बादल मूंदना';

  @override
  String get weatherVisibility => 'दृश्यता';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$miles मील';
  }

  @override
  String weatherSunrise(String time) {
    return 'सूर्योदय $time';
  }

  @override
  String get weatherStatRain => 'बारिश';

  @override
  String get weatherWhatToBring => 'आज क्या लाना है';

  @override
  String get weatherPlanImpact => 'आपकी योजना पर प्रभाव';

  @override
  String get weatherHourlyTitle => 'प्रति घंटा दृष्टिकोण';

  @override
  String get weatherHourlyUnavailable =>
      'डेटा लोड होने पर प्रति घंटा पूर्वानुमान दिखाई देगा.';

  @override
  String get weatherLiveRadar => 'लाइव राडार';

  @override
  String get weatherRadarComingSoon => 'लाइव राडार जल्द ही आ रहा है।';

  @override
  String get weatherRadarPlay => 'लूप खेलें';

  @override
  String get weatherRadarPause => 'लूप रोकें';

  @override
  String get weatherRadarTapToExpand => 'पूर्ण स्क्रीन के लिए टैप करें';

  @override
  String get weatherRadarNow => 'अब';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return '$minutes मिनट पहले';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes मिनट';
  }

  @override
  String get weatherRadarStepBack => 'पहले का फ्रेम';

  @override
  String get weatherRadarStepForward => 'बाद में फ्रेम';

  @override
  String get weatherRadarJumpNow => 'अब';

  @override
  String get weatherRadarJump1h => '−1 घंटा';

  @override
  String get weatherRadarJump2h => '−2 घंटा';

  @override
  String get weatherRadarJump30m => '+30 मिनट';

  @override
  String get weatherRadarSpeedSlow => 'धीमा';

  @override
  String get weatherRadarSpeedNormal => 'सामान्य';

  @override
  String get weatherRadarSpeedFast => 'तेज़';

  @override
  String get weatherRadarLoopNote =>
      'रडार लूप: 10 मिनट के चरणों में ~2 घंटे पार करना, साथ ही उपलब्ध होने पर छोटी दूरी का नाउकास्ट - 4 घंटे का पूर्वानुमान नहीं।';

  @override
  String get shareMapPreviewCaption =>
      'मानचित्र पूर्वावलोकन · लाइव दिशा-निर्देशों के लिए लक्सोरा में खुला';

  @override
  String get shareRadarPreviewCaption =>
      'लाइव डॉपलर रडार · पूरे लूप के लिए लक्सोरा में खुला';

  @override
  String get weatherMapOverlays => 'मानचित्र ओवरले';

  @override
  String get weatherOverlayPrecip => 'वर्षण';

  @override
  String get weatherOverlayTemp => 'तापमान';

  @override
  String get weatherOverlayWind => 'हवा';

  @override
  String get weatherOverlayCloud => 'बादल मूंदना';

  @override
  String get weatherComingSoon => 'जल्द आ रहा है';

  @override
  String get weatherAdjustDay => 'मौसम के अनुसार मेरा दिन समायोजित करें';

  @override
  String get weatherBestOutdoorWindow => 'सर्वोत्तम बाहरी खिड़की';

  @override
  String get weatherRainWindow => 'बारिश की संभावना';

  @override
  String get weatherSunsetRec => 'सूर्यास्त की सिफ़ारिश';

  @override
  String weatherOutdoorAtRisk(int count) {
    return '$count आउटडोर स्टॉप प्रभावित हो सकते हैं';
  }

  @override
  String get weatherIndoorBackup => 'इनडोर बैकअप विचार';

  @override
  String get weatherAdviceLightJacket => 'आज शाम एक हल्का जैकेट लेकर आएं।';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return '$time से पहले बाहरी गतिविधियों की योजना बनाएं।';
  }

  @override
  String get weatherAdviceHighUv =>
      'आज उच्च यूवी - सनस्क्रीन लाएँ और दोपहर में लंबे समय तक सीधे धूप में रहने से बचें।';

  @override
  String get weatherAdviceRainLater =>
      'आज बाद में बारिश का खतरा बढ़ जाता है, इसलिए इनडोर अनुभवों को दोपहर में स्थानांतरित करें।';

  @override
  String get weatherAdviceWindBeach =>
      'हवा आज समुद्र तट या नाव गतिविधियों को कम आरामदायक बना सकती है।';

  @override
  String get weatherAdviceGreatSunset =>
      'आज रात सूर्यास्त की शानदार स्थितियाँ - छत पर रात्रिभोज या झील की सैर पर विचार करें।';

  @override
  String get weatherAdviceDefault =>
      'आसमान प्रबंधनीय दिखता है - अपनी योजना का पालन करें और एक हल्की परत अपने पास रखें।';

  @override
  String weatherSunsetRecRooftop(String time) {
    return '$time के पास आसमान साफ़ हो सकता है - छत पर रात्रिभोज या झील की सैर चमक सकती है।';
  }

  @override
  String get weatherPackSunscreen => 'सनस्क्रीन';

  @override
  String get weatherPackSunglasses => 'धूप का चश्मा';

  @override
  String get weatherPackUmbrella => 'छाता';

  @override
  String get weatherPackLightJacket => 'हल्की जैकेट';

  @override
  String get weatherPackShoes => 'आरामदायक जूतें';

  @override
  String get weatherPackWater => 'पानी की बोतल';

  @override
  String get weatherPackHat => 'टोपी';

  @override
  String get weatherPackPoncho => 'पोंचो';

  @override
  String get weatherPackSwimwear => 'तैराकी पोशाक';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return '$time के बाद बारिश का खतरा बढ़ जाता है। $outdoorStop को पहले ले जाने और बाद के लिए $indoorStop को सहेजने पर विचार करें।';
  }

  @override
  String weatherImpactHeat(String time) {
    return 'दोपहर में तेज़ गर्मी - $time से पहले आउटडोर सैर की योजना बनाएं।';
  }

  @override
  String get weatherImpactClear =>
      'आज सुबह आसमान आपकी बाहरी योजनाओं के लिए अनुकूल दिख रहा है।';

  @override
  String weatherImpactMixed(int count) {
    return '$count आउटडोर स्टॉप के लिए आज समय में बदलाव की आवश्यकता हो सकती है।';
  }

  @override
  String get weatherImpactNoPlanRain =>
      'बारिश मिश्रित है - पहले अपने दिन का निर्माण इनडोर एंकर के साथ करें।';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return 'सबसे अच्छी बाहरी खिड़की गर्मी या वर्षा के निर्माण से पहले $start-$end जैसी दिखती है।';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      'मौसम स्थिर दिख रहा है - जब आप रुकने के क्रम के लिए तैयार हों तो मेरे दिन की योजना बनाएं पर टैप करें।';

  @override
  String get weatherImpactIndoorFallback => 'एक स्पा या संग्रहालय';

  @override
  String get hotelIntelBadge => 'होटल इंटेलिजेंस';

  @override
  String get hotelIntelTitle => 'अपना घरेलू आधार खोजें';

  @override
  String get hotelIntelSubtitle =>
      'आप जो यात्रा करना चाहते हैं, उसके आधार पर, लक्सोरा आपके दिनों को आकार देने वाले ठहरने का चयन करता है - बुकिंग ग्रिड नहीं।';

  @override
  String get hotelDiscoveryTitle => 'ऑरलैंडो के लिए क्यूरेट किया गया';

  @override
  String get hotelMatchmakerTeaser =>
      'लक्सोरा को अपनी यात्रा शैली बताएं और ईमानदार ट्रेडऑफ़ के साथ दरबान द्वारा चुने गए तीन प्रवास प्राप्त करें।';

  @override
  String get hotelMatchmakerCta => 'एआई होटल मैचमेकर';

  @override
  String get hotelMatchmakerTitle => 'होटल मैचमेकर';

  @override
  String get hotelMatchmakerSubtitle =>
      'साझा करें कि आप कैसे यात्रा करते हैं - लक्सोरा अनुशंसा करता है कि आप अपने दिन कहाँ बिताएँ।';

  @override
  String get hotelMatchmakerRun => 'मेरे शीर्ष 3 प्रवास खोजें';

  @override
  String get hotelMatchBudget => 'बजट आराम क्षेत्र';

  @override
  String get hotelMatchTravelers => 'यात्री';

  @override
  String get hotelMatchAdults => 'वयस्कों';

  @override
  String get hotelMatchKids => 'बच्चे';

  @override
  String get hotelMatchAttractions => 'आपकी सूची में आकर्षण';

  @override
  String get hotelMatchLuxuryLevel => 'वांछित विलासिता स्तर';

  @override
  String get hotelMatchTransport => 'चारों ओर से प्राप्त होना';

  @override
  String get hotelTransportCar => 'किराए की कार';

  @override
  String get hotelTransportRideshare => 'कार';

  @override
  String get hotelTransportShuttle => 'रिज़ॉर्ट शटल';

  @override
  String get hotelTransportWalkable => 'चलने योग्य पड़ोस';

  @override
  String get hotelMatchResultsTitle => 'आपके शीर्ष 3 मैच';

  @override
  String hotelMatchWhyTitle(int score) {
    return 'मैच का स्कोर $score';
  }

  @override
  String get hotelMatchBestForLabel => 'इसके लिए सर्वोत्तम:';

  @override
  String get hotelMatchItineraryLabel => 'यात्रा कार्यक्रम:';

  @override
  String get hotelMatchTradeoffsLabel => 'ट्रेडऑफ़:';

  @override
  String get hotelMatchNearbyLabel => 'आस-पास:';

  @override
  String get hotelLuxoraScore => 'लक्सोरा';

  @override
  String get hotelHomeBaseBadge => 'घर आधार';

  @override
  String get hotelScoreLuxury => 'विलासिता';

  @override
  String get hotelScoreFamily => 'परिवार';

  @override
  String get hotelScoreRomance => 'रोमांस';

  @override
  String get hotelScoreWalkability => 'टहलना';

  @override
  String get hotelWhyRecommendTitle => 'लक्सोरा इसकी अनुशंसा क्यों करता है?';

  @override
  String get hotelItineraryImpactTitle => 'यह आपके दिनों को कैसे आकार देता है';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return 'हब से रफ ड्राइव: $driveTime। यात्रा घर्षण स्कोर: $friction/90 (निचला भाग शांत होता है)।';
  }

  @override
  String get hotelAddHomeBase => 'होम बेस के रूप में जोड़ें';

  @override
  String get hotelHomeBaseActive => 'होम बेस सक्रिय';

  @override
  String get hotelViewOnMap => 'मानचित्र पर देखें';

  @override
  String get hotelGetDirections => 'दिशा - निर्देश प्राप्त करें';

  @override
  String get hotelCheckRates => 'दरें चेक कीजिए';

  @override
  String get hotelVisitWebsite => 'बेवसाइट देखना';

  @override
  String get hotelLinkUnavailable =>
      'इस प्रवास के लिए बुकिंग लिंक अभी उपलब्ध नहीं है।';

  @override
  String get hotelLinkOpenFailed =>
      'लिंक नहीं खुल सका - अपना ब्राउज़र जांचें या पुनः प्रयास करें।';

  @override
  String get hotelSave => 'होटल बचाओ';

  @override
  String get hotelSaved => 'सहेजा गया';

  @override
  String get hotelDistanceTitle => 'प्रमुख स्थानों से दूरी';

  @override
  String get hotelCompareTitle => 'ठहरने की तुलना करें';

  @override
  String get hotelCompareSubtitle => 'अगल-बगल द्वारपाल दृश्य - तीन होटलों तक।';

  @override
  String hotelCompareSelected(int count) {
    return '$count चयनित';
  }

  @override
  String get hotelComparePrice => 'मूल्य सीमा';

  @override
  String get hotelCompareDriveImpact => 'ड्राइव प्रभाव';

  @override
  String get hotelCompareNearby => 'आस-पास के मुख्य आकर्षण';

  @override
  String get hotelPriceBudget => 'बजट';

  @override
  String get hotelPriceModerate => 'मध्यम';

  @override
  String get hotelPriceUpscale => 'एक उच्च स्तरीय';

  @override
  String get hotelPriceLuxury => 'विलासिता';

  @override
  String get hotelTagCouples => 'जोड़ों के लिए सर्वोत्तम';

  @override
  String get hotelTagDisney => 'डिज़्नी के लिए सर्वश्रेष्ठ';

  @override
  String get hotelTagUniversal => 'यूनिवर्सल के लिए सर्वश्रेष्ठ';

  @override
  String get hotelTagLuxuryStaycation => 'विलासितापूर्ण प्रवास';

  @override
  String get hotelTagFamily => 'परिवार के अनुकूल';

  @override
  String get hotelTagQuiet => 'शांत पलायन';

  @override
  String get hotelTagWalkableDining => 'चलने योग्य भोजन';

  @override
  String get hotelTagResort => 'रिज़ॉर्ट का एहसास';

  @override
  String get hotelTagBudget => 'बजट अनुकूल';

  @override
  String get hotelReasonMatchesMood =>
      'आपकी यात्रा के मूड और गति से मेल खाता है।';

  @override
  String get hotelReasonCloseStops => 'आपकी टाइमलाइन पर नियोजित स्टॉप के करीब।';

  @override
  String hotelReasonSavesDrive(String time) {
    return 'सामान्य हब की तुलना में ड्राइव का समय बचाता है - केंद्र से लगभग $time।';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return 'गलत रिसॉर्ट पर अधिक खर्च किए बिना एक $range आराम क्षेत्र में फिट बैठता है।';
  }

  @override
  String get hotelReasonBetterGroup =>
      'आपके समूह प्रकार और ऊर्जा स्तर के लिए बेहतर अनुकूल।';

  @override
  String get hotelReasonNearbyDining => 'सहज शाम के लिए पास में मजबूत भोजनालय।';

  @override
  String get hotelReasonLowStress =>
      'रिज़ॉर्ट-शैली की शांति - कम रसद, अधिक छुट्टियां।';

  @override
  String get hotelMatchAttractionsGeneral => 'आपके नियोजित आकर्षण';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return 'आपके $attractions यात्रा कार्यक्रम के आधार पर, $hotel ड्राइव का समय कम कर देता है और शाम को आसान रखता है।';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$hotel में $neighborhood उस तरह फिट बैठता है जैसा आप इस यात्रा को महसूस कराना चाहते हैं।';
  }

  @override
  String get hotelMatchBestForFamily =>
      'वे परिवार जो पार्क तक पहुंच का त्याग किए बिना पूल में दिन गुजारना चाहते हैं।';

  @override
  String get hotelMatchBestForCouple =>
      'जोड़े जो थीम-पार्क अराजकता के बिना रोमांस चाहते हैं।';

  @override
  String get hotelMatchBestForGroup =>
      'समूह आराम, पहुंच और शांत रसद को संतुलित करते हैं।';

  @override
  String hotelMatchImpactDisney(String time) {
    return 'छोटा डिज़्नी आपके दरवाजे से पार्कों तक लगभग $time चलता है।';
  }

  @override
  String get hotelMatchImpactUniversal =>
      'यूनिवर्सल एक्सप्रेस सुविधाएं या वॉटर-टैक्सी का उपयोग आपके दिन के घंटों को पुनः प्राप्त कर सकता है।';

  @override
  String get hotelMatchImpactWalkable =>
      'रात के खाने के लिए पैदल चलें - पार्क में लंबे दिनों के बाद पार्किंग का तनाव कम होगा।';

  @override
  String hotelMatchImpactDefault(String time) {
    return '$time के आसपास औसत ड्राइव रखता है ताकि आपका दिन का प्रवाह आरामदायक रहे।';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget =>
      'प्रीमियम रिसॉर्ट मूल्य निर्धारण - कमरे के लिए बजट अधिक, अन्यत्र कम।';

  @override
  String get hotelMatchTradeoffCarNeeded =>
      'आप कार या राइडशेयर पर भरोसा करेंगे - हर जगह पैदल चलने वाले आधार पर नहीं।';

  @override
  String get hotelMatchTradeoffLessFamily =>
      'समर्पित पारिवारिक रिसॉर्ट्स की तुलना में बच्चे-केंद्रित सुविधाओं पर कम ध्यान केंद्रित किया गया है।';

  @override
  String get hotelMatchTradeoffLessRomantic =>
      'एक शांत युगल रिट्रीट की तुलना में अधिक थीम-पार्क ऊर्जा।';

  @override
  String get hotelMatchTradeoffDefault =>
      'प्रत्येक प्रवास में समझौता होता है - लक्सोरा ने इसे पहले आपकी प्राथमिकताओं के लिए चुना।';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return '$neighborhood के आसपास भोजन और अनुभव।';
  }

  @override
  String get mapHotelIntelBannerTitle => 'सही घरेलू आधार चुनें';

  @override
  String get mapHotelIntelBannerBody =>
      'आपके होटल का आकार, यात्रा का समय, दिन का प्रवाह और आप कहाँ खाते हैं। लक्सोरा आपको चुनने में मदद करता है - बुकिंग के दबाव के बिना।';

  @override
  String get mapHotelIntelBannerCta => 'होटल इंटेलिजेंस का अन्वेषण करें';

  @override
  String get sponsorLuxoraRecommended => 'लक्सोरा अनुशंसित';

  @override
  String get sponsorBadgeFeaturedPartner => 'फ़ीचर्ड पार्टनर';

  @override
  String get sponsorBadgeSponsored => 'प्रायोजित';

  @override
  String get sponsorBadgePromoted => 'प्रचारित';

  @override
  String get sponsorBadgePartnerOffer => 'पार्टनर ऑफर';

  @override
  String get sponsorCtaVisitWebsite => 'बेवसाइट देखना';

  @override
  String get sponsorCtaBookNow => 'अभी बुक करें';

  @override
  String get sponsorCtaCheckRates => 'दरें चेक कीजिए';

  @override
  String get sponsorCtaGetTickets => 'टिकिट पाएं';

  @override
  String get sponsorCtaViewOffer => 'ऑफर देखें';

  @override
  String get featuredStaysTitle => 'विशेष रुप से प्रदर्शित रहता है';

  @override
  String get featuredStaysSubtitle =>
      'पार्टनर प्लेसमेंट - लक्सोरा के ऑर्गेनिक होटल मैच स्कोर से अलग।';

  @override
  String get featuredExperiencesTitle => 'विशेष रुप से प्रदर्शित अनुभव';

  @override
  String get featuredExperiencesSubtitle =>
      'आपके मूड के लिए प्रचारित चयन - हमेशा लेबल किया गया, एआई रैंक के रूप में कभी नहीं छिपाया गया।';

  @override
  String get featuredDiningTitle => 'विशेष भोजन';

  @override
  String get featuredDiningSubtitle =>
      'पार्टनर रेस्तरां लक्सोरा की मुख्य विशेषताएं - आपकी जैविक रत्न सूची स्वतंत्र रहती है।';

  @override
  String get featuredTicketPartnersTitle => 'फ़ीचर्ड टिकट भागीदार';

  @override
  String get featuredTicketPartnersSubtitle =>
      'अधिकृत भागीदार ऑफ़र - नीचे दी गई जैविक बचत से तुलना करें।';

  @override
  String get featuredCityHomeTitle => 'विशेष भागीदार';

  @override
  String get featuredCityHomeSubtitle =>
      'ऑरलैंडो के लिए सहायक भागीदार विकल्प - स्पष्ट रूप से चिह्नित, एआई चयन के अनुसार कभी छिपाए नहीं गए।';

  @override
  String get dayFlowVibeFoodie => 'खाने के शौकीन';

  @override
  String get dayFlowVibeNightlife => 'नाइटलाइफ़';

  @override
  String get dayFlowVibePoolside => 'पूल';

  @override
  String get dayFlowVibeAdventure => 'साहसी';

  @override
  String get dayFlowVibeCulture => 'संस्कृति';

  @override
  String get onboardStep5Title => 'लक्सोरा का दिल';

  @override
  String get onboardStep5Subtitle =>
      'आप इस यात्रा को कैसा महसूस कराना चाहते हैं?';

  @override
  String get onboardTripFeelHint =>
      'सूर्यास्त रात्रिभोज, धीमी सुबह, अपने साथी के साथ हँसी...';

  @override
  String get onboardStepNameEyebrow => 'आपकी कहानी एक नाम से शुरू होती है';

  @override
  String get onboardStepNameTitle => 'हमें इस यात्रा को क्या कहना चाहिए?';

  @override
  String get onboardStepNameSubtitle =>
      'लक्सोरा आपके वाइब से एक शीर्षक तैयार कर सकता है - या अपना खुद का टाइप कर सकता है।';

  @override
  String get onboardTripNameLuxora => 'लक्सोरा को इसका नाम बताएं';

  @override
  String get onboardTripNameYours => 'मैं इसका नाम बताऊंगा';

  @override
  String get onboardTripNameHint => 'हमारा वसंत वर्षगाँठ पलायन...';

  @override
  String onboardTripNameSuggested(String name) {
    return 'लक्सोरा सुझाव देता है: $name';
  }

  @override
  String get conciergeTripNameLabel => 'यात्रा का नाम';

  @override
  String get moodRomantic => 'प्रेम प्रसंगयुक्त';

  @override
  String get moodRelaxing => 'आराम';

  @override
  String get moodAdventurous => 'साहसी';

  @override
  String get moodLuxurious => 'शान शौकत';

  @override
  String get moodFamily => 'परिवार संबंध';

  @override
  String get moodSocial => 'सामाजिक';

  @override
  String get moodNature => 'प्रकृति केंद्रित';

  @override
  String get moodWellness => 'कल्याण वापसी';

  @override
  String get moodFoodie => 'खाने का अनुभव';

  @override
  String get catHiddenGems => 'छुपे हुए रत्न';

  @override
  String get catLuxuryStay => 'विलासितापूर्ण आवास';

  @override
  String get catBeaches => 'समुद्र तटों';

  @override
  String get catRooftop => 'छत पर भोजन';

  @override
  String get catSpas => 'स्पा';

  @override
  String get catNightlife => 'नाइटलाइफ़';

  @override
  String get catFamily => 'परिवार';

  @override
  String get catEco => 'इको पर्यटन';

  @override
  String get catThemeParks => 'थीम पार्क';

  @override
  String get catRomantic => 'रोमांटिक छुट्टियाँ';

  @override
  String get catFood => 'भोजन के अनुभव';

  @override
  String get catSprings => 'स्प्रिंग्स';

  @override
  String get catIslands =>
      'द्वीपों के बीच छोटी यात्राएं करके एक सागर को पार करना';

  @override
  String get catInfluencer => 'प्रभावशाली-योग्य';

  @override
  String get placeCatBeach => 'समुद्र तट';

  @override
  String get placeCatDining => 'भोजन';

  @override
  String get placeCatNature => 'प्रकृति';

  @override
  String get placeCatNightlife => 'नाइटलाइफ़';

  @override
  String get placeCatWellness => 'कल्याण';

  @override
  String get placeCatFamily => 'परिवार';

  @override
  String get placeCatSprings => 'स्प्रिंग्स';

  @override
  String get placeCatRomantic => 'प्रेम प्रसंगयुक्त';

  @override
  String get placeCatAdventure => 'साहसिक काम';

  @override
  String get placeCatHotel => 'होटल';

  @override
  String get styleLessCrowded => 'कम भीड़';

  @override
  String get styleLuxurySubtle => 'विलासितापूर्ण लेकिन आकर्षक नहीं';

  @override
  String get styleHiddenLuxury => 'छुपी हुई विलासिता';

  @override
  String get styleWalkable => 'जब संभव हो चलने योग्य';

  @override
  String get styleSlowMornings => 'धीमी सुबह';

  @override
  String get styleNoTraps => 'कोई पर्यटक जाल नहीं';

  @override
  String get styleNatureHeavy => 'प्रकृति भारी';

  @override
  String get styleNatureWellness => 'केवल प्रकृति + कल्याण';

  @override
  String get styleAestheticDining => 'सौंदर्यपरक भोजन';

  @override
  String get styleFamilyEasy => 'परिवार-आसान रसद';

  @override
  String get paywallHeroEyebrow => 'आपका व्यक्तिगत द्वारपाल';

  @override
  String get paywallHeroHeadline => 'अपनी छुट्टियाँ बर्बाद मत करो';

  @override
  String get paywallHeroSubheadline =>
      'लक्सोरा यात्रा की योजना बनाता है ताकि आप इसका आनंद उठा सकें।';

  @override
  String get paywallEmotionalLine =>
      'आप पहले से ही अपनी छुट्टियों पर हजारों खर्च कर रहे हैं। अनुभव को संयोग पर मत छोड़ो।';

  @override
  String paywallHeadlineCouples(String cityName) {
    return 'आपकी संपूर्ण $cityName छुट्टी यहीं से शुरू होती है।';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return '$cityName में योजना बनाने में कम समय और यादें बनाने में अधिक समय व्यतीत करें।';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return '$cityName को अलग तरह से अनुभव करें।';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return 'उस $cityName की खोज करें जिसे अधिकांश पर्यटक कभी नहीं देख पाते।';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return 'स्थानीय अंदरूनी सूत्र की तरह $cityName का स्वाद चखें।';
  }

  @override
  String get paywallWhatYouUnlock => 'आप क्या अनलॉक करते हैं';

  @override
  String get paywallFeatureAiConcierge => 'ऐ दरबान';

  @override
  String get paywallFeatureItineraries => 'वैयक्तिकृत यात्रा कार्यक्रम';

  @override
  String get paywallFeatureHiddenGems => 'छुपे हुए रत्न';

  @override
  String get paywallFeatureHotelIntel => 'होटल इंटेलिजेंस';

  @override
  String get paywallFeatureTicketSavings => 'स्मार्ट टिकट बचत';

  @override
  String get paywallFeatureWeatherConcierge => 'मौसम द्वारपाल';

  @override
  String get paywallFeatureCrowdIntel => 'भीड़ खुफिया';

  @override
  String get paywallFeatureGpsNav => 'जीपीएस नेविगेशन';

  @override
  String get paywallFeatureLocalSecrets => 'स्थानीय रहस्य';

  @override
  String get paywallFeatureDining => 'भोजन संबंधी सिफ़ारिशें';

  @override
  String get paywallFeatureUnlimitedPlanning => 'असीमित शहर योजना';

  @override
  String get paywallWhyTravelersUnlock =>
      'यात्री लक्सोरा को अनलॉक क्यों करते हैं?';

  @override
  String get paywallBenefitSaveTimeTitle => 'समय की बचत';

  @override
  String get paywallBenefitSaveTimeBody =>
      'अनुसंधान और योजना के घंटों को छोड़ें।';

  @override
  String get paywallBenefitSaveMoneyTitle => 'पैसे बचाएं';

  @override
  String get paywallBenefitSaveMoneyBody =>
      'टिकट बचत, स्थानीय सौदे और बेहतर विकल्पों की खोज करें।';

  @override
  String get paywallBenefitAvoidTrapsTitle => 'पर्यटक जाल से बचें';

  @override
  String get paywallBenefitAvoidTrapsBody =>
      'ऐसे अनुभव ढूंढें जिनकी स्थानीय लोग वास्तव में अनुशंसा करते हैं।';

  @override
  String get paywallBenefitTravelSmarterTitle => 'बेहतर यात्रा करें';

  @override
  String get paywallBenefitTravelSmarterBody =>
      'मौसम, भीड़ और अपनी यात्रा शैली के आधार पर अनुशंसाएँ प्राप्त करें।';

  @override
  String get paywallLockedPreviewTitle =>
      'आपके दरबान के अंदर इंतज़ार कर रहा हूँ';

  @override
  String get paywallLockedPreviewSubtitle =>
      'अपनी यात्रा के अनुरूप मार्गों और रहस्यों को उजागर करने के लिए अनलॉक करें।';

  @override
  String get paywallLockedDateNight => 'रोमांटिक तिथि रात्रि मार्ग';

  @override
  String get paywallLockedHiddenLuxury => 'छिपे हुए विलासिता अनुभव';

  @override
  String get paywallLockedVipSecrets => 'वीआईपी स्थानीय रहस्य';

  @override
  String get paywallLockedConciergeRecs => 'दरबान सिफ़ारिशें';

  @override
  String get paywallLockedFamilyPlans => 'पारिवारिक तनाव-मुक्त योजनाएँ';

  @override
  String get paywallLockedWeatherReroute => 'मौसम-जागरूक पुनर्निर्देशन';

  @override
  String get paywallLockedHotelMatchmaker => 'स्मार्ट होटल मैचमेकर';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return '$cityName द्वारपाल को अनलॉक करें';
  }

  @override
  String get paywallOneTimePurchase => 'एक बार खरीदे';

  @override
  String get paywallNoSubscription => 'कोई सदस्यता नहीं';

  @override
  String get paywallNoMonthlyFees => 'कोई मासिक शुल्क नहीं';

  @override
  String paywallLifetimeAccess(String cityName) {
    return 'लाइफटाइम $cityName एक्सेस';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return 'भविष्य के $cityName अपडेट शामिल हैं';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return 'अधिकांश $cityName छुट्टियों की लागत $minUsd–$maxUsd+ है';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price एक बार';
  }

  @override
  String get paywallLessThanDinner =>
      'छुट्टियों के रात्रिभोज की लागत से भी कम।';

  @override
  String get paywallSocialProofTitle =>
      'वे यात्री जिन्होंने लक्सोरा को अनलॉक किया';

  @override
  String get paywallReview1 =>
      '\"हमें योजना बनाने में लगने वाले घंटों की बचत हुई।\"';

  @override
  String get paywallReview2 =>
      '\"ऐसी जगहें मिलीं जिन्हें हमने कभी नहीं खोजा होगा।\"';

  @override
  String get paywallReview3 =>
      '\"केवल छिपे हुए रत्नों के लिए ही यह इसके लायक है।\"';

  @override
  String paywallCtaUnlock(String cityName) {
    return '$cityName द्वारपाल को अनलॉक करें';
  }

  @override
  String get paywallContinueExploring => 'अन्वेषण जारी रखें';

  @override
  String get paywallConciergePromise =>
      'कोई सब्सक्रिप्शन नहीं · आजीवन शहर एक्सेस';

  @override
  String get paywallRestorePurchases => 'खरीदारी वापस लौटाएं';

  @override
  String get paywallPurchaseSuccess =>
      'खरीदारी पूरी हो गई - आपका दरबान अनलॉक हो गया है।';

  @override
  String get paywallPurchasePending => 'खरीदारी पूरी हो रही है…';

  @override
  String get paywallPurchaseFailed =>
      'खरीदारी पूरी नहीं हो सकी. पुनः प्रयास करें या खरीदारी बहाल करें.';

  @override
  String get paywallPurchaseCanceled => 'खरीद रद्द कर दी गई.';

  @override
  String get paywallRestoreComplete => 'खरीदारी बहाल हो गई.';

  @override
  String get paywallRestoreNone =>
      'इस Apple ID या Google खाते के लिए कोई पिछली खरीदारी नहीं मिली।';

  @override
  String get paywallStoreUnavailable =>
      'इस डिवाइस पर ऐप स्टोर बिलिंग उपलब्ध नहीं है।';

  @override
  String get paywallProductUnavailable =>
      'यह पैक अभी तक स्टोर में उपलब्ध नहीं है.';

  @override
  String get settingsUnlockConciergeTitle => 'शहर द्वारपाल को अनलॉक करें';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'एक बार का सिटी पैक - सदस्यता नहीं';

  @override
  String get settingsOpenConciergeSubtitle => 'अपना एआई कंसीयज टैब खोलें';

  @override
  String get weatherMiamiHumidityIndoor =>
      'आज उच्च आर्द्रता. सबसे पहले समुद्र तट या पूल पर जाएँ, फिर सबसे गर्म घंटों के दौरान इनडोर भोजन और दीर्घाओं के लिए वेनवुड या ब्रिकेल पर जाएँ।';

  @override
  String get weatherMiamiHeatAdvisory =>
      'गर्मी संबंधी सलाह संबंधी स्थितियाँ - हल्के कपड़े, जलयोजन, और बाहरी पड़ावों के बीच छाया विराम।';

  @override
  String get weatherMiamiBeachMorning =>
      'रेत पर तेज़ यूवी - सनस्क्रीन, टोपी और दोपहर से पहले समुद्र तट का समय।';

  @override
  String get weatherMiamiBoatWind =>
      'हवा तेज़ है - नाव या नौका गतिविधियों पर पुनर्विचार करें; छत पर भोजन करना अभी भी काम कर सकता है।';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return 'आगे बारिश की खिड़की - आउटडोर योजनाओं को $indoorSpot या गैलरी समय के लिए बदलें।';
  }

  @override
  String get weatherMiamiSunsetWaterfront =>
      'सूर्यास्त मजबूत दिखता है - पूर्व से पश्चिम दृश्य के साथ तट या छत।';

  @override
  String get miamiBeachIntelTitle => 'समुद्र तट खुफिया';

  @override
  String miamiBeachBestTime(String time) {
    return 'सर्वोत्तम समय: $time';
  }

  @override
  String get miamiBeachFamilyScore => 'परिवार';

  @override
  String get miamiBeachCrowdScore => 'भीड़';

  @override
  String get miamiBeachPhotoScore => 'तस्वीर';

  @override
  String get miamiBeachRomanceScore => 'रोमांस';

  @override
  String get miamiBeachSunsetScore => 'सूर्यास्त';

  @override
  String miamiBeachParking(String level) {
    return 'पार्किंग: $level';
  }

  @override
  String get miamiNightlifeTitle => 'रात्रिजीवन दरबान';

  @override
  String miamiNightlifeDressCode(String code) {
    return 'ड्रेस कोड: $code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return 'सर्वोत्तम आगमन: $time';
  }

  @override
  String get miamiNightlifeReservation => 'आरक्षण की अनुशंसा की गई';

  @override
  String get miamiMoodRoutesTitle => 'मियामी मूड रूट';

  @override
  String get tampaBayMoodRoutesTitle => 'Tampa Bay मूड रूट';

  @override
  String get stAugustineMoodRoutesTitle => 'St. Augustine मूड रूट';

  @override
  String get naplesMoodRoutesTitle => 'Naples मूड रूट';

  @override
  String get destin30aMoodRoutesTitle => 'Destin और 30A मूड रूट';

  @override
  String get vegasMoodRoutesTitle => 'लास वेगास मूड रूट';

  @override
  String miamiMoodRouteStart(String time) {
    return '$time के आसपास प्रारंभ करें';
  }

  @override
  String get keysWaterIntelTitle => 'कीज़ वॉटर इंटेलिजेंस';

  @override
  String keysWaterBestTime(String time) {
    return 'सर्वोत्तम विंडो: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'पानी: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'स्नोर्कल';

  @override
  String get keysWaterDivingScore => 'गोता लगाना';

  @override
  String get keysWaterBoatingScore => 'नाव';

  @override
  String get keysWaterFishingScore => 'मछली';

  @override
  String get keysWaterWindScore => 'हवा';

  @override
  String get keysWaterSunsetScore => 'सूर्यास्त';

  @override
  String get keysWaterCrowdScore => 'भीड़';

  @override
  String get keysMoodRoutesTitle => 'कीज़ द्वीप मार्ग';

  @override
  String keysMoodRouteStart(String time) {
    return 'समय शुरू';
  }

  @override
  String get paywallHeadlineMiamiDefault => 'मियामी को अलग तरह से अनुभव करें';

  @override
  String get paywallHeadlineMiamiWeekend =>
      'अपना मियामी सप्ताहांत बर्बाद मत करो';

  @override
  String get paywallOrlandoAddonsHeading => 'थीम पार्क पैक';

  @override
  String get paywallOrlandoBaseIncludes =>
      'ऑरलैंडो अनलॉक में भोजन, छिपे हुए रत्न, होटल और गैर-पार्क अनुभव शामिल हैं। डिज़्नी और यूनिवर्सल के लिए थीम पार्क पैक को एक साथ जोड़ें।';

  @override
  String get paywallAddonThemeParksTitle => 'डिज्नी और यूनिवर्सल पैक';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'वॉल्ट डिज़्नी वर्ल्ड और यूनिवर्सल ऑरलैंडो - एक अनलॉक में सभी पार्क, सौदे, मार्ग और भीड़ की जानकारी।';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return 'अनलॉक करें $packName · $price';
  }

  @override
  String get paywallAddonUnlocked => 'अनलॉक किया';

  @override
  String get paywallAddonRequiresOrlando => 'पहले ऑरलैंडो अनलॉक की आवश्यकता है';

  @override
  String paywallUnlockAddonPack(String packName) {
    return '$packName अनलॉक करें';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return '$packName अनलॉक करें';
  }

  @override
  String get orlandoThemeParksPromptTitle =>
      'ऑरलैंडो के लिए डिज़्नी और यूनिवर्सल अनलॉक करें?';

  @override
  String get orlandoThemeParksPromptBody =>
      'वॉल्ट डिज़्नी वर्ल्ड और यूनिवर्सल ऑरलैंडो के लिए थीम पार्क पैक जोड़ें - एक अनलॉक में सभी पार्क, टिकट सौदे, मार्ग और भीड़ की जानकारी।';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'अनलॉक · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'अभी नहीं';

  @override
  String get onboardV2Eyebrow =>
      'आइए आपकी संपूर्ण यात्रा की रूपरेखा तैयार करें';

  @override
  String get onboardV2StepTravelerEyebrow => 'स्टेप 1';

  @override
  String get onboardV2StepTravelerTitle => 'आप किसके साथ यात्रा कर रहे हैं?';

  @override
  String get onboardV2StepTravelerSubtitle =>
      'लक्सोरा टेलर्स आपके दल के लिए ठहरता है, भोजन करता है और उनके साथ घूमता है।';

  @override
  String get onboardV2ChildrenLabel => 'बच्चे यात्रा कर रहे हैं?';

  @override
  String get onboardV2StepStyleEyebrow => 'चरण दो';

  @override
  String get onboardV2StepStyleTitle =>
      'आप किस प्रकार की यात्रा की तलाश में हैं?';

  @override
  String get onboardV2StepStyleSubtitle =>
      'वह सब कुछ चुनें जो आपको उत्साहित करता हो।';

  @override
  String get onboardV2StepHotelEyebrow => 'चरण 3';

  @override
  String get onboardV2StepHotelTitle => 'आप किस प्रकार की जगह पर रहना चाहेंगे?';

  @override
  String get onboardV2StepHotelSubtitle =>
      'हम बुटीक रत्नों और रिसॉर्ट आइकनों का मिलान करेंगे।';

  @override
  String get onboardV2HotelBudgetLabel => 'होटल का बजट';

  @override
  String get onboardV2HotelAmenitiesLabel => 'सुविधाएं होनी चाहिए';

  @override
  String get onboardV2StepFoodEyebrow => 'चरण 4';

  @override
  String get onboardV2StepFoodTitle =>
      'आप किस प्रकार के रेस्तरां का आनंद लेते हैं?';

  @override
  String get onboardV2StepFoodSubtitle =>
      'भोजन और भोजन शैली - वह सब चुनें जो आपको पसंद हो।';

  @override
  String get onboardV2CuisineLabel => 'व्यंजन के प्रकार';

  @override
  String get onboardV2DiningStyleLabel => 'भोजन शैली';

  @override
  String get onboardV2StepPaceEyebrow => 'चरण 5';

  @override
  String get onboardV2StepPaceTitle =>
      'आप अपने दिनों की योजना कैसे बनाना चाहेंगे?';

  @override
  String get onboardV2StepPaceSubtitle =>
      'आरामदायक सुबह या भरपूर रोमांच - आप चुनें।';

  @override
  String get onboardV2PaceRelaxedTitle => 'ढील';

  @override
  String get onboardV2PaceRelaxedBody => 'प्रति दिन 2-3 गतिविधियाँ';

  @override
  String get onboardV2PaceBalancedTitle => 'संतुलित';

  @override
  String get onboardV2PaceBalancedBody => 'प्रति दिन 4-5 गतिविधियाँ';

  @override
  String get onboardV2PacePackedTitle => 'पैक्ड';

  @override
  String get onboardV2PacePackedBody => 'हर दिन अधिकतम करें';

  @override
  String get onboardV2StepGoalsEyebrow => 'चरण 6';

  @override
  String get onboardV2StepGoalsTitle =>
      'इस यात्रा पर सबसे ज़्यादा क्या मायने रखता है?';

  @override
  String get onboardV2StepGoalsSubtitle => 'अधिकतम पाँच प्राथमिकताएँ चुनें।';

  @override
  String get onboardV2StepExperienceEyebrow => 'चरण 7';

  @override
  String get onboardV2StepExperienceTitle => 'आप किन अनुभवों का आनंद लेंगे?';

  @override
  String get onboardV2StepExperienceSubtitle =>
      'हम इन्हें आपके यात्रा कार्यक्रम में शामिल करेंगे।';

  @override
  String get onboardV2StepAvoidEyebrow => 'चरण 8';

  @override
  String get onboardV2StepAvoidTitle => 'आप किस चीज़ से बचना पसंद करेंगे?';

  @override
  String get onboardV2StepAvoidSubtitle =>
      'लक्सोरा आपकी यात्रा को प्रभावित करने वाली चीज़ों से दूर रहता है।';

  @override
  String get onboardV2StepEmotionEyebrow => 'चरण 9';

  @override
  String get onboardV2StepEmotionTitle =>
      'इस यात्रा को किस चीज़ से सफल महसूस कराया जाएगा?';

  @override
  String get onboardV2StepEmotionSubtitle => 'एक प्राथमिक भावना चुनें.';

  @override
  String get onboardV2StepSummaryEyebrow => 'LUXORA';

  @override
  String onboardV2StepSummaryTitle(String name) {
    return 'बढ़िया, $name.';
  }

  @override
  String get onboardV2StepSummarySubtitle =>
      'मैंने थोड़ा सीखा है कि आप किस तरह के यात्री हैं।\n\nअब मैं आपकी पसंद के अनुसार स्थान, अनुभव, रेस्तरां और hidden gems सुझाऊँगी।\n\nहर सिफारिश विशेष रूप से आपके लिए होगी।\n\nदेखते हैं क्या खोज सकते हैं।';

  @override
  String get onboardSummaryHotels => 'होटल';

  @override
  String get onboardSummaryRestaurants => 'रेस्टोरेंट';

  @override
  String get onboardSummaryHiddenGems => 'छुपे हुए रत्न';

  @override
  String get onboardSummaryExperiences => 'अनुभव';

  @override
  String get onboardSummaryHotelDefault =>
      'क्यूरेटेड ठहराव आपके बजट से मेल खाता है';

  @override
  String onboardSummaryHotelType(String type) {
    return '$type रहना';
  }

  @override
  String get onboardSummaryRooftopDining => 'छत पर भोजन का अनुभव';

  @override
  String onboardSummaryCuisine(String cuisine) {
    return '$cuisine पसंदीदा';
  }

  @override
  String onboardSummaryPace(String pace) {
    return '$pace दैनिक गति';
  }

  @override
  String get onboardSummaryRomantic => 'रोमांटिक सूर्यास्त अनुभव';

  @override
  String onboardSummaryEmotion(String emotion) {
    return '$emotion-केंद्रित यात्रा';
  }

  @override
  String get onboardSummaryPremiumGems => 'प्रीमियम छुपे हुए रत्न';

  @override
  String get agendaSuggestionsForYou => 'आपके लिए चुना गया';

  @override
  String get agendaSuggestionsAlternates => 'बहुत बढ़िया भी';

  @override
  String get agendaSuggestionsBrowseAll => 'सभी ब्राउज़ करें';

  @override
  String get onboardPrefTravelerSolo => 'एकल';

  @override
  String get onboardPrefTravelerCouple => 'युगल';

  @override
  String get onboardPrefTravelerFamily => 'परिवार';

  @override
  String get onboardPrefTravelerFriends => 'दोस्त';

  @override
  String get onboardPrefTravelerBusiness => 'व्यापार';

  @override
  String get onboardPrefChildrenNone => 'कोई संतान नहीं';

  @override
  String get onboardPrefChildrenToddlers => 'toddlers';

  @override
  String get onboardPrefChildrenElementary => 'प्रारंभिक आयु';

  @override
  String get onboardPrefChildrenTeenagers => 'किशोरों';

  @override
  String get onboardPrefStyleLuxury => 'विलासिता';

  @override
  String get onboardPrefStyleRelaxation => 'विश्राम';

  @override
  String get onboardPrefStyleAdventure => 'साहसिक काम';

  @override
  String get onboardPrefStyleThemeParks => 'थीम पार्क';

  @override
  String get onboardPrefStyleFoodie => 'खाने का शौकीन';

  @override
  String get onboardPrefStyleNightlife => 'नाइटलाइफ़';

  @override
  String get onboardPrefStyleRomance => 'रोमांस';

  @override
  String get onboardPrefStyleShopping => 'खरीदारी';

  @override
  String get onboardPrefStyleBeaches => 'समुद्र तटों';

  @override
  String get onboardPrefStyleWellness => 'कल्याण';

  @override
  String get onboardPrefStyleNature => 'प्रकृति';

  @override
  String get onboardPrefStylePhotography => 'फोटोग्राफी';

  @override
  String get onboardPrefStyleHiddenGems => 'छुपे हुए रत्न';

  @override
  String get onboardPrefStyleFamilyActivities => 'पारिवारिक गतिविधियाँ';

  @override
  String get onboardPrefStyleLocalExperiences => 'स्थानीय अनुभव';

  @override
  String get onboardPrefStyleEntertainment => 'मनोरंजन';

  @override
  String get onboardPrefHotelLuxuryResort => 'लक्जरी रिज़ॉर्ट';

  @override
  String get onboardPrefHotelBoutique => 'बुटीक होटल';

  @override
  String get onboardPrefHotelFamilyResort => 'पारिवारिक रिज़ॉर्ट';

  @override
  String get onboardPrefHotelBudgetFriendly => 'बजट अनुकूल';

  @override
  String get onboardPrefHotelAdultsOnly => 'केवल वयस्क';

  @override
  String get onboardPrefHotelSpaResort => 'स्पा रिज़ॉर्ट';

  @override
  String get onboardPrefHotelBeachfront => 'समुद्र तट';

  @override
  String get onboardPrefHotelDowntown => 'शहर';

  @override
  String get onboardPrefHotelWalkable => 'चलने योग्य क्षेत्र';

  @override
  String get onboardPrefHotelThemeParkArea => 'थीम पार्क क्षेत्र';

  @override
  String get onboardPrefHotelModern => 'आधुनिक होटल';

  @override
  String get onboardPrefHotelHistoric => 'ऐतिहासिक होटल';

  @override
  String get onboardPrefBudgetOne => '\$';

  @override
  String get onboardPrefBudgetTwo => '\$\$';

  @override
  String get onboardPrefBudgetThree => '\$\$\$';

  @override
  String get onboardPrefBudgetFour => '\$\$\$\$';

  @override
  String get onboardPrefAmenityPool => 'पूल';

  @override
  String get onboardPrefAmenitySpa => 'स्पा';

  @override
  String get onboardPrefAmenityGym => 'जिम';

  @override
  String get onboardPrefAmenityBreakfast => 'मुफ़्त नाश्ता';

  @override
  String get onboardPrefAmenityOceanView => 'महासागर का दृश्य';

  @override
  String get onboardPrefAmenityBalcony => 'बालकनी';

  @override
  String get onboardPrefAmenityKitchen => 'रसोईघर';

  @override
  String get onboardPrefAmenityShuttle => 'शटल सेवा';

  @override
  String get onboardPrefAmenityPetFriendly => 'पालतू पशु का ख्याल रखना';

  @override
  String get onboardPrefCuisineAmerican => 'अमेरिकी';

  @override
  String get onboardPrefCuisineItalian => 'इतालवी';

  @override
  String get onboardPrefCuisineMexican => 'मैक्सिकन';

  @override
  String get onboardPrefCuisineSeafood => 'समुद्री भोजन';

  @override
  String get onboardPrefCuisineSteakhouse => 'स्टेक हाउस';

  @override
  String get onboardPrefCuisineSushi => 'सुशी';

  @override
  String get onboardPrefCuisineCuban => 'क्यूबा';

  @override
  String get onboardPrefCuisineMediterranean => 'आभ्यंतरिक';

  @override
  String get onboardPrefCuisineAsian => 'एशियाई';

  @override
  String get onboardPrefCuisineBbq => 'बारबेक्यू';

  @override
  String get onboardPrefCuisineFineDining => 'ठीक भोजन';

  @override
  String get onboardPrefCuisineLocalFavorites => 'स्थानीय पसंदीदा';

  @override
  String get onboardPrefCuisineFoodTrucks => 'खाद्य ट्रक';

  @override
  String get onboardPrefCuisineRooftop => 'छत पर भोजन';

  @override
  String get onboardPrefCuisineBrunch => 'ब्रंच';

  @override
  String get onboardPrefCuisineDessert => 'मिठाई';

  @override
  String get onboardPrefDiningQuick => 'त्वरित सेवा';

  @override
  String get onboardPrefDiningCasual => 'आकस्मिक भोजन';

  @override
  String get onboardPrefDiningFamily => 'परिवार के अनुकूल';

  @override
  String get onboardPrefDiningDateNight => 'तिथि रात';

  @override
  String get onboardPrefDiningFine => 'ठीक भोजन';

  @override
  String get onboardPrefDiningWaterfront => 'तट';

  @override
  String get onboardPrefDiningHiddenGems => 'छुपे हुए रत्न';

  @override
  String get onboardPrefDiningLocal => 'स्थानीय पसंदीदा';

  @override
  String get onboardPrefGoalMakeMemories => 'यादें बनाएं';

  @override
  String get onboardPrefGoalSaveMoney => 'पैसे बचाएं';

  @override
  String get onboardPrefGoalAvoidCrowds => 'भीड़ से बचें';

  @override
  String get onboardPrefGoalLuxury => 'विलासितापूर्ण अनुभव';

  @override
  String get onboardPrefGoalBestFood => 'सर्वोत्तम भोजन';

  @override
  String get onboardPrefGoalHiddenGems => 'छुपे हुए रत्न';

  @override
  String get onboardPrefGoalRelaxation => 'विश्राम';

  @override
  String get onboardPrefGoalAdventure => 'साहसिक काम';

  @override
  String get onboardPrefGoalBestPhotos => 'सर्वोत्तम तस्वीरें';

  @override
  String get onboardPrefGoalFamilyTime => 'परिवार के लिये समय';

  @override
  String get onboardPrefGoalRomance => 'रोमांस';

  @override
  String get onboardPrefGoalNightlife => 'नाइटलाइफ़';

  @override
  String get onboardPrefGoalLocal => 'स्थानीय अनुभव';

  @override
  String get onboardPrefGoalStressFree => 'तनाव मुक्त योजना';

  @override
  String get onboardPrefExpBoatTours => 'नाव यात्राएँ';

  @override
  String get onboardPrefExpSunsetCruises => 'सूर्यास्त परिभ्रमण';

  @override
  String get onboardPrefExpAirboat => 'एयरबोट टूर्स';

  @override
  String get onboardPrefExpThemeParks => 'थीम पार्क';

  @override
  String get onboardPrefExpMuseums => 'संग्रहालय';

  @override
  String get onboardPrefExpLiveShows => 'लाइव शो';

  @override
  String get onboardPrefExpSpas => 'स्पा';

  @override
  String get onboardPrefExpShopping => 'खरीदारी';

  @override
  String get onboardPrefExpWaterParks => 'जल पार्क';

  @override
  String get onboardPrefExpGolf => 'गोल्फ़';

  @override
  String get onboardPrefExpFishing => 'मछली पकड़ने';

  @override
  String get onboardPrefExpKayaking => 'कायाकिंग';

  @override
  String get onboardPrefExpSnorkeling => 'स्नॉर्कलिंग';

  @override
  String get onboardPrefExpRooftopBars => 'छत पर बार्स';

  @override
  String get onboardPrefExpNightclubs => 'नाइटक्लब';

  @override
  String get onboardPrefExpWildlife => 'वन्यजीव अनुभव';

  @override
  String get onboardPrefExpFoodTours => 'खाद्य पर्यटन';

  @override
  String get onboardPrefExpScenicDrives => 'दर्शनीय ड्राइव';

  @override
  String get onboardPrefAvoidCrowds => 'भीड़';

  @override
  String get onboardPrefAvoidLongLines => 'लंबी लाइनें';

  @override
  String get onboardPrefAvoidExpensiveRestaurants => 'महँगे रेस्तरां';

  @override
  String get onboardPrefAvoidWalking => 'लंबी दूरी तक पैदल चलना';

  @override
  String get onboardPrefAvoidNightlife => 'नाइटलाइफ़';

  @override
  String get onboardPrefAvoidDriving => 'ड्राइविंग';

  @override
  String get onboardPrefAvoidTouristTraps => 'पर्यटक जाल';

  @override
  String get onboardPrefAvoidEarlyMornings => 'जल्दी सुबह';

  @override
  String get onboardPrefAvoidLateNights => 'देर रात तक';

  @override
  String get onboardPrefAvoidFamilyAttractions => 'पारिवारिक आकर्षण';

  @override
  String get onboardPrefAvoidThemeParks => 'थीम पार्क';

  @override
  String get onboardPrefEmotionRelaxed => 'ढील';

  @override
  String get onboardPrefEmotionExcited => 'उत्साहित';

  @override
  String get onboardPrefEmotionAdventurous => 'साहसी';

  @override
  String get onboardPrefEmotionRomantic => 'प्रेम प्रसंगयुक्त';

  @override
  String get onboardPrefEmotionLuxurious => 'शान शौकत';

  @override
  String get onboardPrefEmotionFamilyFocused => 'परिवार केंद्रित';

  @override
  String get onboardPrefEmotionMemorable => 'अविस्मरणीय';

  @override
  String get onboardPrefEmotionStressFree => 'तनाव मुक्त';

  @override
  String get onboardPrefEmotionInspiring => 'प्रेरणादायक';

  @override
  String get onboardPrefPaceSlow => 'ढील';

  @override
  String get onboardPrefPaceBalanced => 'संतुलित';

  @override
  String get onboardPrefPacePacked => 'पैक्ड';

  @override
  String get onboardSummaryHiddenGemsInsight =>
      'छिपे हुए स्थानीय रेस्तरां और रत्न';

  @override
  String get onboardBuildFailedHint =>
      'हमने आपकी प्राथमिकताएँ सहेज ली हैं, लेकिन यात्रा कार्यक्रम के लिए एक और क्षण की आवश्यकता है। एजेंडा पर ताज़ा करने या द्वारपाल खोलने के लिए खींचें।';

  @override
  String get onboardV2ChildrenSubtitle =>
      'लागू होने वाले सभी आयु समूहों का चयन करें।';

  @override
  String get onboardTravelerNameEyebrow => 'सबसे पहली बात';

  @override
  String get onboardTravelerNameTitle =>
      'लक्सोरा को आपको क्या कहकर बुलाना चाहिए?';

  @override
  String get onboardTravelerNameSubtitle =>
      'आपका पहला नाम ही काफी है - जब आप चैट करेंगे तो लक्सोरा इसका उपयोग करेगा।';

  @override
  String get onboardTravelerNameLabel => 'आपका प्रथम नाम';

  @override
  String get onboardTravelerNameHint => 'जैसे मारिया';

  @override
  String conciergeWelcomeNamed(String name) {
    return 'आपका स्वागत है, $name - आपका भावनात्मक रूप से बुद्धिमान फ़्लोरिडा साथी।\n\nनीचे एक संकेत चुनें, या उस भावना का वर्णन करें जिसे आप अपनी यात्रा में पैदा करना चाहते हैं।';
  }

  @override
  String conciergeWelcomeWarmNamed(String name) {
    return '$name, मैं यहां फ्लोरिडा को आकार देने आया हूं कि आप कैसा महसूस करना चाहते हैं - दर्शनीय स्थलों की चेकलिस्ट नहीं। आज आप क्या चाह रहे हैं?';
  }

  @override
  String get onboardWelcomeEyebrow => 'LUXORA';

  @override
  String get onboardWelcomeTitle => 'नमस्ते, मैं Luxora हूँ।';

  @override
  String get onboardWelcomeTagline => 'आपकी personal travel concierge.';

  @override
  String get onboardWelcomeBody =>
      'मैं अद्भुत जगहें खोजने, tourist traps से बचने और ऐसी छुट्टी बनाने में मदद करती हूँ जिसे आप सालों तक याद रखेंगे।\n\nचलिए कुछ अविस्मरणीय plan करें।';

  @override
  String get onboardWelcomeCta => 'मेरी यात्रा शुरू करें';

  @override
  String get onboardLuxoraGuideBody =>
      'अब से मैं हर कदम पर आपकी मदद करूँगी।\n\nHidden gems, शानदार खाना, अविस्मरणीय अनुभव, या बस stress-free vacation — मैं साथ हूँ।';

  @override
  String get onboardLuxoraReplyClosing =>
      'चलिए मिलकर आपका perfect adventure बनाते हैं।';

  @override
  String onboardBuildingTitle(String name) {
    return 'शानदार choice, $name.';
  }

  @override
  String get onboardBuildingBody =>
      'मैं आपकी travel style, रुचियों, pace, dining preferences और vacation goals के आधार पर personalized itinerary बना रही हूँ।\n\nइसमें थोड़ा समय लग सकता है।';

  @override
  String get onboardBuildingTagline =>
      'अच्छी छुट्टियाँ संयोग से होती हैं।\n\nGreat vacations एक plan से होती हैं।';

  @override
  String get onboardItineraryReadyTitle => 'आपका adventure तैयार है।';

  @override
  String get onboardItineraryReadyBody =>
      'मैंने सावधानी से experiences, restaurants, attractions और hidden gems चुने हैं जो आपकी trip से मेल खाते हैं।\n\nबेशक, हम रास्ते में कुछ भी adjust कर सकते हैं।\n\nBest vacations चलते-चलते evolve होती हैं।';

  @override
  String weatherRerouteLuxoraIntro(String name) {
    return '$name, लगता है मौसम आज के कुछ plans को प्रभावित कर सकता है।';
  }

  @override
  String get weatherRerouteLuxoraClosing =>
      'कभी-कभी अप्रत्याशित चीज़ें best memories बनाती हैं।';

  @override
  String rightNowLuxoraIntro(String name) {
    return '$name, आपके location, current weather और preferences के आधार पर — अभी मैं यह करूँगी।';
  }

  @override
  String get rightNowLuxoraClosing =>
      'मुझ पर भरोसा करें।\n\nमुझे लगता है आपको पसंद आएगा।';

  @override
  String paywallPersonalPitch(String name, String cityName) {
    return '$name, आपका personalized vacation plan पहले से shape ले रहा है।\n\nDay 1 ready है।\n\nबाकी journey इंतज़ार कर रही है।\n\n$cityName Concierge unlock करें — full itinerary, hidden gems, local secrets, weather intelligence और unlimited concierge guidance के लिए।\n\nइस vacation को unforgettable बनाते हैं।';
  }

  @override
  String get onboardLuxoraReplyEyebrow => 'लक्सोरा';

  @override
  String onboardLuxoraReplyTitle(String name) {
    return 'आपसे मिलकर अच्छा लगा, $name।';
  }

  @override
  String onboardLuxoraGuideNamed(String name) {
    return 'अब से मैं हर कदम पर आपकी मदद करूँगी।\n\nHidden gems, शानदार खाना, अविस्मरणीय अनुभव, या बस stress-free vacation — मैं साथ हूँ।';
  }

  @override
  String get onboardLuxoraItineraryPromise =>
      'चलिए मिलकर आपका perfect adventure बनाते हैं।';

  @override
  String get onboardReturningEyebrow => 'वापसी पर स्वागत';

  @override
  String onboardReturningTitle(String name) {
    return 'वापसी पर स्वागत है, $name।';
  }

  @override
  String get onboardReturningTitleGeneric => 'वापसी पर स्वागत है।';

  @override
  String get onboardReturningSubtitle =>
      'अपना adventure जारी रखने के लिए तैयार?\n\nमैंने आपकी preferences, favorite places और trip plans save किए हैं ताकि हम वहीं से शुरू कर सकें।\n\nदेखते हैं आज क्या इंतज़ार कर रहा है।';

  @override
  String get todayPlanSectionTitle => 'आज की योजना';

  @override
  String get todayNextActivityLabel => 'आगे';

  @override
  String get todayStaysDiningSection => 'ठहरने और खाने का विकल्प';

  @override
  String get todayStaysDiningCollapsedHint =>
      'होटल और रेस्तरां विचार - विस्तार करने के लिए टैप करें';

  @override
  String get todayPlanDetailsTitle => 'पूरा शेड्यूल';

  @override
  String todayPlanStopCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count आज स्टॉप',
      one: '1 stop today',
    );
    return '$_temp0';
  }

  @override
  String get todayRainRerouteTitle => 'मौसम reroute';

  @override
  String get todayExtrasSection => 'टिकट और साझाकरण';

  @override
  String get todayExtrasCollapsedHint => 'सौदे, शेयर कार्ड, और बहुत कुछ';

  @override
  String freemiumVacationTitle(String cityName) {
    return 'आपकी $cityName छुट्टी';
  }

  @override
  String get freemiumDay1Ready => '✓ दिन 1 तैयार';

  @override
  String get freemiumUnlockFullPlan => 'पूरा vacation plan अनलॉक करें';

  @override
  String freemiumLockedDayConcierge(int day) {
    return 'दिन $day · Concierge अनुकूलित';
  }

  @override
  String get freemiumLockedDayGems => 'दिन 3 · छिपे हुए रत्न मार्ग';

  @override
  String get freemiumLockedDayWeather => 'दिन 4 · मौसम-जागरूक योजना';

  @override
  String get freemiumLockedDayDeparture => 'दिन 5 · प्रस्थान रणनीति';

  @override
  String freemiumConciergeRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मुफ्त प्रश्न शेष',
      one: '1 मुफ्त प्रश्न शेष',
    );
    return '$_temp0';
  }

  @override
  String get freemiumConciergeLimitReached =>
      'मुफ्त concierge सीमा पूरी — असीमित planning के लिए अनलॉक करें।';

  @override
  String freemiumLockedHotels(int count) {
    return '🔒 $count+ और hotels उपलब्ध';
  }

  @override
  String freemiumLockedRestaurants(int count) {
    return '🔒 $count+ और restaurants उपलब्ध';
  }

  @override
  String freemiumLockedGems(int count) {
    return '🔒 $count+ hidden gems उपलब्ध';
  }

  @override
  String freemiumLockedSecrets(int count) {
    return '🔒 $count+ local secrets उपलब्ध';
  }

  @override
  String freemiumLockedExperiences(int count) {
    return '🔒 $count+ experiences उपलब्ध';
  }

  @override
  String get freemiumLockedAttractions => '🔒 और attractions उपलब्ध';

  @override
  String freemiumUnlockExplore(String cityName) {
    return 'और explore करने के लिए $cityName Concierge अनलॉक करें।';
  }

  @override
  String freemiumUnlockConcierge(String cityName) {
    return '$cityName Concierge अनलॉक करें';
  }

  @override
  String freemiumHeadlineDayTwoPlus(String cityName) {
    return 'आपके अगले दिन तैयार हैं — पूरा $cityName plan अनलॉक करें।';
  }

  @override
  String get freemiumHeadlineConciergeLimit =>
      'असीमित concierge access के साथ planning जारी रखें।';

  @override
  String freemiumHeadlineHotels(String cityName) {
    return 'हर stay recommendation के लिए $cityName Concierge अनलॉक करें।';
  }

  @override
  String freemiumHeadlineRestaurants(String cityName) {
    return '$cityName का पूरा restaurant collection अनलॉक करें।';
  }

  @override
  String get freemiumHeadlineGems =>
      'स्थानीय favorites और insider gems इंतज़ार कर रहे हैं।';

  @override
  String get freemiumHeadlineSecrets =>
      'निवासियों के timing और parking secrets अनलॉक करें।';

  @override
  String freemiumHeadlineExperiences(String cityName) {
    return 'पूरे $cityName में curated experiences अनलॉक करें।';
  }

  @override
  String get freemiumHeadlineAttractions =>
      'पूरा attractions collection अनलॉक करें।';

  @override
  String get freemiumHeadlineHotelMatchmaker =>
      'हर stay compare करने के लिए Hotel Intelligence अनलॉक करें।';

  @override
  String get freemiumHeadlineFullItinerary =>
      'अपना पूरा vacation plan अनलॉक करें।';

  @override
  String get freemiumLocalSecretsTitle => 'स्थानीय रहस्य';

  @override
  String get freemiumLocalSecretsSubtitle =>
      'Insider timing, parking और viewpoints जो locals संभालते हैं।';
}
