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
  String get commonClose => 'Kapalı';

  @override
  String get navConcierge => 'Kapıcı';

  @override
  String get navTimeline => 'Zaman çizelgesi';

  @override
  String get navMap => 'Harita';

  @override
  String get navGems => 'Taşlar';

  @override
  String get navFeed => 'Beslemek';

  @override
  String get navTrips => 'Geziler';

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
  String get discoverSearchScopeAll => 'Katalogdaki tüm Florida\'yı arama';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'Orlando\'nun $radius dahilinde';
  }

  @override
  String get discoverSearchEmpty =>
      'Bu yarıçapta eşleşme yok; daha kısa bir ad deneyin, Harita veya Akış\'ta mesafe çipinizi genişletin veya \"plaj\", \"Disney\" veya \"yaylar\" şeklinde arama yapın.';

  @override
  String get discoverPopularInRadius => 'Çevrenizdeki popüler';

  @override
  String get discoverTrySearching => 'Aramayı deneyin';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return 'Orlando\'nun $radius dahilindeki $count varış noktası';
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
  String get feedBadge => 'CANLI KEŞİF';

  @override
  String get feedTitle => 'Deneyim Akışı';

  @override
  String get feedSubtitle =>
      'Şu anda trend olan noktalar, yeni açılışlar, içerik oluşturucuların seçimleri, sezonluk rotalar ve canlı güncellemeler.';

  @override
  String get feedPillTrending => 'Trend olan';

  @override
  String get feedPillNewOpenings => 'Yeni açılışlar';

  @override
  String get feedPillCreator => 'İçerik oluşturucunun seçtikleri';

  @override
  String get feedPillLive => 'Canlı güncellemeler';

  @override
  String get feedEmptyHint =>
      'Bu çevrede yayın kartı yok; Körfez kıyısı ve Keys\'in önemli noktaları için 50 mil veya Tüm Florida\'yı deneyin.';

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
  String get tripsLiveWeather => 'Canlı hava durumu';

  @override
  String get tripsNextUp => 'Sonraki';

  @override
  String get tripsSunsetWindow => 'Gün batımı penceresi';

  @override
  String get tripsTimelineSnapshot => 'Zaman çizelgesi anlık görüntüsü';

  @override
  String get tripsOpenTimeline => 'Tam zaman çizelgesini aç';

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
  String get detailPrice => 'Fiyat';

  @override
  String get detailLocation => 'Konum';

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
  String get landingBadge => 'FLORIDA · ORLANDO MVP\'si';

  @override
  String get landingTitle1 => 'Tatil';

  @override
  String get landingTitle2 => 'çoktan başladı.';

  @override
  String get landingSubtitle =>
      'Luxora AI, duygusal açıdan akıllı kapıcınızdır; gizli mücevherler, çatıdaki gün batımları ve daha bavulunuzu hazırlamadan önce unutulmaz hissetmeniz için tasarlanmış anlar.';

  @override
  String get landingBegin => 'Yolculuğunuza başlayın';

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
  String get onboardStep1Title => 'Hayallerin ilk indiği yer';

  @override
  String get onboardStep1Subtitle => 'Nereye gidiyorsun?';

  @override
  String get onboardDestination => 'Varış noktası';

  @override
  String get onboardRegion => 'Bölge';

  @override
  String get onboardStep2Title => 'Özgür hissetme zamanı';

  @override
  String get onboardStep2Subtitle => 'Kaçışınız ne zaman başlıyor?';

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
  String get onboardStep5Title => 'Luxora\'nın kalbi';

  @override
  String get onboardStep5Subtitle =>
      'Bu yolculuğun nasıl HİSSETTİRilmesini istiyorsunuz?';

  @override
  String get onboardTripFeelHint =>
      'Gün batımı akşam yemekleri, yavaş sabahlar, eşimle kahkahalar…';

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
}
