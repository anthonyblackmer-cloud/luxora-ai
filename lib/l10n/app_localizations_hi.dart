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
  String get commonLive => 'लाइव';

  @override
  String get commonClose => 'बंद करें';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonDelete => 'हटाएँ';

  @override
  String get settingsStartOverSubtitle => 'शुरुआत से एक नई यात्रा बनाएँ';

  @override
  String get navConcierge => 'दरबान';

  @override
  String get navTimeline => 'समय';

  @override
  String get navMap => 'मानचित्र';

  @override
  String get navGems => 'रत्न';

  @override
  String get navFeed => 'खिलाना';

  @override
  String get navTrips => 'ट्रिप्स';

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
  String get conciergeGreetingMorning => 'सुप्रभात।';

  @override
  String get conciergeGreetingAfternoon => 'नमस्कार।';

  @override
  String get conciergeGreetingEvening => 'शुभ संध्या।';

  @override
  String get conciergeWelcomeWarm =>
      'मैं फ्लोरिडा को आपकी पसंदीदा अनुभूति के अनुसार ढालने के लिए यहाँ हूँ — न कि स्थलों की सूची के अनुसार। आज आपका क्या मन है?';

  @override
  String get conciergeRefineStyle => 'मेरी शैली निखारें';

  @override
  String get conciergeRecallReturning => 'वापसी पर स्वागत है।';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'मुझे याद है आपको $prefs पसंद है।';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'और आप चाहते थे कि यह यात्रा ऐसा महसूस कराए: “$feel”।';
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
  String get discoverSearchScopeAll =>
      'कैटलॉग में संपूर्ण फ्लोरिडा खोजा जा रहा है';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'ऑरलैंडो के $radius के भीतर';
  }

  @override
  String get discoverSearchEmpty =>
      'इस दायरे में कोई मिलान नहीं - एक छोटा नाम आज़माएं, मानचित्र या फ़ीड पर अपनी दूरी चिप को चौड़ा करें, या \"समुद्र तट\", \"डिज़नी\", या \"स्प्रिंग्स\" खोजें।';

  @override
  String get discoverFilterAll => 'सभी';

  @override
  String get discoverFilterHotels => 'होटल';

  @override
  String get discoverFilterRestaurants => 'रेस्तरां';

  @override
  String get discoverFilterDestinations => 'गंतव्य';

  @override
  String get discoverPopularInRadius => 'आपके दायरे में लोकप्रिय';

  @override
  String get discoverTrySearching => 'खोजने का प्रयास करें';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return 'गंतव्यों की $count · ऑरलैंडो के $radius के भीतर';
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
  String get feedBadge => 'लाइव खोज';

  @override
  String get feedTitle => 'अनुभव फ़ीड';

  @override
  String get feedSubtitle =>
      'अभी क्या चल रहा है - ट्रेंडिंग स्पॉट, नए उद्घाटन, निर्माता की पसंद, मौसमी मार्ग और लाइव अपडेट।';

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
  String get feedMoodAll => 'सब कुछ';

  @override
  String get feedMoodRomantic => 'रोमांटिक';

  @override
  String get feedMoodCalm => 'शांत';

  @override
  String get feedMoodAdventurous => 'साहसिक';

  @override
  String get feedMoodPampered => 'लाड़-प्यार';

  @override
  String get feedMoodSocial => 'जीवंत';

  @override
  String get feedMoodFoodie => 'खाने का शौक़';

  @override
  String get feedEmptyHint =>
      'इस दायरे में कोई फ़ीड कार्ड नहीं - खाड़ी तट और कीज़ हाइलाइट्स के लिए 50 मील या ऑल फ़्लोरिडा का प्रयास करें।';

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
    return '$count रत्न आपकी शैली से मेल खाते हैं';
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
  String get mapPlanDayTitle => 'मेरा दिन प्लान करें';

  @override
  String get mapPlanDaySuggested =>
      'आपकी यात्रा के मूड के आधार पर सुझाया गया — इसे अपना बनाने के लिए स्थान बुकमार्क करें।';

  @override
  String get mapPlanDayEmpty =>
      'गंतव्य बुकमार्क करें (♥) और Luxora आपके ऑरलैंडो हब से एक अनुकूलित रूट बनाएगा — कम ड्राइविंग, ज़्यादा एहसास।';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count पड़ाव · $miles · $time ड्राइव';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return '$hotel से शुरू';
  }

  @override
  String get mapCrowdLevelQuiet => 'शांत';

  @override
  String get mapCrowdLevelModerate => 'मध्यम';

  @override
  String get mapCrowdLevelBusy => 'भीड़';

  @override
  String get mapCrowdLevelPacked => 'बहुत भीड़';

  @override
  String mapCrowdAtStop(String level) {
    return 'भीड़: $level';
  }

  @override
  String get mapRerouteButton => 'शांत स्टॉप्स के लिए रूट बदलें';

  @override
  String mapRerouteApplied(int count) {
    return 'दिन समायोजित — $count स्टॉप कम भीड़ वाले स्थानों से बदले गए।';
  }

  @override
  String get mapRerouteNone => 'आपका रूट पहले से शांत लगता है।';

  @override
  String get mapRerouteRainHint =>
      'बारिश की संभावना — इनडोर विकल्पों के लिए रूट बदलें।';

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
  String get tripsPlanNew => 'नई यात्रा की योजना बनाएँ';

  @override
  String get tripsEmptyTitle => 'अभी तक कोई सहेजी गई यात्रा नहीं';

  @override
  String get tripsEmptyBody =>
      'अपनी पहली यात्रा की योजना बनाएँ और वह यहाँ दिखाई देगी, जब चाहें फिर से देखें।';

  @override
  String get tripsDeleteTitle => 'यात्रा हटाएँ?';

  @override
  String tripsDeleteBody(String title) {
    return 'यह “$title” को आपकी सहेजी गई यात्राओं से हटा देगा। इसे पूर्ववत नहीं किया जा सकता।';
  }

  @override
  String get tripsDeleted => 'यात्रा हटाई गई';

  @override
  String get tripsLiveWeather => 'लाइव मौसम';

  @override
  String get tripsNextUp => 'अगला';

  @override
  String get tripsSunsetWindow => 'सूर्यास्त खिड़की';

  @override
  String get tripsTimelineSnapshot => 'टाइमलाइन स्नैपशॉट';

  @override
  String get tripsOpenTimeline => 'पूर्ण टाइमलाइन खोलें';

  @override
  String get tripsShare => 'साझा करें';

  @override
  String get shareItineraryFooter =>
      'Luxora के साथ नियोजित — आपका भावनात्मक रूप से समझदार फ्लोरिडा साथी।';

  @override
  String shareSubject(String title) {
    return 'मेरी $title';
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
  String get detailPrice => 'कीमत';

  @override
  String get detailLocation => 'जगह';

  @override
  String get detailGetDirections => 'दिशा-निर्देश पाएँ';

  @override
  String get detailParkMap => 'पार्क मानचित्र';

  @override
  String get detailViewOnMap => 'मानचित्र पर देखें';

  @override
  String get detailMapsError => 'इस डिवाइस पर मानचित्र नहीं खोला जा सका।';

  @override
  String get detailGoogleMaps => 'Google मानचित्र';

  @override
  String get detailAppleMaps => 'Apple मानचित्र';

  @override
  String get detailOpenInMaps => 'मानचित्र में खोलें';

  @override
  String detailDriveFromOrlando(String time) {
    return 'ऑरलैंडो से $time की ड्राइव';
  }

  @override
  String get detailSaveToItinerary => 'यात्रा-योजना में सहेजें';

  @override
  String get detailSaved => 'सहेजा गया';

  @override
  String get detailSavedSnack => 'आपकी यात्रा-योजना में सहेजा गया';

  @override
  String get detailRemovedSnack => 'आपकी यात्रा-योजना से हटाया गया';

  @override
  String get detailSetHomeBase => 'होम बेस सेट करें';

  @override
  String get detailHomeBaseActive => 'आपकी यात्रा का होम बेस';

  @override
  String get detailHomeBaseHint =>
      'आपके दिन का रूट यहीं से शुरू और खत्म होता है।';

  @override
  String get detailHomeBaseSetSnack => 'आपकी यात्रा का होम बेस सेट किया गया';

  @override
  String get detailHomeBaseClearedSnack => 'होम बेस हटाया गया';

  @override
  String get detailMenuTitle => 'मेन्यू की झलकियाँ';

  @override
  String get detailMenuDisclaimer =>
      'चुनिंदा व्यंजन — पूरा मेन्यू और कीमतें स्थान पर भिन्न हो सकती हैं।';

  @override
  String get detailMenuComingSoon =>
      'हम अभी यह मेन्यू तैयार कर रहे हैं। तब तक नवीनतम मेन्यू और कीमतें ऑनलाइन देखें।';

  @override
  String get detailViewMenuOnline => 'मेन्यू ऑनलाइन देखें';

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
  String get landingBadge => 'फ्लोरिडा · ऑरलैंडो एमवीपी';

  @override
  String get landingTitle1 => 'छुट्टियाँ';

  @override
  String get landingTitle2 => 'पहले ही शुरू हो चुका है.';

  @override
  String get landingSubtitle =>
      'लक्सोरा एआई आपकी भावनात्मक रूप से बुद्धिमान दरबान है - छिपे हुए रत्न, छत पर सूर्यास्त, और आपके पैक करने से पहले अविस्मरणीय महसूस करने के लिए डिज़ाइन किए गए क्षण।';

  @override
  String get landingBegin => 'अपनी यात्रा शुरू करें';

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
  String get onboardStep1Title => 'जहां सपने सबसे पहले उतरते हैं';

  @override
  String get onboardStep1Subtitle => 'आपकी मंज़िल किधर है?';

  @override
  String get onboardDestination => 'गंतव्य';

  @override
  String get onboardRegion => 'क्षेत्र';

  @override
  String get onboardStep2Title => 'स्वतंत्र महसूस करने का समय';

  @override
  String get onboardStep2Subtitle => 'आपका पलायन कब शुरू होता है?';

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
  String get onboardPoolside => 'पूल और आराम';

  @override
  String get onboardAdventure => 'रोमांच और बाहरी गतिविधियाँ';

  @override
  String get onboardCulture => 'संस्कृति और दर्शनीय स्थल';

  @override
  String get dayFlowSubtitle =>
      'एक दिन जो इस पर आधारित है कि आप कैसा महसूस करना चाहते हैं — कोई चेकलिस्ट नहीं।';

  @override
  String get dayFlowMorning => 'सुबह';

  @override
  String get dayFlowMidday => 'दोपहर';

  @override
  String get dayFlowAfternoon => 'अपराह्न';

  @override
  String get dayFlowEvening => 'शाम';

  @override
  String get dayFlowNight => 'रात';

  @override
  String get dayFlowReasonMorningPool =>
      'धीरे शुरू करें — दिन शुरू होने से पहले पूल या स्पा में।';

  @override
  String get dayFlowReasonMorningCalm =>
      'दिन का माहौल तय करने के लिए एक शांत शुरुआत।';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'सबसे ज़्यादा ऊर्जा वाले घंटे — तरोताज़ा रहते हुए बड़ा रोमांच।';

  @override
  String get dayFlowReasonMiddayCulture =>
      'दिन की सबसे अच्छी रोशनी में दर्शनीय स्थल।';

  @override
  String get dayFlowReasonMiddayIcon => 'दिन का सबसे ख़ास पल।';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'तरोताज़ा होने के लिए दोपहर का आराम।';

  @override
  String get dayFlowReasonAfternoonGem => 'भीड़ से दूर एक छिपा हुआ रत्न।';

  @override
  String get dayFlowReasonEveningDining =>
      'दिन का मुख्य भोजन — आपकी पसंदीदा खाने की जगह।';

  @override
  String get dayFlowReasonNightOut => 'एक आख़िरी चमक — रात की सैर।';

  @override
  String weatherToday(String place) {
    return '$place में अभी';
  }

  @override
  String weatherSunset(String time) {
    return 'सूर्यास्त $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% बारिश की संभावना — एक हल्की परत साथ रखें।';
  }

  @override
  String get weatherConditionClear => 'साफ़';

  @override
  String get weatherConditionPartlyCloudy => 'आंशिक रूप से बादल';

  @override
  String get weatherConditionCloudy => 'बादल';

  @override
  String get weatherConditionFog => 'कोहरा';

  @override
  String get weatherConditionDrizzle => 'बूंदाबांदी';

  @override
  String get weatherConditionRain => 'बारिश';

  @override
  String get weatherConditionSnow => 'बर्फ़';

  @override
  String get weatherConditionThunder => 'आंधी-तूफ़ान';

  @override
  String get dayFlowVibeFoodie => 'खाने का शौक़';

  @override
  String get dayFlowVibeNightlife => 'नाइटलाइफ़';

  @override
  String get dayFlowVibePoolside => 'पूल';

  @override
  String get dayFlowVibeAdventure => 'साहसिक';

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
}
