// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Luxora AI';

  @override
  String get settings => 'Configurações';

  @override
  String get appearance => 'Aparência';

  @override
  String get settingsThemeIntro =>
      'Escuro cinematográfico ou resort claro — escolha o clima da sua viagem.';

  @override
  String get settingsThemeLabel => 'Tema';

  @override
  String get themeGoldenEmber => 'Golden Ember';

  @override
  String get themeGoldenEmberMood => 'Ultra luxo quente';

  @override
  String get themeMidnightAmethyst => 'Midnight Amethyst';

  @override
  String get themeMidnightAmethystMood => 'Misterioso e exclusivo';

  @override
  String get themeEmeraldHaven => 'Emerald Haven';

  @override
  String get themeEmeraldHavenMood => 'Luxo tropical sereno';

  @override
  String get themeRivieraWhite => 'Riviera White';

  @override
  String get themeRivieraWhiteMood => 'Revista de viagens de luxo elegante';

  @override
  String get themeCoastalGlass => 'Coastal Glass';

  @override
  String get themeCoastalGlassMood => 'Energia de férias premium e limpa';

  @override
  String get themeChampagneLuxe => 'Champagne Luxe';

  @override
  String get themeChampagneLuxeMood => 'Elegância de concierge privado';

  @override
  String get themeBlackCard => 'Black Card';

  @override
  String get themeBlackCardMood => 'Prestígio da aviação privada';

  @override
  String get settingsThemeSectionLuxury => 'Cinematográfico de luxo';

  @override
  String get settingsThemeSectionReadable => 'Limpo e legível';

  @override
  String get settingsMapSkinSection => 'Mapa base';

  @override
  String get settingsMapSkinIntro =>
      'Escolha o visual dos blocos do mapa na aba Mapa.';

  @override
  String get mapSkinVoyager => 'Voyager';

  @override
  String get mapSkinVoyagerMood => 'Cores suaves — parques, água, estradas';

  @override
  String get mapSkinOsm => 'OpenStreetMap';

  @override
  String get mapSkinOsmMood => 'Clássico, tons naturais';

  @override
  String get mapSkinCartoLight => 'Carto Light';

  @override
  String get mapSkinCartoLightMood => 'Minimalista e claro';

  @override
  String get mapSkinCartoDark => 'Carto Dark';

  @override
  String get mapSkinCartoDarkMood => 'Mapa base noturno';

  @override
  String get mapSkinMapboxStreets => 'Mapbox Streets';

  @override
  String get mapSkinMapboxStreetsMood =>
      'Rico em detalhes, visual de app de viagem';

  @override
  String get mapSkinMapboxOutdoors => 'Mapbox Outdoors';

  @override
  String get mapSkinMapboxOutdoorsMood => 'Verdes e terreno em destaque';

  @override
  String get dark_mode => 'Modo escuro';

  @override
  String get light_mode => 'Modo claro';

  @override
  String get language => 'Linguagem';

  @override
  String get settings_language_picker_note =>
      'As alterações aplicam-se imediatamente.';

  @override
  String get settings_regions_coming_title => 'Países e cidades';

  @override
  String get settings_regions_coming_subtitle =>
      'Pacotes de hub doméstico e cidade – em breve.';

  @override
  String get commonSoon => 'Breve';

  @override
  String get commonContinue => 'Continuar';

  @override
  String get commonNew => 'Novo';

  @override
  String get commonRoadmap => 'Roteiro';

  @override
  String get commonLive => 'Ao vivo';

  @override
  String get commonClose => 'Fechar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonDelete => 'Excluir';

  @override
  String get settingsStartOverSubtitle => 'Comece uma nova viagem do zero';

  @override
  String get navConcierge => 'Porteiro';

  @override
  String get navAgenda => 'Hoje';

  @override
  String get navDiscover => 'Descobrir';

  @override
  String get navMap => 'Mapa';

  @override
  String get navTrips => 'Viagens';

  @override
  String get navMore => 'Mais';

  @override
  String get navRestaurants => 'Restaurantes';

  @override
  String get navTimeline => 'Linha do tempo';

  @override
  String get agendaTabItinerary => 'Dias';

  @override
  String get agendaTabRestaurants => 'Restaurantes';

  @override
  String get restaurantsPageTitle => 'Restaurantes';

  @override
  String get restaurantsPageSubtitle =>
      'Navegue pelos restaurantes que Luxora conhece - salve os favoritos ou deixe o Concierge escolher a refeição desta noite.';

  @override
  String get restaurantsConciergePick => 'Escolha um restaurante para mim';

  @override
  String restaurantsConciergePickDone(String name) {
    return '$name salvo — peça ao Concierge para adicioná-lo à sua viagem.';
  }

  @override
  String restaurantsSavedCount(int count) {
    return '$count economizados para sua viagem';
  }

  @override
  String get restaurantsEmptyHint =>
      'Não há restaurantes no seu raio de descoberta – amplie o raio no mapa.';

  @override
  String get moreCardRestaurantsSub =>
      'Procure restaurantes e deixe o Concierge escolher para você';

  @override
  String get agendaHotelSuggestionsTitle => 'Onde ficar';

  @override
  String agendaHotelSuggestionsSubtitle(int budget) {
    return 'AI compatível com seu orçamento de viagem de ~$budget USD — toque para ver todas as opções.';
  }

  @override
  String agendaHotelTopPick(String name) {
    return 'Melhor escolha: $name';
  }

  @override
  String get agendaStayDropdownHint => 'Selecione um hotel';

  @override
  String get agendaDiningDropdownHint => 'Selecione um restaurante';

  @override
  String get agendaDaySelectLabel => 'Que dia';

  @override
  String get agendaDayDiningTitle => 'Onde comer esta noite';

  @override
  String agendaDayDiningSubtitle(int budget, String tier) {
    return 'Sugestões para seu orçamento de ~$budget USD (refeições $tier) com base no plano de hoje.';
  }

  @override
  String get agendaDiningNearStops => 'Perto das paradas de hoje';

  @override
  String get agendaDiningFitsBudget => 'Cabe no seu orçamento de viagem';

  @override
  String get agendaDiningMatchesDay => 'Combina com a vibe de hoje';

  @override
  String get agendaDiningFoodiePick => 'Favorito gastronômico';

  @override
  String get browseCatRecommended => 'Recomendado';

  @override
  String get browseCatDisneyHotels => 'Área da Disney';

  @override
  String get browseCatBudgetFriendly => 'Econômico';

  @override
  String get browseCatUpscaleLuxury => 'Sofisticado e luxuoso';

  @override
  String get browseCatUniversalHotels => 'Área universal';

  @override
  String get browseCatThemeParkDining => 'Jantar em parque temático';

  @override
  String get browseCatUpscaleDining => 'Jantar sofisticado e requintado';

  @override
  String get browseSearchAllHotels => 'Pesquise o catálogo completo de hotéis…';

  @override
  String get browseSearchAllRestaurants =>
      'Pesquise o catálogo completo do restaurante…';

  @override
  String get browseCategoryEmpty =>
      'Nenhuma correspondência nesta categoria para seu raio. Tente pesquisar ou ampliar a descoberta.';

  @override
  String get browseFullCatalogHint =>
      'Use a pesquisa acima para obter o catálogo completo – todos os hotéis e restaurantes que Luxora conhece.';

  @override
  String get agendaPageSubtitle => 'O que estou fazendo agora?';

  @override
  String get navGems => 'Gemas';

  @override
  String get navFeed => 'Alimentar';

  @override
  String get navTicketSavings => 'Poupança';

  @override
  String get navStays => 'Estadias';

  @override
  String get morePageTitle => 'Mais';

  @override
  String get morePageSubtitle =>
      'Ferramentas de viagem, contas e preferências — selecionadas para acesso tranquilo.';

  @override
  String get moreSectionTravelTools => 'FERRAMENTAS DE VIAGEM';

  @override
  String get moreSectionAccount => 'CONTA';

  @override
  String get moreSectionApp => 'APLICATIVO';

  @override
  String get moreCardHotelsSub =>
      'Inteligente permanece compatível com o seu humor';

  @override
  String get moreCardGemsSub => 'Descobertas internas guardam moradores locais';

  @override
  String get moreCardTicketsSub => 'Compare economias de parceiros autorizados';

  @override
  String get moreCardWeatherSub => 'Orientação diária com base na previsão';

  @override
  String get moreCardProfileTitle => 'Perfil de viagem';

  @override
  String get moreCardProfileSub => 'Quem viaja, como deve ser';

  @override
  String get moreCardFavoritesSub => 'Destinos que você marcou';

  @override
  String get moreCardNotificationsTitle => 'Notificações';

  @override
  String get moreCardNotificationsSub =>
      'Alertas de viagem e atualizações de concierge';

  @override
  String get moreCardSettingsSub => 'Tema, pacotes de cidades e preferências';

  @override
  String get moreCardAboutSub => 'Por que estamos construindo Luxora';

  @override
  String get moreCardHelpSub => 'Guias e suporte de concierge';

  @override
  String get moreCardCityPacksSub => 'Desbloquear concierges de destino';

  @override
  String get moreCardPartnersSub => 'Experiências de parceiros em destaque';

  @override
  String get moreCardItinerarySub => 'Sua fuga dourada do dia a dia';

  @override
  String get moreCardDiscoverSub =>
      'Tendências gastronômicas, experiências e descobertas ao vivo';

  @override
  String get savedFavoritesTitle => 'Favoritos salvos';

  @override
  String get savedFavoritesEmpty =>
      'Marque destinos no mapa ou feed — eles aparecerão aqui.';

  @override
  String get helpCenterTitle => 'Central de Ajuda';

  @override
  String get helpCenterBody =>
      'Envie um e-mail para support@luxora.ai para obter ajuda do concierge. Guias no aplicativo estarão disponíveis em breve.';

  @override
  String get notificationsComingSoon =>
      'As notificações de viagem chegarão em uma atualização futura.';

  @override
  String get partnerOffersTitle => 'Ofertas de parceiros';

  @override
  String get ticketSavingsTitle => 'Economia inteligente de ingressos';

  @override
  String get ticketSavingsBadgeLabel => 'ECONOMIA PREMIUM';

  @override
  String get ticketSavingsSubtitle =>
      'Luxora apresenta revendedores autorizados, pacotes e promoções para que você se sinta como um consultor de luxo - não como um site de cupons.';

  @override
  String ticketSavingsBadge(int percent) {
    return 'ECONOMIZE $percent%';
  }

  @override
  String get ticketOfficialPrice => 'Oficial';

  @override
  String get ticketDiscountPrice => 'Preço Luxora';

  @override
  String ticketSaveAmount(String amount) {
    return 'Economize $amount';
  }

  @override
  String get ticketSaveAmountLabel => 'Poupança';

  @override
  String ticketSavePerTicket(String amount) {
    return 'Você pode economizar $amount por ingresso.';
  }

  @override
  String ticketFamilySave(String amount) {
    return 'Poupança familiar estimada: $amount.';
  }

  @override
  String ticketEstimatedFamilySave(String amount) {
    return 'Poupança familiar estimada: $amount.';
  }

  @override
  String ticketSource(String source) {
    return 'Fonte: $source';
  }

  @override
  String ticketExpires(String date) {
    return 'Oferta até $date';
  }

  @override
  String get ticketBetterOption => 'Luxora encontrou uma opção melhor.';

  @override
  String get ticketOverpaying =>
      'Você pode estar pagando a mais pelo preço de entrada.';

  @override
  String get ticketRecommendedSavings => 'Economias recomendadas disponíveis';

  @override
  String get ticketCalculatorTitle => 'Economia potencial';

  @override
  String get ticketFilterLabel => 'Filtro';

  @override
  String get ticketFilterAll => 'Todos';

  @override
  String get ticketFilterThemeParks => 'Parques temáticos';

  @override
  String get ticketFilterAttractions => 'Atrações';

  @override
  String get ticketFilterTours => 'Passeios';

  @override
  String get ticketFilterDining => 'Experiências gastronômicas';

  @override
  String get ticketFilterWaterParks => 'Parques aquáticos';

  @override
  String get ticketFilterFamily => 'Atividades familiares';

  @override
  String get ticketFilterEntertainment => 'Entretenimento';

  @override
  String get ticketSortLabel => 'Ordenar por';

  @override
  String get ticketSortHighestSavings => 'Maior economia';

  @override
  String get ticketSortMostPopular => 'Mais popular';

  @override
  String get ticketSortFamilyFriendly => 'Adequado para famílias';

  @override
  String get ticketSortLuxury => 'Experiências de luxo';

  @override
  String get ticketSortClosest => 'Mais perto de mim';

  @override
  String get ticketDealsSectionTitle => 'Transações autorizadas';

  @override
  String ticketDealsPricesAsOf(String date) {
    return 'Preços em $date';
  }

  @override
  String get ticketDealsRefreshFailed =>
      'Não foi possível atualizar os preços. Exibindo ofertas em cache.';

  @override
  String get ticketDealsUpdating => 'Atualizando preços…';

  @override
  String get ticketNoDeals =>
      'Não há ofertas neste filtro. Tente outra categoria.';

  @override
  String get ticketConfidenceHigh => 'Alta confiança';

  @override
  String get ticketConfidenceVerified => 'Revendedor verificado';

  @override
  String get ticketConfidenceLimited => 'Tempo limitado';

  @override
  String get ticketAiInsightTitle => 'Recomendação Luxora';

  @override
  String get ticketInsightDisneyPass =>
      'Com base no seu itinerário, um passe de 3 dias para o Walt Disney World em vez de ingressos de um dia pode economizar aproximadamente US\$ 120 para sua família.';

  @override
  String get ticketInsightUniversalCombo =>
      'Seu plano inclui a Universal – um ingresso para 2 parques é melhor do que comprar dias separadamente para a maioria das famílias.';

  @override
  String get ticketInsightSeaworldCombo =>
      'SeaWorld em sua rota – o combo Aquatica geralmente supera duas entradas separadas.';

  @override
  String get ticketInsightGeneric =>
      'Luxora combinou economias com paradas em seu itinerário – compare antes de comprar no portão.';

  @override
  String get ticketInsightMiamiCulture =>
      'A cultura pára no seu plano – as ofertas de parceiros Vizcaya e PAMM podem superar o preço inicial esta semana.';

  @override
  String get ticketInsightMiamiEverglades =>
      'Dia de Everglades em seu itinerário – os horários matinais do aerobarco geralmente ficam mais baratos no meio da semana.';

  @override
  String get ticketInsightMiamiWynwood =>
      'Wynwood em sua rota – uma caminhada artística guiada pode superar o preço do estande.';

  @override
  String get ticketItineraryMatchTitle =>
      'Verificação de poupança de itinerário';

  @override
  String get conciergeBrand => 'LUXORA';

  @override
  String get conciergeTitle => 'Porteiro';

  @override
  String conciergeTripFeel(String feel) {
    return 'Sensação de viagem: “$feel”';
  }

  @override
  String get conciergeWelcome =>
      'Bem-vindo ao Luxora – seu companheiro emocionalmente inteligente da Flórida.\n\nEscolha uma sugestão abaixo ou descreva a sensação que você deseja que sua viagem crie.';

  @override
  String get conciergeQuickPrompts => 'Avisos rápidos';

  @override
  String get conciergeRemembering => 'Lembrando para esta viagem';

  @override
  String get conciergeStyleMemory => 'Memória de estilo';

  @override
  String get conciergeInputHint =>
      'Descreva a sensação que você deseja que sua viagem crie…';

  @override
  String get conciergeGreetingMorning => 'Bom dia.';

  @override
  String get conciergeGreetingAfternoon => 'Boa tarde.';

  @override
  String get conciergeGreetingEvening => 'Boa noite.';

  @override
  String get conciergeWelcomeWarm =>
      'Estou aqui para moldar a Flórida de acordo com como você deseja se sentir - não uma lista de pontos turísticos. O que você está desejando hoje?';

  @override
  String get conciergeRefineStyle => 'Refinar meu estilo';

  @override
  String get conciergeRecallReturning => 'Bem vindo de volta.';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'Lembro que você gosta de $prefs.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'E você queria que essa viagem fosse: “$feel”.';
  }

  @override
  String get conciergePromptRomantic => 'Escapadinha romântica';

  @override
  String get conciergePromptWellness => 'Redefinição de bem-estar';

  @override
  String get conciergePromptFamily => 'Magia familiar';

  @override
  String get conciergePromptHiddenLuxury => 'Luxo escondido';

  @override
  String get conciergePromptFoodie => 'Aventura gastronômica';

  @override
  String get conciergePromptSoftLuxury => 'Fuga de luxo suave';

  @override
  String get conciergePromptAdventure => 'Modo aventura';

  @override
  String get conciergePromptDisney => 'Depois do anoitecer da Disney';

  @override
  String get discoverSearchHint => 'Pesquisar destinos…';

  @override
  String get discoverSearchTitle => 'Encontre um destino';

  @override
  String get discoverFromOrlando => 'De Orlando';

  @override
  String discoverFromHub(String hub) {
    return 'De $hub';
  }

  @override
  String get discoverSearchScopeAll => 'Pesquisando toda a Flórida no catálogo';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'Dentro de $radius de Orlando';
  }

  @override
  String discoverSearchScopeRadiusHub(String radius, String hub) {
    return 'Dentro de $radius de $hub';
  }

  @override
  String get discoverSearchEmpty =>
      'Não há correspondências neste raio. Tente um nome mais curto, aumente o chip de distância no mapa ou no feed ou pesquise “praia”, “Disney” ou “fontes”.';

  @override
  String get discoverFilterAll => 'Todos';

  @override
  String get discoverFilterHotels => 'Hotéis';

  @override
  String get discoverFilterRestaurants => 'Restaurantes';

  @override
  String get discoverFilterDestinations => 'Destinos';

  @override
  String get discoverPopularInRadius => 'Popular em seu raio';

  @override
  String get discoverTrySearching => 'Tente pesquisar';

  @override
  String scopeDestinationsRadius(int count, String radius) {
    return '$count destinos · dentro de $radius de Orlando';
  }

  @override
  String scopeDestinationsRadiusHub(int count, String radius, String hub) {
    return '$count destinos · dentro de $radius de $hub';
  }

  @override
  String scopeDestinationsAll(int count) {
    return '$count destinos · toda a Flórida';
  }

  @override
  String get radius25 => '25 milhas';

  @override
  String get radius50 => '50 milhas';

  @override
  String get radius100 => '100 milhas';

  @override
  String get radiusAllFlorida => 'Toda a Flórida';

  @override
  String get radiusDesc25 => 'Passeios de um dia pelo centro de Orlando';

  @override
  String get radiusDesc50 =>
      'Nascentes, passeios de um dia pela costa, Costa Espacial';

  @override
  String get radiusDesc100 => 'Tampa Bay, Daytona, Golfo mais profundo';

  @override
  String get radiusDescAll => 'Keys, Miami, destaques estaduais';

  @override
  String get radiusDesc25Miami => 'South Beach, Brickell e bairros centrais';

  @override
  String get radiusDesc50Miami => 'Wynwood, Coconut Grove, Key Biscayne';

  @override
  String get radiusDesc100Miami =>
      'Everglades, Fort Lauderdale, mais profundo no sul da Flórida';

  @override
  String get radiusDescAllMiami =>
      'Trilha de Florida Keys e destaques em todo o estado';

  @override
  String get radiusDesc25Keys =>
      'Key Largo, Islamorada e corredor superior de recifes';

  @override
  String get radiusDesc50Keys => 'Praias de Marathon, Big Pine e Middle Keys';

  @override
  String get radiusDesc100Keys =>
      'Rodovia internacional completa através de Key West';

  @override
  String get radiusDescAllKeys =>
      'Cadeia inteira de ilhas e águas para passeios de um dia';

  @override
  String get feedBadge => 'DESCOBERTA AO VIVO';

  @override
  String get feedTitle => 'Feed de experiência';

  @override
  String get feedSubtitle =>
      'O que está acontecendo agora: tendências, novas vagas, escolhas de criadores, rotas sazonais e atualizações ao vivo.';

  @override
  String get feedSubtitleFamily =>
      'Escolhas familiares para sua equipe: parques, vitórias fáceis e momentos que acontecem com as crianças (e os pais).';

  @override
  String get feedPillTrending => 'Tendências';

  @override
  String get feedPillNewOpenings => 'Novas aberturas';

  @override
  String get feedPillCreator => 'Escolhas do criador';

  @override
  String get feedPillLive => 'Atualizações ao vivo';

  @override
  String get feedMoodPrompt => 'COMO VOCÊ QUER SENTIR?';

  @override
  String get feedMoodPromptFamily => 'COMO DEVE SER HOJE PARA SUA EQUIPE?';

  @override
  String get feedMoodAll => 'Tudo';

  @override
  String get feedMoodFamily => 'Magia familiar';

  @override
  String get feedMoodRomantic => 'Romântico';

  @override
  String get feedMoodCalm => 'Calma';

  @override
  String get feedMoodAdventurous => 'Aventureiro';

  @override
  String get feedMoodPampered => 'Mimado';

  @override
  String get feedMoodSocial => 'Zumbido';

  @override
  String get feedMoodFoodie => 'Viciado em comida';

  @override
  String get vibeSunsetReady => 'Pôr do sol';

  @override
  String get vibeViral => 'Viral';

  @override
  String get vibeFamilyApproved => 'Família';

  @override
  String get vibeHiddenGem => 'Joia escondida';

  @override
  String get vibeRainSafe => 'Chuva OK';

  @override
  String get vibeDateNight => 'Encontro romântico';

  @override
  String get vibeNightVibe => 'Vibe noturna';

  @override
  String get vibeFoodie => 'Foodie';

  @override
  String get vibeLuxury => 'Luxo';

  @override
  String get vibeTrending => 'Em alta';

  @override
  String get vibeLive => 'Ao vivo';

  @override
  String get vibeSeasonal => 'Sazonal';

  @override
  String get vibeLocalPick => 'Local';

  @override
  String get vibeAdventure => 'Aventura';

  @override
  String get vibeWellness => 'Bem-estar';

  @override
  String get vibeBeachDay => 'Dia de praia';

  @override
  String get vibeLuxoraPick => 'Escolha Luxora';

  @override
  String get mapLayersTitle => 'CAMADAS DO MAPA';

  @override
  String get mapLayerAll => 'Todos';

  @override
  String get mapLayerGems => 'Joias';

  @override
  String get mapLayerNight => 'Noite';

  @override
  String get mapLayerDateNight => 'Encontro';

  @override
  String get mapLayerWeather => 'Melhor clima';

  @override
  String get mapLayerItinerary => 'Roteiro';

  @override
  String get mapExpandMap => 'Expandir mapa';

  @override
  String get mapFullscreenTitle => 'Mapa';

  @override
  String get mapCloseFullscreen => 'Fechar mapa';

  @override
  String get mapItineraryDayLabel => 'Mostrar roteiro para';

  @override
  String get mapItineraryCurrentDay => 'Dia atual';

  @override
  String get feedFamilyMoodHint =>
      'Parques temáticos, refeições com personagens e prêmios fáceis para os pais – filtrados por tags de família.';

  @override
  String get feedEmptyHint =>
      'Não há cartões de alimentação neste raio – tente 50 milhas ou toda a Flórida para ver os destaques da costa do Golfo e Keys.';

  @override
  String get feedEmptyHintFamily =>
      'Nenhum cartão com etiqueta familiar neste raio – experimente Aventureiro ou Tudo, ou amplie o raio.';

  @override
  String get gemsBadge => 'CURAÇÃO INTERNA';

  @override
  String get gemsTitle => 'Joias escondidas';

  @override
  String get gemsSubtitle =>
      'Descobertas secretas que os moradores locais guardam – por que é especial, quando ir, quão lotado fica e dicas que você não encontrará em um cartão postal.';

  @override
  String get gemsPillHidden => 'Lugares escondidos';

  @override
  String get gemsPillLocal => 'Somente local';

  @override
  String get gemsPillInsider => 'Dicas internas';

  @override
  String get gemsPillCrowd => 'Informações da multidão';

  @override
  String get gemsEmptyHint =>
      'Ainda não há joias neste raio – amplie para 80 km ou mais para ver nascentes e segredos da Costa Espacial.';

  @override
  String get gemsSearchHint => 'Pesquise joias e destinos escondidos…';

  @override
  String get gemLocalSecret => 'SEGREDO LOCAL';

  @override
  String get gemsMatchedBadge => 'Seu estilo';

  @override
  String gemsMatchedNote(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gemas correspondente ao seu estilo',
      one: '1 gem matched to your style',
    );
    return '$_temp0';
  }

  @override
  String get gemWhySpecial => 'Por que é especial';

  @override
  String get gemBestTime => 'Melhor hora para ir';

  @override
  String get gemCrowdLevel => 'Nível de multidão';

  @override
  String get gemInsiderTip => 'Dica interna';

  @override
  String get gemLocalNote => 'Nota apenas local';

  @override
  String get mapBadge => 'MAPA DE IA';

  @override
  String get mapTitle => 'Sua rota inteligente';

  @override
  String get mapSubtitle =>
      'Pins para o seu dia selecionado – diamantes dourados são joias, marcadores ciano são a linha do tempo de hoje, linha dourada é a rota do humor.';

  @override
  String get mapPlanDayTitle => 'Planeje meu dia';

  @override
  String get mapPlanDaySuggested =>
      'Sugerido de acordo com o seu humor de viagem - marque lugares para torná-lo seu.';

  @override
  String get mapPlanDayEmpty =>
      'Marque destinos (♥) e Luxora cria uma rota otimizada a partir do seu hub de Orlando – menos direção, mais emoção.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count paradas · $miles · $time viagem';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return 'A partir de $hotel';
  }

  @override
  String shareDayLegDrive(String time, String miles) {
    return '$time viagem · $miles da parada anterior';
  }

  @override
  String get mapCrowdLevelQuiet => 'Quieto';

  @override
  String get mapCrowdLevelModerate => 'Moderado';

  @override
  String get mapCrowdLevelBusy => 'Ocupado';

  @override
  String get mapCrowdLevelPacked => 'Embalado';

  @override
  String mapCrowdAtStop(String level) {
    return 'Multidão: $level';
  }

  @override
  String get mapParkingLevelEasy => 'Fácil';

  @override
  String get mapParkingLevelModerate => 'Moderado';

  @override
  String get mapParkingLevelDifficult => 'Difícil';

  @override
  String get mapParkingLevelLimited => 'Limitado · chegar cedo';

  @override
  String mapParkingAtStop(String level) {
    return 'Estacionamento: $level';
  }

  @override
  String mapDriveFrictionAtStop(int score) {
    return 'Atrito de direção: $score/90';
  }

  @override
  String get mapRerouteButton => 'Redirecione para paradas mais calmas';

  @override
  String mapRerouteApplied(int count) {
    return 'Dia ajustado — $count paradas trocadas por multidões mais leves.';
  }

  @override
  String get mapRerouteNone => 'Seu percurso já parece tranquilo.';

  @override
  String get mapRerouteRainHint =>
      'Não se preocupe — já encontrei alternativas por perto para seu dia continuar agradável e sem estresse.';

  @override
  String get dayFlowSwapTitle => 'Alterar esta parada';

  @override
  String dayFlowSwapSubtitle(String current) {
    return 'Diga a Luxora o que você prefere fazer em vez de $current.';
  }

  @override
  String get dayFlowSwapTemplate =>
      'Eu estava pensando em algo mais parecido...';

  @override
  String get dayFlowSwapHint =>
      'por exemplo um parque tranquilo esta manhã ou frutos do mar para o jantar';

  @override
  String get dayFlowSwapApply => 'Atualizar meu dia';

  @override
  String get dayFlowSwapViewPlace => 'Ver parada atual';

  @override
  String dayFlowSwapSuccess(String newStop, String phase) {
    return 'Atualizado — $newStop agora é sua parada $phase.';
  }

  @override
  String get dayFlowSwapNoMatch =>
      'Não foi possível encontrar uma correspondência por perto. Tente ser mais específico.';

  @override
  String get dayFlowSwapTapToChange => 'Alterar esta parada';

  @override
  String get dayFlowSwapHoldSpeak => 'Segure para falar';

  @override
  String get dayFlowSwapListening => 'Audição…';

  @override
  String get rightNowButton => 'O que devemos fazer agora?';

  @override
  String get rightNowEmpty =>
      'Ainda não há um momento forte em seu raio – amplie a descoberta ou marque alguns favoritos.';

  @override
  String get rightNowResultTitle => 'AGORA MESMO';

  @override
  String get rightNowTapForDetails => 'Toque para detalhes';

  @override
  String rightNowScenicCoffee(
    int minutes,
    String district,
    String place,
    String walkArea,
    String crowd,
  ) {
    return 'Você está a $minutes minutos de $district. O clima está perfeito. Tome um café em $place e caminhe por $walkArea antes que a multidão chegue ($crowd crowds).';
  }

  @override
  String rightNowPerfectWeather(
    int minutes,
    String district,
    String place,
    String crowd,
  ) {
    return 'Você está a $minutes minutos de $district. O céu está ótimo. Vá para $place enquanto as multidões ainda são $crowd.';
  }

  @override
  String rightNowGoldenHour(int minutes, String place, String crowd) {
    return 'A hora dourada está chegando. Saia em cerca de $minutes minutos para $place ($crowd ao pôr do sol).';
  }

  @override
  String rightNowRainyIndoor(int minutes, String place) {
    return 'Chuva no radar — $minutes minutos para uma escolha interna aconchegante: $place.';
  }

  @override
  String rightNowFamilyCalm(int minutes, String place) {
    return 'Calma na janela do cochilo — $minutes minutos para uma redefinição familiar fácil em $place.';
  }

  @override
  String rightNowRomantic(int minutes, String place) {
    return 'Energia encontro-noite – $minutes minutos para $place antes do rush.';
  }

  @override
  String rightNowQuietGem(int minutes, String place, String crowd) {
    return 'Janela silenciosa — $minutes minutos para $place ($crowd agora).';
  }

  @override
  String get goldenHourTitle => 'Hora de ouro';

  @override
  String goldenHourLeaveBy(String time, int minutes, String place) {
    return 'Saia às $time ($minutes minutos de carro) para $place - chegue cerca de 15 minutos antes do pôr do sol.';
  }

  @override
  String get goldenHourKindBeach => 'Janela do pôr do sol da praia';

  @override
  String get goldenHourKindRooftop => 'Hora dourada na cobertura';

  @override
  String get goldenHourKindScenic => 'Tempo de fotografia cênica';

  @override
  String get vacationScoreTitle => 'Pontuação de férias';

  @override
  String vacationScoreSubtitle(int score) {
    return 'Hoje parece um dia tipo $score/100.';
  }

  @override
  String get onboardOccasionLabel => 'Qual é a ocasião?';

  @override
  String get onboardThemeParksOccasionHint =>
      'Desbloqueie Orlando para ver ocasiões nos parques Disney e Universal abaixo.';

  @override
  String get occasionGeneral => 'Apenas explorando';

  @override
  String get occasionAnniversary => 'Aniversário';

  @override
  String get occasionHoneymoon => 'Lua de mel';

  @override
  String get occasionDateNight => 'Encontro à noite';

  @override
  String get occasionProposal => 'Viagem proposta';

  @override
  String get occasionFamily => 'Família com crianças';

  @override
  String get occasionDisneyAdventure => 'Aventura da Disney';

  @override
  String get occasionUniversalAdventure => 'Aventura universal';

  @override
  String get localSecretTitle => 'Segredo local';

  @override
  String get localSecretWinterParkParkAvenue =>
      'Os moradores locais entram no beco atrás da livraria – sem placa de rua.';

  @override
  String get localSecretWorldFoodTrucks =>
      'Peça o peixe do dia, não o hambúrguer – a fila anda mais rápido na janela mais distante.';

  @override
  String get localSecretWekiwaSprings =>
      'Evite o calçadão principal depois das 14h – o início da trilha norte permanece silencioso.';

  @override
  String get localSecretDisneySpringsParking =>
      'O melhor estacionamento é a garagem laranja – caminhe pelo lado da marina, não pela entrada principal.';

  @override
  String get localSecretLakeEolaSunset =>
      'Fique de frente para o lado do anfiteatro para tirar fotos de cisnes enquanto o céu fica dourado.';

  @override
  String get localSecretMiamiWynwoodAlley =>
      'Passe pelo beco de carregamento atrás do Panther Coffee - os moradores locais gravam murais sem a multidão da linha principal.';

  @override
  String get localSecretMiamiLittleHavanaDomino =>
      'Compre primeiro o cafecito no carrinho da janela - os frequentadores do banco lateral abrem quando você está segurando um cortadito.';

  @override
  String get localSecretMiamiVizcayaMangrove =>
      'Evite a correria do terraço principal – entre pelo jardim leste e caminhe pelo calçadão de mangue no sentido anti-horário.';

  @override
  String get localSecretMiamiOceanDriveSunrise =>
      'Vire-se para o leste às 7h na Lummus - os pastéis art déco brilham antes que a multidão do brunch chegue.';

  @override
  String get localSecretMiamiPantherAlley =>
      'Faça o pedido na janela, caminhe pelo beco no sentido horário - a melhor luz do mural atinge a parede turquesa às 8h45.';

  @override
  String get localSecretTampaBayRiverwalkParking =>
      'Use o estacionamento Whiting Street — caminhe ao sul pelo rio para evitar fechamentos perto do cais.';

  @override
  String get localSecretTampaBayClearwaterSunset =>
      'Evite a multidão do Pier 60 — aproxime-se de Sand Key 40 minutos antes do pôr do sol.';

  @override
  String get localSecretTampaBayDaliGarden =>
      'Reserve a última entrada da tarde — o jardim leste captura a luz da ponte sem aglomeração.';

  @override
  String get localSecretTampaBayPierTiming =>
      'Entrada no píer em dias úteis às 16h — pôr do sol sem carrinhos de fim de semana.';

  @override
  String get localSecretTampaBayYborCourtyard =>
      'Sanduíches cubanos para viagem — coma no pátio de tijolos que os locais usam após 20h.';

  @override
  String get localSecretTampaBaySpongeDocks =>
      'Almoço no cais primeiro, barcos de esponja depois — tours diminuem em dias úteis após 13h.';

  @override
  String get localSecretVegasBellagioFountains =>
      'Fique no centro do relvado 15 min antes — a grade da frente bloqueia a coreografia.';

  @override
  String get localSecretVegasFremontTiming =>
      'Noite de semana 21h sob a cúpula — loop Viva Vision completo sem multidão de sábado.';

  @override
  String get localSecretVegasCaesarsEntrance =>
      'Use a ligação da garagem — evite o congestionamento da Strip na hora do jantar.';

  @override
  String get localSecretVegasVenetianWalk =>
      'Passeio no canal coberto ao meio-dia — atravesse a Strip com ar condicionado.';

  @override
  String get nycMoodRoutesTitle => 'Rotas de ambiente Nova York';

  @override
  String get localSecretNycTimesSquareStrategy =>
      'Entre pelas ruas laterais da 7ª Ave — evite o cruzamento lotado e mantenha Broadway à vista.';

  @override
  String get localSecretNycObservationDeck =>
      'Reserve o último horário antes do pôr do sol — luz dourada sem fila do meio-dia.';

  @override
  String get localSecretNycCentralParkEntrance =>
      'Use a travessia da 72nd Street — caminho mais rápido até Bethesda sem multidão na Columbus Circle.';

  @override
  String get localSecretNycBroadwayTickets =>
      'Fila matinal TKTS abre cedo — lugares rush vencem preços turísticos.';

  @override
  String get localSecretNycBrooklynBridgePhoto =>
      'Washington Street DUMBO às 8h — enquadramento vazio antes dos grupos turísticos.';

  @override
  String get localSecretNycFerryGoldenHour =>
      'Balsa para Staten Island ao pôr do sol — volta pelo porto grátis sem barco turístico.';

  @override
  String get momentsTitle => 'MOMENTOS LUXORA';

  @override
  String get momentsSubtitle => 'Procure um sentimento – não um lugar.';

  @override
  String get momentFeelRelaxed => 'Sinta-se relaxado';

  @override
  String get momentImpressSpouse => 'Impressione meu cônjuge';

  @override
  String get momentPerfectSunset => 'Pôr do sol perfeito';

  @override
  String get momentFamilyMemory => 'Memória familiar';

  @override
  String get momentLuxuryValue => 'Luxo sem gastar demais';

  @override
  String get momentPromptRelaxed =>
      'Quero me sentir completamente relaxado pelas próximas horas – lento, bonito, sem multidões.';

  @override
  String get momentPromptImpressSpouse =>
      'Quero impressionar minha esposa com algo romântico e inesperado esta noite.';

  @override
  String get momentPromptPerfectSunset =>
      'Quero o momento perfeito do pôr do sol na Flórida – onde devemos estar e quando devemos partir?';

  @override
  String get momentPromptFamilyMemory =>
      'Quero um momento familiar memorável que seja fácil para os pais e mágico para as crianças.';

  @override
  String get momentPromptLuxuryValue =>
      'Quero luxo que pareça especial sem gastar uma fortuna.';

  @override
  String get visualShareImageButton => 'Compartilhar cartão de imagem';

  @override
  String get tripStoryTitle => 'A história da sua viagem';

  @override
  String tripStoryHeading(String title) {
    return '$title — sua história na Flórida';
  }

  @override
  String tripStoryBeatMoods(String moods) {
    return 'Você veio por causa de $moods.';
  }

  @override
  String tripStoryBeatTitle(String title) {
    return 'Este capítulo: $title.';
  }

  @override
  String get tripStoryBeatClosing =>
      'Luxora moldou os momentos – você os viveu.';

  @override
  String get tripsOpenStory => 'Sua história';

  @override
  String get conciergeVoiceHold => 'Segure para falar';

  @override
  String get conciergeVoiceSoon =>
      'O concierge de voz chegará em breve – por enquanto, toque em um momento ou digite como deseja se sentir.';

  @override
  String get conciergeVoiceListening => 'Luxora está ouvindo…';

  @override
  String get conciergeVoiceSpeaking => 'Luxora está falando…';

  @override
  String get conciergeVoiceRelease => 'Liberar para enviar';

  @override
  String get conciergeVoiceSend => 'Enviar para Luxora';

  @override
  String get conciergeVoiceProcessing => 'Enviando para Luxora…';

  @override
  String get conciergeVoiceNoSpeech =>
      'Eu não entendi – segure o botão, fale e solte.';

  @override
  String get conciergeVoicePreviewFailed =>
      'Não foi possível reproduzir uma prévia. Verifique seu volume e tente novamente.';

  @override
  String get conciergeVoiceUnavailable =>
      'A voz não está disponível neste dispositivo.';

  @override
  String get conciergeVoiceSettingsTitle => 'Voz Luxora';

  @override
  String get conciergeVoiceSettingsSubtitle =>
      'Escolha como Luxora soa quando fala – sotaque, tom e ritmo. Usa as vozes integradas do seu dispositivo.';

  @override
  String get conciergeVoiceRateLabel => 'Ritmo de fala';

  @override
  String get conciergeVoiceRateSlow => 'Lento';

  @override
  String get conciergeVoiceRateNatural => 'Natural';

  @override
  String get conciergeVoiceRateFast => 'Rápido';

  @override
  String get conciergeVoicePreview => 'Visualizar voz';

  @override
  String get conciergeVoicePreviewCurrent => 'Ouvir voz atual';

  @override
  String get conciergeVoicePreviewSample =>
      'Olá, sou Luxora. Diga-me como você deseja que seja esta viagem.';

  @override
  String get conciergeVoiceDeviceNote =>
      'Baixe mais vozes em Configurações do iPhone → Acessibilidade → Conteúdo falado → Vozes. Volte aqui e toque em Atualizar.';

  @override
  String get conciergeVoiceDeviceSection => 'Vozes neste iPhone';

  @override
  String get conciergeVoiceDeviceSectionHint =>
      'Inclui vozes que você baixou – toque em uma para usá-la no Luxora.';

  @override
  String get conciergeVoiceRefreshList => 'Atualizar lista de vozes';

  @override
  String get conciergeVoiceShowAllLanguages => 'Mostrar todos os idiomas';

  @override
  String get conciergeVoiceOpenSettings =>
      'Abra as configurações de voz do iPhone';

  @override
  String get conciergeVoiceNoDeviceVoices =>
      'Nenhuma voz encontrada – baixe os pacotes em Configurações e atualize.';

  @override
  String get conciergeVoicePresetSection => 'Personagens rápidas';

  @override
  String get conciergeVoiceRegionRecommended => 'Recomendado';

  @override
  String get conciergeVoiceRegionEnglish => 'Inglês';

  @override
  String get conciergeVoiceRegionRussian => 'russo';

  @override
  String get conciergeVoiceRegionSpanish => 'Espanhol';

  @override
  String get conciergeVoiceRegionFrench => 'Francês';

  @override
  String get conciergeVoiceRegionGerman => 'Alemão';

  @override
  String get conciergeVoiceRegionOther => 'Outro';

  @override
  String get conciergeVoicePresetMatchApp => 'Padrão Luxora · Kate (Premium)';

  @override
  String get conciergeVoicePresetEnUsF => 'Americana · Mulher';

  @override
  String get conciergeVoicePresetEnUsM => 'Americano · Masculino';

  @override
  String get conciergeVoicePresetEnGbF => 'Britânica · Mulher';

  @override
  String get conciergeVoicePresetEnGbM => 'Britânico · Masculino';

  @override
  String get conciergeVoicePresetRuF => 'Russa · Mulher';

  @override
  String get conciergeVoicePresetRuM => 'Russo · Masculino';

  @override
  String get conciergeVoicePresetEsF => 'Espanhol · Feminino';

  @override
  String get conciergeVoicePresetEsM => 'Espanhol · Masculino';

  @override
  String get conciergeVoicePresetFrF => 'Francesa · Mulher';

  @override
  String get conciergeVoicePresetFrM => 'Francês · Masculino';

  @override
  String get conciergeVoicePresetDeF => 'Alemão · Feminino';

  @override
  String get conciergeVoicePresetDeM => 'Alemão · Masculino';

  @override
  String get conciergeThinking => 'Luxora está pensando…';

  @override
  String get conciergeItinerarySynced =>
      'Adicionei isso à sua Agenda — mesmas paradas no Mapa, prontas para compartilhar.';

  @override
  String get conciergeAgendaUpdatedSnack =>
      'Sua agenda está pronta no Mapa e Agenda';

  @override
  String get conciergeAgendaSyncFailed =>
      'Mapa e Agenda não foram atualizados. Experimente um pedido claro, por exemplo: Planeje uma viagem de 4 dias à Disney e à Universal.';

  @override
  String get conciergeViewAgendaOnMap => 'Ver Agenda';

  @override
  String get conciergeAgendaDealsIntro =>
      'Combinei ofertas de ingressos autorizados com paradas em sua agenda – compare antes de comprar no portão:';

  @override
  String get conciergeAgendaDealsSnack =>
      'Ofertas de ingressos correspondentes à sua agenda';

  @override
  String get conciergeViewTicketDeals => 'Ver ofertas';

  @override
  String ticketAgendaMatchLine(String stop, String amount, String source) {
    return '$stop · estimativa de economia de $amount via $source';
  }

  @override
  String ticketAgendaStopsSummary(int count) {
    return '$count paradas em sua agenda têm ofertas de parceiros. Compare as ofertas autorizadas antes de comprar no portão.';
  }

  @override
  String ticketAgendaStopsSavings(String amount) {
    return 'Husa. poupança familiar · $amount';
  }

  @override
  String get ticketBrowseAgendaDeals => 'Procure ofertas para sua agenda →';

  @override
  String get conciergeFreshThread =>
      'Sua agenda está no Mapa e na Agenda. Arquivei este bate-papo e comecei do zero - ajuste o dia, encontre ofertas ou pergunte algo novo.';

  @override
  String get conciergeThreadArchivedSnack =>
      'Bate-papo arquivado – novo tópico iniciado';

  @override
  String get conciergeNewConversationTooltip => 'Nova conversa';

  @override
  String get itinerarySameAsMapAgenda =>
      'Plano Concierge de hoje – também fixado no mapa. Compartilhe o cartão do dia abaixo.';

  @override
  String get conciergeTicketsFoundIntro =>
      'Encontrei ofertas de passagens autorizadas para sua viagem. Toque em Reservar passagens na Agenda para obter links diretos:';

  @override
  String conciergeTicketDealLine(
    String title,
    String price,
    String source,
    String savings,
  ) {
    return '• $title: $price via $source (economize $savings)';
  }

  @override
  String get conciergeTicketsTimelineHint =>
      'Cada parada correspondente na Agenda agora possui um botão Reservar ingressos com o link do revendedor.';

  @override
  String itineraryBookTickets(String amount) {
    return 'Reserve ingressos · Economize $amount';
  }

  @override
  String get itineraryOpenTicketDeal => 'Reservar ingressos';

  @override
  String conciergeTripSaved(String title) {
    return '“$title” salvo em suas viagens. Abra a guia Viagens a qualquer momento para revisitá-lo.';
  }

  @override
  String conciergeTripSavedWithStops(String title, int count) {
    return '“$title” salvo com $count experiências na sua linha do tempo.';
  }

  @override
  String conciergeSavedTripsIntro(int count) {
    return 'Você tem $count viagem(s) salva(s):';
  }

  @override
  String conciergeSavedTripLine(String title, String dates, String status) {
    return '• $title ($dates) — $status';
  }

  @override
  String get conciergeSavedTripsEmpty =>
      'Você ainda não tem nenhuma viagem salva. Peça-me para planejar algo e diga “salve minha viagem”.';

  @override
  String get conciergeSavedTripsHint =>
      'Abra a guia Viagens para visualizar cartões, compartilhar ou editar datas.';

  @override
  String get conciergeAiError =>
      'Não consegui falar com Luxora agora. Verifique sua conexão e tente novamente.';

  @override
  String get conciergeAiErrorVoice =>
      'Desculpe, não consegui entrar em contato com o concierge de Luxora agora.';

  @override
  String get conciergeAiNotConfigured =>
      'O concierge ao vivo do Luxora ainda não está conectado a esta versão - o URL do Supabase e a chave anon precisam ser incorporados ao aplicativo e a função de borda implantada. Mapa e itinerário ainda funcionam; consulte docs/CONCIERGE_AI.md para configuração.';

  @override
  String get conciergeAiOpenAiNotReady =>
      'Luxora ouviu você, mas o cérebro do concierge ainda não está online. Defina OPENAI_API_KEY em segredos Supabase para a função Edge (processador brilhante) e tente novamente.';

  @override
  String conciergeAiFunctionNotFound(String function) {
    return 'Luxora não conseguiu encontrar a função concierge edge \"$function\". Implante-o no Supabase ou corrija SUPABASE_CONCIERGE_FUNCTION nesta compilação.';
  }

  @override
  String get conciergeAiAuthFailed =>
      'Luxora não conseguiu autenticar com Supabase – verifique novamente SUPABASE_ANON_KEY corresponde ao seu projeto.';

  @override
  String get mapAiPowers => 'Poderes do mapa de IA';

  @override
  String get mapNavLayerTitle => 'Camada de navegação AI (próximo)';

  @override
  String get mapNavLayerSubtitle =>
      'Além da descoberta: inteligência ao vivo sobre se vale a pena parar agora.';

  @override
  String get mapBookingTitle => 'Reserva perfeita (parceiros)';

  @override
  String get mapCapMoodTitle => 'Rotas baseadas no humor';

  @override
  String get mapCapMoodDesc =>
      'Caminhos que combinam com romance, bem-estar, família ou aventura - e não apenas com menor tempo de viagem.';

  @override
  String get mapCapDriveTitle => 'Otimização do tempo de percurso';

  @override
  String get mapCapDriveDesc =>
      'Sequenciamento inteligente para que você passe o tempo sentindo, sem ficar parado no trânsito entre os destaques.';

  @override
  String get mapCapWeatherTitle => 'Sugestões baseadas no clima';

  @override
  String get mapCapWeatherDesc =>
      'Rotas alternativas de chuva e janelas dinâmicas para praias, telhados e nascentes.';

  @override
  String get mapCapSunsetTitle => 'Melhor pôr do sol agora';

  @override
  String get mapCapSunsetDesc =>
      'Onde a hora dourada atinge melhor nos próximos 90 minutos com base nos padrões do céu e da multidão.';

  @override
  String get mapCapCrowdTitle => 'Previsão de multidão';

  @override
  String get mapCapCrowdDesc =>
      'Quando parques, nascentes e pontos virais se acalmam – antes de você chegar.';

  @override
  String get mapCapGemsTitle => 'Jóias escondidas próximas';

  @override
  String get mapCapGemsDesc =>
      'Pins internos surgiram ao longo de sua rota - não apenas nas 10 principais paradas turísticas.';

  @override
  String get mapCapPersonalTitle => 'Personalização de rota';

  @override
  String get mapCapPersonalDesc =>
      'A sensação, o ritmo e o orçamento da sua viagem remodelam o mapa em tempo real.';

  @override
  String get mapFutureCrowdTitle => 'Calor da multidão ao vivo';

  @override
  String get mapFutureCrowdDesc =>
      'Densidade em tempo real em nascentes, parques e telhados virais – vale a pena agora?';

  @override
  String get mapFutureParkingTitle => 'Dificuldade de estacionamento';

  @override
  String get mapFutureParkingDesc =>
      'Pontuação de atrito antes de você se comprometer - ponto ideal para manobrista, garagem ou compartilhamento de viagens.';

  @override
  String get mapFutureTrafficTitle => 'Pontuação de atrito do drive';

  @override
  String get mapFutureTrafficDesc =>
      'Roteamento ponderado pelo estresse - não apenas minutos, mas como será a sensação da viagem.';

  @override
  String get mapFutureRerouteTitle => 'Redirecionamento espontâneo';

  @override
  String get mapFutureRerouteDesc =>
      'Mudança climática ou aumento de multidão? Um toque para remodelar o resto do seu dia.';

  @override
  String affiliateReserve(String category) {
    return 'Reserva · $category · parceiro premium (em breve)';
  }

  @override
  String get affiliateHotels => 'Hotéis e estadias';

  @override
  String get affiliateExperiences => 'Experiências e passeios';

  @override
  String get affiliateRestaurants => 'Reservas em restaurantes';

  @override
  String get affiliateThemeParks => 'Ingressos para parques temáticos';

  @override
  String get affiliateDayPasses => 'ResortPass / passes diários';

  @override
  String get affiliateCarRentals => 'Aluguel de carros';

  @override
  String get affiliateWellness => 'Reservas de bem-estar';

  @override
  String get tripsBadge => 'COLEÇÕES';

  @override
  String get tripsTitle => 'Viagens salvas';

  @override
  String get tripsSubtitle =>
      'Toque em uma viagem para obter um instantâneo ao vivo: próximo momento, clima, pôr do sol e linha do tempo.';

  @override
  String get tripsFooter =>
      'Capas de viagens do catálogo de humor · Sincronização Supabase Fase 2';

  @override
  String get tripsPlanNew => 'Planeje uma nova viagem';

  @override
  String get tripsEmptyTitle => 'Ainda não há viagens salvas';

  @override
  String get tripsEmptyBody =>
      'Planeje sua primeira viagem e ela aparecerá aqui, pronta para revisitar a qualquer momento.';

  @override
  String get tripsDeleteTitle => 'Excluir viagem?';

  @override
  String tripsDeleteBody(String title) {
    return 'Isso remove “$title” das suas viagens salvas. Isso não pode ser desfeito.';
  }

  @override
  String get tripsDeleted => 'Viagem excluída';

  @override
  String get tripsEditDates => 'Datas da viagem';

  @override
  String get tripsSaveDates => 'Salvar datas';

  @override
  String get tripsDatesUpdated => 'Datas de viagem atualizadas';

  @override
  String get tripsDatesFlexible => 'Datas flexíveis';

  @override
  String get tripsLiveWeather => 'Clima ao vivo';

  @override
  String get tripsNextUp => 'Próximo';

  @override
  String get tripsSunsetWindow => 'Janela do pôr do sol';

  @override
  String get tripsTimelineSnapshot => 'Instantâneo da linha do tempo';

  @override
  String get tripsOpenAgenda => 'Abrir agenda completa';

  @override
  String get tripsOpenTimeline => 'Abrir linha do tempo completa';

  @override
  String get tripsShare => 'Compartilhar';

  @override
  String get shareItineraryFooter =>
      'Planejado com Luxora – seu companheiro emocionalmente inteligente na Flórida.';

  @override
  String get shareCardCta => 'Planeje o seu em Luxora';

  @override
  String get shareCardDownloadHint =>
      'Gratuito para iOS e Android · luxora.ai/download';

  @override
  String shareCardShareMessage(String title, String url) {
    return '$title\n\nPlanejado com Luxora AI – viagens emocionalmente inteligentes para a Flórida.\nBaixe o aplicativo: $url';
  }

  @override
  String get conciergeLocalTryPlanning =>
      'Diga-me como você deseja que seja a viagem - por exemplo. \"Planeje uma viagem descontraída de 2 dias em Orlando com fontes e comida.\" Construirei uma agenda real no seu dispositivo (sem necessidade de nuvem).';

  @override
  String conciergeLocalPlanBuilt(String city, int count) {
    return 'Eu construí o dia da sua $city — $count paradas sequenciadas por humor e tempo de viagem. Abra Agenda ou Mapa para ver sua rota.';
  }

  @override
  String get conciergeLocalNoIntent =>
      'Descreva a sensação que você deseja — ou diga \"Planeje meu dia em Orlando\" — e eu criarei uma rota real no dispositivo.';

  @override
  String get ticketConciergeIntelBadge => 'Informações do concierge';

  @override
  String get ticketConciergeIntelAgenda =>
      'Correspondente às paradas da sua agenda - não a uma lista genérica de cupons.';

  @override
  String get agendaFixAfternoonRain => 'Chuva chegando - conserte minha tarde';

  @override
  String agendaRainRerouteDone(int count, int score) {
    return 'Tarde atualizada — $count paradas movidas para dentro de casa. Pontuação de férias $score/100.';
  }

  @override
  String get agendaRainRerouteNone => 'Seu plano já funciona para este clima.';

  @override
  String get cloudTripsTitle => 'Backup na nuvem';

  @override
  String get cloudTripsSubtitle =>
      'Suas viagens salvas são sincronizadas entre dispositivos quando você faz login, inclusive em qualquer desbloqueio de cidade.';

  @override
  String get cloudTripsMoreSubSignedOut =>
      'Faça login para fazer backup de viagens salvas';

  @override
  String cloudTripsMoreSubSignedIn(String email) {
    return 'Conectado como $email';
  }

  @override
  String get cloudTripsMoreSubSyncing => 'Sincronizando…';

  @override
  String get cloudTripsUnlockRequired =>
      'Desbloqueie um pacote de cidade para ativar o backup na nuvem';

  @override
  String get cloudTripsUnlockCta => 'Desbloquear concierge';

  @override
  String get cloudTripsEmailHint => 'Endereço de email';

  @override
  String get cloudTripsSendCode => 'Enviar código de login';

  @override
  String get cloudTripsCodeHint => 'Código de 6 dígitos do e-mail';

  @override
  String get cloudTripsVerify => 'Verifique e faça login';

  @override
  String get cloudTripsCodeSent =>
      'Verifique seu e-mail para obter um código de login';

  @override
  String get cloudTripsSignOut => 'sair';

  @override
  String get cloudTripsSyncNow => 'Sincronize agora';

  @override
  String get cloudTripsSyncSuccess => 'Viagens sincronizadas';

  @override
  String get cloudTripsSyncError => 'Falha na sincronização. Tente novamente';

  @override
  String get cloudTripsBannerTitle => 'Faça backup de suas viagens';

  @override
  String get cloudTripsBannerBody =>
      'Faça login para restaurar viagens em um novo telefone ou tablet.';

  @override
  String get cloudTripsBannerCta => 'Configurar backup na nuvem';

  @override
  String get cloudTripsNotConfigured =>
      'O backup na nuvem requer Supabase (configuração do desenvolvedor)';

  @override
  String get paywallFeatureCloudBackup => 'Backup de viagem na nuvem';

  @override
  String shareSubject(String title) {
    return 'Meu $title';
  }

  @override
  String get itineraryBadge => 'SUA LINHA DO TEMPO';

  @override
  String get itineraryTagline =>
      'Cada momento conectado – antecipação incorporada, estresse deixado de lado.';

  @override
  String itineraryDayTab(int day, String label) {
    return 'Dia $day · $label';
  }

  @override
  String get detailWhySpecial => 'Por que é especial';

  @override
  String get detailBestTime => 'Melhor época para ir';

  @override
  String get detailInsiderTips => 'Dicas internas';

  @override
  String get detailReserve => 'Reservar Experiência';

  @override
  String get detailReserveSoon => 'Parceiros de reservas em breve.';

  @override
  String get detailNearbyGems => 'Joias próximas';

  @override
  String get detailDuration => 'Duração';

  @override
  String get detailPractical => 'Detalhes práticos';

  @override
  String get detailCostRange => 'Faixa de custo';

  @override
  String get detailBestFor => 'Melhor para';

  @override
  String get detailVibeMatch => 'Combinação de vibração';

  @override
  String get detailCrowd => 'Multidão';

  @override
  String get detailTravelIntelTitle => 'Perspectiva de atrito de viagem';

  @override
  String get detailTravelIntelSubtitle =>
      'Previsto por categoria, tempo e distância – não por sensores ativos.';

  @override
  String detailCrowdOutlook(String level) {
    return 'Multidão: $level';
  }

  @override
  String detailParkingOutlook(String level) {
    return 'Estacionamento: $level';
  }

  @override
  String detailDriveFrictionOutlook(int score) {
    return 'Atrito de direção: $score/90';
  }

  @override
  String get detailPrice => 'Preço';

  @override
  String get detailLocation => 'Localização';

  @override
  String get detailGetDirections => 'Obter direções';

  @override
  String get detailParkMap => 'Mapa do parque';

  @override
  String get detailViewOnMap => 'Ver no mapa';

  @override
  String get detailMapsError =>
      'Não foi possível abrir mapas neste dispositivo.';

  @override
  String get detailGoogleMaps => 'Google Mapas';

  @override
  String get detailAppleMaps => 'Mapas da Apple';

  @override
  String get detailOpenInMaps => 'Abrir em mapas';

  @override
  String detailDriveFromOrlando(String time) {
    return '$time de carro de Orlando';
  }

  @override
  String detailDriveFromHub(String time, String hub) {
    return '$time de carro de $hub';
  }

  @override
  String get detailSaveToItinerary => 'Salvar no itinerário';

  @override
  String get detailSaved => 'Salvo';

  @override
  String get detailSavedSnack => 'Salvo no seu itinerário';

  @override
  String get detailRemovedSnack => 'Removido do seu itinerário';

  @override
  String get detailSetHomeBase => 'Definir como base';

  @override
  String get detailHomeBaseActive => 'Sua base de viagem';

  @override
  String get detailHomeBaseHint => 'A rota do seu dia começa e termina aqui.';

  @override
  String get detailHomeBaseSetSnack => 'Defina como sua base de viagem';

  @override
  String get detailHomeBaseClearedSnack => 'Base inicial limpa';

  @override
  String get detailMenuTitle => 'Destaques do cardápio';

  @override
  String get detailMenuDisclaimer =>
      'Destaques selecionados – menu completo e preços podem variar de acordo com o local.';

  @override
  String get detailMenuComingSoon =>
      'Ainda estamos fazendo a curadoria deste menu. Enquanto isso, veja o menu e os preços mais recentes on-line.';

  @override
  String get detailViewMenuOnline => 'Ver cardápio on-line';

  @override
  String get photoClose => 'Fechar';

  @override
  String get photoViewDestination => 'Ver destino';

  @override
  String get photoBy => 'Foto de';

  @override
  String get photoOn => 'sobre';

  @override
  String milesFromOrlando(String distance) {
    return '$distance de Orlando';
  }

  @override
  String milesFromHub(String distance, String hub) {
    return '$distance de $hub';
  }

  @override
  String get landingBadge => 'FLÓRIDA · MVP DE ORLANDO';

  @override
  String get landingTitle1 => 'As férias';

  @override
  String get landingTitle2 => 'já começou.';

  @override
  String get landingSubtitle =>
      'Luxora AI é o seu concierge emocionalmente inteligente – joias escondidas, pôr do sol na cobertura e momentos projetados para serem inesquecíveis antes mesmo de você fazer as malas.';

  @override
  String get landingBegin => 'Começar minha jornada';

  @override
  String get landingTalk => 'Fale com Luxora';

  @override
  String get landingWhy => 'Por que estamos construindo isso';

  @override
  String get storyTitle => 'Nossa história';

  @override
  String get storyHeroBadge => 'CONSTRUÍDO COM INTENÇÃO';

  @override
  String get storyHeroCreator => 'Criador, Luxora AI';

  @override
  String get storyHeroSubtitle => 'Flórida · viagem que prioriza a emoção';

  @override
  String get storyHeading => 'Por que estamos construindo Luxora';

  @override
  String get storyProblemLead =>
      'Percebemos que planejar uma viagem Flórida/Orlando é surpreendentemente fragmentado e cansativo.';

  @override
  String get storyJumpingBetween => 'As pessoas geralmente saltam entre';

  @override
  String get storyProblemTail =>
      '…e ainda acabar com planos turísticos genéricos.';

  @override
  String get storyDifferentLead => 'Queremos construir algo diferente.';

  @override
  String get storyNotPlannerTitle => 'Não apenas um planejador de viagens';

  @override
  String get storyNotPlannerBody =>
      'Um companheiro de viagem com IA que prioriza a emoção.';

  @override
  String get storyInsteadOfAsking => 'Em vez de perguntar';

  @override
  String get storyAppAsks => 'O aplicativo pergunta';

  @override
  String get storyInsteadQuestion => '“Para onde devo ir?”';

  @override
  String get storyFeelQuestion => '“Como você quer que seja esta viagem?”';

  @override
  String get storyMoodBuildLine =>
      'Então a IA cria uma experiência personalizada em torno desse clima.';

  @override
  String get storyFloridaFirstTitle => 'Por que Flórida/Orlando primeiro?';

  @override
  String get storyFloridaFirstLead => 'Orlando é um mercado de teste perfeito:';

  @override
  String get storyVisionTitle => 'Nossa visão';

  @override
  String get storyVisionLead => 'Combinar:';

  @override
  String get storyVisionCard =>
      'Portanto, o aplicativo parece mais um concierge de IA de luxo – e não outra ferramenta de itinerário enfadonha.';

  @override
  String get storyLongTermTitle => 'Oportunidade de longo prazo';

  @override
  String get storySourceGoogleMaps => 'Google Mapas';

  @override
  String get storySourceTikTok => 'TikTok';

  @override
  String get storySourceInstagram => 'Carretéis do Instagram';

  @override
  String get storySourceTravelBlogs => 'blogs de viagens';

  @override
  String get storySourceRestaurantApps => 'aplicativos de restaurante';

  @override
  String get storySourceWeatherApps => 'aplicativos de clima';

  @override
  String get storySourceTicketSites => 'sites de ingressos';

  @override
  String get storySourceTop10 =>
      'artigos aleatórios dos “10 melhores de Orlando”';

  @override
  String get storyBulletMarket => 'Enorme mercado turístico';

  @override
  String get storyBulletAudience =>
      'Famílias, casais, viajantes de luxo e viajantes de bem-estar';

  @override
  String get storyBulletOptions =>
      'Infinitos restaurantes, resorts, joias escondidas, parques temáticos, nascentes e vida noturna';

  @override
  String get storyBulletRepeat => 'Comportamento de alta repetição de visitas';

  @override
  String get storyBulletLogisticsGap =>
      'A maioria dos aplicativos de viagens se concentra na logística – não no design de experiência';

  @override
  String get storyPillarAiItinerary => 'Geração de itinerário AI';

  @override
  String get storyPillarMoodPlanning =>
      'Planejamento de viagens baseado no humor';

  @override
  String get storyPillarLiveDiscovery =>
      'Descoberta ao vivo e experiências de tendências';

  @override
  String get storyPillarHiddenGems => 'Joias locais escondidas';

  @override
  String get storyPillarRouting => 'Roteamento inteligente';

  @override
  String get storyPillarWeatherSunset =>
      'Inteligência meteorológica e pôr do sol';

  @override
  String get storyPillarPremiumUx => 'UX estética premium';

  @override
  String get storyOpportunityMultilingual => 'Expansão multilíngue';

  @override
  String get storyOpportunityAffiliate => 'Afiliados e parcerias de reserva';

  @override
  String get storyOpportunityInventory =>
      'Restaurantes, experiências e ingressos';

  @override
  String get storyOpportunitySubscriptions => 'Assinaturas premium';

  @override
  String get storyOpportunityScale =>
      'Escalável além da Flórida → outros destinos mais tarde';

  @override
  String get landingValues => 'Memórias · Emoção · Fuga · Conexão';

  @override
  String get landingRegionBadge => 'Região de lançamento';

  @override
  String get landingRegionTitle =>
      'Orlando e Flórida – curadoria de sentimento';

  @override
  String get onboardFinish => 'Conheça seu concierge';

  @override
  String get onboardBuilding => 'Criando sua aventura…';

  @override
  String get onboardStep1Title => 'Onde os sonhos pousam primeiro';

  @override
  String get onboardStep1Subtitle => 'Para onde você está indo?';

  @override
  String get onboardDestination => 'Destino';

  @override
  String get onboardRegion => 'Região';

  @override
  String get onboardCityLabel => 'Escolha sua cidade';

  @override
  String get onboardCityUnlockNote =>
      'Cada destino tem seu próprio desbloqueio de concierge – compra única por cidade.';

  @override
  String get landingCityLabel => 'Onde você está indo?';

  @override
  String get paywallSwitchCity => 'Destino';

  @override
  String get paywallUnlockingDestination => 'Desbloqueio para esta viagem';

  @override
  String paywallUnifiedPriceHeadline(String price) {
    return 'Cada pack de cidade desbloqueia por $price';
  }

  @override
  String get paywallUnifiedPriceBody =>
      'Orlando (inclui Disney e Universal), Miami e Florida Keys — compra única pelo mesmo preço. Sem assinatura.';

  @override
  String paywallSelectedPackToday(String packName) {
    return 'Desbloqueando hoje: $packName';
  }

  @override
  String paywallAddonUnifiedHeadline(String price) {
    return 'Disney e Universal — $price uma vez';
  }

  @override
  String get paywallAddonUnifiedBody =>
      'Mesmo preço simples de cada pack da Flórida — um desbloqueio, acesso vitalício.';

  @override
  String get cityPickerUnlocked => 'Desbloqueado';

  @override
  String cityPickerUnlockPrice(String price) {
    return 'Desbloquear $price';
  }

  @override
  String get cityPickerThemeParksSubtitle =>
      'Complemento Orlando · Disney e Universal juntos';

  @override
  String get onboardStep2Title => 'Hora de se sentir livre';

  @override
  String get onboardStep2Subtitle => 'Quando começa sua fuga?';

  @override
  String get onboardStartDateLabel => 'Data de início';

  @override
  String get onboardEndDateLabel => 'Data de término';

  @override
  String get onboardPickDate => 'Toque para escolher';

  @override
  String get onboardSelectStartDate => 'Escolha a data de início';

  @override
  String get onboardSelectEndDate => 'Escolha a data de término';

  @override
  String get onboardDatesHint =>
      'Você pode alterá-los a qualquer momento na guia Viagens.';

  @override
  String get onboardStepBudgetTitle => 'Planeje com facilidade';

  @override
  String get onboardStepBudgetSubtitle => 'O que parece certo para esta fuga?';

  @override
  String get onboardBudget => 'Orçamento de viagem (USD)';

  @override
  String get onboardStep3Title => 'Quem compartilha a história';

  @override
  String get onboardStep3Subtitle => 'Quem está viajando com você?';

  @override
  String get onboardTravelers => 'Viajantes';

  @override
  String get onboardStep4Title => 'Seu ritmo';

  @override
  String get onboardStep4Subtitle => 'Como seus dias devem fluir?';

  @override
  String get onboardNightlife => 'Interesse pela vida noturna';

  @override
  String get onboardFoodie => 'Paixão gastronômica';

  @override
  String get onboardPoolside => 'À beira da piscina e tempo de inatividade';

  @override
  String get onboardAdventure => 'Aventura e atividades ao ar livre';

  @override
  String get onboardCulture => 'Cultura e turismo';

  @override
  String get dayFlowSubtitle =>
      'Um dia moldado em torno de como você deseja se sentir – não uma lista de verificação.';

  @override
  String get dayFlowMorning => 'MANHÃ';

  @override
  String get dayFlowMidday => 'MEIO-DIA';

  @override
  String get dayFlowAfternoon => 'TARDE';

  @override
  String get dayFlowEvening => 'NOITE';

  @override
  String get dayFlowNight => 'NOITE';

  @override
  String get dayFlowReasonMorningPool =>
      'Relaxe lentamente - à beira da piscina ou spa antes do início do dia.';

  @override
  String get dayFlowReasonMorningCalm => 'Um começo suave para definir o tom.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Horas de pico de energia – a grande aventura enquanto você está revigorado.';

  @override
  String get dayFlowReasonMiddayCulture =>
      'Passeios turísticos enquanto a luz está forte.';

  @override
  String get dayFlowReasonMiddayIcon => 'O momento marcante do dia.';

  @override
  String get dayFlowReasonMiddayLunch =>
      'A midday meal break between experiences.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'À tarde, tempo de inatividade para recarregar.';

  @override
  String get dayFlowReasonAfternoonGem =>
      'Uma joia escondida longe das multidões.';

  @override
  String get dayFlowReasonEveningDining =>
      'A refeição do dia – a sua escolha gastronómica.';

  @override
  String get dayFlowReasonNightOut => 'Um último brilho – uma noite fora.';

  @override
  String weatherToday(String place) {
    return 'Agora mesmo em $place';
  }

  @override
  String weatherSunset(String time) {
    return 'Pôr do sol $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% de chance de chuva – coloque uma camada leve.';
  }

  @override
  String get weatherConditionClear => 'Claro';

  @override
  String get weatherConditionPartlyCloudy => 'Parcialmente nublado';

  @override
  String get weatherConditionCloudy => 'Nublado';

  @override
  String get weatherConditionFog => 'Névoa';

  @override
  String get weatherConditionDrizzle => 'Chuvisco';

  @override
  String get weatherConditionRain => 'Chuva';

  @override
  String get weatherConditionSnow => 'Neve';

  @override
  String get weatherConditionThunder => 'Tempestades';

  @override
  String get weatherConciergeTitle => 'Portaria do tempo';

  @override
  String get weatherConciergeTapHint => 'Toque para obter previsões de viagens';

  @override
  String get weatherConciergeAdviceTitle =>
      'Conselhos meteorológicos em Luxora';

  @override
  String weatherFeelsLike(String temp) {
    return 'Parece $temp';
  }

  @override
  String get weatherHumidity => 'Umidade';

  @override
  String get weatherWind => 'Vento';

  @override
  String weatherWindValue(String dir, int speed) {
    return '$dir a $speed mph';
  }

  @override
  String get weatherUv => 'Índice UV';

  @override
  String get weatherCloudCover => 'Cobertura de nuvens';

  @override
  String get weatherVisibility => 'Visibilidade';

  @override
  String weatherVisibilityMiles(String miles) {
    return '$miles milhas';
  }

  @override
  String weatherSunrise(String time) {
    return 'Nascer do sol $time';
  }

  @override
  String get weatherStatRain => 'Chuva';

  @override
  String get weatherWhatToBring => 'O que levar hoje';

  @override
  String get weatherPlanImpact => 'Impacto no seu plano';

  @override
  String get weatherHourlyTitle => 'Perspectiva horária';

  @override
  String get weatherHourlyUnavailable =>
      'A previsão por hora aparecerá quando os dados forem carregados.';

  @override
  String get weatherLiveRadar => 'Radar ao vivo';

  @override
  String get weatherRadarComingSoon => 'Radar ao vivo em breve.';

  @override
  String get weatherRadarPlay => 'Ciclo de reprodução';

  @override
  String get weatherRadarPause => 'Pausar ciclo';

  @override
  String get weatherRadarTapToExpand => 'Toque para tela cheia';

  @override
  String get weatherRadarNow => 'Agora';

  @override
  String weatherRadarMinutesAgo(int minutes) {
    return '$minutes minutos atrás';
  }

  @override
  String weatherRadarMinutesAhead(int minutes) {
    return '+$minutes min';
  }

  @override
  String get weatherRadarStepBack => 'Quadro anterior';

  @override
  String get weatherRadarStepForward => 'Quadro posterior';

  @override
  String get weatherRadarJumpNow => 'Agora';

  @override
  String get weatherRadarJump1h => '−1 hora';

  @override
  String get weatherRadarJump2h => '−2 horas';

  @override
  String get weatherRadarJump30m => '+30 minutos';

  @override
  String get weatherRadarSpeedSlow => 'Lento';

  @override
  String get weatherRadarSpeedNormal => 'Normal';

  @override
  String get weatherRadarSpeedFast => 'Rápido';

  @override
  String get weatherRadarLoopNote =>
      'Loop de radar: últimas aproximadamente 2 horas em passos de 10 minutos, além de previsão imediata de curto alcance quando disponível — não uma previsão de 4 horas.';

  @override
  String get shareMapPreviewCaption =>
      'Pré-visualização do mapa · aberto em Luxora para obter instruções em tempo real';

  @override
  String get shareRadarPreviewCaption =>
      'Radar Doppler ao vivo · aberto em Luxora para o circuito completo';

  @override
  String get weatherMapOverlays => 'Sobreposições de mapas';

  @override
  String get weatherOverlayPrecip => 'Precipitação';

  @override
  String get weatherOverlayTemp => 'Temperatura';

  @override
  String get weatherOverlayWind => 'Vento';

  @override
  String get weatherOverlayCloud => 'Cobertura de nuvens';

  @override
  String get weatherComingSoon => 'Em breve';

  @override
  String get weatherAdjustDay => 'Ajustar meu dia de acordo com o clima';

  @override
  String get weatherBestOutdoorWindow => 'Melhor janela externa';

  @override
  String get weatherRainWindow => 'Chuva provável';

  @override
  String get weatherSunsetRec => 'Recomendação do pôr do sol';

  @override
  String weatherOutdoorAtRisk(int count) {
    return '$count paradas ao ar livre podem ser afetadas';
  }

  @override
  String get weatherIndoorBackup => 'Ideias de backup interno';

  @override
  String get weatherAdviceLightJacket => 'Traga uma jaqueta leve esta noite.';

  @override
  String weatherAdviceOutdoorBefore(String time) {
    return 'Planeje atividades ao ar livre antes de $time.';
  }

  @override
  String get weatherAdviceHighUv =>
      'UV alto hoje – leve protetor solar e evite exposição solar direta e prolongada ao meio-dia.';

  @override
  String get weatherAdviceRainLater =>
      'O risco de chuva aumenta mais tarde hoje, então mude as experiências internas para a tarde.';

  @override
  String get weatherAdviceWindBeach =>
      'O vento pode tornar as atividades na praia ou no barco menos confortáveis ​​hoje.';

  @override
  String get weatherAdviceGreatSunset =>
      'Ótimas condições para o pôr do sol esta noite – considere um jantar na cobertura ou uma caminhada no lago.';

  @override
  String get weatherAdviceDefault =>
      'O céu parece administrável – siga seu plano e mantenha uma camada leve à mão.';

  @override
  String weatherSunsetRecRooftop(String time) {
    return 'Céu limpo perto de $time – um jantar no terraço ou uma caminhada no lago podem brilhar.';
  }

  @override
  String get weatherPackSunscreen => 'Protetor solar';

  @override
  String get weatherPackSunglasses => 'Óculos de sol';

  @override
  String get weatherPackUmbrella => 'Guarda-chuva';

  @override
  String get weatherPackLightJacket => 'Jaqueta leve';

  @override
  String get weatherPackShoes => 'Sapatos confortáveis';

  @override
  String get weatherPackWater => 'Garrafa de água';

  @override
  String get weatherPackHat => 'Chapéu';

  @override
  String get weatherPackPoncho => 'Poncho';

  @override
  String get weatherPackSwimwear => 'Trajes de banho';

  @override
  String weatherImpactRainLater(
    String time,
    String outdoorStop,
    String indoorStop,
  ) {
    return 'O risco de chuva aumenta após $time. Considere mover $outdoorStop mais cedo e salvar $indoorStop para mais tarde.';
  }

  @override
  String weatherImpactHeat(String time) {
    return 'Meio-dia com calor intenso – planeje caminhadas ao ar livre antes de $time.';
  }

  @override
  String get weatherImpactClear =>
      'O céu parece favorável para seus planos ao ar livre esta manhã.';

  @override
  String weatherImpactMixed(int count) {
    return '$count paradas ao ar livre podem precisar de ajustes de tempo hoje.';
  }

  @override
  String get weatherImpactNoPlanRain =>
      'A chuva está na mistura – construa primeiro o seu dia com âncoras internas.';

  @override
  String weatherImpactNoPlanClear(String start, String end) {
    return 'A melhor janela externa tem a aparência $start–$end antes do calor ou dos chuveiros aumentarem.';
  }

  @override
  String get weatherImpactNoPlanDefault =>
      'O tempo parece estável - toque em Planejar meu dia quando estiver pronto para sequenciar as paradas.';

  @override
  String get weatherImpactIndoorFallback => 'um spa ou museu';

  @override
  String get hotelIntelBadge => 'INTELIGÊNCIA HOTELEIRA';

  @override
  String get hotelIntelTitle => 'Encontre sua base';

  @override
  String get hotelIntelSubtitle =>
      'Com base na viagem que você deseja, Luxora seleciona estadias que moldam seus dias - não uma grade de reservas.';

  @override
  String get hotelDiscoveryTitle => 'Curadoria para Orlando';

  @override
  String get hotelMatchmakerTeaser =>
      'Diga a Luxora seu estilo de viagem e obtenha três estadias escolhidas pelo concierge com compensações honestas.';

  @override
  String get hotelMatchmakerCta => 'Casamenteiro de hotéis AI';

  @override
  String get hotelMatchmakerTitle => 'Hotel Casamenteiro';

  @override
  String get hotelMatchmakerSubtitle =>
      'Compartilhe como você viaja – Luxora recomenda onde ancorar seus dias.';

  @override
  String get hotelMatchmakerRun => 'Encontre minhas 3 melhores estadias';

  @override
  String get hotelMatchBudget => 'Zona de conforto orçamentária';

  @override
  String get hotelMatchTravelers => 'Viajantes';

  @override
  String get hotelMatchAdults => 'Adultos';

  @override
  String get hotelMatchKids => 'Crianças';

  @override
  String get hotelMatchAttractions => 'Atrações na sua lista';

  @override
  String get hotelMatchLuxuryLevel => 'Nível de luxo desejado';

  @override
  String get hotelMatchTransport => 'Locomovendo-se';

  @override
  String get hotelTransportCar => 'Aluguel de carro';

  @override
  String get hotelTransportRideshare => 'Compartilhamento de carona';

  @override
  String get hotelTransportShuttle => 'Transporte para o resort';

  @override
  String get hotelTransportWalkable => 'Bairro acessível';

  @override
  String get hotelMatchResultsTitle => 'Suas 3 melhores partidas';

  @override
  String hotelMatchWhyTitle(int score) {
    return 'Pontuação da partida $score';
  }

  @override
  String get hotelMatchBestForLabel => 'Melhor para:';

  @override
  String get hotelMatchItineraryLabel => 'Itinerário:';

  @override
  String get hotelMatchTradeoffsLabel => 'Compensações:';

  @override
  String get hotelMatchNearbyLabel => 'Próximo:';

  @override
  String get hotelLuxoraScore => 'Luxora';

  @override
  String get hotelHomeBaseBadge => 'BASE INICIAL';

  @override
  String get hotelScoreLuxury => 'Luxo';

  @override
  String get hotelScoreFamily => 'Família';

  @override
  String get hotelScoreRomance => 'Romance';

  @override
  String get hotelScoreWalkability => 'Andar';

  @override
  String get hotelWhyRecommendTitle => 'Por que Luxora recomenda isso';

  @override
  String get hotelItineraryImpactTitle => 'Como isso molda seus dias';

  @override
  String hotelItineraryImpactBody(String driveTime, int friction) {
    return 'Percurso aproximado do hub: $driveTime. Pontuação de fricção de deslocamento: $friction/90 (menor é mais calmo).';
  }

  @override
  String get hotelAddHomeBase => 'Adicionar como base inicial';

  @override
  String get hotelHomeBaseActive => 'Base inicial ativa';

  @override
  String get hotelViewOnMap => 'Ver no mapa';

  @override
  String get hotelGetDirections => 'Obter direções';

  @override
  String get hotelCheckRates => 'Verifique as taxas';

  @override
  String get hotelVisitWebsite => 'Visite o site';

  @override
  String get hotelLinkUnavailable =>
      'Link de reserva ainda não disponível para esta estadia.';

  @override
  String get hotelLinkOpenFailed =>
      'Não foi possível abrir o link. Verifique seu navegador ou tente novamente.';

  @override
  String get hotelSave => 'Salvar hotel';

  @override
  String get hotelSaved => 'Salvo';

  @override
  String get hotelDistanceTitle => 'Distância aos pontos-chave';

  @override
  String get hotelCompareTitle => 'Comparar estadias';

  @override
  String get hotelCompareSubtitle =>
      'Vista do concierge lado a lado — até três hotéis.';

  @override
  String hotelCompareSelected(int count) {
    return '$count selecionados';
  }

  @override
  String get hotelComparePrice => 'Faixa de preço';

  @override
  String get hotelCompareDriveImpact => 'Impulsione o impacto';

  @override
  String get hotelCompareNearby => 'Destaques próximos';

  @override
  String get hotelPriceBudget => 'Orçamento';

  @override
  String get hotelPriceModerate => 'Moderado';

  @override
  String get hotelPriceUpscale => 'Sofisticado';

  @override
  String get hotelPriceLuxury => 'Luxo';

  @override
  String get hotelTagCouples => 'Melhor para casais';

  @override
  String get hotelTagDisney => 'Melhor para a Disney';

  @override
  String get hotelTagUniversal => 'Melhor para Universal';

  @override
  String get hotelTagLuxuryStaycation => 'Estadia de luxo';

  @override
  String get hotelTagFamily => 'Adequado para famílias';

  @override
  String get hotelTagQuiet => 'Fuga tranquila';

  @override
  String get hotelTagWalkableDining => 'Refeições a pé';

  @override
  String get hotelTagResort => 'Sensação de resort';

  @override
  String get hotelTagBudget => 'Econômico';

  @override
  String get hotelReasonMatchesMood =>
      'Combina com o humor e o ritmo da sua viagem.';

  @override
  String get hotelReasonCloseStops =>
      'Perto das paradas planejadas na sua linha do tempo.';

  @override
  String hotelReasonSavesDrive(String time) {
    return 'Economiza tempo de deslocamento em comparação com um hub genérico — cerca de $time do centro.';
  }

  @override
  String hotelReasonFitsBudget(String range) {
    return 'Adapta-se a uma zona de conforto $range sem gastar demais no resort errado.';
  }

  @override
  String get hotelReasonBetterGroup =>
      'Mais adequado ao seu tipo de grupo e nível de energia.';

  @override
  String get hotelReasonNearbyDining =>
      'Refeições fortes nas proximidades para noites sem esforço.';

  @override
  String get hotelReasonLowStress =>
      'Calma estilo resort – menos logística, mais férias.';

  @override
  String get hotelMatchAttractionsGeneral => 'suas atrações planejadas';

  @override
  String hotelMatchWhyMulti(String attractions, String hotel) {
    return 'Com base no seu itinerário de $attractions, o $hotel reduz o tempo de viagem e facilita as noites.';
  }

  @override
  String hotelMatchWhySingle(String hotel, String neighborhood) {
    return '$hotel em $neighborhood se adapta a como você deseja que seja esta viagem.';
  }

  @override
  String get hotelMatchBestForFamily =>
      'Famílias que querem dias na piscina sem sacrificar o acesso ao parque.';

  @override
  String get hotelMatchBestForCouple =>
      'Casais que querem romance sem o caos dos parques temáticos.';

  @override
  String get hotelMatchBestForGroup =>
      'Grupos equilibrando conforto, acesso e logística tranquila.';

  @override
  String hotelMatchImpactDisney(String time) {
    return 'Percursos mais curtos na Disney – cerca de $time até os parques da sua porta.';
  }

  @override
  String get hotelMatchImpactUniversal =>
      'As vantagens do Universal Express ou o acesso ao táxi aquático podem recuperar horas do seu dia.';

  @override
  String get hotelMatchImpactWalkable =>
      'Caminhe até o jantar – menos estresse ao estacionar após longos dias no parque.';

  @override
  String hotelMatchImpactDefault(String time) {
    return 'Mantém a média de viagens em torno de $time para que seu fluxo diário permaneça tranquilo.';
  }

  @override
  String get hotelMatchTradeoffLuxuryBudget =>
      'Preços de resort premium – faça um orçamento maior para o quarto e menos para outros lugares.';

  @override
  String get hotelMatchTradeoffCarNeeded =>
      'Você dependerá de um carro ou de um veículo compartilhado - não de uma base para caminhar por toda parte.';

  @override
  String get hotelMatchTradeoffLessFamily =>
      'Menos focado em comodidades voltadas para crianças do que em resorts familiares dedicados.';

  @override
  String get hotelMatchTradeoffLessRomantic =>
      'Mais energia de parque temático do que um retiro tranquilo para casais.';

  @override
  String get hotelMatchTradeoffDefault =>
      'Cada estadia tem vantagens e desvantagens – Luxora escolheu isso primeiro para suas prioridades.';

  @override
  String hotelNearbyDefault(String neighborhood) {
    return 'Jantares e experiências em $neighborhood.';
  }

  @override
  String get mapHotelIntelBannerTitle => 'Escolha a base certa';

  @override
  String get mapHotelIntelBannerBody =>
      'Seu hotel determina os horários de viagem, o fluxo do dia e onde você come. Luxora ajuda você a escolher – sem pressão de reserva.';

  @override
  String get mapHotelIntelBannerCta => 'Explore a inteligência hoteleira';

  @override
  String get sponsorLuxoraRecommended => 'Luxora Recomendado';

  @override
  String get sponsorBadgeFeaturedPartner => 'Parceiro em destaque';

  @override
  String get sponsorBadgeSponsored => 'Patrocinado';

  @override
  String get sponsorBadgePromoted => 'Promovido';

  @override
  String get sponsorBadgePartnerOffer => 'Oferta de parceiro';

  @override
  String get sponsorCtaVisitWebsite => 'Visite o site';

  @override
  String get sponsorCtaBookNow => 'Reserve agora';

  @override
  String get sponsorCtaCheckRates => 'Verifique as taxas';

  @override
  String get sponsorCtaGetTickets => 'Obter ingressos';

  @override
  String get sponsorCtaViewOffer => 'Ver oferta';

  @override
  String get featuredStaysTitle => 'Estadias em destaque';

  @override
  String get featuredStaysSubtitle =>
      'Posicionamentos de parceiros — separados das pontuações de correspondência de hotéis orgânicos do Luxora.';

  @override
  String get featuredExperiencesTitle => 'Experiências em destaque';

  @override
  String get featuredExperiencesSubtitle =>
      'Escolhas promovidas de acordo com o seu humor – sempre rotuladas, nunca disfarçadas de classificação de IA.';

  @override
  String get featuredDiningTitle => 'Jantares em destaque';

  @override
  String get featuredDiningSubtitle =>
      'Restaurantes parceiros Destaques de Luxora - sua lista de joias orgânicas permanece independente.';

  @override
  String get featuredTicketPartnersTitle =>
      'Parceiros de ingressos em destaque';

  @override
  String get featuredTicketPartnersSubtitle =>
      'Ofertas de parceiros autorizados — compare com as economias orgânicas abaixo.';

  @override
  String get featuredCityHomeTitle => 'Parceiros em destaque';

  @override
  String get featuredCityHomeSubtitle =>
      'Opções úteis de parceiros para Orlando – claramente marcadas, nunca escondidas como escolhas de IA.';

  @override
  String get dayFlowVibeFoodie => 'Avançado gastronômico';

  @override
  String get dayFlowVibeNightlife => 'Vida noturna';

  @override
  String get dayFlowVibePoolside => 'À beira da piscina';

  @override
  String get dayFlowVibeAdventure => 'Aventureiro';

  @override
  String get dayFlowVibeCulture => 'Cultura';

  @override
  String get onboardStep5Title => 'O coração de Luxora';

  @override
  String get onboardStep5Subtitle => 'Como você quer que esta viagem seja?';

  @override
  String get onboardTripFeelHint =>
      'Jantares ao pôr do sol, manhãs lentas, risadas com meu parceiro…';

  @override
  String get onboardStepNameEyebrow => 'Sua história começa com um nome';

  @override
  String get onboardStepNameTitle => 'Como devemos chamar esta viagem?';

  @override
  String get onboardStepNameSubtitle =>
      'Luxora pode criar um título a partir de sua vibração – ou digitar o seu próprio.';

  @override
  String get onboardTripNameLuxora => 'Deixe Luxora nomeá-lo';

  @override
  String get onboardTripNameYours => 'vou nomeá-lo';

  @override
  String get onboardTripNameHint => 'Nossa fuga de aniversário de primavera…';

  @override
  String onboardTripNameSuggested(String name) {
    return 'Luxora sugere: $name';
  }

  @override
  String get conciergeTripNameLabel => 'Nome da viagem';

  @override
  String get moodRomantic => 'Romântico';

  @override
  String get moodRelaxing => 'Relaxante';

  @override
  String get moodAdventurous => 'Aventureiro';

  @override
  String get moodLuxurious => 'Luxuoso';

  @override
  String get moodFamily => 'Vínculo familiar';

  @override
  String get moodSocial => 'Social';

  @override
  String get moodNature => 'Focado na natureza';

  @override
  String get moodWellness => 'Retiro de bem-estar';

  @override
  String get moodFoodie => 'Experiência gastronômica';

  @override
  String get catHiddenGems => 'Joias escondidas';

  @override
  String get catLuxuryStay => 'Férias de luxo';

  @override
  String get catBeaches => 'Praias';

  @override
  String get catRooftop => 'Jantar na cobertura';

  @override
  String get catSpas => 'Spas';

  @override
  String get catNightlife => 'Vida noturna';

  @override
  String get catFamily => 'Família';

  @override
  String get catEco => 'Turismo ecológico';

  @override
  String get catThemeParks => 'Parques temáticos';

  @override
  String get catRomantic => 'Escapadinhas românticas';

  @override
  String get catFood => 'Experiências gastronômicas';

  @override
  String get catSprings => 'Molas';

  @override
  String get catIslands => 'Passeio pelas ilhas';

  @override
  String get catInfluencer => 'Digno de influenciador';

  @override
  String get placeCatBeach => 'Praia';

  @override
  String get placeCatDining => 'Jantar';

  @override
  String get placeCatNature => 'Natureza';

  @override
  String get placeCatNightlife => 'Vida noturna';

  @override
  String get placeCatWellness => 'Bem-estar';

  @override
  String get placeCatFamily => 'Família';

  @override
  String get placeCatSprings => 'Molas';

  @override
  String get placeCatRomantic => 'Romântico';

  @override
  String get placeCatAdventure => 'Aventura';

  @override
  String get placeCatHotel => 'Hotel';

  @override
  String get styleLessCrowded => 'Menos lotado';

  @override
  String get styleLuxurySubtle => 'Luxo, mas não chamativo';

  @override
  String get styleHiddenLuxury => 'Luxo escondido';

  @override
  String get styleWalkable => 'Caminhável quando possível';

  @override
  String get styleSlowMornings => 'Manhãs lentas';

  @override
  String get styleNoTraps => 'Sem armadilhas para turistas';

  @override
  String get styleNatureHeavy => 'Natureza pesada';

  @override
  String get styleNatureWellness => 'Natureza + bem-estar apenas';

  @override
  String get styleAestheticDining => 'Jantar estético';

  @override
  String get styleFamilyEasy => 'Logística fácil para a família';

  @override
  String get paywallHeroEyebrow => 'SEU CONCIERGE PESSOAL';

  @override
  String get paywallHeroHeadline => 'NÃO PERCA SUAS FÉRIAS';

  @override
  String get paywallHeroSubheadline =>
      'Luxora planeja a viagem para que você possa aproveitar.';

  @override
  String get paywallEmotionalLine =>
      'Você já está gastando milhares em suas férias. Não deixe a experiência ao acaso.';

  @override
  String paywallHeadlineCouples(String cityName) {
    return 'Sua viagem perfeita para $cityName começa aqui.';
  }

  @override
  String paywallHeadlineFamily(String cityName) {
    return 'Gaste menos tempo planejando e mais tempo criando lembranças em $cityName.';
  }

  @override
  String paywallHeadlineLuxury(String cityName) {
    return 'Experimente $cityName de maneira diferente.';
  }

  @override
  String paywallHeadlineAdventure(String cityName) {
    return 'Descubra a $cityName que a maioria dos turistas nunca vê.';
  }

  @override
  String paywallHeadlineFoodie(String cityName) {
    return 'Experimente $cityName como um especialista local.';
  }

  @override
  String get paywallWhatYouUnlock => 'O que você desbloqueia';

  @override
  String get paywallFeatureAiConcierge => 'Concierge de IA';

  @override
  String get paywallFeatureItineraries => 'Itinerários Personalizados';

  @override
  String get paywallFeatureHiddenGems => 'Joias escondidas';

  @override
  String get paywallFeatureHotelIntel => 'Inteligência Hoteleira';

  @override
  String get paywallFeatureTicketSavings => 'Economia inteligente de ingressos';

  @override
  String get paywallFeatureWeatherConcierge => 'Portaria do tempo';

  @override
  String get paywallFeatureCrowdIntel => 'Inteligência de Multidões';

  @override
  String get paywallFeatureGpsNav => 'Navegação GPS';

  @override
  String get paywallFeatureLocalSecrets => 'Segredos locais';

  @override
  String get paywallFeatureDining => 'Recomendações gastronômicas';

  @override
  String get paywallFeatureUnlimitedPlanning => 'Planejamento urbano ilimitado';

  @override
  String get paywallWhyTravelersUnlock =>
      'Por que os viajantes desbloqueiam Luxora';

  @override
  String get paywallBenefitSaveTimeTitle => 'Economize tempo';

  @override
  String get paywallBenefitSaveTimeBody =>
      'Evite horas de pesquisa e planejamento.';

  @override
  String get paywallBenefitSaveMoneyTitle => 'Economize dinheiro';

  @override
  String get paywallBenefitSaveMoneyBody =>
      'Descubra economia de ingressos, ofertas locais e escolhas mais inteligentes.';

  @override
  String get paywallBenefitAvoidTrapsTitle => 'Evite armadilhas para turistas';

  @override
  String get paywallBenefitAvoidTrapsBody =>
      'Encontre experiências que os habitantes locais realmente recomendam.';

  @override
  String get paywallBenefitTravelSmarterTitle =>
      'Viaje de maneira mais inteligente';

  @override
  String get paywallBenefitTravelSmarterBody =>
      'Obtenha recomendações com base no clima, nas multidões e no seu estilo de viagem.';

  @override
  String paywallValueStory(String cityName, String price) {
    return 'Cada pack da Flórida — incluindo Disney e Universal em Orlando — desbloqueia por $price. Você recebe o concierge completo para $cityName: roteiros, joias escondidas, inteligência hoteleira e guia IA ilimitado.';
  }

  @override
  String get paywallRoiHook =>
      'Uma refeição ruim, ingressos caros ou uma tarde perdida custam mais do que este desbloqueio único.';

  @override
  String get paywallPeaceOfMindTitle => 'Tranquilidade incluída';

  @override
  String get paywallPeaceOfMindBody =>
      'Você não está comprando outra assinatura. Está comprando férias mais inteligentes — planejadas antes de pousar e apoiadas enquanto você está lá.';

  @override
  String get paywallLockedPreviewTitle => 'Esperando dentro do seu concierge';

  @override
  String get paywallLockedPreviewSubtitle =>
      'Desbloqueie para revelar rotas e segredos adaptados à sua viagem.';

  @override
  String get paywallLockedDateNight =>
      'Rotas românticas para encontros noturnos';

  @override
  String get paywallLockedHiddenLuxury => 'Experiências de luxo ocultas';

  @override
  String get paywallLockedVipSecrets => 'Segredos locais VIP';

  @override
  String get paywallLockedConciergeRecs => 'Recomendações do concierge';

  @override
  String get paywallLockedFamilyPlans => 'Planos familiares sem estresse';

  @override
  String get paywallLockedWeatherReroute =>
      'Redirecionamento sensível ao clima';

  @override
  String get paywallLockedHotelMatchmaker =>
      'Casamenteiro de hotel inteligente';

  @override
  String paywallUnlockCityConcierge(String cityName) {
    return 'Desbloqueie o concierge de $cityName';
  }

  @override
  String get paywallOneTimePurchase => 'Compra única';

  @override
  String get paywallNoSubscription => 'Sem assinatura';

  @override
  String get paywallNoMonthlyFees => 'Sem taxas mensais';

  @override
  String paywallLifetimeAccess(String cityName) {
    return 'Acesso vitalício a $cityName';
  }

  @override
  String paywallFutureUpdatesIncluded(String cityName) {
    return 'Atualizações futuras de $cityName incluídas';
  }

  @override
  String paywallMostVacationsCost(
    String cityName,
    String minUsd,
    String maxUsd,
  ) {
    return 'A maioria das férias em $cityName custa $minUsd–$maxUsd+';
  }

  @override
  String paywallLuxoraPriceLine(String price) {
    return '$price Uma vez';
  }

  @override
  String get paywallLessThanDinner =>
      'Menos que o custo de um jantar de férias.';

  @override
  String get paywallSocialProofTitle => 'Viajantes que desbloquearam Luxora';

  @override
  String get paywallSocialProofHeading => 'Valeu a pena antes mesmo de pousar';

  @override
  String get paywallReview1 => '\"Economizou-nos horas de planejamento.\"';

  @override
  String get paywallReview2 =>
      '\"Encontramos lugares que nunca teríamos descoberto.\"';

  @override
  String get paywallReview3 => '\"Vale a pena apenas pelas jóias escondidas.\"';

  @override
  String paywallCtaUnlock(String cityName) {
    return 'Desbloqueie o concierge de $cityName';
  }

  @override
  String get paywallContinueExploring => 'Continue explorando';

  @override
  String get paywallConciergePromise =>
      'Sem assinatura · Acesso vitalício à cidade';

  @override
  String get paywallRestorePurchases => 'Restaurar compras';

  @override
  String get paywallRestorePreviewDisabled =>
      'Restaurar está desativado no modo de pré-visualização — use uma build completa para testar.';

  @override
  String get paywallPurchaseSuccess =>
      'Compra concluída – seu concierge está desbloqueado.';

  @override
  String get paywallPurchasePending => 'Concluindo a compra…';

  @override
  String get paywallPurchaseFailed =>
      'Não foi possível concluir a compra. Tente novamente ou restaure as compras.';

  @override
  String get paywallPurchaseCanceled => 'Compra cancelada.';

  @override
  String get paywallRestoreComplete => 'Compras restauradas.';

  @override
  String get paywallRestoreNone =>
      'Nenhuma compra anterior encontrada para este ID Apple ou conta do Google.';

  @override
  String get paywallStoreUnavailable =>
      'O faturamento da App Store não está disponível neste dispositivo.';

  @override
  String get paywallProductUnavailable =>
      'Este pacote ainda não está disponível na loja.';

  @override
  String get settingsUnlockConciergeTitle =>
      'Desbloqueie o concierge da cidade';

  @override
  String get settingsUnlockConciergeSubtitle =>
      'Pacote urbano único – não é uma assinatura';

  @override
  String get settingsOpenConciergeSubtitle =>
      'Abra sua guia de concierge de IA';

  @override
  String get weatherMiamiHumidityIndoor =>
      'Alta umidade hoje. Vá para a praia ou piscina mais cedo e depois para Wynwood ou Brickell para jantares em ambientes fechados e galerias durante os horários mais quentes.';

  @override
  String get weatherMiamiHeatAdvisory =>
      'Condições de aviso de calor – tecidos leves, hidratação e pausas para sombra entre as paradas ao ar livre.';

  @override
  String get weatherMiamiBeachMorning =>
      'UV forte na areia – protetor solar, chapéu e horário de praia antes do meio-dia.';

  @override
  String get weatherMiamiBoatWind =>
      'O vento está elevado – reconsidere as atividades de barco ou iate; refeições na cobertura ainda podem funcionar.';

  @override
  String weatherMiamiRainReroute(String indoorSpot) {
    return 'Janela de chuva à frente – troque planos externos para $indoorSpot ou horário da galeria.';
  }

  @override
  String get weatherMiamiSunsetWaterfront =>
      'O pôr do sol parece forte - à beira-mar ou na cobertura com vista de leste a oeste.';

  @override
  String get miamiBeachIntelTitle => 'Inteligência de praia';

  @override
  String miamiBeachBestTime(String time) {
    return 'Melhor horário: $time';
  }

  @override
  String get miamiBeachFamilyScore => 'Família';

  @override
  String get miamiBeachCrowdScore => 'Multidão';

  @override
  String get miamiBeachPhotoScore => 'Foto';

  @override
  String get miamiBeachRomanceScore => 'Romance';

  @override
  String get miamiBeachSunsetScore => 'Pôr do sol';

  @override
  String miamiBeachParking(String level) {
    return 'Estacionamento: $level';
  }

  @override
  String get miamiNightlifeTitle => 'Concierge de vida noturna';

  @override
  String miamiNightlifeDressCode(String code) {
    return 'Código de vestimenta: $code';
  }

  @override
  String miamiNightlifeArrival(String time) {
    return 'Melhor chegada: $time';
  }

  @override
  String get miamiNightlifeReservation => 'Reserva recomendada';

  @override
  String get miamiMoodRoutesTitle => 'Rotas de humor de Miami';

  @override
  String get tampaBayMoodRoutesTitle => 'Rotas de mood Tampa Bay';

  @override
  String get stAugustineMoodRoutesTitle => 'Rotas de mood St. Augustine';

  @override
  String get naplesMoodRoutesTitle => 'Rotas de mood Naples';

  @override
  String get destin30aMoodRoutesTitle => 'Rotas de mood Destin e 30A';

  @override
  String get vegasMoodRoutesTitle => 'Rotas de ambiente Las Vegas';

  @override
  String miamiMoodRouteStart(String time) {
    return 'Comece por volta de $time';
  }

  @override
  String get keysWaterIntelTitle => 'Chaves de Inteligência Hídrica';

  @override
  String keysWaterBestTime(String time) {
    return 'Melhor janela: $time';
  }

  @override
  String keysWaterTemp(String note) {
    return 'Água: $note';
  }

  @override
  String get keysWaterSnorkelScore => 'Snorkel';

  @override
  String get keysWaterDivingScore => 'Mergulho';

  @override
  String get keysWaterBoatingScore => 'Barco';

  @override
  String get keysWaterFishingScore => 'Peixe';

  @override
  String get keysWaterWindScore => 'Vento';

  @override
  String get keysWaterSunsetScore => 'Pôr do sol';

  @override
  String get keysWaterCrowdScore => 'Multidão';

  @override
  String get keysMoodRoutesTitle => 'Rotas da Ilha Keys';

  @override
  String keysMoodRouteStart(String time) {
    return 'Início $time';
  }

  @override
  String get paywallHeadlineMiamiDefault => 'EXPERIMENTE MIAMI DIFERENTE';

  @override
  String get paywallHeadlineMiamiWeekend =>
      'NÃO PERCA SEU FIM DE SEMANA EM MIAMI';

  @override
  String get paywallOrlandoAddonsHeading => 'Pacote de parque temático';

  @override
  String get paywallOrlandoBaseIncludes =>
      'O desbloqueio de Orlando inclui restaurantes, joias escondidas, hotéis e experiências fora do parque. Adicione o pacote de parques temáticos da Disney e da Universal juntos.';

  @override
  String get paywallAddonThemeParksTitle => 'Pacote Disney e Universal';

  @override
  String get paywallAddonThemeParksSubtitle =>
      'Walt Disney World e Universal Orlando – todos os parques, ofertas, rotas e informações sobre multidões em um só desbloqueio.';

  @override
  String paywallUnlockAddon(String packName, String price) {
    return 'Desbloquear $packName · $price';
  }

  @override
  String get paywallAddonUnlocked => 'Desbloqueado';

  @override
  String get paywallAddonRequiresOrlando =>
      'Requer o desbloqueio de Orlando primeiro';

  @override
  String paywallUnlockAddonPack(String packName) {
    return 'Desbloquear $packName';
  }

  @override
  String paywallCtaUnlockAddon(String packName) {
    return 'Desbloquear $packName';
  }

  @override
  String get orlandoThemeParksPromptTitle =>
      'Desbloquear Disney e Universal para Orlando?';

  @override
  String get orlandoThemeParksPromptBody =>
      'Adicione o pacote de parques temáticos do Walt Disney World e Universal Orlando – todos os parques, ofertas de ingressos, rotas e informações sobre multidões em um só desbloqueio.';

  @override
  String orlandoThemeParksPromptUnlock(String price) {
    return 'Desbloquear · $price';
  }

  @override
  String get orlandoThemeParksPromptNotNow => 'Agora não';

  @override
  String get onboardV2Eyebrow => 'Vamos projetar sua viagem perfeita';

  @override
  String get onboardV2StepTravelerEyebrow => 'Passo 1';

  @override
  String get onboardV2StepTravelerTitle => 'Com quem você está viajando?';

  @override
  String get onboardV2StepTravelerSubtitle =>
      'Luxora adapta estadias, refeições e passeios para sua tripulação.';

  @override
  String get onboardV2ChildrenLabel => 'Crianças viajando?';

  @override
  String get onboardV2StepStyleEyebrow => 'Etapa 2';

  @override
  String get onboardV2StepStyleTitle => 'Que tipo de viagem você procura?';

  @override
  String get onboardV2StepStyleSubtitle => 'Escolha tudo o que te entusiasma.';

  @override
  String get onboardV2StepHotelEyebrow => 'Etapa 3';

  @override
  String get onboardV2StepHotelTitle =>
      'Que tipo de lugar você gostaria de ficar?';

  @override
  String get onboardV2StepHotelSubtitle =>
      'Combinaremos joias de boutique e ícones de resort.';

  @override
  String get onboardV2HotelBudgetLabel => 'Orçamento de hotel';

  @override
  String get onboardV2HotelAmenitiesLabel => 'Comodidades indispensáveis';

  @override
  String get onboardV2StepFoodEyebrow => 'Etapa 4';

  @override
  String get onboardV2StepFoodTitle => 'Que tipos de restaurantes você gosta?';

  @override
  String get onboardV2StepFoodSubtitle =>
      'Cozinha e estilo de jantar – escolha tudo o que você gosta.';

  @override
  String get onboardV2CuisineLabel => 'Tipos de cozinha';

  @override
  String get onboardV2DiningStyleLabel => 'Estilo de jantar';

  @override
  String get onboardV2StepPaceEyebrow => 'Etapa 5';

  @override
  String get onboardV2StepPaceTitle =>
      'Como você gostaria que seus dias fossem planejados?';

  @override
  String get onboardV2StepPaceSubtitle =>
      'Manhãs descontraídas ou aventuras recheadas: você escolhe.';

  @override
  String get onboardV2PaceRelaxedTitle => 'Descontraído';

  @override
  String get onboardV2PaceRelaxedBody => '2–3 atividades por dia';

  @override
  String get onboardV2PaceBalancedTitle => 'Equilibrado';

  @override
  String get onboardV2PaceBalancedBody => '4–5 atividades por dia';

  @override
  String get onboardV2PacePackedTitle => 'Embalado';

  @override
  String get onboardV2PacePackedBody => 'Maximize todos os dias';

  @override
  String get onboardV2StepGoalsEyebrow => 'Etapa 6';

  @override
  String get onboardV2StepGoalsTitle => 'O que é mais importante nesta viagem?';

  @override
  String get onboardV2StepGoalsSubtitle => 'Escolha até cinco prioridades.';

  @override
  String get onboardV2StepExperienceEyebrow => 'Etapa 7';

  @override
  String get onboardV2StepExperienceTitle => 'Que experiências você gostaria?';

  @override
  String get onboardV2StepExperienceSubtitle =>
      'Iremos incluí-los em seu itinerário.';

  @override
  String get onboardV2StepAvoidEyebrow => 'Etapa 8';

  @override
  String get onboardV2StepAvoidTitle => 'O que você prefere evitar?';

  @override
  String get onboardV2StepAvoidSubtitle =>
      'Luxora evita o que prejudica sua viagem.';

  @override
  String get onboardV2StepEmotionEyebrow => 'Etapa 9';

  @override
  String get onboardV2StepEmotionTitle =>
      'O que faria esta viagem parecer um sucesso?';

  @override
  String get onboardV2StepEmotionSubtitle => 'Escolha um sentimento primário.';

  @override
  String get onboardV2StepSummaryEyebrow => 'LUXORA';

  @override
  String onboardV2StepSummaryTitle(String name) {
    return 'Perfeito, $name.';
  }

  @override
  String get onboardV2StepSummarySubtitle =>
      'Aprendi um pouco sobre o tipo de viajante que você é.\n\nAgora usarei suas preferências para recomendar lugares, experiências, restaurantes e joias escondidas que combinem com você.\n\nCada recomendação será feita sob medida.\n\nVamos ver o que podemos descobrir.';

  @override
  String get onboardSummaryHotels => 'Hotéis';

  @override
  String get onboardSummaryRestaurants => 'Restaurantes';

  @override
  String get onboardSummaryHiddenGems => 'Joias escondidas';

  @override
  String get onboardSummaryExperiences => 'Experiências';

  @override
  String get onboardSummaryHotelDefault =>
      'Estadias selecionadas de acordo com seu orçamento';

  @override
  String onboardSummaryHotelType(String type) {
    return '$type ficar';
  }

  @override
  String get onboardSummaryRooftopDining =>
      'Experiências gastronômicas na cobertura';

  @override
  String onboardSummaryCuisine(String cuisine) {
    return '$cuisine favoritos';
  }

  @override
  String onboardSummaryPace(String pace) {
    return '$pace ritmo diário';
  }

  @override
  String get onboardSummaryRomantic => 'Experiências românticas ao pôr do sol';

  @override
  String onboardSummaryEmotion(String emotion) {
    return 'jornada focada na $emotion';
  }

  @override
  String get onboardSummaryPremiumGems => 'Joias escondidas premium';

  @override
  String get agendaSuggestionsForYou => 'Escolhido para você';

  @override
  String get agendaSuggestionsAlternates => 'Também ótimo';

  @override
  String get agendaSuggestionsBrowseAll => 'Navegar por tudo';

  @override
  String get onboardPrefTravelerSolo => 'Sozinho';

  @override
  String get onboardPrefTravelerCouple => 'Casal';

  @override
  String get onboardPrefTravelerFamily => 'Família';

  @override
  String get onboardPrefTravelerFriends => 'Amigos';

  @override
  String get onboardPrefTravelerBusiness => 'Negócios';

  @override
  String get onboardPrefChildrenNone => 'Sem filhos';

  @override
  String get onboardPrefChildrenToddlers => 'Crianças';

  @override
  String get onboardPrefChildrenElementary => 'Idade elementar';

  @override
  String get onboardPrefChildrenTeenagers => 'Adolescentes';

  @override
  String get onboardPrefStyleLuxury => 'Luxo';

  @override
  String get onboardPrefStyleRelaxation => 'Relaxamento';

  @override
  String get onboardPrefStyleAdventure => 'Aventura';

  @override
  String get onboardPrefStyleThemeParks => 'Parques Temáticos';

  @override
  String get onboardPrefStyleFoodie => 'Gourmet';

  @override
  String get onboardPrefStyleNightlife => 'Vida noturna';

  @override
  String get onboardPrefStyleRomance => 'Romantismo';

  @override
  String get onboardPrefStyleShopping => 'Compras';

  @override
  String get onboardPrefStyleBeaches => 'Praias';

  @override
  String get onboardPrefStyleWellness => 'Bem-estar';

  @override
  String get onboardPrefStyleNature => 'Natureza';

  @override
  String get onboardPrefStylePhotography => 'Fotografia';

  @override
  String get onboardPrefStyleHiddenGems => 'Joias escondidas';

  @override
  String get onboardPrefStyleFamilyActivities => 'Atividades familiares';

  @override
  String get onboardPrefStyleLocalExperiences => 'Experiências Locais';

  @override
  String get onboardPrefStyleEntertainment => 'Entretenimento';

  @override
  String get onboardPrefHotelLuxuryResort => 'Resort de luxo';

  @override
  String get onboardPrefHotelBoutique => 'Hotel Boutique';

  @override
  String get onboardPrefHotelFamilyResort => 'Estância Familiar';

  @override
  String get onboardPrefHotelBudgetFriendly => 'Econômico';

  @override
  String get onboardPrefHotelAdultsOnly => 'Somente adultos';

  @override
  String get onboardPrefHotelSpaResort => 'Estância termal';

  @override
  String get onboardPrefHotelBeachfront => 'À beira-mar';

  @override
  String get onboardPrefHotelDowntown => 'Centro da cidade';

  @override
  String get onboardPrefHotelWalkable => 'Área Caminhável';

  @override
  String get onboardPrefHotelThemeParkArea => 'Área do Parque Temático';

  @override
  String get onboardPrefHotelModern => 'Hotel moderno';

  @override
  String get onboardPrefHotelHistoric => 'Hotel histórico';

  @override
  String get onboardPrefBudgetOne => '\$';

  @override
  String get onboardPrefBudgetTwo => '\$\$';

  @override
  String get onboardPrefBudgetThree => '\$\$\$';

  @override
  String get onboardPrefBudgetFour => '\$\$\$\$';

  @override
  String get onboardPrefAmenityPool => 'Piscina';

  @override
  String get onboardPrefAmenitySpa => 'Spa';

  @override
  String get onboardPrefAmenityGym => 'Academia';

  @override
  String get onboardPrefAmenityBreakfast => 'Café da manhã grátis';

  @override
  String get onboardPrefAmenityOceanView => 'Vista para o mar';

  @override
  String get onboardPrefAmenityBalcony => 'Sacada';

  @override
  String get onboardPrefAmenityKitchen => 'Cozinha';

  @override
  String get onboardPrefAmenityShuttle => 'Serviço de transporte';

  @override
  String get onboardPrefAmenityPetFriendly => 'Aceita animais de estimação';

  @override
  String get onboardPrefCuisineAmerican => 'americano';

  @override
  String get onboardPrefCuisineItalian => 'italiano';

  @override
  String get onboardPrefCuisineMexican => 'mexicano';

  @override
  String get onboardPrefCuisineSeafood => 'Frutos do mar';

  @override
  String get onboardPrefCuisineSteakhouse => 'Churrascaria';

  @override
  String get onboardPrefCuisineSushi => 'Sushi';

  @override
  String get onboardPrefCuisineCuban => 'cubano';

  @override
  String get onboardPrefCuisineMediterranean => 'Mediterrâneo';

  @override
  String get onboardPrefCuisineAsian => 'Asiático';

  @override
  String get onboardPrefCuisineBbq => 'Churrasco';

  @override
  String get onboardPrefCuisineFineDining => 'Jantares finos';

  @override
  String get onboardPrefCuisineLocalFavorites => 'Favoritos locais';

  @override
  String get onboardPrefCuisineFoodTrucks => 'Food trucks';

  @override
  String get onboardPrefCuisineRooftop => 'Jantar na cobertura';

  @override
  String get onboardPrefCuisineBrunch => 'Brunch';

  @override
  String get onboardPrefCuisineDessert => 'Sobremesa';

  @override
  String get onboardPrefDiningQuick => 'Serviço rápido';

  @override
  String get onboardPrefDiningCasual => 'Jantar casual';

  @override
  String get onboardPrefDiningFamily => 'Adequado para toda a família';

  @override
  String get onboardPrefDiningDateNight => 'Encontro à noite';

  @override
  String get onboardPrefDiningFine => 'Jantares finos';

  @override
  String get onboardPrefDiningWaterfront => 'Beira-mar';

  @override
  String get onboardPrefDiningHiddenGems => 'Joias escondidas';

  @override
  String get onboardPrefDiningLocal => 'Favoritos locais';

  @override
  String get onboardPrefGoalMakeMemories => 'Faça memórias';

  @override
  String get onboardPrefGoalSaveMoney => 'Economize dinheiro';

  @override
  String get onboardPrefGoalAvoidCrowds => 'Evite multidões';

  @override
  String get onboardPrefGoalLuxury => 'Experiências de luxo';

  @override
  String get onboardPrefGoalBestFood => 'Melhor comida';

  @override
  String get onboardPrefGoalHiddenGems => 'Joias escondidas';

  @override
  String get onboardPrefGoalRelaxation => 'Relaxamento';

  @override
  String get onboardPrefGoalAdventure => 'Aventura';

  @override
  String get onboardPrefGoalBestPhotos => 'Melhores fotos';

  @override
  String get onboardPrefGoalFamilyTime => 'Tempo para a família';

  @override
  String get onboardPrefGoalRomance => 'Romantismo';

  @override
  String get onboardPrefGoalNightlife => 'Vida noturna';

  @override
  String get onboardPrefGoalLocal => 'Experiências Locais';

  @override
  String get onboardPrefGoalStressFree => 'Planejamento sem estresse';

  @override
  String get onboardPrefExpBoatTours => 'Passeios de barco';

  @override
  String get onboardPrefExpSunsetCruises => 'Cruzeiros ao pôr do sol';

  @override
  String get onboardPrefExpAirboat => 'Passeios de aerobarco';

  @override
  String get onboardPrefExpThemeParks => 'Parques Temáticos';

  @override
  String get onboardPrefExpMuseums => 'Museus';

  @override
  String get onboardPrefExpLiveShows => 'Programas ao vivo';

  @override
  String get onboardPrefExpSpas => 'Spas e bem-estar';

  @override
  String get onboardPrefExpShopping => 'Compras';

  @override
  String get onboardPrefExpWaterParks => 'Parques Aquáticos';

  @override
  String get onboardPrefExpGolf => 'Golf';

  @override
  String get onboardPrefExpFishing => 'Pesca';

  @override
  String get onboardPrefExpKayaking => 'Caiaque';

  @override
  String get onboardPrefExpSnorkeling => 'Mergulho com snorkel';

  @override
  String get onboardPrefExpRooftopBars => 'Barras na cobertura';

  @override
  String get onboardPrefExpNightclubs => 'Discotecas';

  @override
  String get onboardPrefExpWildlife => 'Experiências com vida selvagem';

  @override
  String get onboardPrefExpFoodTours => 'Passeios gastronômicos';

  @override
  String get onboardPrefExpScenicDrives => 'Passeios panorâmicos';

  @override
  String get onboardPrefAvoidCrowds => 'Multidões';

  @override
  String get onboardPrefAvoidLongLines => 'Longas filas';

  @override
  String get onboardPrefAvoidExpensiveRestaurants => 'Restaurantes caros';

  @override
  String get onboardPrefAvoidWalking => 'Caminhando longas distâncias';

  @override
  String get onboardPrefAvoidNightlife => 'Vida noturna';

  @override
  String get onboardPrefAvoidDriving => 'Condução';

  @override
  String get onboardPrefAvoidTouristTraps => 'Armadilhas para turistas';

  @override
  String get onboardPrefAvoidEarlyMornings => 'Madrugadas';

  @override
  String get onboardPrefAvoidLateNights => 'Tarde da noite';

  @override
  String get onboardPrefAvoidFamilyAttractions => 'Atrações familiares';

  @override
  String get onboardPrefAvoidThemeParks => 'Parques Temáticos';

  @override
  String get onboardPrefEmotionRelaxed => 'Descontraído';

  @override
  String get onboardPrefEmotionExcited => 'Excitado';

  @override
  String get onboardPrefEmotionAdventurous => 'Aventureiro';

  @override
  String get onboardPrefEmotionRomantic => 'Romântico';

  @override
  String get onboardPrefEmotionLuxurious => 'Luxuoso';

  @override
  String get onboardPrefEmotionFamilyFocused => 'Focado na família';

  @override
  String get onboardPrefEmotionMemorable => 'Memorável';

  @override
  String get onboardPrefEmotionStressFree => 'Livre de estresse';

  @override
  String get onboardPrefEmotionInspiring => 'Inspirador';

  @override
  String get onboardPrefPaceSlow => 'Descontraído';

  @override
  String get onboardPrefPaceBalanced => 'Equilibrado';

  @override
  String get onboardPrefPacePacked => 'Embalado';

  @override
  String get onboardSummaryHiddenGemsInsight =>
      'Restaurantes locais e joias escondidas';

  @override
  String get onboardBuildFailedHint =>
      'Salvamos suas preferências, mas o roteiro precisa de mais um momento. Puxe para atualizar na Agenda ou abra o Concierge.';

  @override
  String get onboardV2ChildrenSubtitle =>
      'Selecione todas as faixas etárias aplicáveis.';

  @override
  String get onboardTravelerNameEyebrow => 'As primeiras coisas primeiro';

  @override
  String get onboardTravelerNameTitle => 'Como Luxora deveria ligar para você?';

  @override
  String get onboardTravelerNameSubtitle =>
      'Seu primeiro nome é suficiente – Luxora o usará quando você conversar.';

  @override
  String get onboardTravelerNameLabel => 'Seu primeiro nome';

  @override
  String get onboardTravelerNameHint => 'por exemplo Maria';

  @override
  String conciergeWelcomeNamed(String name) {
    return 'Bem-vindo, $name – seu companheiro emocionalmente inteligente da Flórida.\n\nEscolha uma sugestão abaixo ou descreva a sensação que você deseja que sua viagem crie.';
  }

  @override
  String conciergeWelcomeWarmNamed(String name) {
    return '$name, estou aqui para moldar a Flórida de acordo com como você deseja se sentir - não uma lista de pontos turísticos. O que você está desejando hoje?';
  }

  @override
  String get onboardWelcomeEyebrow => 'LUXORA';

  @override
  String get onboardWelcomeTitle => 'Olá, sou a Luxora.';

  @override
  String get onboardWelcomeTagline => 'Sua concierge de viagem pessoal.';

  @override
  String get onboardWelcomeBody =>
      'Estou aqui para ajudá-lo a descobrir lugares incríveis, evitar armadilhas turísticas e criar férias que você lembrará por anos.\n\nVamos começar a planejar algo inesquecível.';

  @override
  String get onboardWelcomeCta => 'Começar minha jornada';

  @override
  String get onboardLuxoraGuideBody =>
      'A partir de agora, vou guiar sua viagem em cada passo.\n\nSeja joias escondidas, comida incrível, experiências inesquecíveis ou simplesmente férias sem estresse — estou com você.';

  @override
  String get onboardLuxoraReplyClosing =>
      'Vamos criar juntos sua aventura perfeita.';

  @override
  String onboardBuildingTitle(String name) {
    return 'Escolha maravilhosa, $name.';
  }

  @override
  String get onboardBuildingBody =>
      'Estou montando um roteiro personalizado com base no seu estilo, interesses, ritmo, preferências gastronômicas e objetivos de férias.\n\nIsso pode levar um momento.';

  @override
  String get onboardBuildingTagline =>
      'Boas férias acontecem por acaso.\n\nGrandes férias acontem com um plano.';

  @override
  String get onboardItineraryReadyTitle => 'Sua aventura está pronta.';

  @override
  String get onboardItineraryReadyBody =>
      'Selecionei cuidadosamente experiências, restaurantes, atrações e joias escondidas que combinam com a viagem que você descreveu.\n\nClaro, podemos ajustar qualquer coisa no caminho.\n\nAs melhores férias evoluem enquanto acontecem.';

  @override
  String weatherRerouteLuxoraIntro(String name) {
    return '$name, o clima pode impactar parte dos planos de hoje.';
  }

  @override
  String get weatherRerouteLuxoraClosing =>
      'Às vezes o inesperado cria as melhores memórias.';

  @override
  String rightNowLuxoraIntro(String name) {
    return '$name, com base na sua localização, clima atual e preferências, isto é o que eu faria agora.';
  }

  @override
  String get rightNowLuxoraClosing =>
      'Confie em mim.\n\nAcho que você vai adorar.';

  @override
  String paywallPersonalPitch(String name, String cityName) {
    return '$name, seu plano de férias personalizado já está tomando forma.\n\nO Dia 1 está pronto.\n\nO resto da jornada espera por você.\n\nDesbloqueie $cityName Concierge para o roteiro completo, joias escondidas, segredos locais, inteligência meteorológica e orientação concierge ilimitada.\n\nVamos tornar estas férias inesquecíveis.';
  }

  @override
  String get onboardLuxoraReplyEyebrow => 'LUXORA';

  @override
  String onboardLuxoraReplyTitle(String name) {
    return 'Prazer em conhecê-lo, $name.';
  }

  @override
  String onboardLuxoraGuideNamed(String name) {
    return 'A partir de agora, vou guiar sua viagem em cada passo.\n\nSeja joias escondidas, comida incrível, experiências inesquecíveis ou simplesmente férias sem estresse — estou com você.';
  }

  @override
  String get onboardLuxoraItineraryPromise =>
      'Vamos criar juntos sua aventura perfeita.';

  @override
  String get onboardReturningEyebrow => 'BEM-VINDO DE VOLTA';

  @override
  String onboardReturningTitle(String name) {
    return 'Bem-vindo de volta, $name.';
  }

  @override
  String get onboardReturningTitleGeneric => 'Bem-vindo de volta.';

  @override
  String get onboardReturningSubtitle =>
      'Pronto para continuar sua aventura?\n\nSalvei suas preferências, lugares favoritos e planos para retomar de onde paramos.\n\nVamos ver o que te espera hoje.';

  @override
  String get todayPlanSectionTitle => 'O plano de hoje';

  @override
  String get todayNextActivityLabel => 'A seguir';

  @override
  String get todayStaysDiningSection => 'Estadias e opções de refeições';

  @override
  String get todayStaysDiningCollapsedHint =>
      'Ideias para hotéis e restaurantes – toque para expandir';

  @override
  String get todayPlanDetailsTitle => 'Agenda completa';

  @override
  String todayPlanStopCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count paradas hoje',
      one: '1 stop today',
    );
    return '$_temp0';
  }

  @override
  String todayDayHeading(int day) {
    return 'Dia $day';
  }

  @override
  String get todayHappeningNowLabel => 'Acontecendo agora';

  @override
  String get todayPlanComplete => 'O plano de hoje está completo';

  @override
  String todayStartsIn(String duration) {
    return 'Começa em $duration';
  }

  @override
  String get todayRainRerouteTitle => 'Desvio por clima';

  @override
  String get todayExtrasSection => 'Ingressos e compartilhamento';

  @override
  String get todayExtrasCollapsedHint =>
      'Ofertas, cartão de compartilhamento e muito mais';

  @override
  String freemiumVacationTitle(String cityName) {
    return 'Suas férias em $cityName';
  }

  @override
  String get freemiumDay1Ready => '✓ Dia 1 pronto';

  @override
  String get freemiumUnlockFullPlan =>
      'Desbloqueie seu plano de férias completo';

  @override
  String freemiumLockedDayConcierge(int day) {
    return 'Dia $day · Otimizado pelo concierge';
  }

  @override
  String get freemiumLockedDayGems => 'Dia 3 · Rota de joias escondidas';

  @override
  String get freemiumLockedDayWeather => 'Dia 4 · Planejamento com clima';

  @override
  String get freemiumLockedDayDeparture => 'Dia 5 · Estratégia de partida';

  @override
  String freemiumConciergeRemaining(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perguntas grátis restantes',
      one: '1 pergunta grátis restante',
    );
    return '$_temp0';
  }

  @override
  String get freemiumConciergeLimitReached =>
      'Limite gratuito do concierge atingido — desbloqueie planejamento ilimitado.';

  @override
  String freemiumLockedHotels(int count) {
    return '🔒 $count+ hotéis adicionais disponíveis';
  }

  @override
  String freemiumLockedRestaurants(int count) {
    return '🔒 $count+ restaurantes adicionais disponíveis';
  }

  @override
  String freemiumLockedGems(int count) {
    return '🔒 $count+ joias escondidas disponíveis';
  }

  @override
  String freemiumLockedSecrets(int count) {
    return '🔒 $count+ segredos locais disponíveis';
  }

  @override
  String freemiumLockedExperiences(int count) {
    return '🔒 $count+ experiências disponíveis';
  }

  @override
  String get freemiumLockedAttractions => '🔒 Mais atrações disponíveis';

  @override
  String freemiumUnlockExplore(String cityName) {
    return 'Desbloqueie $cityName Concierge para continuar explorando.';
  }

  @override
  String freemiumUnlockConcierge(String cityName) {
    return 'Desbloquear $cityName Concierge';
  }

  @override
  String freemiumHeadlineDayTwoPlus(String cityName) {
    return 'Seus próximos dias estão prontos — desbloqueie o plano completo de $cityName.';
  }

  @override
  String get freemiumHeadlineConciergeLimit =>
      'Continue planejando com acesso ilimitado ao concierge.';

  @override
  String freemiumHeadlineHotels(String cityName) {
    return 'Desbloqueie $cityName Concierge para cada recomendação de hotel.';
  }

  @override
  String freemiumHeadlineRestaurants(String cityName) {
    return 'Desbloqueie a coleção completa de restaurantes de $cityName.';
  }

  @override
  String get freemiumHeadlineGems =>
      'Favoritos locais e joias escondidas esperam por você.';

  @override
  String get freemiumHeadlineSecrets =>
      'Desbloqueie segredos de horários e estacionamento dos moradores.';

  @override
  String freemiumHeadlineExperiences(String cityName) {
    return 'Desbloqueie experiências curadas em todo $cityName.';
  }

  @override
  String get freemiumHeadlineAttractions =>
      'Desbloqueie a coleção completa de atrações.';

  @override
  String get freemiumHeadlineHotelMatchmaker =>
      'Desbloqueie Hotel Intelligence para comparar cada estadia.';

  @override
  String get freemiumHeadlineFullItinerary =>
      'Desbloqueie seu plano de férias completo.';

  @override
  String get freemiumLocalSecretsTitle => 'Segredos locais';

  @override
  String get freemiumLocalSecretsSubtitle =>
      'Horários, estacionamento e mirantes que os locais guardam.';

  @override
  String get onboardNeedChoiceHint =>
      'Escolha pelo menos uma opção para continuar.';
}
