// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => 'Ayarlar';

  @override
  String get appearance => 'Dış görünüş';

  @override
  String get settingsThemeIntro =>
      'Sinematik karanlık veya resort açık — geziniz için ruh hâlini seçin.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get themeGoldenEmber => 'Golden Ember';

  @override
  String get themeGoldenEmberMood => 'Sıcak ultra lüks';

  @override
  String get themeMidnightAmethyst => 'Midnight Amethyst';

  @override
  String get themeMidnightAmethystMood => 'Gizemli ve ayrıcalıklı';

  @override
  String get themeEmeraldHaven => 'Emerald Haven';

  @override
  String get themeEmeraldHavenMood => 'Huzurlu tropik lüks';

  @override
  String get themeRivieraWhite => 'Riviera White';

  @override
  String get themeRivieraWhiteMood => 'Zarif lüks seyahat dergisi';

  @override
  String get themeCoastalGlass => 'Coastal Glass';

  @override
  String get themeCoastalGlassMood => 'Temiz premium tatil enerjisi';

  @override
  String get themeChampagneLuxe => 'Champagne Luxe';

  @override
  String get themeChampagneLuxeMood => 'Özel concierge zarafeti';

  @override
  String get themeBlackCard => 'Black Card';

  @override
  String get themeBlackCardMood => 'Özel havacılık prestiji';

  @override
  String get settingsThemeSectionLuxury => 'Lüks sinema';

  @override
  String get settingsThemeSectionReadable => 'Temiz ve okunabilir';

  @override
  String get settingsMapSkinSection => 'Harita tabanı';

  @override
  String get settingsMapSkinIntro =>
      'Harita sekmesindeki harita döşemelerinin görünümünü seçin.';

  @override
  String get mapSkinVoyager => 'Voyager';

  @override
  String get mapSkinVoyagerMood => 'Yumuşak renkler — parklar, su, yollar';

  @override
  String get mapSkinOsm => 'OpenStreetMap';

  @override
  String get mapSkinOsmMood => 'Klasik, doğal tonlar';

  @override
  String get mapSkinCartoLight => 'Carto Light';

  @override
  String get mapSkinCartoLightMood => 'Minimal ve aydınlık';

  @override
  String get mapSkinCartoDark => 'Carto Dark';

  @override
  String get mapSkinCartoDarkMood => 'Gece dostu taban';

  @override
  String get mapSkinMapboxStreets => 'Mapbox Streets';

  @override
  String get mapSkinMapboxStreetsMood =>
      'Zengin detay, seyahat uygulaması görünümü';

  @override
  String get mapSkinMapboxOutdoors => 'Mapbox Outdoors';

  @override
  String get mapSkinMapboxOutdoorsMood => 'Yeşillik ve arazi vurgusu';

  @override
  String get dark_mode => 'Karanlık mod';

  @override
  String get light_mode => 'Işık modu';

  @override
  String get language => 'Dil';

  @override
  String get settings_language_picker_note => 'Değişiklikler hemen uygulanır.';

  @override
  String get settings_regions_coming_title => 'Ülkeler ve şehirler';

  @override
  String get settings_regions_coming_subtitle =>
      'Ana merkez ve şehir paketleri — çok yakında.';

  @override
  String get commonSoon => 'Yakında';

  @override
  String get commonContinue => 'Devam etmek';

  @override
  String get commonNew => 'Yeni';

  @override
  String get commonRoadmap => 'Yol Haritası';

  @override
  String get commonLive => 'Canlı';

  @override
  String get commonClose => 'Kapalı';

  @override
  String get commonCancel => 'İptal etmek';

  @override
  String get commonDelete => 'Silmek';

  @override
  String get settingsStartOverSubtitle =>
      'Sıfırdan yeni bir yolculuğa başlayın';

  @override
  String get navConcierge => 'Kapıcı';

  @override
  String get navAgenda => 'Bugün';

  @override
  String get navDiscover => 'Keşfetmek';

  @override
  String get navMap => 'Harita';

  @override
  String get navTrips => 'Geziler';

  @override
  String get navMore => 'Daha';

  @override
  String get navRestaurants => 'Restoranlar';

  @override
  String get navTimeline => 'Zaman çizelgesi';

  @override
  String get agendaTabItinerary => 'Günler';

  @override
  String get agendaTabRestaurants => 'Restoranlar';

  @override
  String get restaurantsPageTitle => 'Restoranlar';

  @override
  String get restaurantsPageSubtitle =>
      'Luxora\'nın bildiği yemeklere göz atın - favorilerinizi kaydedin veya bu gecenin yemeğini Concierge\'in seçmesine izin verin.';

  @override
  String get restaurantsConciergePick => 'Benim için bir restoran seç';

  @override
  String restaurantsConciergePickDone(String name) {
    return '$name kaydedildi — Concierge\'den bunu seyahatinize eklemesini isteyin.';
  }

  @override
  String restaurantsSavedCount(int count) {
    return '$count seyahatiniz için kaydedildi';
  }

  @override
  String get restaurantsEmptyHint =>
      'Keşfetme yarıçapınızda restoran yok; haritadaki yarıçapı genişletin.';

  @override
  String get moreCardRestaurantsSub =>
      'Restoranlara göz atın ve Concierge\'in sizin için seçim yapmasına izin verin';

  @override
  String get agendaHotelSuggestionsTitle => 'Nerede kalınır';

  @override
  String agendaHotelSuggestionsSubtitle(int budget) {
    return '~$budget ABD Doları tutarındaki seyahat bütçenize yapay zekayla uyum sağlayın; tüm seçenekleri görmek için dokunun.';
  }

  @override
  String agendaHotelTopPick(String name) {
    return 'En iyi seçim: $name';
  }

  @override
  String get agendaStayDropdownHint => 'Bir otel seçin';

  @override
  String get agendaDiningDropdownHint => 'Bir restoran seçin';

  @override
  String get agendaDaySelectLabel => 'Hangi gün';

  @override
  String get agendaDayDiningTitle => 'Bu gece nerede yenir';

  @override
  String agendaDayDiningSubtitle(int budget, String tier) {
    return 'Bugünün planına göre ~$budget ABD Doları bütçeniz ($tier yemek) için öneriler.';
  }

  @override
  String get agendaDiningNearStops => 'Bugünkü durakların yakınında';

  @override
  String get agendaDiningFitsBudget => 'Seyahat bütçenize uygun';

  @override
  String get agendaDiningMatchesDay => 'Bugünün atmosferine uyuyor';

  @override
  String get agendaDiningFoodiePick => 'Yemek tutkunlarının favorisi';

  @override
  String get browseCatRecommended => 'Tavsiye edilen';

  @override
  String get browseCatDisneyHotels => 'Disney bölgesi';

  @override
  String get browseCatBudgetFriendly => 'Bütçe dostu';

  @override
  String get browseCatUpscaleLuxury => 'Lüks ve lüks';

  @override
  String get browseCatUniversalHotels => 'Evrensel alan';

  @override
  String get browseCatThemeParkDining => 'Tema parkında yemek';

  @override
  String get browseCatUpscaleDining => 'Lüks ve seçkin restoranlar';

  @override
  String get browseSearchAllHotels => 'Otel kataloğunun tamamını arayın…';

  @override
  String get browseSearchAllRestaurants =>
      'Restoran kataloğunun tamamını arayın…';

  @override
  String get browseCategoryEmpty =>
      'Bu kategoride yarıçapınız için eşleşme yok; aramayı deneyin veya keşfetmeyi genişletin.';

  @override
  String get browseFullCatalogHint =>
      'Kataloğun tamamı için yukarıdaki aramayı kullanın; Luxora\'nın bildiği her otel ve restoran.';

  @override
  String get agendaPageSubtitle => 'Şu anda ne yapıyorum?';

  @override
  String get navGems => 'Taşlar';

  @override
  String get navFeed => 'Beslemek';

  @override
  String get navTicketSavings => 'Tasarruf';

  @override
  String get navStays => 'Konaklamalar';

  @override
  String get morePageTitle => 'Daha';

  @override
  String get morePageSubtitle =>
      'Seyahat araçları, hesap ve tercihler — sakin erişim için seçilmiştir.';

  @override
  String get moreSectionTravelTools => 'SEYAHAT ARAÇLARI';

  @override
  String get moreSectionAccount => 'HESAP';

  @override
  String get moreSectionApp => 'UYGULAMA';

  @override
  String get moreCardHotelsSub => 'Akıllı, ruh halinize uygun kalır';

  @override
  String get moreCardGemsSub =>
      'İçeriden öğrenenlerin yerel korumayı keşfetmesi';

  @override
  String get moreCardTicketsSub =>
      'Yetkili iş ortağı tasarruflarını karşılaştırın';

  @override
  String get moreCardWeatherSub => 'Tahmine duyarlı gün rehberliği';

  @override
  String get moreCardProfileTitle => 'Seyahat profili';

  @override
  String get moreCardProfileSub => 'Kim seyahat eder, nasıl hissetmeli?';

  @override
  String get moreCardFavoritesSub => 'Favorilerinize eklediğiniz hedefler';

  @override
  String get moreCardNotificationsTitle => 'Bildirimler';

  @override
  String get moreCardNotificationsSub =>
      'Seyahat uyarıları ve konsiyerj güncellemeleri';

  @override
  String get moreCardSettingsSub => 'Tema, şehir paketleri ve tercihler';

  @override
  String get moreCardAboutSub => 'Neden Luxora\'yı inşa ediyoruz?';

  @override
  String get moreCardHelpSub => 'Rehberler ve konsiyerj desteği';

  @override
  String get moreCardCityPacksSub => 'Hedef konsiyerjlerin kilidini açın';

  @override
  String get moreCardPartnersSub => 'Öne çıkan iş ortağı deneyimleri';

  @override
  String get moreCardItinerarySub => 'Günlük altın kaçışınız';

  @override
  String get moreCardDiscoverSub =>
      'Trend olan yemekler, deneyimler ve canlı keşif';

  @override
  String get savedFavoritesTitle => 'Favoriler kaydedildi';

  @override
  String get savedFavoritesEmpty =>
      'Hedefleri haritada veya yayında yer imlerine ekleyin; burada görünecekler.';

  @override
  String get helpCenterTitle => 'Yardım Merkezi';

  @override
  String get helpCenterBody =>
      'Konsiyerj yardımı için support@luxora.ai adresine e-posta gönderin. Uygulama içi kılavuzlar yakında gelecek.';

  @override
  String get notificationsComingSoon =>
      'Gelecekteki bir güncellemeyle gezi bildirimleri gelecek.';

  @override
  String get partnerOffersTitle => 'İş ortağı teklifleri';

  @override
  String get ticketSavingsTitle => 'Akıllı Bilet Tasarrufu';

  @override
  String get ticketSavingsBadgeLabel => 'PREMIUM TASARRUF';

  @override
  String get ticketSavingsSubtitle =>
      'Luxora yetkili satıcıları, paketleri ve promosyonları öne çıkarır, böylece kendinizi bir kupon sitesi değil, lüks bir danışman gibi hissedersiniz.';

  @override
  String ticketSavingsBadge(int percent) {
    return '%$percent TASARRUF EDİN';
  }

  @override
  String get ticketOfficialPrice => 'Resmi';

  @override
  String get ticketDiscountPrice => 'Luxora fiyatı';

  @override
  String ticketSaveAmount(String amount) {
    return '$amount tasarruf edin';
  }

  @override
  String get ticketSaveAmountLabel => 'Tasarruf';

  @override
  String ticketSavePerTicket(String amount) {
    return 'Bilet başına $amount tasarruf edebilirsiniz.';
  }

  @override
  String ticketFamilySave(String amount) {
    return 'Tahmini aile tasarrufu: $amount.';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return 'Tahmini aile tasarrufu: $amount.';
  }

  @override
  String ticketSource(String source) {
    return 'Kaynak: $source';
  }

  @override
  String ticketExpires(String date) {
    return '$date tarihine kadar teklif';
  }

  @override
  String get ticketBetterOption => 'Luxora daha iyi bir seçenek buldu.';

  @override
  String get ticketOverpaying =>
      'Kapı fiyatında fazla ödeme yapıyor olabilirsiniz.';

  @override
  String get ticketRecommendedSavings => 'Önerilen tasarruflar mevcut';

  @override
  String get ticketCalculatorTitle => 'Potansiyel tasarruf';

  @override
  String get ticketFilterLabel => 'Filtre';

  @override
  String get ticketFilterAll => 'Tüm';

  @override
  String get ticketFilterThemeParks => 'Tema parkları';

  @override
  String get ticketFilterAttractions => 'Gezilecek Yerler';

  @override
  String get ticketFilterTours => 'Turlar';

  @override
  String get ticketFilterDining => 'Yemek deneyimleri';

  @override
  String get ticketFilterWaterParks => 'Su parkları';

  @override
  String get ticketFilterFamily => 'Aile aktiviteleri';

  @override
  String get ticketFilterEntertainment => 'Eğlence';

  @override
  String get ticketSortLabel => 'Göre sırala';

  @override
  String get ticketSortHighestSavings => 'En yüksek tasarruf';

  @override
  String get ticketSortMostPopular => 'En popüler';

  @override
  String get ticketSortFamilyFriendly => 'Aile dostu';

  @override
  String get ticketSortLuxury => 'Lüks deneyimler';

  @override
  String get ticketSortClosest => 'Bana en yakın';

  @override
  String get ticketDealsSectionTitle => 'Yetkili anlaşmalar';

  @override
  String ticketDealsPricesAsOf(String date) {
    return '$date itibarıyla fiyatlar';
  }

  @override
  String get ticketDealsRefreshFailed =>
      'Fiyatlar yenilenemedi; önbelleğe alınan fırsatlar gösteriliyor.';

  @override
  String get ticketDealsUpdating => 'Fiyatlar güncelleniyor…';

  @override
  String get ticketNoDeals =>
      'Bu filtrede fırsat yok; başka bir kategori deneyin.';

  @override
  String get ticketConfidenceHigh => 'Yüksek güven';

  @override
  String get ticketConfidenceVerified => 'Doğrulanmış satıcı';

  @override
  String get ticketConfidenceLimited => 'Sınırlı süre';

  @override
  String get ticketAiInsightTitle => 'Luxora tavsiyesi';

  @override
  String get ticketInsightDisneyPass =>
      'Seyahat programınıza göre, tek günlük biletler yerine 3 günlük Walt Disney World pass bileti ailenize yaklaşık 120 USD tasarruf sağlayabilir.';

  @override
  String get ticketInsightUniversalCombo =>
      'Planınız Universal\'i içeriyor; 2 park bileti, çoğu aile için ayrı ayrı satın alma günlerinden daha iyi.';

  @override
  String get ticketInsightSeaworldCombo =>
      'Rotanızda SeaWorld — Aquatica kombinasyonu genellikle iki ayrı girişi geride bırakır.';

  @override
  String get ticketInsightGeneric =>
      'Luxora, seyahat planınızdaki duraklarla tasarrufları eşleştirdi; kapıda satın almadan önce karşılaştırın.';

  @override
  String get ticketInsightMiamiCulture =>
      'Planınızda kültür durakları — Vizcaya ve PAMM iş ortağı teklifleri bu hafta giriş fiyatlarını geçebilir.';

  @override
  String get ticketInsightMiamiEverglades =>
      'Seyahat programınızdaki Everglades günü - sabah sürat teknesi slotları genellikle hafta ortasında daha ucuzdur.';

  @override
  String get ticketInsightMiamiWynwood =>
      'Wynwood rotanızda - rehberli bir sanat yürüyüşü, standsız stand fiyatlandırmasından daha iyi olabilir.';

  @override
  String get ticketItineraryMatchTitle => 'Seyahat planı tasarruf kontrolü';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'Kapıcı';

  @override
  String conciergeTripFeel(String feel) {
    return 'Yolculuk hissi: “$feel”';
  }

  @override
  String get conciergeWelcome =>
      'Duygusal açıdan zeki Florida arkadaşınız Luxora\'ya hoş geldiniz.\n\nAşağıdan bir bilgi istemi seçin veya seyahatinizin yaratmasını istediğiniz duyguyu tanımlayın.';

  @override
  String get conciergeQuickPrompts => 'Hızlı istemler';

  @override
  String get conciergeRemembering => 'Bu geziyi hatırlamak';

  @override
  String get conciergeStyleMemory => 'Stil hafızası';

  @override
  String get conciergeInputHint =>
      'Seyahatinizin yaratmasını istediğiniz duyguyu tanımlayın…';

  @override
  String get conciergeGreetingMorning => 'Günaydın.';

  @override
  String get conciergeGreetingAfternoon => 'Tünaydın.';

  @override
  String get conciergeGreetingEvening => 'İyi akşamlar.';

  @override
  String get conciergeWelcomeWarm =>
      'Florida\'yı nasıl hissetmek istediğinize göre şekillendirmek için buradayım; görülecek yerlerin bir kontrol listesi değil. Bugün neyi arzuluyorsun?';

  @override
  String get conciergeRefineStyle => 'Stilimi Geliştir';

  @override
  String get conciergeRecallReturning => 'Tekrar hoşgeldiniz.';

  @override
  String conciergeRecallStyle(String prefs) {
    return '$prefs\'i sevdiğinizi hatırlıyorum.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'Ve bu yolculuğun şunu hissetmesini istediniz: \"$feel\".';
  }

  @override
  String get conciergePromptRomantic => 'Romantik kaçamak';

  @override
  String get conciergePromptWellness => 'Sağlık sıfırlama';

  @override
  String get conciergePromptFamily => 'Aile büyüsü';

  @override
  String get conciergePromptHiddenLuxury => 'Gizli lüks';

  @override
  String get conciergePromptFoodie => 'Yemek macerası';

  @override
  String get conciergePromptSoftLuxury => 'Yumuşak lüks kaçış';

  @override
  String get conciergePromptAdventure => 'Macera modu';

  @override
  String get conciergePromptDisney => 'Disney karanlık sonrası';

  @override
  String get discoverSearchHint => 'Hedefleri ara…';

  @override
  String get discoverSearchTitle => 'Bir varış noktası bulun';

  @override
  String get discoverFromOrlando => 'Orlando\'dan';

  @override
  String discoverFromHub(String hub) {
    return '$hub\'dan';
  }

  @override
  String get discoverSearchScopeAll => 'Katalogdaki tüm Florida\'yı arama';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'Orlando\'nun $radius dahilinde';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return '$hub bölgesinin $radius dahilinde';
  }

  @override
  String get discoverSearchEmpty =>
      'Bu yarıçapta eşleşme yok; daha kısa bir ad deneyin, Harita veya Akış\'ta mesafe çipinizi genişletin veya \"plaj\", \"Disney\" veya \"yaylar\" şeklinde arama yapın.';

  @override
  String get discoverFilterAll => 'Tüm';

  @override
  String get discoverFilterHotels => 'Oteller';

  @override
  String get discoverFilterRestaurants => 'Restoranlar';

  @override
  String get discoverFilterDestinations => 'Destinasyonlar';

  @override
  String get discoverPopularInRadius => 'Çevrenizdeki popüler';

  @override
  String get discoverTrySearching => 'Aramayı deneyin';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return 'Orlando\'nun $radius dahilindeki $count varış noktası';
  }

  @override
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return '$hub bölgesinin $radius dahilindeki $count hedef';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count varış noktası · tüm Florida';
  }

  @override
  String get radius25 => '25 mil';

  @override
  String get radius50 => '50 mil';

  @override
  String get radius100 => '100 mil';

  @override
  String get radiusAllFlorida => 'Tüm Florida';

  @override
  String get radiusDesc25 => 'Orlando çekirdeği çevresinde günlük geziler';

  @override
  String get radiusDesc50 => 'Yaylar, sahil günübirlik geziler, Uzay Sahili';

  @override
  String get radiusDesc100 => 'Tampa Körfezi, Daytona, derin Körfez';

  @override
  String get radiusDescAll => 'Keys, Miami, eyalet çapında öne çıkanlar';

  @override
  String get radiusDesc25Miami =>
      'South Beach, Brickell ve çekirdek mahalleler';

  @override
  String get radiusDesc50Miami => 'Wynwood, Coconut Grove, Key Biscayne';

  @override
  String get radiusDesc100Miami =>
      'Everglades, Fort Lauderdale, daha derin Güney Florida';

  @override
  String get radiusDescAllMiami =>
      'Florida Keys yolu ve eyalet çapında öne çıkanlar';

  @override
  String get radiusDesc25Keys => 'Key Largo, Islamorada ve üst resif koridoru';

  @override
  String get radiusDesc50Keys => 'Maraton, Big Pine ve Middle Keys plajları';

  @override
  String get radiusDesc100Keys => 'Key West\'ten geçen Tam Denizaşırı Otoyol';

  @override
  String get radiusDescAllKeys => 'Tüm ada zinciri ve günlük gezi suları';

  @override
  String get feedBadge => 'CANLI KEŞİF';

  @override
  String get feedTitle => 'Deneyim Akışı';

  @override
  String get feedSubtitle =>
      'Şu anda trend olan noktalar, yeni açılışlar, içerik oluşturucuların seçimleri, sezonluk rotalar ve canlı güncellemeler.';

  @override
  String get feedSubtitleFamily =>
      'Mürettebatınız için aile dostu seçimler: parklar, kolay galibiyetler ve çocukların (ve ebeveynlerin) hoşuna giden anlar.';

  @override
  String get feedPillTrending => 'Trend olan';

  @override
  String get feedPillNewOpenings => 'Yeni açılışlar';

  @override
  String get feedPillCreator => 'İçerik oluşturucunun seçtikleri';

  @override
  String get feedPillLive => 'Canlı güncellemeler';

  @override
  String get feedMoodPrompt => 'NASIL HİSSETMEK İSTİYORSUNUZ?';

  @override
  String get feedMoodPromptFamily => 'EKİBİNİZ İÇİN BUGÜN NASIL OLMALI?';

  @override
  String get feedMoodAll => 'Her şey';

  @override
  String get feedMoodFamily => 'Aile büyüsü';

  @override
  String get feedMoodRomantic => 'Romantik';

  @override
  String get feedMoodCalm => 'Sakinlik';

  @override
  String get feedMoodAdventurous => 'Maceracı';

  @override
  String get feedMoodPampered => 'Şımartılmış';

  @override
  String get feedMoodSocial => 'Uğultu';

  @override
  String get feedMoodFoodie => 'Foodie';

  @override
  String get vibeSunsetReady => 'Gün batımı';

  @override
  String get vibeViral => 'Viral';

  @override
  String get vibeFamilyApproved => 'Aile';

  @override
  String get vibeHiddenGem => 'Gizli mücevher';

  @override
  String get vibeRainSafe => 'Yağmura dayanıklı';

  @override
  String get vibeDateNight => 'Randevu gecesi';

  @override
  String get vibeNightVibe => 'Gece havası';

  @override
  String get vibeFoodie => 'Foodie';

  @override
  String get vibeLuxury => 'Lüks';

  @override
  String get vibeTrending => 'Trend';

  @override
  String get vibeLive => 'Canlı';

  @override
  String get vibeSeasonal => 'Mevsimlik';

  @override
  String get vibeLocalPick => 'Yerel';

  @override
  String get vibeAdventure => 'Macera';

  @override
  String get vibeWellness => 'Wellness';

  @override
  String get vibeBeachDay => 'Plaj günü';

  @override
  String get vibeLuxoraPick => 'Luxora seçimi';

  @override
  String get mapLayersTitle => 'HARİTA KATMANI';

  @override
  String get mapLayerAll => 'Tümü';

  @override
  String get mapLayerGems => 'Mücevherler';

  @override
  String get mapLayerNight => 'Gece';

  @override
  String get mapLayerDateNight => 'Randevu';

  @override
  String get mapLayerWeather => 'En iyi hava';

  @override
  String get mapLayerItinerary => 'Program';

  @override
  String get mapExpandMap => 'Haritayı genişlet';

  @override
  String get mapFullscreenTitle => 'Harita';

  @override
  String get mapCloseFullscreen => 'Haritayı kapat';

  @override
  String get mapItineraryDayLabel => 'Programı göster';

  @override
  String get mapItineraryCurrentDay => 'Bugün';

  @override
  String get feedFamilyMoodHint =>
      'Aile etiketleri için filtrelenmiş tema parkları, karakter yemekleri ve kolay ebeveyn kazanımları.';

  @override
  String get feedEmptyHint =>
      'Bu çevrede yayın kartı yok; Körfez kıyısı ve Keys\'in önemli noktaları için 50 mil veya Tüm Florida\'yı deneyin.';

  @override
  String get feedEmptyHintFamily =>
      'Bu çevrede aile etiketli kart yok; Maceracı veya Her Şey\'i deneyin ya da kapsamı genişletin.';

  @override
  String get gemsBadge => 'İÇERİDEN KÜRASYON';

  @override
  String get gemsTitle => 'Gizli Mücevher';

  @override
  String get gemsSubtitle =>
      'Yerel halkın koruduğu gizli keşifler; neden özel olduğu, ne zaman gidileceği, ne kadar kalabalık olduğu ve kartpostallarda bulamayacağınız ipuçları.';

  @override
  String get gemsPillHidden => 'Gizli yerler';

  @override
  String get gemsPillLocal => 'Yalnızca yerel';

  @override
  String get gemsPillInsider => 'İçeriden ipuçları';

  @override
  String get gemsPillCrowd => 'Kalabalık istihbaratı';

  @override
  String get gemsEmptyHint =>
      'Bu yarıçapta henüz mücevher yok; pınarlar ve Uzay Sahili sırları için 50 mil veya ötesine kadar genişletin.';

  @override
  String get gemsSearchHint => 'Gizli mücevherleri ve destinasyonları arayın…';

  @override
  String get gemLocalSecret => 'YEREL GİZLİ';

  @override
  String get gemsMatchedBadge => 'Senin tarzın';

  @override
  String gemsMatchedNote(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mücevher stilinize uyuyor',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
  }

  @override
  String get gemWhySpecial => 'Neden özel?';

  @override
  String get gemBestTime => 'Gitmek için en iyi zaman';

  @override
  String get gemCrowdLevel => 'Kalabalık düzeyi';

  @override
  String get gemInsiderTip => 'İçeriden ipucu';

  @override
  String get gemLocalNote => 'Yalnızca yerel not';

  @override
  String get mapBadge => 'Yapay Zeka HARİTASI';

  @override
  String get mapTitle => 'Akıllı rotanız';

  @override
  String get mapSubtitle =>
      'Seçilmiş gününüz için Pinler - altın pırlantalar Mücevherlerdir, camgöbeği işaretleyiciler bugünün zaman çizelgesidir, altın çizgi ise ruh hali rotasıdır.';

  @override
  String get mapPlanDayTitle => 'Günümü planla';

  @override
  String get mapPlanDaySuggested =>
      'Seyahat ruh halinizden önerilenler; yerleri kendinize ait hale getirmek için yer imlerine ekleyin.';

  @override
  String get mapPlanDayEmpty =>
      'Destinasyonları işaretleyin (♥) ve Luxora, Orlando merkezinizden en az sürüş, en çok duygu ile optimize edilmiş bir rota oluşturur.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count durak · $miles · $time sürüş';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return '$hotel\'den başlıyor';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return '$time sürüş · önceki duraktan $miles uzakta';
  }

  @override
  String get mapCrowdLevelQuiet => 'Sessizlik';

  @override
  String get mapCrowdLevelModerate => 'Ilıman';

  @override
  String get mapCrowdLevelBusy => 'Meşgul';

  @override
  String get mapCrowdLevelPacked => 'Paketlenmiş';

  @override
  String mapCrowdAtStop(String level) {
    return 'Kalabalık: $level';
  }

  @override
  String get mapParkingLevelEasy => 'Kolay';

  @override
  String get mapParkingLevelModerate => 'Ilıman';

  @override
  String get mapParkingLevelDifficult => 'Zor';

  @override
  String get mapParkingLevelLimited => 'Sınırlı · erken varmak';

  @override
  String mapParkingAtStop(String level) {
    return 'Park yeri: $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return 'Sürtünmeyi artırın: $score/90';
  }

  @override
  String get mapRerouteButton => 'Daha sakin duraklar için yeniden rota çizin';

  @override
  String mapRerouteApplied(int count) {
    return 'Gün ayarlandı — Daha hafif kalabalıklar için $count durak değiştirildi.';
  }

  @override
  String get mapRerouteNone => 'Rotanız zaten sakin görünüyor.';

  @override
  String get mapRerouteRainHint =>
      'Endişelenme — günün keyifli ve stressiz kalması için yakında alternatifler buldum.';

  @override
  String get dayFlowSwapTitle => 'Bu durağı değiştir';

  @override
  String dayFlowSwapSubtitle(String current) {
    return 'Luxora\'ya $current yerine ne yapmayı tercih ettiğinizi söyleyin.';
  }

  @override
  String get dayFlowSwapTemplate => 'Daha çok şöyle bir şey düşünüyordum…';

  @override
  String get dayFlowSwapHint =>
      'örneğin bu sabah sakin bir park ya da akşam yemeğinde deniz ürünleri';

  @override
  String get dayFlowSwapApply => 'Günümü güncelle';

  @override
  String get dayFlowSwapViewPlace => 'Geçerli durağı görüntüle';

  @override
  String dayFlowSwapSuccess(String newStop, String phase) {
    return 'Güncellendi — $newStop artık $phase durağınızdır.';
  }

  @override
  String get dayFlowSwapNoMatch =>
      'Yakınlarda bir eşleşme bulunamadı; daha spesifik olmayı deneyin.';

  @override
  String get dayFlowSwapTapToChange => 'Bu durağı değiştir';

  @override
  String get dayFlowSwapHoldSpeak => 'Konuşmak için basılı tutun';

  @override
  String get dayFlowSwapListening => 'Dinleme…';

  @override
  String get rightNowButton => 'Şu anda ne yapmalıyız?';

  @override
  String get rightNowEmpty =>
      'Çevrenizde henüz güçlü bir an yok; genişletin, keşfedin veya birkaç favoriyi yer imlerine ekleyin.';

  @override
  String get rightNowResultTitle => 'ŞU ANDA';

  @override
  String get rightNowTapForDetails => 'Ayrıntılar için dokunun';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return '$minutes\'den $district dakika uzaktasınız. Hava mükemmel; $place\'de kahve alın, ardından kalabalıklar ($crowd kalabalıklar) gelmeden önce $walkArea dolaşın.';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return '$minutes\'den $district dakika uzaktasınız. Gökyüzü harika görünüyor; kalabalıklar hâlâ $crowd iken $place\'e gidin.';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return 'Altın saat yaklaşıyor — yaklaşık $minutes dakika içinde $place (gün batımına kadar $crowd) için yola çıkın.';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return 'Radarda yağmur — Rahat bir iç mekan seçimine $minutes dakika: $place.';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return 'Şekerleme penceresi sakinliği — $minutes konumunda ailece kolay bir sıfırlamaya $place dakika kaldı.';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return 'Randevu gecesi enerjisi — aceleye gelmeden $minutes\'e $place dakika.';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return 'Sessiz zaman aralığı — $minutes\'e $place dakika (şu anda $crowd).';
  }

  @override
  String get goldenHourTitle => 'Altın saat';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return '$minutes\'e gitmek için $time kadar (arabayla $place dakika) yola çıkın; gün batımından ~15 dakika önce varın.';
  }

  @override
  String get goldenHourKindBeach => 'Sahil gün batımı penceresi';

  @override
  String get goldenHourKindRooftop => 'Çatıdaki altın saat';

  @override
  String get goldenHourKindScenic => 'Manzara fotoğrafçılığı zamanlaması';

  @override
  String get vacationScoreTitle => 'Tatil puanı';

  @override
  String vacationScoreSubtitle(int score) {
    return 'Bugün $score/100 gibi bir gün gibi geliyor.';
  }

  @override
  String get onboardOccasionLabel => 'Durum nedir?';

  @override
  String get onboardThemeParksOccasionHint =>
      'Aşağıda Disney ve Universal tema parkı etkinliklerini görmek için Orlando\'nun kilidini açın.';

  @override
  String get occasionGeneral => 'Sadece keşfediyorum';

  @override
  String get occasionAnniversary => 'Yıl dönümü';

  @override
  String get occasionHoneymoon => 'Balayı';

  @override
  String get occasionDateNight => 'Randevu gecesi';

  @override
  String get occasionProposal => 'Teklif gezisi';

  @override
  String get occasionFamily => 'Çocuklu aile';

  @override
  String get occasionDisneyAdventure => 'Disney macerası';

  @override
  String get occasionUniversalAdventure => 'Evrensel macera';

  @override
  String get localSecretTitle => 'Yerel sır';

  @override
  String get localSecretWinterParkParkAvenue =>
      'Yerel halk kitapçının arkasındaki avluya sığınıyor; sokak tabelası yok.';

  @override
  String get localSecretWorldFoodTrucks =>
      'Burger değil, günlük avı sipariş edin; kuyruk uzaktaki pencerede daha hızlı hareket eder.';

  @override
  String get localSecretWekiwaSprings =>
      'Öğleden sonra 2\'den sonra ana tahta kaldırımı atlayın; kuzey patika başı sessiz kalır.';

  @override
  String get localSecretDisneySpringsParking =>
      'En iyi park yeri turuncu garajdır; ana girişte değil, marina tarafında yürüyün.';

  @override
  String get localSecretLakeEolaSunset =>
      'Gökyüzü altın rengine dönerken kuğu fotoğrafları için amfitiyatro tarafına dönün.';

  @override
  String get localSecretMiamiWynwoodAlley =>
      'Panther Coffee\'nin arkasındaki yükleme yolundan geçin; yerel halk, ana hat kalabalığı olmadan duvar resimleri çekiyor.';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      'Önce vitrin arabasından cafecito satın alın; elinizde bir cortadito tuttuğunuzda yan sıradaki müdavimler açılıyor.';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      'Ana teras acelesini atlayın - doğu bahçesinden girin ve mangrov tahta kaldırımında saat yönünün tersine yürüyün.';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      'Sabah saat 7\'de Lummus\'ta doğuya dönün; brunch kalabalığı gelmeden önce art deco pastelleri parlıyor.';

  @override
  String get localSecretMiamiPantherAlley =>
      'Pencereden sipariş verin, sokakta saat yönünde yürüyün; en iyi duvar ışığı turkuaz duvara sabah 8:45\'te vurur.';

  @override
  String get localSecretTampaBayRiverwalkParking =>
      'Whiting Street garajını kullanın — iskele yakınındaki kapanışlardan kaçınmak için nehir boyunca güneye yürüyün.';

  @override
  String get localSecretTampaBayClearwaterSunset =>
      'Pier 60 kalabalığından kaçının — gün batımından 40 dk önce Sand Key yaklaşımı.';

  @override
  String get localSecretTampaBayDaliGarden =>
      'Son öğleden sonra girişini ayırtın — doğu bahçe köprü ışığını teras kalabalığı olmadan yakalar.';

  @override
  String get localSecretTampaBayPierTiming =>
      'Hafta içi 16:00 iskele girişi — hafta sonu bebek arabası trafiği olmadan gün batımı.';

  @override
  String get localSecretTampaBayYborCourtyard =>
      'Paket Cuban sandwich — akşam 8\'den sonra yerel halkın kullandığı tuğla avluda yiyin.';

  @override
  String get localSecretTampaBaySpongeDocks =>
      'Önce iskelede öğle yemeği, sonra sünger botları — hafta içi 13:00 sonrası turlar seyrekleşir.';

  @override
  String get localSecretVegasBellagioFountains =>
      'Gösteriden 15 dk önce çimenin ortasında durun — ön korkuluk koreografiyi keser.';

  @override
  String get localSecretVegasFremontTiming =>
      'Hafta içi 21:00 tavan altında — cumartesi kalabalığı olmadan tam Viva Vision.';

  @override
  String get localSecretVegasCaesarsEntrance =>
      'Otopark bağlantısını kullanın — akşam yemeği saatinde Strip tıkanıklığından kaçının.';

  @override
  String get localSecretVegasVenetianWalk =>
      'Öğlen kapalı kanal yürüyüşü — klimalı Strip geçişi, sıcak uyarısı yok.';

  @override
  String get nycMoodRoutesTitle => 'New York ruh hali rotaları';

  @override
  String get localSecretNycTimesSquareStrategy =>
      '7th Ave yan sokaklarından girin — kavşak kalabalığından kaçının, Broadway görüşünü koruyun.';

  @override
  String get localSecretNycObservationDeck =>
      'Gün batımından önce son slotu ayırtın — öğle kuyruğu olmadan altın ışık.';

  @override
  String get localSecretNycCentralParkEntrance =>
      '72nd Street geçidini kullanın — Columbus Circle kalabalığı olmadan Bethesda\'ya daha hızlı yol.';

  @override
  String get localSecretNycBroadwayTickets =>
      'TKTS sabah kuyruğu erken açılır — rush koltuklar turist fiyatlarını yener.';

  @override
  String get localSecretNycBrooklynBridgePhoto =>
      'Washington Street DUMBO saat 8 — tur gruplarından önce boş arnavut kaldırımı kadrajı.';

  @override
  String get localSecretNycFerryGoldenHour =>
      'Gün batımında Staten Island feribotu — tur teknesi ücreti olmadan ücretsiz liman turu.';

  @override
  String get momentsTitle => 'LUXORA ANLARI';

  @override
  String get momentsSubtitle => 'Bir yer değil, bir duygu arayın.';

  @override
  String get momentFeelRelaxed => 'Rahatlamış hissedin';

  @override
  String get momentImpressSpouse => 'Eşimi etkilemek';

  @override
  String get momentPerfectSunset => 'Mükemmel gün batımı';

  @override
  String get momentFamilyMemory => 'Aile hafızası';

  @override
  String get momentLuxuryValue => 'Aşırı harcama yapmadan lüks';

  @override
  String get momentPromptRelaxed =>
      'Önümüzdeki birkaç saat boyunca tamamen rahatlamış hissetmek istiyorum; yavaş, güzel, kalabalıksız.';

  @override
  String get momentPromptImpressSpouse =>
      'Bu gece eşimi romantik ve beklenmedik bir şeyle etkilemek istiyorum.';

  @override
  String get momentPromptPerfectSunset =>
      'Mükemmel Florida gün batımı anını istiyorum; nerede olmalıyız ve ne zaman yola çıkmalıyız?';

  @override
  String get momentPromptFamilyMemory =>
      'Ebeveynler için kolay, çocuklar için ise büyülü, unutulmaz bir aile anı istiyorum.';

  @override
  String get momentPromptLuxuryValue =>
      'Bir servet harcamadan özel hissettiren lüks istiyorum.';

  @override
  String get visualShareImageButton => 'Resim kartını paylaş';

  @override
  String get tripStoryTitle => 'Seyahat hikayeniz';

  @override
  String tripStoryHeading(String title) {
    return '$title — Florida hikayeniz';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return '$moods için geldin.';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return 'Bu bölüm: $title.';
  }

  @override
  String get tripStoryBeatClosing =>
      'Luxora anları şekillendirdi; siz onları yaşadınız.';

  @override
  String get tripsOpenStory => 'Hikayeniz';

  @override
  String get conciergeVoiceHold => 'Konuşmak için basılı tutun';

  @override
  String get conciergeVoiceSoon =>
      'Sesli konsiyerj yakında geliyor; şimdilik bir dakikaya dokunun veya nasıl hissetmek istediğinizi yazın.';

  @override
  String get conciergeVoiceListening => 'Luxora dinliyor…';

  @override
  String get conciergeVoiceSpeaking => 'Luxora konuşuyor…';

  @override
  String get conciergeVoiceRelease => 'Göndermek için bırakın';

  @override
  String get conciergeVoiceSend => 'Luxora\'ya gönder';

  @override
  String get conciergeVoiceProcessing => 'Luxora\'ya gönderiliyor…';

  @override
  String get conciergeVoiceNoSpeech =>
      'Bunu anlamadım; düğmeyi basılı tutun, konuşun ve bırakın.';

  @override
  String get conciergeVoicePreviewFailed =>
      'Önizleme oynatılamadı. Ses seviyenizi kontrol edip tekrar deneyin.';

  @override
  String get conciergeVoiceUnavailable => 'Ses bu cihazda kullanılamıyor.';

  @override
  String get conciergeVoiceSettingsTitle => 'Luxora\'nın sesi';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Luxora\'nın konuştuğunda nasıl ses çıkaracağını seçin (vurgu, ton ve tempo). Cihazınızın yerleşik seslerini kullanır.';

  @override
  String get conciergeVoiceRateLabel => 'Konuşma temposu';

  @override
  String get conciergeVoiceRateSlow => 'Yavaş';

  @override
  String get conciergeVoiceRateNatural => 'Doğal';

  @override
  String get conciergeVoiceRateFast => 'Hızlı';

  @override
  String get conciergeVoicePreview => 'Sesi önizle';

  @override
  String get conciergeVoicePreviewCurrent => 'Mevcut sesi dinle';

  @override
  String get conciergeVoicePreviewSample =>
      'Merhaba - ben Luxora. Bana bu yolculuğun nasıl hissettirmesini istediğini söyle.';

  @override
  String get conciergeVoiceDeviceNote =>
      'iPhone Ayarları → Erişilebilirlik → Sözlü İçerik → Sesler bölümünden daha fazla ses indirin. Buraya dönün ve Yenile\'ye dokunun.';

  @override
  String get conciergeVoiceDeviceSection => 'Bu iPhone\'daki sesler';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'İndirdiğiniz sesleri içerir; Luxora\'da kullanmak için birine dokunun.';

  @override
  String get conciergeVoiceRefreshList => 'Ses listesini yenile';

  @override
  String get conciergeVoiceShowAllLanguages => 'Tüm dilleri göster';

  @override
  String get conciergeVoiceOpenSettings => 'İPhone ses ayarlarını aç';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      'Ses bulunamadı; Ayarlar\'dan paketleri indirin, ardından yenileyin.';

  @override
  String get conciergeVoicePresetSection => 'Hızlı kişiler';

  @override
  String get conciergeVoiceRegionRecommended => 'Tavsiye edilen';

  @override
  String get conciergeVoiceRegionEnglish => 'İngilizce';

  @override
  String get conciergeVoiceRegionRussian => 'Rusça';

  @override
  String get conciergeVoiceRegionSpanish => 'İspanyol';

  @override
  String get conciergeVoiceRegionFrench => 'Fransızca';

  @override
  String get conciergeVoiceRegionGerman => 'Almanca';

  @override
  String get conciergeVoiceRegionOther => 'Diğer';

  @override
  String get conciergeVoicePresetMatchApp =>
      'Luxora varsayılan · Kate (Premium)';

  @override
  String get conciergeVoicePresetEnUsF => 'Amerikalı · Kadın';

  @override
  String get conciergeVoicePresetEnUsM => 'Amerikalı · Erkek';

  @override
  String get conciergeVoicePresetEnGbF => 'İngiliz · Kadın';

  @override
  String get conciergeVoicePresetEnGbM => 'İngiliz · Erkek';

  @override
  String get conciergeVoicePresetRuF => 'Rus · Kadın';

  @override
  String get conciergeVoicePresetRuM => 'Rus · Erkek';

  @override
  String get conciergeVoicePresetEsF => 'İspanyolca · Kadın';

  @override
  String get conciergeVoicePresetEsM => 'İspanyolca · Erkek';

  @override
  String get conciergeVoicePresetFrF => 'Fransızca · Kadın';

  @override
  String get conciergeVoicePresetFrM => 'Fransızca · Erkek';

  @override
  String get conciergeVoicePresetDeF => 'Almanca · Kadın';

  @override
  String get conciergeVoicePresetDeM => 'Almanca · Erkek';

  @override
  String get conciergeThinking => 'Luxora düşünüyor…';

  @override
  String get conciergeItinerarySynced =>
      'Bunu Ajandanıza ekledim; Haritada aynı duraklar, paylaşıma hazır.';

  @override
  String get conciergeAgendaUpdatedSnack =>
      'Harita ve Gündemde ajandanız hazır';

  @override
  String get conciergeAgendaSyncFailed =>
      'Harita ve Gündem güncellenmedi. Açık bir isteği deneyin, örneğin: 4 günlük bir Disney ve Universal gezisi planlayın.';

  @override
  String get conciergeViewAgendaOnMap => 'Gündemi Görüntüle';

  @override
  String get conciergeAgendaDealsIntro =>
      'Yetkili bilet fırsatlarını gündeminizdeki duraklarla eşleştirdim; kapıda satın almadan önce karşılaştırın:';

  @override
  String get conciergeAgendaDealsSnack => 'Gündeminize uygun bilet fırsatları';

  @override
  String get conciergeViewTicketDeals => 'Fırsatları görüntüle';

  @override
  String ticketAgendaMatchLine(String stop, String amount, String source) {
    return '$stop · $amount aracılığıyla tahmini $source tasarruf edin';
  }

  @override
  String ticketAgendaStopsSummary(int count) {
    return 'Gündeminizdeki $count durakta iş ortağı fırsatları var; kapıda satın almadan önce yetkili teklifleri karşılaştırın.';
  }

  @override
  String ticketAgendaStopsSavings(String amount) {
    return 'Avustralya, Brezilya ve Kuzey Amerika ülkelerinin kullandığı saat uygulaması. aile tasarrufları · $amount';
  }

  @override
  String get ticketBrowseAgendaDeals => 'Gündeminiz için fırsatlara göz atın →';

  @override
  String get conciergeFreshThread =>
      'Gündeminiz Harita ve Gündem üzerindedir. Bu sohbeti arşivledim ve yeni bir başlangıç ​​yaptım; günü düzenleyin, fırsatlar bulun veya yeni bir şeyler sorun.';

  @override
  String get conciergeThreadArchivedSnack =>
      'Sohbet arşivlendi — yeni konu başlatıldı';

  @override
  String get conciergeNewConversationTooltip => 'Yeni görüşme';

  @override
  String get itinerarySameAsMapAgenda =>
      'Bugünün Konsiyerj planı da Haritaya sabitlendi. Aşağıdaki gün kartını paylaşın.';

  @override
  String get conciergeTicketsFoundIntro =>
      'Seyahatiniz için yetkili bilet fırsatları buldum; doğrudan bağlantılar için Ajanda\'da Bilet rezervasyonu yapın\'a dokunun:';

  @override
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  ) {
    return '• $title: $source aracılığıyla $price ($savings tasarruf edin)';
  }

  @override
  String get conciergeTicketsTimelineHint =>
      'Gündemde eşleşen her durakta artık bayi bağlantısını içeren bir Bilet rezervasyonu düğmesi bulunuyor.';

  @override
  String itineraryBookTickets(String amount) {
    return 'Bilet ayırtın · $amount tasarruf edin';
  }

  @override
  String get itineraryOpenTicketDeal => 'Bilet ayırtın';

  @override
  String conciergeTripSaved(String title) {
    return '“$title” Seyahatlerinize kaydedildi; tekrar ziyaret etmek için istediğiniz zaman Seyahatler sekmesini açın.';
  }

  @override
  String conciergeTripSavedWithStops(String title, int count) {
    return '“$title”, $count deneyimle birlikte zaman çizelgenize kaydedildi.';
  }

  @override
  String conciergeSavedTripsIntro(int count) {
    return '$count kayıtlı seyahatiniz var:';
  }

  @override
  String conciergeSavedTripLine(String title, String dates, String status) {
    return '• $title ($dates) — $status';
  }

  @override
  String get conciergeSavedTripsEmpty =>
      'Henüz kayıtlı seyahatiniz yok. Benden bir şeyler planlamamı isteyin ve ardından \"yolculuğumu kaydet\" deyin.';

  @override
  String get conciergeSavedTripsHint =>
      'Kartları görüntülemek, paylaşmak veya tarihleri ​​düzenlemek için Geziler sekmesini açın.';

  @override
  String get conciergeAiError =>
      'Şu anda Luxora\'ya ulaşamadım. Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get conciergeAiErrorVoice =>
      'Üzgünüm, şu anda Luxora\'nın kapı görevlisine bağlanamadım.';

  @override
  String get conciergeAiNotConfigured =>
      'Luxora\'nın canlı destek ekibi henüz bu yapıya bağlanmadı; Supabase URL\'si ve anon anahtarının uygulamaya eklenmesi ve uç işlevinin konuşlandırılması gerekiyor. Harita ve seyahat planı hâlâ çalışıyor; kurulum için docs/CONCIERGE_AI.md adresine bakın.';

  @override
  String get conciergeAiOpenAiNotReady =>
      'Luxora seni duydu ama kapıcı beyni henüz çevrimiçi değil. Edge işlevi (parlak işlemci) için Supabase gizli dizilerinde OPENAI_API_KEY\'i ayarlayın ve tekrar deneyin.';

  @override
  String conciergeAiFunctionNotFound(String function) {
    return 'Luxora, \"$function\" konsiyerj kenar işlevini bulamadı. Bunu Supabase\'de dağıtın veya bu yapıda SUPABASE_CONCIERGE_FUNCTION sorununu düzeltin.';
  }

  @override
  String get conciergeAiAuthFailed =>
      'Luxora, Supabase ile kimlik doğrulaması yapamadı — SUPABASE_ANON_KEY\'in projenizle eşleştiğini bir kez daha kontrol edin.';

  @override
  String get mapAiPowers => 'Yapay zeka harita güçleri';

  @override
  String get mapNavLayerTitle => 'Yapay zeka gezinme katmanı (sonraki)';

  @override
  String get mapNavLayerSubtitle =>
      'Keşfin ötesinde - şu anda durmaya değip değmeyeceğine dair canlı istihbarat.';

  @override
  String get mapBookingTitle => 'Sorunsuz rezervasyon (iş ortakları)';

  @override
  String get mapCapMoodTitle => 'Ruh halinize dayalı rotalar';

  @override
  String get mapCapMoodDesc =>
      'Yalnızca en kısa sürüş süresine değil, romantik, sağlıklı yaşam, aile veya maceraya da uygun yollar.';

  @override
  String get mapCapDriveTitle => 'Sürüş süresi optimizasyonu';

  @override
  String get mapCapDriveDesc =>
      'Akıllı sıralama, önemli anlar arasında trafikte oturmak yerine hissederek zaman geçirmenizi sağlar.';

  @override
  String get mapCapWeatherTitle => 'Hava durumuna duyarlı öneriler';

  @override
  String get mapCapWeatherDesc =>
      'Yağmur yedekleme yolları ve plajlar, çatılar ve su kaynakları için canlı pencereler.';

  @override
  String get mapCapSunsetTitle => 'Şu anki en iyi gün batımı';

  @override
  String get mapCapSunsetDesc =>
      'Gökyüzü ve kalabalık modellerine göre altın saatin önümüzdeki 90 dakika içinde en iyi vurduğu yer.';

  @override
  String get mapCapCrowdTitle => 'Kalabalık tahmini';

  @override
  String get mapCapCrowdDesc =>
      'Parklar, kaplıcalar ve viral noktalar siz gelmeden sakinleştiğinde.';

  @override
  String get mapCapGemsTitle => 'Yakındaki gizli mücevherler';

  @override
  String get mapCapGemsDesc =>
      'Sadece en iyi 10 turist durağı değil, rotanız boyunca içeriden öğrenilen bilgiler ortaya çıktı.';

  @override
  String get mapCapPersonalTitle => 'Rota kişiselleştirme';

  @override
  String get mapCapPersonalDesc =>
      'Seyahat hissiniz, hızınız ve bütçeniz haritayı gerçek zamanlı olarak yeniden şekillendirir.';

  @override
  String get mapFutureCrowdTitle => 'Canlı kalabalık ısısı';

  @override
  String get mapFutureCrowdDesc =>
      'Kaynaklarda, parklarda ve viral çatılarda gerçek zamanlı yoğunluk; buna değer mi?';

  @override
  String get mapFutureParkingTitle => 'Park etme zorluğu';

  @override
  String get mapFutureParkingDesc =>
      'Taahhüt etmeden önce sürtünme puanı - vale, garaj veya araç paylaşımı en iyi nokta.';

  @override
  String get mapFutureTrafficTitle => 'Sürtünme puanını artırın';

  @override
  String get mapFutureTrafficDesc =>
      'Stres ağırlıklı yönlendirme; yalnızca dakikalar değil, sürücünün nasıl hissedeceği.';

  @override
  String get mapFutureRerouteTitle => 'Kendiliğinden yeniden yönlendirme';

  @override
  String get mapFutureRerouteDesc =>
      'Hava değişimi mi yoksa kalabalık artışı mı? Günün geri kalanını yeniden şekillendirmek için tek dokunuş.';

  @override
  String affiliateReserve(String category) {
    return 'Rezervasyon · $category · premium iş ortağı (yakında)';
  }

  @override
  String get affiliateHotels => 'Oteller ve konaklama yerleri';

  @override
  String get affiliateExperiences => 'Deneyimler ve turlar';

  @override
  String get affiliateRestaurants => 'Restoran rezervasyonları';

  @override
  String get affiliateThemeParks => 'Tema parkı biletleri';

  @override
  String get affiliateDayPasses => 'ResortPass / günlük geçişler';

  @override
  String get affiliateCarRentals => 'Araba kiralama';

  @override
  String get affiliateWellness => 'Sağlıklı yaşam rezervasyonları';

  @override
  String get tripsBadge => 'KOLEKSİYONLAR';

  @override
  String get tripsTitle => 'Kaydedilen geziler';

  @override
  String get tripsSubtitle =>
      'Canlı bir anlık görüntü için bir geziye dokunun (bir sonraki an, hava durumu, gün batımı ve zaman çizelgesi).';

  @override
  String get tripsFooter =>
      'Ruh hali kataloğundan gezi kapakları · Supabase senkronizasyonu Aşama 2';

  @override
  String get tripsPlanNew => 'Yeni bir gezi planlayın';

  @override
  String get tripsEmptyTitle => 'Henüz kayıtlı gezi yok';

  @override
  String get tripsEmptyBody =>
      'İlk seyahatinizi planlayın ve istediğiniz zaman tekrar ziyaret etmeye hazır olarak burada görünsün.';

  @override
  String get tripsDeleteTitle => 'Gezi silinsin mi?';

  @override
  String tripsDeleteBody(String title) {
    return 'Bu, “$title” adlı geziyi kayıtlı gezilerinizden kaldırır. Bu geri alınamaz.';
  }

  @override
  String get tripsDeleted => 'Gezi silindi';

  @override
  String get tripsEditDates => 'Seyahat tarihleri';

  @override
  String get tripsSaveDates => 'Tarihleri ​​kaydet';

  @override
  String get tripsDatesUpdated => 'Seyahat tarihleri ​​güncellendi';

  @override
  String get tripsDatesFlexible => 'Tarihler esnek';

  @override
  String get tripsLiveWeather => 'Canlı hava durumu';

  @override
  String get tripsNextUp => 'Sonraki';

  @override
  String get tripsSunsetWindow => 'Gün batımı penceresi';

  @override
  String get tripsTimelineSnapshot => 'Zaman çizelgesi anlık görüntüsü';

  @override
  String get tripsOpenAgenda => 'Tüm gündemi aç';

  @override
  String get tripsOpenTimeline => 'Tam zaman çizelgesini aç';

  @override
  String get tripsShare => 'Paylaşmak';

  @override
  String get shareItineraryFooter =>
      'Duygusal açıdan zeki Florida arkadaşınız Luxora ile planlandı.';

  @override
  String get shareCardCta => 'Luxora\'da kendi planınızı yapın';

  @override
  String get shareCardDownloadHint =>
      'iOS ve Android\'de ücretsiz · luxora.ai/download';

  @override
  String shareCardShareMessage(String title, String url) {
    return '$title\n\nDuygusal açıdan akıllı Florida seyahati olan Luxora AI ile planlandı.\nUygulamayı edinin: $url';
  }

  @override
  String get conciergeLocalTryPlanning =>
      'Bana yolculuğun nasıl hissettirmesini istediğinizi söyleyin - ör. \"Yaylar ve yiyeceklerle 2 günlük rahat bir Orlando gezisi planlayın.\" Cihazınızda gerçek bir gündem oluşturacağım (bulut gerekmez).';

  @override
  String conciergeLocalPlanBuilt(String city, int count) {
    return '$city gününüzü oluşturdum — ruh halinize ve sürüş süresine göre sıralanmış $count durak. Rotanızı görmek için Gündem veya Harita\'yı açın.';
  }

  @override
  String get conciergeLocalNoIntent =>
      'İstediğiniz duyguyu tanımlayın veya \"Orlando günümü planlayın\" deyin, ben de cihazda gerçek bir rota oluşturayım.';

  @override
  String get ticketConciergeIntelBadge => 'Konsiyerj bilgisi';

  @override
  String get ticketConciergeIntelAgenda =>
      'Genel bir kupon listesi değil, gündeminizdeki duraklarla eşleştirilir.';

  @override
  String get agendaFixAfternoonRain =>
      'Yağmur geliyor — öğleden sonramı düzelt';

  @override
  String agendaRainRerouteDone(int count, int score) {
    return 'Öğleden sonra güncellendi — $count durak iç mekana taşındı. Tatil puanı $score/100.';
  }

  @override
  String get agendaRainRerouteNone =>
      'Planınız bu hava için zaten işe yarıyor.';

  @override
  String get cloudTripsTitle => 'Bulut yedekleme';

  @override
  String get cloudTripsSubtitle =>
      'Kayıtlı gezileriniz, oturum açtığınızda cihazlar arasında senkronize edilir; tüm şehir kilit açma işlemlerine dahildir.';

  @override
  String get cloudTripsMoreSubSignedOut =>
      'Kaydedilen gezileri yedeklemek için oturum açın';

  @override
  String cloudTripsMoreSubSignedIn(String email) {
    return '$email olarak oturum açıldı';
  }

  @override
  String get cloudTripsMoreSubSyncing => 'Senkronize ediliyor…';

  @override
  String get cloudTripsUnlockRequired =>
      'Bulut yedeklemeyi etkinleştirmek için şehir paketinin kilidini açın';

  @override
  String get cloudTripsUnlockCta => 'Konsiyerj kilidini aç';

  @override
  String get cloudTripsEmailHint => 'E-posta adresi';

  @override
  String get cloudTripsSendCode => 'Oturum açma kodunu gönder';

  @override
  String get cloudTripsCodeHint => 'E-postadan gelen 6 haneli kod';

  @override
  String get cloudTripsVerify => 'Doğrula ve oturum aç';

  @override
  String get cloudTripsCodeSent =>
      'Oturum açma kodu için e-postanızı kontrol edin';

  @override
  String get cloudTripsSignOut => 'oturumu Kapat';

  @override
  String get cloudTripsSyncNow => 'Şimdi senkronize et';

  @override
  String get cloudTripsSyncSuccess => 'Seyahatler senkronize edildi';

  @override
  String get cloudTripsSyncError =>
      'Senkronizasyon başarısız oldu; tekrar deneyin';

  @override
  String get cloudTripsBannerTitle => 'Gezilerinizi yedekleyin';

  @override
  String get cloudTripsBannerBody =>
      'Gezileri yeni bir telefon veya tablette geri yüklemek için oturum açın.';

  @override
  String get cloudTripsBannerCta => 'Bulut yedeklemeyi ayarlama';

  @override
  String get cloudTripsNotConfigured =>
      'Bulut yedekleme, Supabase (geliştirme kurulumu) gerektirir';

  @override
  String get paywallFeatureCloudBackup => 'Bulut Gezisi Yedekleme';

  @override
  String shareSubject(String title) {
    return 'Benim $title';
  }

  @override
  String get itineraryBadge => 'ZAMAN ÇİZELGİNİZ';

  @override
  String get itineraryTagline =>
      'Her an bağlantılı; beklenti yerleşik, stres dışarıda.';

  @override
  String itineraryDayTab(int day, String label) {
    return 'Gün $day · $label';
  }

  @override
  String get detailWhySpecial => 'Neden Özel?';

  @override
  String get detailBestTime => 'Gitmek İçin En İyi Zaman';

  @override
  String get detailInsiderTips => 'İçeriden İpuçları';

  @override
  String get detailReserve => 'Rezerv Deneyimi';

  @override
  String get detailReserveSoon => 'Rezervasyon ortakları çok yakında.';

  @override
  String get detailNearbyGems => 'Yakındaki Taşlar';

  @override
  String get detailDuration => 'Süre';

  @override
  String get detailPractical => 'Pratik Detaylar';

  @override
  String get detailCostRange => 'Maliyet aralığı';

  @override
  String get detailBestFor => 'Şunun için en iyisi:';

  @override
  String get detailVibeMatch => 'Vibe Maçı';

  @override
  String get detailCrowd => 'Kalabalık';

  @override
  String get detailTravelIntelTitle => 'Trip sürtünme görünümü';

  @override
  String get detailTravelIntelSubtitle =>
      'Canlı sensörlere göre değil, kategoriye, zamana ve mesafeye göre tahmin yapılır.';

  @override
  String detailCrowdOutlook(String level) {
    return 'Kalabalık: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return 'Park yeri: $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return 'Sürtünmeyi artırın: $score/90';
  }

  @override
  String get detailPrice => 'Fiyat';

  @override
  String get detailLocation => 'Konum';

  @override
  String get detailGetDirections => 'Yol Tarifi Al';

  @override
  String get detailParkMap => 'Park haritası';

  @override
  String get detailViewOnMap => 'Haritada görüntüle';

  @override
  String get detailMapsError => 'Bu cihazda haritalar açılamadı.';

  @override
  String get detailGoogleMaps => 'Google Haritalar';

  @override
  String get detailAppleMaps => 'Apple Haritalar';

  @override
  String get detailOpenInMaps => 'Haritalarda aç';

  @override
  String detailDriveFromOrlando(String time) {
    return 'Orlando\'dan $time arabayla';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '$hub\'dan $time arabayla';
  }

  @override
  String get detailSaveToItinerary => 'Seyahat planına kaydet';

  @override
  String get detailSaved => 'Kaydedildi';

  @override
  String get detailSavedSnack => 'Seyahat programınıza kaydedildi';

  @override
  String get detailRemovedSnack => 'Seyahat planınızdan kaldırıldı';

  @override
  String get detailSetHomeBase => 'Ana üs olarak ayarla';

  @override
  String get detailHomeBaseActive => 'Eve dönüş yolculuğunuzun üssü';

  @override
  String get detailHomeBaseHint =>
      'Gününüzün rotası burada başlıyor ve bitiyor.';

  @override
  String get detailHomeBaseSetSnack => 'Eve dönüş üssünüz olarak ayarlayın';

  @override
  String get detailHomeBaseClearedSnack => 'Ana üs temizlendi';

  @override
  String get detailMenuTitle => 'Menüde öne çıkanlar';

  @override
  String get detailMenuDisclaimer =>
      'Seçilen öne çıkanlar — tam menü ve fiyatlar mekana göre değişiklik gösterebilir.';

  @override
  String get detailMenuComingSoon =>
      'Bu menüyü hâlâ hazırlıyoruz. Bu arada en son menüyü ve fiyatları çevrimiçi olarak görüntüleyin.';

  @override
  String get detailViewMenuOnline => 'Menüyü çevrimiçi görüntüle';

  @override
  String get photoClose => 'Kapalı';

  @override
  String get photoViewDestination => 'Hedefi görüntüle';

  @override
  String get photoBy => 'Fotoğraf:';

  @override
  String get photoOn => 'Açık';

  @override
  String milesFromOrlando(String distance) {
    return 'Orlando\'dan $distance';
  }

  @override
  String milesFromHub(String distance, String hub) {
    return '$hub\'dan $distance';
  }

  @override
  String get landingBadge => 'FLORIDA · ORLANDO MVP\'si';

  @override
  String get landingTitle1 => 'Tatil';

  @override
  String get landingTitle2 => 'çoktan başladı.';

  @override
  String get landingSubtitle =>
      'Luxora AI, duygusal açıdan akıllı kapıcınızdır; gizli mücevherler, çatıdaki gün batımları ve daha bavulunuzu hazırlamadan önce unutulmaz hissetmeniz için tasarlanmış anlar.';

  @override
  String get landingBegin => 'Yolculuğuma başla';

  @override
  String get landingTalk => 'Luxora\'yla konuş';

  @override
  String get landingWhy => 'Bunu neden inşa ediyoruz?';

  @override
  String get storyTitle => 'Hikayemiz';

  @override
  String get storyHeroBadge => 'NİYETLE İNŞA EDİLDİ';

  @override
  String get storyHeroCreator => 'Yaratıcı, Luxora AI';

  @override
  String get storyHeroSubtitle => 'Florida · önce duyguya dayalı seyahat';

  @override
  String get storyHeading => 'Neden Luxora\'yı inşa ediyoruz?';

  @override
  String get storyProblemLead =>
      'Florida / Orlando gezisi planlamanın şaşırtıcı derecede parçalı ve bunaltıcı olduğunu fark ettik.';

  @override
  String get storyJumpingBetween => 'İnsanlar genellikle arada atlarlar';

  @override
  String get storyProblemTail =>
      '…ve yine de genel turist planlarıyla karşılaşıyorum.';

  @override
  String get storyDifferentLead => 'Farklı bir şey inşa etmek istiyoruz.';

  @override
  String get storyNotPlannerTitle => 'Sadece bir seyahat planlayıcısı değil';

  @override
  String get storyNotPlannerBody =>
      'Duygulara öncelik veren yapay zekalı bir seyahat arkadaşı.';

  @override
  String get storyInsteadOfAsking => 'Sormak yerine';

  @override
  String get storyAppAsks => 'Uygulama soruyor';

  @override
  String get storyInsteadQuestion => '“Nereye gitmeliyim?”';

  @override
  String get storyFeelQuestion =>
      '“Bu yolculuğun nasıl hissetmesini istiyorsun?”';

  @override
  String get storyMoodBuildLine =>
      'Daha sonra yapay zeka bu ruh hali etrafında kişiselleştirilmiş bir deneyim oluşturur.';

  @override
  String get storyFloridaFirstTitle => 'Neden önce Florida/Orlando?';

  @override
  String get storyFloridaFirstLead => 'Orlando mükemmel bir test pazarıdır:';

  @override
  String get storyVisionTitle => 'Vizyonumuz';

  @override
  String get storyVisionLead => 'Birleştirin:';

  @override
  String get storyVisionCard =>
      'Böylece uygulama, başka bir sıkıcı seyahat planı aracı değil, lüks bir yapay zeka konsiyerjine daha yakın hissettiriyor.';

  @override
  String get storyLongTermTitle => 'Uzun vadeli fırsat';

  @override
  String get storySourceGoogleMaps => 'Google Haritalar';

  @override
  String get storySourceTikTok => 'Tiktok';

  @override
  String get storySourceInstagram => 'Instagram Makaraları';

  @override
  String get storySourceTravelBlogs => 'seyahat blogları';

  @override
  String get storySourceRestaurantApps => 'restoran uygulamaları';

  @override
  String get storySourceWeatherApps => 'hava durumu uygulamaları';

  @override
  String get storySourceTicketSites => 'bilet siteleri';

  @override
  String get storySourceTop10 => 'rastgele “en iyi 10 Orlando” makalesi';

  @override
  String get storyBulletMarket => 'Dev turizm pazarı';

  @override
  String get storyBulletAudience =>
      'Aileler, çiftler, lüks gezginler ve sağlıklı yaşam gezginleri';

  @override
  String get storyBulletOptions =>
      'Sonsuz restoranlar, tatil köyleri, gizli mücevherler, tema parkları, kaplıcalar ve gece hayatı';

  @override
  String get storyBulletRepeat => 'Yüksek tekrar ziyaret davranışı';

  @override
  String get storyBulletLogisticsGap =>
      'Çoğu seyahat uygulaması deneyim tasarımına değil lojistiğe odaklanır';

  @override
  String get storyPillarAiItinerary => 'Yapay zeka seyahat planı oluşturma';

  @override
  String get storyPillarMoodPlanning =>
      'Ruh halinize dayalı seyahat planlaması';

  @override
  String get storyPillarLiveDiscovery => 'Canlı keşif ve trend deneyimler';

  @override
  String get storyPillarHiddenGems => 'Gizli yerel mücevherler';

  @override
  String get storyPillarRouting => 'Akıllı yönlendirme';

  @override
  String get storyPillarWeatherSunset =>
      'Hava durumu ve gün batımı istihbaratı';

  @override
  String get storyPillarPremiumUx => 'Birinci sınıf estetik kullanıcı deneyimi';

  @override
  String get storyOpportunityMultilingual => 'Çok dilli genişleme';

  @override
  String get storyOpportunityAffiliate =>
      'Ortaklık ve rezervasyon ortaklıkları';

  @override
  String get storyOpportunityInventory => 'Restoranlar, deneyimler ve biletler';

  @override
  String get storyOpportunitySubscriptions => 'Premium abonelikler';

  @override
  String get storyOpportunityScale =>
      'Florida\'nın ötesinde ölçeklenebilir → diğer destinasyonlar daha sonra';

  @override
  String get landingValues => 'Anılar · Duygu · Kaçış · Bağlantı';

  @override
  String get landingRegionBadge => 'Başlatma bölgesi';

  @override
  String get landingRegionTitle => 'Orlando ve Florida — duygu için seçilmiş';

  @override
  String get onboardFinish => 'Konsiyerjinizle tanışın';

  @override
  String get onboardBuilding => 'Macera oluşturuluyor…';

  @override
  String get onboardStep1Title => 'Hayallerin ilk indiği yer';

  @override
  String get onboardStep1Subtitle => 'Nereye gidiyorsun?';

  @override
  String get onboardDestination => 'Varış noktası';

  @override
  String get onboardRegion => 'Bölge';

  @override
  String get onboardCityLabel => 'Şehrinizi seçin';

  @override
  String get onboardCityUnlockNote =>
      'Her destinasyonun kendi konsiyerj kilidi vardır; şehir başına tek seferlik satın alma.';

  @override
  String get landingCityLabel => 'Nereye gidiyorsun?';

  @override
  String get paywallSwitchCity => 'Varış noktası';

  @override
  String get paywallUnlockingDestination => 'Bu gezi için kilidi aç';

  @override
  String paywallUnifiedPriceHeadline(String price) {
    return 'Her şehir paketi $price karşılığında açılır';
  }

  @override
  String get paywallUnifiedPriceBody =>
      'Orlando (Disney ve Universal dahil), Miami ve Florida Keys — aynı fiyata tek seferlik satın alma. Abonelik yok.';

  @override
  String paywallSelectedPackToday(String packName) {
    return 'Bugün açılıyor: $packName';
  }

  @override
  String paywallAddonUnifiedHeadline(String price) {
    return 'Disney ve Universal — $price tek sefer';
  }

  @override
  String get paywallAddonUnifiedBody =>
      'Her Florida paketiyle aynı basit fiyat — tek açılış, ömür boyu erişim.';

  @override
  String get cityPickerUnlocked => 'Kilitli değil';

  @override
  String cityPickerUnlockPrice(String price) {
    return '$price\'in kilidini açın';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'Orlando eklentisi · Disney ve Universal bir arada';

  @override
  String get onboardStep2Title => 'Özgür hissetme zamanı';

  @override
  String get onboardStep2Subtitle => 'Kaçışınız ne zaman başlıyor?';

  @override
  String get onboardStartDateLabel => 'Başlangıç ​​tarihi';

  @override
  String get onboardEndDateLabel => 'Bitiş tarihi';

  @override
  String get onboardPickDate => 'Seçmek için dokunun';

  @override
  String get onboardSelectStartDate => 'Başlangıç ​​tarihini seçin';

  @override
  String get onboardSelectEndDate => 'Bitiş tarihini seçin';

  @override
  String get onboardDatesHint =>
      'Bunları istediğiniz zaman Geziler sekmenizden değiştirebilirsiniz.';

  @override
  String get onboardStepBudgetTitle => 'Kolayca planlayın';

  @override
  String get onboardStepBudgetSubtitle => 'Bu kaçış için doğru olan ne?';

  @override
  String get onboardBudget => 'Seyahat bütçesi (USD)';

  @override
  String get onboardStep3Title => 'Hikayeyi kim paylaşıyor?';

  @override
  String get onboardStep3Subtitle => 'Kim seninle seyahat ediyor?';

  @override
  String get onboardTravelers => 'Gezginler';

  @override
  String get onboardStep4Title => 'Senin ritmin';

  @override
  String get onboardStep4Subtitle => 'Günleriniz nasıl akmalı?';

  @override
  String get onboardNightlife => 'Gece hayatına ilgi';

  @override
  String get onboardFoodie => 'Yemek tutkusu';

  @override
  String get onboardPoolside => 'Havuz başı ve dinlenme süresi';

  @override
  String get onboardAdventure => 'Macera ve açık hava';

  @override
  String get onboardCulture => 'Kültür ve gezi';

  @override
  String get dayFlowSubtitle =>
      'Bir kontrol listesi değil, nasıl hissetmek istediğinize göre şekillenen bir gün.';

  @override
  String get dayFlowMorning => 'SABAH';

  @override
  String get dayFlowMidday => 'ÖĞLE';

  @override
  String get dayFlowAfternoon => 'ÖĞLEDEN SONRA';

  @override
  String get dayFlowEvening => 'AKŞAM';

  @override
  String get dayFlowNight => 'GECE';

  @override
  String get dayFlowReasonMorningPool =>
      'Gün başlamadan önce havuz kenarında veya spada yavaşça rahatlayın.';

  @override
  String get dayFlowReasonMorningCalm =>
      'Ortamı ayarlamak için yumuşak bir başlangıç.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Enerjinizin zirveye ulaştığı saatler — zindeyken geçireceğiniz büyük macera.';

  @override
  String get dayFlowReasonMiddayCulture => 'Işık parlakken gezi.';

  @override
  String get dayFlowReasonMiddayIcon => 'Günün imza anı.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'Yeniden şarj olmak için öğleden sonra kesinti.';

  @override
  String get dayFlowReasonAfternoonGem =>
      'Kalabalıktan uzakta gizli bir mücevher.';

  @override
  String get dayFlowReasonEveningDining =>
      'Günün yemeği – yemek tutkunlarının seçimi.';

  @override
  String get dayFlowReasonNightOut => 'Son bir parıltı - dışarıda bir gece.';

  @override
  String weatherToday(String place) {
    return 'Şu anda $place\'de';
  }

  @override
  String weatherSunset(String time) {
    return 'Gün batımı $time';
  }

  @override
  String weatherRainNote(int percent) {
    return 'Yağmur ihtimali %$percent; üzerinize ince bir tabaka örtün.';
  }

  @override
  String get weatherConditionClear => 'Temizlemek';

  @override
  String get weatherConditionPartlyCloudy => 'Parçalı bulutlu';

  @override
  String get weatherConditionCloudy => 'Bulutlu';

  @override
  String get weatherConditionFog => 'Sis';

  @override
  String get weatherConditionDrizzle => 'Çiseleyen yağmur';

  @override
  String get weatherConditionRain => 'Yağmur';

  @override
  String get weatherConditionSnow => 'Kar';

  @override
  String get weatherConditionThunder => 'gök gürültülü sağanak yağışlar';

  @override
  String get weatherConciergeTitle => 'Hava Durumu Danışmanı';

  @override
  String get weatherConciergeTapHint => 'Seyahate duyarlı tahmin için dokunun';

  @override
  String get weatherConciergeAdviceTitle => 'Luxora Hava Durumu Tavsiyeleri';

  @override
  String weatherFeelsLike(String temp) {
    return '$temp gibi geliyor';
  }

  @override
  String get weatherHumidity => 'Nem';

  @override
  String get weatherWind => 'Rüzgâr';

  @override
  String weatherWindValue(String dir, int speed) {
    return '$dir, $speed mil/saatte';
  }

  @override
  String get weatherUv => 'UV indeksi';

  @override
  String get weatherCloudCover => 'Bulut örtüsü';

  @override
  String get weatherVisibility => 'Görünürlük';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$miles mil';
  }

  @override
  String weatherSunrise(String time) {
    return 'Gündoğumu $time';
  }

  @override
  String get weatherStatRain => 'Yağmur';

  @override
  String get weatherWhatToBring => 'Bugün Ne Getirmeli?';

  @override
  String get weatherPlanImpact => 'Planınıza Etkisi';

  @override
  String get weatherHourlyTitle => 'Saatlik görünüm';

  @override
  String get weatherHourlyUnavailable =>
      'Veriler yüklendiğinde saatlik tahmin görünecektir.';

  @override
  String get weatherLiveRadar => 'Canlı Radar';

  @override
  String get weatherRadarComingSoon => 'Canlı radar çok yakında.';

  @override
  String get weatherRadarPlay => 'Oynatma döngüsü';

  @override
  String get weatherRadarPause => 'Döngüyü duraklat';

  @override
  String get weatherRadarTapToExpand => 'Tam ekran için dokunun';

  @override
  String get weatherRadarNow => 'Şimdi';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return '$minutes dakika önce';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes dk';
  }

  @override
  String get weatherRadarStepBack => 'Önceki çerçeve';

  @override
  String get weatherRadarStepForward => 'Daha sonra çerçeve';

  @override
  String get weatherRadarJumpNow => 'Şimdi';

  @override
  String get weatherRadarJump1h => '−1 saat';

  @override
  String get weatherRadarJump2h => '−2 saat';

  @override
  String get weatherRadarJump30m => '+30 dakika';

  @override
  String get weatherRadarSpeedSlow => 'Yavaş';

  @override
  String get weatherRadarSpeedNormal => 'Normal';

  @override
  String get weatherRadarSpeedFast => 'Hızlı';

  @override
  String get weatherRadarLoopNote =>
      'Radar döngüsü: 10 dakikalık adımlarla yaklaşık 2 saatin üzerinde bir sürenin yanı sıra mümkün olduğunda kısa menzilli şimdi tahmini — 4 saatlik bir tahmin değil.';

  @override
  String get shareMapPreviewCaption =>
      'Harita ön izlemesi · canlı yol tarifleri için Luxora\'da aç';

  @override
  String get shareRadarPreviewCaption =>
      'Canlı Doppler radarı · tam döngü için Luxora\'da açık';

  @override
  String get weatherMapOverlays => 'Harita katmanları';

  @override
  String get weatherOverlayPrecip => 'Yağış';

  @override
  String get weatherOverlayTemp => 'Sıcaklık';

  @override
  String get weatherOverlayWind => 'Rüzgâr';

  @override
  String get weatherOverlayCloud => 'Bulut örtüsü';

  @override
  String get weatherComingSoon => 'Yakında gelecek';

  @override
  String get weatherAdjustDay => 'Günümü Hava Durumuna Göre Ayarla';

  @override
  String get weatherBestOutdoorWindow => 'En iyi dış mekan penceresi';

  @override
  String get weatherRainWindow => 'Yağmur muhtemel';

  @override
  String get weatherSunsetRec => 'Gün batımı önerisi';

  @override
  String weatherOutdoorAtRisk(int count) {
    return '$count açık hava durağı etkilenebilir';
  }

  @override
  String get weatherIndoorBackup => 'İç mekan yedekleme fikirleri';

  @override
  String get weatherAdviceLightJacket => 'Bu akşam hafif bir ceket getirin.';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return 'Açık hava etkinliklerini $time öncesinde planlayın.';
  }

  @override
  String get weatherAdviceHighUv =>
      'Bugün yüksek UV - güneş kremi getirin ve öğle vakti doğrudan güneşe uzun süre maruz kalmaktan kaçının.';

  @override
  String get weatherAdviceRainLater =>
      'Yağmur riski bugün ilerleyen saatlerde artıyor, bu nedenle iç mekan deneyimlerini öğleden sonraya taşıyın.';

  @override
  String get weatherAdviceWindBeach =>
      'Rüzgar bugün plaj veya tekne aktivitelerini daha az konforlu hale getirebilir.';

  @override
  String get weatherAdviceGreatSunset =>
      'Bu gece harika gün batımı koşulları; çatıda bir akşam yemeği veya gölde yürüyüş yapmayı düşünün.';

  @override
  String get weatherAdviceDefault =>
      'Gökyüzü idare edilebilir görünüyor; planınızı takip edin ve hafif bir katmanı elinizin altında bulundurun.';

  @override
  String weatherSunsetRecRooftop(String time) {
    return '$time yakınında gökyüzü açık; çatıda akşam yemeği veya gölde yürüyüş parlayabilir.';
  }

  @override
  String get weatherPackSunscreen => 'Güneş kremi';

  @override
  String get weatherPackSunglasses => 'Güneş gözlüğü';

  @override
  String get weatherPackUmbrella => 'Şemsiye';

  @override
  String get weatherPackLightJacket => 'Hafif ceket';

  @override
  String get weatherPackShoes => 'Rahat ayakkabılar';

  @override
  String get weatherPackWater => 'Su şişesi';

  @override
  String get weatherPackHat => 'Şapka';

  @override
  String get weatherPackPoncho => 'Panço';

  @override
  String get weatherPackSwimwear => 'Mayo';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return '$time sonrasında yağmur riski artıyor. $outdoorStop\'u daha erken taşımayı ve $indoorStop\'u sonraya kaydetmeyi düşünün.';
  }

  @override
  String weatherImpactHeat(String time) {
    return 'Öğle vakti yüksek sıcaklık — $time öncesinde açık havada yürüyüş yapmayı planlayın.';
  }

  @override
  String get weatherImpactClear =>
      'Bu sabah açık hava planlarınız için gökyüzü dost canlısı görünüyor.';

  @override
  String weatherImpactMixed(int count) {
    return '$count açık hava durağının bugün zamanlamada ayarlamalara ihtiyacı olabilir.';
  }

  @override
  String get weatherImpactNoPlanRain =>
      'Yağmur da işin içinde; gününüzü öncelikle iç mekan çapalarıyla geçirin.';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return 'En iyi dış mekan penceresi, ısı veya duş oluşmadan önce $start-$end gibi görünür.';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      'Hava durumu sabit görünüyor; durakları sıralamaya hazır olduğunuzda Günümü Planla\'ya dokunun.';

  @override
  String get weatherImpactIndoorFallback => 'spa veya müze';

  @override
  String get hotelIntelBadge => 'OTEL İSTİHBARATI';

  @override
  String get hotelIntelTitle => 'Ev Üssünüzü Bulun';

  @override
  String get hotelIntelSubtitle =>
      'Luxora, yapmak istediğiniz seyahate göre rezervasyon tablosunu değil, günlerinizi şekillendiren konaklamaları seçer.';

  @override
  String get hotelDiscoveryTitle => 'Orlando için küratörlük yapıldı';

  @override
  String get hotelMatchmakerTeaser =>
      'Luxora\'ya seyahat tarzınızı söyleyin ve dürüst ödünlerle kapıcı tarafından seçilen üç konaklamaya sahip olun.';

  @override
  String get hotelMatchmakerCta => 'AI Otel Çöpçatanı';

  @override
  String get hotelMatchmakerTitle => 'Otel Çöpçatanı';

  @override
  String get hotelMatchmakerSubtitle =>
      'Nasıl seyahat ettiğinizi paylaşın — Luxora, günlerinizi nereye demirleyeceğinizi önerir.';

  @override
  String get hotelMatchmakerRun => 'İlk 3 Konaklamamı Bul';

  @override
  String get hotelMatchBudget => 'Bütçe konfor bölgesi';

  @override
  String get hotelMatchTravelers => 'Gezginler';

  @override
  String get hotelMatchAdults => 'Yetişkinler';

  @override
  String get hotelMatchKids => 'Çocuklar';

  @override
  String get hotelMatchAttractions => 'Listenizdeki gezilecek yerler';

  @override
  String get hotelMatchLuxuryLevel => 'İstenilen lüks seviye';

  @override
  String get hotelMatchTransport => 'Dolaşmak';

  @override
  String get hotelTransportCar => 'Kiralık araba';

  @override
  String get hotelTransportRideshare => 'Araç paylaşımı';

  @override
  String get hotelTransportShuttle => 'Tesis servisi';

  @override
  String get hotelTransportWalkable => 'Yürünebilir mahalle';

  @override
  String get hotelMatchResultsTitle => 'İlk 3 maçınız';

  @override
  String hotelMatchWhyTitle(int score) {
    return 'Maç skoru $score';
  }

  @override
  String get hotelMatchBestForLabel => 'Şunun için en iyisi:';

  @override
  String get hotelMatchItineraryLabel => 'Seyahat programı:';

  @override
  String get hotelMatchTradeoffsLabel => 'Takaslar:';

  @override
  String get hotelMatchNearbyLabel => 'Yakında:';

  @override
  String get hotelLuxoraScore => 'Luxora';

  @override
  String get hotelHomeBaseBadge => 'ANA BAZ';

  @override
  String get hotelScoreLuxury => 'Lüks';

  @override
  String get hotelScoreFamily => 'Aile';

  @override
  String get hotelScoreRomance => 'romantik';

  @override
  String get hotelScoreWalkability => 'Yürümek';

  @override
  String get hotelWhyRecommendTitle => 'Luxora Neden Bunu Öneriyor?';

  @override
  String get hotelItineraryImpactTitle =>
      'Bu günlerinizi nasıl şekillendiriyor?';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return 'Merkezden kaba sürüş: $driveTime. Seyahat sürtünme puanı: $friction/90 (düşükse daha sakindir).';
  }

  @override
  String get hotelAddHomeBase => 'Ana Üs Olarak Ekle';

  @override
  String get hotelHomeBaseActive => 'Ev Üssü Aktif';

  @override
  String get hotelViewOnMap => 'Haritada Görüntüle';

  @override
  String get hotelGetDirections => 'Yol Tarifi Al';

  @override
  String get hotelCheckRates => 'Fiyatları Kontrol Et';

  @override
  String get hotelVisitWebsite => 'Web Sitesini Ziyaret Edin';

  @override
  String get hotelLinkUnavailable =>
      'Bu konaklama için henüz rezervasyon bağlantısı mevcut değil.';

  @override
  String get hotelLinkOpenFailed =>
      'Bağlantı açılamadı; tarayıcınızı kontrol edin veya tekrar deneyin.';

  @override
  String get hotelSave => 'Oteli Kaydet';

  @override
  String get hotelSaved => 'Kaydedildi';

  @override
  String get hotelDistanceTitle => 'Önemli noktalara uzaklık';

  @override
  String get hotelCompareTitle => 'Konaklamaları Karşılaştır';

  @override
  String get hotelCompareSubtitle =>
      'Üç otele kadar yan yana konsiyerj görünümü.';

  @override
  String hotelCompareSelected(int count) {
    return '$count seçildi';
  }

  @override
  String get hotelComparePrice => 'Fiyat aralığı';

  @override
  String get hotelCompareDriveImpact => 'Etkiyi artırın';

  @override
  String get hotelCompareNearby => 'Yakındaki önemli noktalar';

  @override
  String get hotelPriceBudget => 'Bütçe';

  @override
  String get hotelPriceModerate => 'Ilıman';

  @override
  String get hotelPriceUpscale => 'Lüks';

  @override
  String get hotelPriceLuxury => 'Lüks';

  @override
  String get hotelTagCouples => 'Çiftler için en iyisi';

  @override
  String get hotelTagDisney => 'Disney için en iyisi';

  @override
  String get hotelTagUniversal => 'Evrensel için en iyisi';

  @override
  String get hotelTagLuxuryStaycation => 'Lüks konaklama';

  @override
  String get hotelTagFamily => 'Aile dostu';

  @override
  String get hotelTagQuiet => 'Sessiz kaçış';

  @override
  String get hotelTagWalkableDining => 'Yürünebilir yemek';

  @override
  String get hotelTagResort => 'Tatil hissi';

  @override
  String get hotelTagBudget => 'Bütçe dostu';

  @override
  String get hotelReasonMatchesMood =>
      'Seyahat ruh halinize ve hızınıza uyum sağlar.';

  @override
  String get hotelReasonCloseStops =>
      'Zaman çizelgenizdeki planlı duraklara yakın.';

  @override
  String hotelReasonSavesDrive(String time) {
    return 'Genel bir merkeze kıyasla sürüş süresinden tasarruf sağlar; merkezden yaklaşık $time uzaklıkta.';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return 'Yanlış tesise aşırı harcama yapmadan $range konfor bölgesine uyar.';
  }

  @override
  String get hotelReasonBetterGroup =>
      'Grup türünüze ve enerji seviyenize daha uygun.';

  @override
  String get hotelReasonNearbyDining =>
      'Zahmetsiz akşamlar için yakındaki güçlü yemek mekanları.';

  @override
  String get hotelReasonLowStress =>
      'Tatil köyü tarzı sakinlik; daha az lojistik, daha fazla tatil.';

  @override
  String get hotelMatchAttractionsGeneral => 'planladığınız turistik yerler';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return '$attractions, $hotel seyahat programınıza göre sürüş süresini kısaltır ve akşamları rahat geçirmenizi sağlar.';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$hotel\'deki $neighborhood bu seyahatin nasıl hissettirmesini istediğinize uyuyor.';
  }

  @override
  String get hotelMatchBestForFamily =>
      'Park erişiminden ödün vermeden havuz günleri isteyen aileler.';

  @override
  String get hotelMatchBestForCouple =>
      'Tema parkı kaosu olmadan romantizm isteyen çiftler.';

  @override
  String get hotelMatchBestForGroup =>
      'Konfor, erişim ve sakin lojistiği dengeleyen gruplar.';

  @override
  String hotelMatchImpactDisney(String time) {
    return 'Daha kısa Disney koşuları - kapınızdan parklara yaklaşık $time.';
  }

  @override
  String get hotelMatchImpactUniversal =>
      'Universal Express ayrıcalıkları veya su taksisi erişimi, gününüzün saatlerini geri kazanmanızı sağlayabilir.';

  @override
  String get hotelMatchImpactWalkable =>
      'Akşam yemeğine yürüyerek gidin; parkta geçen uzun günlerin ardından park etme stresini azaltın.';

  @override
  String hotelMatchImpactDefault(String time) {
    return 'Ortalama sürüşü $time civarında tutar, böylece gün akışınız rahat kalır.';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget =>
      'Premium tesis fiyatlandırması — oda için daha fazla bütçe, diğer yerler için daha az bütçe.';

  @override
  String get hotelMatchTradeoffCarNeeded =>
      'Her yere yürüyerek gidebileceğiniz bir üs değil, bir arabaya veya araç paylaşımına güveneceksiniz.';

  @override
  String get hotelMatchTradeoffLessFamily =>
      'Özel aile tatil yerlerine kıyasla çocuk merkezli olanaklara daha az odaklanılmıştır.';

  @override
  String get hotelMatchTradeoffLessRomantic =>
      'Çiftlerin sessiz dinlenmesinden daha fazla tema parkı enerjisi.';

  @override
  String get hotelMatchTradeoffDefault =>
      'Her konaklamanın ödünleşimleri vardır; Luxora öncelikle bunu önceliklerinize göre seçti.';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return '$neighborhood çevresinde yemek ve deneyimler.';
  }

  @override
  String get mapHotelIntelBannerTitle => 'Doğru ana üssü seçin';

  @override
  String get mapHotelIntelBannerBody =>
      'Oteliniz sürüş sürelerini, günün akışını ve nerede yemek yediğinizi şekillendirir. Luxora rezervasyon baskısı olmadan seçim yapmanıza yardımcı olur.';

  @override
  String get mapHotelIntelBannerCta => 'Hotel Intelligence\'ı keşfedin';

  @override
  String get sponsorLuxoraRecommended => 'Luxora Tavsiye Edildi';

  @override
  String get sponsorBadgeFeaturedPartner => 'Öne Çıkan Ortak';

  @override
  String get sponsorBadgeSponsored => 'sponsorlu';

  @override
  String get sponsorBadgePromoted => 'Tanıtıldı';

  @override
  String get sponsorBadgePartnerOffer => 'İş Ortağı Teklifi';

  @override
  String get sponsorCtaVisitWebsite => 'Web Sitesini Ziyaret Edin';

  @override
  String get sponsorCtaBookNow => 'Şimdi Rezervasyon Yapın';

  @override
  String get sponsorCtaCheckRates => 'Fiyatları Kontrol Et';

  @override
  String get sponsorCtaGetTickets => 'Bilet Al';

  @override
  String get sponsorCtaViewOffer => 'Teklifi Görüntüle';

  @override
  String get featuredStaysTitle => 'Öne Çıkan Konaklamalar';

  @override
  String get featuredStaysSubtitle =>
      'Ortak yerleşimleri Luxora\'nın organik otel maç skorlarından ayrıdır.';

  @override
  String get featuredExperiencesTitle => 'Öne Çıkan Deneyimler';

  @override
  String get featuredExperiencesSubtitle =>
      'Ruh halinize göre öne çıkan seçimler - her zaman etiketlenir, asla AI sıralaması olarak gizlenmez.';

  @override
  String get featuredDiningTitle => 'Öne Çıkan Yemek';

  @override
  String get featuredDiningSubtitle =>
      'Luxora\'nın öne çıkan ortak restoranları; organik mücevher listeniz bağımsız kalır.';

  @override
  String get featuredTicketPartnersTitle => 'Öne Çıkan Bilet Ortakları';

  @override
  String get featuredTicketPartnersSubtitle =>
      'Yetkili iş ortağı teklifleri - aşağıdaki organik tasarruflarla karşılaştırın.';

  @override
  String get featuredCityHomeTitle => 'Öne Çıkan Ortaklar';

  @override
  String get featuredCityHomeSubtitle =>
      'Orlando için yararlı iş ortağı seçenekleri - açıkça işaretlenmiş, yapay zekanın seçtikleri gibi asla gizlenmemiştir.';

  @override
  String get dayFlowVibeFoodie => 'Foodie-ileri';

  @override
  String get dayFlowVibeNightlife => 'Gece Hayatı';

  @override
  String get dayFlowVibePoolside => 'Havuzbaşı';

  @override
  String get dayFlowVibeAdventure => 'Maceracı';

  @override
  String get dayFlowVibeCulture => 'Kültür';

  @override
  String get onboardStep5Title => 'Luxora\'nın kalbi';

  @override
  String get onboardStep5Subtitle =>
      'Bu yolculuğun nasıl HİSSETTİRilmesini istiyorsunuz?';

  @override
  String get onboardTripFeelHint =>
      'Gün batımı akşam yemekleri, yavaş sabahlar, eşimle kahkahalar…';

  @override
  String get onboardStepNameEyebrow => 'Hikayeniz bir isimle başlar';

  @override
  String get onboardStepNameTitle => 'Bu geziye ne ad vermeliyiz?';

  @override
  String get onboardStepNameSubtitle =>
      'Luxora, kendi tarzınıza göre bir başlık oluşturabilir veya kendinizinkini yazabilir.';

  @override
  String get onboardTripNameLuxora => 'Bırakın Luxora adını versin';

  @override
  String get onboardTripNameYours => 'adını ben koyacağım';

  @override
  String get onboardTripNameHint => 'Bahar yıldönümü kaçamağımız…';

  @override
  String onboardTripNameSuggested(String name) {
    return 'Luxora şunları öneriyor: $name';
  }

  @override
  String get conciergeTripNameLabel => 'Seyahat adı';

  @override
  String get moodRomantic => 'Romantik';

  @override
  String get moodRelaxing => 'Rahatlatıcı';

  @override
  String get moodAdventurous => 'Maceracı';

  @override
  String get moodLuxurious => 'Lüks';

  @override
  String get moodFamily => 'Aile bağı';

  @override
  String get moodSocial => 'Sosyal';

  @override
  String get moodNature => 'Doğa odaklı';

  @override
  String get moodWellness => 'Sağlıklı yaşam inzivası';

  @override
  String get moodFoodie => 'Yemek deneyimi';

  @override
  String get catHiddenGems => 'Gizli mücevherler';

  @override
  String get catLuxuryStay => 'Lüks konaklamalar';

  @override
  String get catBeaches => 'Plajlar';

  @override
  String get catRooftop => 'Çatı katında yemek';

  @override
  String get catSpas => 'Kaplıcalar';

  @override
  String get catNightlife => 'Gece Hayatı';

  @override
  String get catFamily => 'Aile';

  @override
  String get catEco => 'Eko turizm';

  @override
  String get catThemeParks => 'Tema parkları';

  @override
  String get catRomantic => 'Romantik kaçamaklar';

  @override
  String get catFood => 'Yemek deneyimleri';

  @override
  String get catSprings => 'Yaylar';

  @override
  String get catIslands => 'Ada atlamalı';

  @override
  String get catInfluencer => 'Etkileyici olmaya değer';

  @override
  String get placeCatBeach => 'Sahil';

  @override
  String get placeCatDining => 'Yemek';

  @override
  String get placeCatNature => 'Doğa';

  @override
  String get placeCatNightlife => 'Gece Hayatı';

  @override
  String get placeCatWellness => 'Sağlık';

  @override
  String get placeCatFamily => 'Aile';

  @override
  String get placeCatSprings => 'Yaylar';

  @override
  String get placeCatRomantic => 'Romantik';

  @override
  String get placeCatAdventure => 'Macera';

  @override
  String get placeCatHotel => 'Otel';

  @override
  String get styleLessCrowded => 'Daha az kalabalık';

  @override
  String get styleLuxurySubtle => 'Lüks ama gösterişli değil';

  @override
  String get styleHiddenLuxury => 'Gizli lüks';

  @override
  String get styleWalkable => 'Mümkün olduğunda yürünebilir';

  @override
  String get styleSlowMornings => 'Yavaş sabahlar';

  @override
  String get styleNoTraps => 'Turist tuzağı yok';

  @override
  String get styleNatureHeavy => 'Doğa ağır';

  @override
  String get styleNatureWellness => 'Yalnızca doğa + sağlıklı yaşam';

  @override
  String get styleAestheticDining => 'Estetik yemek';

  @override
  String get styleFamilyEasy => 'Aile için kolay lojistik';

  @override
  String get paywallHeroEyebrow => 'KİŞİSEL CONCIERGE\'İNİZ';

  @override
  String get paywallHeroHeadline => 'TATİLİNİZİ BOŞA KAÇIRMAYIN';

  @override
  String get paywallHeroSubheadline =>
      'Luxora geziyi sizin keyfini çıkarabilmeniz için planlar.';

  @override
  String get paywallEmotionalLine =>
      'Zaten tatilinize binlerce dolar harcıyorsunuz. Deneyimi şansa bırakmayın.';

  @override
  String paywallHeadlineCouples(String cityName) {
    return 'Mükemmel $cityName kaçamağınız burada başlıyor.';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return '$cityName\'da planlamaya daha az, anılar biriktirmeye daha fazla zaman ayırın.';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return '$cityName şehrini farklı bir şekilde deneyimleyin.';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return 'Çoğu turistin asla görmediği $cityName şehrini keşfedin.';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return '$cityName şehrini yerel bir uzman gibi tadın.';
  }

  @override
  String get paywallWhatYouUnlock => 'Neyin Kilidini Açarsınız';

  @override
  String get paywallFeatureAiConcierge => 'Yapay Zeka Danışmanı';

  @override
  String get paywallFeatureItineraries =>
      'Kişiselleştirilmiş Seyahat Programları';

  @override
  String get paywallFeatureHiddenGems => 'Gizli Mücevher';

  @override
  String get paywallFeatureHotelIntel => 'Otel İstihbaratı';

  @override
  String get paywallFeatureTicketSavings => 'Akıllı Bilet Tasarrufu';

  @override
  String get paywallFeatureWeatherConcierge => 'Hava Durumu Danışmanı';

  @override
  String get paywallFeatureCrowdIntel => 'Kalabalık İstihbaratı';

  @override
  String get paywallFeatureGpsNav => 'GPS Navigasyonu';

  @override
  String get paywallFeatureLocalSecrets => 'Yerel Sırlar';

  @override
  String get paywallFeatureDining => 'Yemek Önerileri';

  @override
  String get paywallFeatureUnlimitedPlanning => 'Sınırsız Şehir Planlama';

  @override
  String get paywallWhyTravelersUnlock =>
      'Neden Gezginler Luxora\'nın Kilidini Açıyor?';

  @override
  String get paywallBenefitSaveTimeTitle => 'Zamandan Tasarruf Edin';

  @override
  String get paywallBenefitSaveTimeBody =>
      'Saatlerce süren araştırma ve planlamayı atlayın.';

  @override
  String get paywallBenefitSaveMoneyTitle => 'Paradan Tasarruf Edin';

  @override
  String get paywallBenefitSaveMoneyBody =>
      'Bilet tasarruflarını, yerel fırsatları ve daha akıllı seçenekleri keşfedin.';

  @override
  String get paywallBenefitAvoidTrapsTitle => 'Turist Tuzaklarından Kaçının';

  @override
  String get paywallBenefitAvoidTrapsBody =>
      'Yerel halkın gerçekten tavsiye ettiği deneyimleri bulun.';

  @override
  String get paywallBenefitTravelSmarterTitle => 'Daha Akıllı Seyahat Edin';

  @override
  String get paywallBenefitTravelSmarterBody =>
      'Hava durumuna, kalabalığa ve seyahat tarzınıza göre öneriler alın.';

  @override
  String paywallValueStory(String cityName, String price) {
    return 'Her Florida paketi — Orlando\'daki Disney ve Universal dahil — $price karşılığında açılır. $cityName için tam concierge: rotalar, gizli mücevherler, otel bilgisi ve sınırsız AI rehberliği.';
  }

  @override
  String get paywallRoiHook =>
      'Kötü bir yemek, pahalı biletler veya boşa geçen bir öğleden sonra, bu tek seferlik açılıştan daha pahalıya patlar.';

  @override
  String get paywallPeaceOfMindTitle => 'İç huzur dahil';

  @override
  String get paywallPeaceOfMindBody =>
      'Başka bir abonelik almıyorsunuz. İnişten önce planlanan ve oradayken desteklenen daha akıllı bir tatil alıyorsunuz.';

  @override
  String get paywallLockedPreviewTitle => 'Kapıcınızın İçerisinde Bekliyorum';

  @override
  String get paywallLockedPreviewSubtitle =>
      'Seyahatinize göre uyarlanmış rotaları ve sırları ortaya çıkarmak için kilidi açın.';

  @override
  String get paywallLockedDateNight => 'Romantik Randevu Gecesi Rotaları';

  @override
  String get paywallLockedHiddenLuxury => 'Gizli Lüks Deneyimler';

  @override
  String get paywallLockedVipSecrets => 'VIP yerel sırlar';

  @override
  String get paywallLockedConciergeRecs => 'Konsiyerj Önerileri';

  @override
  String get paywallLockedFamilyPlans => 'Aile Stressiz Planları';

  @override
  String get paywallLockedWeatherReroute =>
      'Hava Durumuna Duyarlı Yeniden Yönlendirme';

  @override
  String get paywallLockedHotelMatchmaker => 'Akıllı Otel Çöpçatanı';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return '$cityName Konsiyerjinin kilidini açın';
  }

  @override
  String get paywallOneTimePurchase => 'Tek Seferlik Satın Alma';

  @override
  String get paywallNoSubscription => 'Abonelik Yok';

  @override
  String get paywallNoMonthlyFees => 'Aylık Ücret Yok';

  @override
  String paywallLifetimeAccess(String cityName) {
    return 'Ömür Boyu $cityName Erişimi';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return 'Gelecekteki $cityName Güncellemeleri Dahil Edildi';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return 'Çoğu $cityName tatilinin maliyeti $minUsd–$maxUsd+';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price Bir Kez';
  }

  @override
  String get paywallLessThanDinner =>
      'Bir tatil yemeğinin maliyetinden daha az.';

  @override
  String get paywallSocialProofTitle => 'Luxora\'nın Kilidini Açan Gezginler';

  @override
  String get paywallSocialProofHeading => 'İnmeden önce bile değdi';

  @override
  String get paywallReview1 =>
      '\"Bizi saatlerce planlama yapmaktan kurtardı.\"';

  @override
  String get paywallReview2 => '\"Asla keşfedemeyeceğimiz yerler bulduk.\"';

  @override
  String get paywallReview3 =>
      '\"Yalnızca gizli mücevherler için bile buna değer.\"';

  @override
  String paywallCtaUnlock(String cityName) {
    return '$cityName Konsiyerjinin kilidini açın';
  }

  @override
  String get paywallContinueExploring => 'Keşfetmeye Devam Edin';

  @override
  String get paywallConciergePromise =>
      'Abonelik yok · Ömür boyu şehir erişimi';

  @override
  String get paywallRestorePurchases => 'Satın alınanları geri yükle';

  @override
  String get paywallRestorePreviewDisabled =>
      'Önizleme modunda geri yükleme devre dışı — tam derlemede test edin.';

  @override
  String get paywallPurchaseSuccess =>
      'Satın alma işlemi tamamlandı — kapıcı hizmetinizin kilidi açıldı.';

  @override
  String get paywallPurchasePending => 'Satın alma işlemi tamamlanıyor…';

  @override
  String get paywallPurchaseFailed =>
      'Satın alma işlemi tamamlanamadı. Tekrar deneyin veya satın alınanları geri yükleyin.';

  @override
  String get paywallPurchaseCanceled => 'Satın alma iptal edildi.';

  @override
  String get paywallRestoreComplete => 'Satın alma işlemleri geri yüklendi.';

  @override
  String get paywallRestoreNone =>
      'Bu Apple Kimliği veya Google hesabı için daha önce satın alınan bir şey bulunamadı.';

  @override
  String get paywallStoreUnavailable =>
      'App Store faturalandırması bu cihazda kullanılamıyor.';

  @override
  String get paywallProductUnavailable =>
      'Bu paket henüz mağazada mevcut değil.';

  @override
  String get settingsUnlockConciergeTitle => 'Şehir kapıcısının kilidini açın';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'Tek seferlik şehir paketi – abonelik değil';

  @override
  String get settingsOpenConciergeSubtitle => 'AI konsiyerj sekmenizi açın';

  @override
  String get weatherMiamiHumidityIndoor =>
      'Bugün yüksek nem. Daha önce plaja veya havuza gidin, ardından en sıcak saatlerde kapalı mekanda yemek yemek ve galeriler için Wynwood veya Brickell\'e gidin.';

  @override
  String get weatherMiamiHeatAdvisory =>
      'Isı tavsiyesi koşulları - hafif kumaşlar, nem ve dış mekan durakları arasındaki gölge molaları.';

  @override
  String get weatherMiamiBeachMorning =>
      'Kumda güçlü UV - güneş kremi, şapka ve öğleden önce plaj zamanı.';

  @override
  String get weatherMiamiBoatWind =>
      'Rüzgar yükseliyor; tekne veya yat faaliyetlerini yeniden değerlendirin; çatı katında yemek hala işe yarayabilir.';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return 'Önümüzdeki yağmur penceresi — dış mekan planlarını $indoorSpot veya galeri zamanı ile değiştirin.';
  }

  @override
  String get weatherMiamiSunsetWaterfront =>
      'Gün batımı güçlü görünüyor; doğudan batıya bakan sahil veya çatı katı.';

  @override
  String get miamiBeachIntelTitle => 'Sahil İstihbaratı';

  @override
  String miamiBeachBestTime(String time) {
    return 'En iyi zaman: $time';
  }

  @override
  String get miamiBeachFamilyScore => 'Aile';

  @override
  String get miamiBeachCrowdScore => 'Kalabalık';

  @override
  String get miamiBeachPhotoScore => 'Fotoğraf';

  @override
  String get miamiBeachRomanceScore => 'romantik';

  @override
  String get miamiBeachSunsetScore => 'Gün batımı';

  @override
  String miamiBeachParking(String level) {
    return 'Park yeri: $level';
  }

  @override
  String get miamiNightlifeTitle => 'Gece Hayatı Kapıcı';

  @override
  String miamiNightlifeDressCode(String code) {
    return 'Kıyafet kodu: $code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return 'En iyi varış: $time';
  }

  @override
  String get miamiNightlifeReservation => 'Rezervasyon önerilir';

  @override
  String get miamiMoodRoutesTitle => 'Miami Ruh Hali Rotaları';

  @override
  String get tampaBayMoodRoutesTitle => 'Tampa Bay ruh hali rotaları';

  @override
  String get stAugustineMoodRoutesTitle => 'St. Augustine ruh hali rotaları';

  @override
  String get naplesMoodRoutesTitle => 'Naples ruh hali rotaları';

  @override
  String get destin30aMoodRoutesTitle => 'Destin ve 30A ruh hali rotaları';

  @override
  String get vegasMoodRoutesTitle => 'Las Vegas ruh hali rotaları';

  @override
  String miamiMoodRouteStart(String time) {
    return '$time civarında başlayın';
  }

  @override
  String get keysWaterIntelTitle => 'Tuşlar Su Zekası';

  @override
  String keysWaterBestTime(String time) {
    return 'En iyi zaman aralığı: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'Su: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'Şnorkel';

  @override
  String get keysWaterDivingScore => 'Dalmak';

  @override
  String get keysWaterBoatingScore => 'Bot';

  @override
  String get keysWaterFishingScore => 'Balık';

  @override
  String get keysWaterWindScore => 'Rüzgâr';

  @override
  String get keysWaterSunsetScore => 'Gün batımı';

  @override
  String get keysWaterCrowdScore => 'Kalabalık';

  @override
  String get keysMoodRoutesTitle => 'Keys Adası Rotaları';

  @override
  String keysMoodRouteStart(String time) {
    return '$time başla';
  }

  @override
  String get paywallHeadlineMiamiDefault =>
      'MIAMI\'Yİ FARKLI BİR ŞEKİLDE DENEYİMLEYİN';

  @override
  String get paywallHeadlineMiamiWeekend => 'MIAMI HAFTASONUNUZU ziyan etmeyin';

  @override
  String get paywallOrlandoAddonsHeading => 'Tema parkı paketi';

  @override
  String get paywallOrlandoBaseIncludes =>
      'Orlando\'nun kilidini açma, yemek, gizli mücevherler, oteller ve park dışı deneyimleri içerir. Disney ve Universal için tema parkı paketini birlikte ekleyin.';

  @override
  String get paywallAddonThemeParksTitle => 'Disney ve Evrensel Paket';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World ve Universal Orlando — tüm parklar, fırsatlar, rotalar ve kalabalık bilgileri tek bir kilitte.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return '$packName\'ın kilidini açın · $price';
  }

  @override
  String get paywallAddonUnlocked => 'Kilitli değil';

  @override
  String get paywallAddonRequiresOrlando =>
      'Önce Orlando\'nun kilidini açmanız gerekir';

  @override
  String paywallUnlockAddonPack(String packName) {
    return '$packName\'in kilidini açın';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return '$packName\'in kilidini açın';
  }

  @override
  String get orlandoThemeParksPromptTitle =>
      'Orlando için Disney ve Universal\'ın kilidini açmak mı istiyorsunuz?';

  @override
  String get orlandoThemeParksPromptBody =>
      'Walt Disney World ve Universal Orlando için tema parkı paketini ekleyin; tüm parklar, bilet fırsatları, rotalar ve kalabalık bilgileri tek bir kilit açma işleminde.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'Kilidi aç · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'Şimdi değil';

  @override
  String get onboardV2Eyebrow => 'Mükemmel seyahatinizi tasarlayalım';

  @override
  String get onboardV2StepTravelerEyebrow => '1. Adım';

  @override
  String get onboardV2StepTravelerTitle => 'Kiminle seyahat ediyorsunuz?';

  @override
  String get onboardV2StepTravelerSubtitle =>
      'Luxora, mürettebatınızın konaklamasını, yemeğini ve temposunu düzenler.';

  @override
  String get onboardV2ChildrenLabel => 'Çocuklar seyahat mi ediyor?';

  @override
  String get onboardV2StepStyleEyebrow => '2. Adım';

  @override
  String get onboardV2StepStyleTitle => 'Ne tür bir gezi arıyorsunuz?';

  @override
  String get onboardV2StepStyleSubtitle =>
      'Sizi heyecanlandıran her şeyi seçin.';

  @override
  String get onboardV2StepHotelEyebrow => '3. Adım';

  @override
  String get onboardV2StepHotelTitle => 'Ne tür bir yerde kalmak istersiniz?';

  @override
  String get onboardV2StepHotelSubtitle =>
      'Butik mücevherleri ve tatil ikonlarını eşleştireceğiz.';

  @override
  String get onboardV2HotelBudgetLabel => 'Otel bütçesi';

  @override
  String get onboardV2HotelAmenitiesLabel => 'Olması gereken olanaklar';

  @override
  String get onboardV2StepFoodEyebrow => '4. Adım';

  @override
  String get onboardV2StepFoodTitle => 'Ne tür restoranlardan hoşlanırsınız?';

  @override
  String get onboardV2StepFoodSubtitle =>
      'Mutfak ve yemek tarzı; sevdiğiniz her şeyi seçin.';

  @override
  String get onboardV2CuisineLabel => 'Mutfak türleri';

  @override
  String get onboardV2DiningStyleLabel => 'Yemek tarzı';

  @override
  String get onboardV2StepPaceEyebrow => 'Adım 5';

  @override
  String get onboardV2StepPaceTitle =>
      'Günlerinizin nasıl planlanmasını istersiniz?';

  @override
  String get onboardV2StepPaceSubtitle =>
      'Rahat sabahlar veya dolu dolu macera; siz seçin.';

  @override
  String get onboardV2PaceRelaxedTitle => 'Rahat';

  @override
  String get onboardV2PaceRelaxedBody => 'Günde 2-3 aktivite';

  @override
  String get onboardV2PaceBalancedTitle => 'Dengeli';

  @override
  String get onboardV2PaceBalancedBody => 'Günde 4-5 aktivite';

  @override
  String get onboardV2PacePackedTitle => 'Paketlenmiş';

  @override
  String get onboardV2PacePackedBody => 'Her gün maksimuma çıkarın';

  @override
  String get onboardV2StepGoalsEyebrow => 'Adım 6';

  @override
  String get onboardV2StepGoalsTitle =>
      'Bu yolculukta en önemli olan şey nedir?';

  @override
  String get onboardV2StepGoalsSubtitle => 'En fazla beş öncelik seçin.';

  @override
  String get onboardV2StepExperienceEyebrow => 'Adım 7';

  @override
  String get onboardV2StepExperienceTitle =>
      'Hangi deneyimlerden keyif alırsınız?';

  @override
  String get onboardV2StepExperienceSubtitle =>
      'Bunları seyahat programınıza dahil edeceğiz.';

  @override
  String get onboardV2StepAvoidEyebrow => 'Adım 8';

  @override
  String get onboardV2StepAvoidTitle => 'Neyden kaçınmayı tercih edersiniz?';

  @override
  String get onboardV2StepAvoidSubtitle =>
      'Luxora yolculuğunuzu olumsuz etkileyen şeylerden uzak durur.';

  @override
  String get onboardV2StepEmotionEyebrow => '9. Adım';

  @override
  String get onboardV2StepEmotionTitle =>
      'Bu yolculuğun başarılı olmasını sağlayacak şey nedir?';

  @override
  String get onboardV2StepEmotionSubtitle => 'Bir birincil duygu seçin.';

  @override
  String get onboardV2StepSummaryEyebrow => 'LUXORA';

  @override
  String onboardV2StepSummaryTitle(String name) {
    return 'Harika, $name.';
  }

  @override
  String get onboardV2StepSummarySubtitle =>
      'Ne tür bir gezgin olduğunu biraz öğrendim.\n\nArtık tercihlerine göre sana uygun yerler, deneyimler, restoranlar ve gizli mücevherler önereceğim.\n\nHer öneri özellikle sana göre olacak.\n\nBakalım neler keşfedebiliriz.';

  @override
  String get onboardSummaryHotels => 'Oteller';

  @override
  String get onboardSummaryRestaurants => 'Restoranlar';

  @override
  String get onboardSummaryHiddenGems => 'Gizli mücevherler';

  @override
  String get onboardSummaryExperiences => 'Deneyimler';

  @override
  String get onboardSummaryHotelDefault =>
      'Bütçenize uygun seçilmiş konaklamalar';

  @override
  String onboardSummaryHotelType(String type) {
    return '$type kal';
  }

  @override
  String get onboardSummaryRooftopDining => 'Çatı katında yemek deneyimleri';

  @override
  String onboardSummaryCuisine(String cuisine) {
    return '$cuisine favoriler';
  }

  @override
  String onboardSummaryPace(String pace) {
    return '$pace günlük tempo';
  }

  @override
  String get onboardSummaryRomantic => 'Romantik gün batımı deneyimleri';

  @override
  String onboardSummaryEmotion(String emotion) {
    return '$emotion odaklı yolculuk';
  }

  @override
  String get onboardSummaryPremiumGems => 'Premium gizli mücevherler';

  @override
  String get agendaSuggestionsForYou => 'Senin için seçildi';

  @override
  String get agendaSuggestionsAlternates => 'Ayrıca harika';

  @override
  String get agendaSuggestionsBrowseAll => 'Tümüne göz at';

  @override
  String get onboardPrefTravelerSolo => 'Yalnız';

  @override
  String get onboardPrefTravelerCouple => 'Çift';

  @override
  String get onboardPrefTravelerFamily => 'Aile';

  @override
  String get onboardPrefTravelerFriends => 'Arkadaşlar';

  @override
  String get onboardPrefTravelerBusiness => 'İşletme';

  @override
  String get onboardPrefChildrenNone => 'Çocuk yok';

  @override
  String get onboardPrefChildrenToddlers => 'Yeni yürümeye başlayan çocuklar';

  @override
  String get onboardPrefChildrenElementary => 'İlkokul yaşı';

  @override
  String get onboardPrefChildrenTeenagers => 'Gençler';

  @override
  String get onboardPrefStyleLuxury => 'Lüks';

  @override
  String get onboardPrefStyleRelaxation => 'Gevşeme';

  @override
  String get onboardPrefStyleAdventure => 'Macera';

  @override
  String get onboardPrefStyleThemeParks => 'Tema Parkları';

  @override
  String get onboardPrefStyleFoodie => 'Gurme';

  @override
  String get onboardPrefStyleNightlife => 'Gece Hayatı';

  @override
  String get onboardPrefStyleRomance => 'romantik';

  @override
  String get onboardPrefStyleShopping => 'Alışveriş';

  @override
  String get onboardPrefStyleBeaches => 'Plajlar';

  @override
  String get onboardPrefStyleWellness => 'Sağlık';

  @override
  String get onboardPrefStyleNature => 'Doğa';

  @override
  String get onboardPrefStylePhotography => 'Fotoğrafçılık';

  @override
  String get onboardPrefStyleHiddenGems => 'Gizli Mücevher';

  @override
  String get onboardPrefStyleFamilyActivities => 'Aile Aktiviteleri';

  @override
  String get onboardPrefStyleLocalExperiences => 'Yerel Deneyimler';

  @override
  String get onboardPrefStyleEntertainment => 'Eğlence';

  @override
  String get onboardPrefHotelLuxuryResort => 'Lüks Tatil Köyü';

  @override
  String get onboardPrefHotelBoutique => 'Butik Otel';

  @override
  String get onboardPrefHotelFamilyResort => 'Aile Tesisi';

  @override
  String get onboardPrefHotelBudgetFriendly => 'Bütçe Dostu';

  @override
  String get onboardPrefHotelAdultsOnly => 'Yalnızca yetişkinler';

  @override
  String get onboardPrefHotelSpaResort => 'Spa Tesisi';

  @override
  String get onboardPrefHotelBeachfront => 'Sahil kenarında';

  @override
  String get onboardPrefHotelDowntown => 'Şehir merkezi';

  @override
  String get onboardPrefHotelWalkable => 'Yürünebilir Alan';

  @override
  String get onboardPrefHotelThemeParkArea => 'Tema Parkı Alanı';

  @override
  String get onboardPrefHotelModern => 'Modern Otel';

  @override
  String get onboardPrefHotelHistoric => 'Tarihi Otel';

  @override
  String get onboardPrefBudgetOne => '\$';

  @override
  String get onboardPrefBudgetTwo => '\$\$';

  @override
  String get onboardPrefBudgetThree => '\$\$\$';

  @override
  String get onboardPrefBudgetFour => '\$\$\$\$';

  @override
  String get onboardPrefAmenityPool => 'Havuz';

  @override
  String get onboardPrefAmenitySpa => 'Spa';

  @override
  String get onboardPrefAmenityGym => 'Spor salonu';

  @override
  String get onboardPrefAmenityBreakfast => 'Ücretsiz Kahvaltı';

  @override
  String get onboardPrefAmenityOceanView => 'Okyanus Manzaralı';

  @override
  String get onboardPrefAmenityBalcony => 'Balkon';

  @override
  String get onboardPrefAmenityKitchen => 'Mutfak';

  @override
  String get onboardPrefAmenityShuttle => 'Servis Hizmeti';

  @override
  String get onboardPrefAmenityPetFriendly => 'Evcil Hayvan Dostu';

  @override
  String get onboardPrefCuisineAmerican => 'Amerikan';

  @override
  String get onboardPrefCuisineItalian => 'İtalyan';

  @override
  String get onboardPrefCuisineMexican => 'Meksika';

  @override
  String get onboardPrefCuisineSeafood => 'Deniz ürünleri';

  @override
  String get onboardPrefCuisineSteakhouse => 'Et restoranı';

  @override
  String get onboardPrefCuisineSushi => 'Suşi';

  @override
  String get onboardPrefCuisineCuban => 'Küba';

  @override
  String get onboardPrefCuisineMediterranean => 'Akdeniz';

  @override
  String get onboardPrefCuisineAsian => 'Asya';

  @override
  String get onboardPrefCuisineBbq => 'Barbekü';

  @override
  String get onboardPrefCuisineFineDining => 'Kaliteli Yemek';

  @override
  String get onboardPrefCuisineLocalFavorites => 'Yerel Favoriler';

  @override
  String get onboardPrefCuisineFoodTrucks => 'Gıda Kamyonları';

  @override
  String get onboardPrefCuisineRooftop => 'Çatıda Yemek';

  @override
  String get onboardPrefCuisineBrunch => 'Brunch';

  @override
  String get onboardPrefCuisineDessert => 'Tatlı';

  @override
  String get onboardPrefDiningQuick => 'Hızlı Servis';

  @override
  String get onboardPrefDiningCasual => 'Gündelik Yemek';

  @override
  String get onboardPrefDiningFamily => 'Aile Dostu';

  @override
  String get onboardPrefDiningDateNight => 'Randevu Gecesi';

  @override
  String get onboardPrefDiningFine => 'Kaliteli Yemek';

  @override
  String get onboardPrefDiningWaterfront => 'Sahil';

  @override
  String get onboardPrefDiningHiddenGems => 'Gizli Mücevher';

  @override
  String get onboardPrefDiningLocal => 'Yerel Favoriler';

  @override
  String get onboardPrefGoalMakeMemories => 'Anılar Oluşturun';

  @override
  String get onboardPrefGoalSaveMoney => 'Paradan Tasarruf Edin';

  @override
  String get onboardPrefGoalAvoidCrowds => 'Kalabalıktan Kaçının';

  @override
  String get onboardPrefGoalLuxury => 'Lüks Deneyimler';

  @override
  String get onboardPrefGoalBestFood => 'En İyi Yemek';

  @override
  String get onboardPrefGoalHiddenGems => 'Gizli Mücevher';

  @override
  String get onboardPrefGoalRelaxation => 'Gevşeme';

  @override
  String get onboardPrefGoalAdventure => 'Macera';

  @override
  String get onboardPrefGoalBestPhotos => 'En İyi Fotoğraflar';

  @override
  String get onboardPrefGoalFamilyTime => 'Aile Zamanı';

  @override
  String get onboardPrefGoalRomance => 'romantik';

  @override
  String get onboardPrefGoalNightlife => 'Gece Hayatı';

  @override
  String get onboardPrefGoalLocal => 'Yerel Deneyimler';

  @override
  String get onboardPrefGoalStressFree => 'Stressiz Planlama';

  @override
  String get onboardPrefExpBoatTours => 'Tekne Turları';

  @override
  String get onboardPrefExpSunsetCruises => 'Gün Batımı Gezileri';

  @override
  String get onboardPrefExpAirboat => 'Hava Teknesi Turları';

  @override
  String get onboardPrefExpThemeParks => 'Tema Parkları';

  @override
  String get onboardPrefExpMuseums => 'Müzeler';

  @override
  String get onboardPrefExpLiveShows => 'Canlı Şovlar';

  @override
  String get onboardPrefExpSpas => 'Kaplıcalar';

  @override
  String get onboardPrefExpShopping => 'Alışveriş';

  @override
  String get onboardPrefExpWaterParks => 'Su Parkları';

  @override
  String get onboardPrefExpGolf => 'Golf';

  @override
  String get onboardPrefExpFishing => 'Balık tutma';

  @override
  String get onboardPrefExpKayaking => 'Kayak';

  @override
  String get onboardPrefExpSnorkeling => 'Şnorkelli yüzme';

  @override
  String get onboardPrefExpRooftopBars => 'Çatı Barları';

  @override
  String get onboardPrefExpNightclubs => 'Gece kulüpleri';

  @override
  String get onboardPrefExpWildlife => 'Yaban Hayatı Deneyimleri';

  @override
  String get onboardPrefExpFoodTours => 'Yemek Turları';

  @override
  String get onboardPrefExpScenicDrives => 'Manzaralı Sürüşler';

  @override
  String get onboardPrefAvoidCrowds => 'Kalabalık';

  @override
  String get onboardPrefAvoidLongLines => 'Uzun Çizgiler';

  @override
  String get onboardPrefAvoidExpensiveRestaurants => 'Pahalı Restoranlar';

  @override
  String get onboardPrefAvoidWalking => 'Uzun Mesafeler Yürümek';

  @override
  String get onboardPrefAvoidNightlife => 'Gece Hayatı';

  @override
  String get onboardPrefAvoidDriving => 'Araba kullanmak';

  @override
  String get onboardPrefAvoidTouristTraps => 'Turist Tuzakları';

  @override
  String get onboardPrefAvoidEarlyMornings => 'Sabahın Erken Saatleri';

  @override
  String get onboardPrefAvoidLateNights => 'Geç saatler';

  @override
  String get onboardPrefAvoidFamilyAttractions => 'Aile Gezileri';

  @override
  String get onboardPrefAvoidThemeParks => 'Tema Parkları';

  @override
  String get onboardPrefEmotionRelaxed => 'Rahat';

  @override
  String get onboardPrefEmotionExcited => 'Heyecanlı';

  @override
  String get onboardPrefEmotionAdventurous => 'Maceracı';

  @override
  String get onboardPrefEmotionRomantic => 'Romantik';

  @override
  String get onboardPrefEmotionLuxurious => 'Lüks';

  @override
  String get onboardPrefEmotionFamilyFocused => 'Aile Odaklı';

  @override
  String get onboardPrefEmotionMemorable => 'Unutulmaz';

  @override
  String get onboardPrefEmotionStressFree => 'Stressiz';

  @override
  String get onboardPrefEmotionInspiring => 'İlham verici';

  @override
  String get onboardPrefPaceSlow => 'Rahat';

  @override
  String get onboardPrefPaceBalanced => 'Dengeli';

  @override
  String get onboardPrefPacePacked => 'Paketlenmiş';

  @override
  String get onboardSummaryHiddenGemsInsight =>
      'Gizli yerel restoranlar ve mücevherler';

  @override
  String get onboardBuildFailedHint =>
      'Tercihlerinizi kaydettik ancak seyahat planının biraz daha zamana ihtiyacı var. Ajandayı yenilemek veya Concierge\'i açmak için çekin.';

  @override
  String get onboardV2ChildrenSubtitle =>
      'Geçerli olan tüm yaş gruplarını seçin.';

  @override
  String get onboardTravelerNameEyebrow => 'İlk önce ilk şeyler';

  @override
  String get onboardTravelerNameTitle => 'Luxora sana ne isim vermeli?';

  @override
  String get onboardTravelerNameSubtitle =>
      'Adınız yeterlidir; Luxora sohbet ederken onu kullanacaktır.';

  @override
  String get onboardTravelerNameLabel => 'Adınız';

  @override
  String get onboardTravelerNameHint => 'örneğin Maria';

  @override
  String conciergeWelcomeNamed(String name) {
    return 'Hoş geldin $name; duygusal açıdan zeki Florida arkadaşın.\n\nAşağıdan bir bilgi istemi seçin veya seyahatinizin yaratmasını istediğiniz duyguyu tanımlayın.';
  }

  @override
  String conciergeWelcomeWarmNamed(String name) {
    return '$name, Florida\'yı nasıl hissetmek istediğine göre şekillendirmek için buradayım; görülecek yerlerin bir kontrol listesi değil. Bugün neyi arzuluyorsun?';
  }

  @override
  String get onboardWelcomeEyebrow => 'LUXORA';

  @override
  String get onboardWelcomeTitle => 'Merhaba, ben Luxora.';

  @override
  String get onboardWelcomeTagline => 'Kişisel seyahat concierge\'in.';

  @override
  String get onboardWelcomeBody =>
      'İnanılmaz yerler keşfetmene, turist tuzaklarından kaçınmana ve yıllarca hatırlayacağın bir tatil oluşturmana yardım ediyorum.\n\nUnutulmaz bir şey planlamaya başlayalım.';

  @override
  String get onboardWelcomeCta => 'Yolculuğuma başla';

  @override
  String get onboardLuxoraGuideBody =>
      'Bu andan itibaren yolculuğunda her adımda yanındayım.\n\nGizli mücevherler, harika yemek, unutulmaz deneyimler veya sadece stressiz bir tatil — yanındayım.';

  @override
  String get onboardLuxoraReplyClosing =>
      'Birlikte mükemmel maceranı oluşturalım.';

  @override
  String onboardBuildingTitle(String name) {
    return 'Harika seçim, $name.';
  }

  @override
  String get onboardBuildingBody =>
      'Seyahat tarzın, ilgi alanların, tempon, yemek tercihlerin ve tatil hedeflerine göre kişiselleştirilmiş bir rota oluşturuyorum.\n\nBu biraz zaman alabilir.';

  @override
  String get onboardBuildingTagline =>
      'İyi tatiller tesadüfen olur.\n\nHarika tatiller planla olur.';

  @override
  String get onboardItineraryReadyTitle => 'Macera hazır.';

  @override
  String get onboardItineraryReadyBody =>
      'Anlattığın geziye uygun deneyimler, restoranlar, cazibe merkezleri ve gizli mücevherler seçtim.\n\nTabii ki yolda her şeyi değiştirebiliriz.\n\nEn iyi tatiller ilerledikçe evrilir.';

  @override
  String weatherRerouteLuxoraIntro(String name) {
    return '$name, hava koşulları bugünkü planların bir kısmını etkileyebilir.';
  }

  @override
  String get weatherRerouteLuxoraClosing =>
      'Bazen beklenmedik olan en güzel anıları yaratır.';

  @override
  String rightNowLuxoraIntro(String name) {
    return '$name, konumuna, hava durumuna ve tercihlerine göre — şimdi bunu yapardım.';
  }

  @override
  String get rightNowLuxoraClosing =>
      'Bana güven.\n\nBayılacağını düşünüyorum.';

  @override
  String paywallPersonalPitch(String name, String cityName) {
    return '$name, kişiselleştirilmiş tatil planın şekilleniyor.\n\n1. Gün hazır.\n\nYolculuğunun geri kalanı bekliyor.\n\nTam rota, gizli mücevherler, yerel sırlar, hava zekâsı ve sınırsız concierge için $cityName Concierge\'i aç.\n\nBu tatili unutulmaz yapalım.';
  }

  @override
  String get onboardLuxoraReplyEyebrow => 'LUXORA';

  @override
  String onboardLuxoraReplyTitle(String name) {
    return 'Seninle tanıştığıma memnun oldum $name.';
  }

  @override
  String onboardLuxoraGuideNamed(String name) {
    return 'Bu andan itibaren yolculuğunda her adımda yanındayım.\n\nGizli mücevherler, harika yemek, unutulmaz deneyimler veya sadece stressiz bir tatil — yanındayım.';
  }

  @override
  String get onboardLuxoraItineraryPromise =>
      'Birlikte mükemmel maceranı oluşturalım.';

  @override
  String get onboardReturningEyebrow => 'TEKRAR HOŞ GELDİN';

  @override
  String onboardReturningTitle(String name) {
    return 'Tekrar hoş geldin, $name.';
  }

  @override
  String get onboardReturningTitleGeneric => 'Tekrar hoş geldin.';

  @override
  String get onboardReturningSubtitle =>
      'Macerana devam etmeye hazır mısın?\n\nTercihlerini, favori yerlerini ve planlarını kaydettim; kaldığımız yerden devam edelim.\n\nBugün seni ne bekliyor bakalım.';

  @override
  String get todayPlanSectionTitle => 'Bugünkü plan';

  @override
  String get todayNextActivityLabel => 'Sıradaki';

  @override
  String get todayStaysDiningSection => 'Konaklamalar ve yemek seçenekleri';

  @override
  String get todayStaysDiningCollapsedHint =>
      'Otel ve restoran fikirleri — genişletmek için dokunun';

  @override
  String get todayPlanDetailsTitle => 'Tam program';

  @override
  String todayPlanStopCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ​​durak',
      one: '1 stop today',
    );
    return '$_temp0';
  }

  @override
  String get todayRainRerouteTitle => 'Hava rotası değişimi';

  @override
  String get todayExtrasSection => 'Biletler ve paylaşım';

  @override
  String get todayExtrasCollapsedHint =>
      'Fırsatlar, paylaşım kartı ve daha fazlası';

  @override
  String freemiumVacationTitle(String cityName) {
    return '$cityName tatiliniz';
  }

  @override
  String get freemiumDay1Ready => '✓ 1. gün hazır';

  @override
  String get freemiumUnlockFullPlan => 'Tam tatil planının kilidini aç';

  @override
  String freemiumLockedDayConcierge(int day) {
    return 'Gün $day · Concierge optimize';
  }

  @override
  String get freemiumLockedDayGems => 'Gün 3 · Gizli mücevher rotası';

  @override
  String get freemiumLockedDayWeather => 'Gün 4 · Hava durumuna duyarlı plan';

  @override
  String get freemiumLockedDayDeparture => 'Gün 5 · Ayrılış stratejisi';

  @override
  String freemiumConciergeRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ücretsiz soru kaldı',
      one: '1 ücretsiz soru kaldı',
    );
    return '$_temp0';
  }

  @override
  String get freemiumConciergeLimitReached =>
      'Ücretsiz concierge limitine ulaşıldı — sınırsız planlama için kilidi açın.';

  @override
  String freemiumLockedHotels(int count) {
    return '🔒 $count+ ek otel mevcut';
  }

  @override
  String freemiumLockedRestaurants(int count) {
    return '🔒 $count+ ek restoran mevcut';
  }

  @override
  String freemiumLockedGems(int count) {
    return '🔒 $count+ gizli mücevher mevcut';
  }

  @override
  String freemiumLockedSecrets(int count) {
    return '🔒 $count+ yerel sır mevcut';
  }

  @override
  String freemiumLockedExperiences(int count) {
    return '🔒 $count+ deneyim mevcut';
  }

  @override
  String get freemiumLockedAttractions => '🔒 Ek cazibe merkezleri mevcut';

  @override
  String freemiumUnlockExplore(String cityName) {
    return 'Keşfe devam etmek için $cityName Concierge kilidini açın.';
  }

  @override
  String freemiumUnlockConcierge(String cityName) {
    return '$cityName Concierge kilidini aç';
  }

  @override
  String freemiumHeadlineDayTwoPlus(String cityName) {
    return 'Sonraki günleriniz hazır — tam $cityName planının kilidini açın.';
  }

  @override
  String get freemiumHeadlineConciergeLimit =>
      'Sınırsız concierge erişimiyle planlamaya devam edin.';

  @override
  String freemiumHeadlineHotels(String cityName) {
    return 'Her konaklama önerisi için $cityName Concierge kilidini açın.';
  }

  @override
  String freemiumHeadlineRestaurants(String cityName) {
    return '$cityName için tam restoran koleksiyonunun kilidini açın.';
  }

  @override
  String get freemiumHeadlineGems =>
      'Yerel favoriler ve gizli mücevherler bekliyor.';

  @override
  String get freemiumHeadlineSecrets =>
      'Yerel sakinlerin zamanlama ve park sırlarının kilidini açın.';

  @override
  String freemiumHeadlineExperiences(String cityName) {
    return '$cityName genelinde küratörlü deneyimlerin kilidini açın.';
  }

  @override
  String get freemiumHeadlineAttractions =>
      'Tam cazibe merkezi koleksiyonunun kilidini açın.';

  @override
  String get freemiumHeadlineHotelMatchmaker =>
      'Her konaklamayı karşılaştırmak için Hotel Intelligence kilidini açın.';

  @override
  String get freemiumHeadlineFullItinerary =>
      'Tam tatil planınızın kilidini açın.';

  @override
  String get freemiumLocalSecretsTitle => 'Yerel sırlar';

  @override
  String get freemiumLocalSecretsSubtitle =>
      'Yerel halkın sakladığı zamanlama, park ve manzara noktaları.';
}
