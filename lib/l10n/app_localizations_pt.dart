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
  String get navTimeline => 'Linha do tempo';

  @override
  String get navMap => 'Mapa';

  @override
  String get navGems => 'Gemas';

  @override
  String get navFeed => 'Alimentar';

  @override
  String get navTrips => 'Viagens';

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
      'Estou aqui para moldar a Flórida de acordo com como você quer se sentir — não uma lista de pontos turísticos. O que você deseja hoje?';

  @override
  String get conciergeRefineStyle => 'Refinar meu estilo';

  @override
  String get conciergeRecallReturning => 'Bem-vindo de volta.';

  @override
  String conciergeRecallStyle(String prefs) {
    return 'Lembro que você gosta de $prefs.';
  }

  @override
  String conciergeRecallFeelLine(String feel) {
    return 'E você queria que esta viagem transmitisse: “$feel”.';
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
  String get discoverSearchScopeAll => 'Pesquisando toda a Flórida no catálogo';

  @override
  String discoverSearchScopeRadius(String radius) {
    return 'Dentro de $radius de Orlando';
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
  String get feedBadge => 'DESCOBERTA AO VIVO';

  @override
  String get feedTitle => 'Feed de experiência';

  @override
  String get feedSubtitle =>
      'O que está acontecendo agora: tendências, novas vagas, escolhas de criadores, rotas sazonais e atualizações ao vivo.';

  @override
  String get feedPillTrending => 'Tendências';

  @override
  String get feedPillNewOpenings => 'Novas aberturas';

  @override
  String get feedPillCreator => 'Escolhas do criador';

  @override
  String get feedPillLive => 'Atualizações ao vivo';

  @override
  String get feedMoodPrompt => 'COMO VOCÊ QUER SE SENTIR?';

  @override
  String get feedMoodAll => 'Tudo';

  @override
  String get feedMoodRomantic => 'Romântico';

  @override
  String get feedMoodCalm => 'Tranquilo';

  @override
  String get feedMoodAdventurous => 'Aventureiro';

  @override
  String get feedMoodPampered => 'Mimado';

  @override
  String get feedMoodSocial => 'Animado';

  @override
  String get feedMoodFoodie => 'Gastronômico';

  @override
  String get feedEmptyHint =>
      'Não há cartões de alimentação neste raio – tente 50 milhas ou toda a Flórida para ver os destaques da costa do Golfo e Keys.';

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
    return '$count joias que combinam com seu estilo';
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
  String get mapPlanDayTitle => 'Planejar meu dia';

  @override
  String get mapPlanDaySuggested =>
      'Sugerido pelo clima da sua viagem — marque lugares para personalizar.';

  @override
  String get mapPlanDayEmpty =>
      'Marque destinos (♥) e a Luxora cria uma rota otimizada a partir da sua base em Orlando: menos direção, mais emoção.';

  @override
  String mapPlanDaySummary(int count, String miles, String time) {
    return '$count paradas · $miles · $time de carro';
  }

  @override
  String mapPlanDayHomeBase(String hotel) {
    return 'Saindo de $hotel';
  }

  @override
  String get mapCrowdLevelQuiet => 'Tranquilo';

  @override
  String get mapCrowdLevelModerate => 'Moderado';

  @override
  String get mapCrowdLevelBusy => 'Cheio';

  @override
  String get mapCrowdLevelPacked => 'Muito cheio';

  @override
  String mapCrowdAtStop(String level) {
    return 'Movimento: $level';
  }

  @override
  String get mapRerouteButton => 'Recalcular para paradas mais calmas';

  @override
  String mapRerouteApplied(int count) {
    return 'Dia ajustado — $count paradas trocadas por menos movimento.';
  }

  @override
  String get mapRerouteNone => 'Sua rota já parece tranquila.';

  @override
  String get mapRerouteRainHint =>
      'Chuva provável — toque para alternativas cobertas.';

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
  String get tripsPlanNew => 'Planejar uma nova viagem';

  @override
  String get tripsEmptyTitle => 'Nenhuma viagem salva ainda';

  @override
  String get tripsEmptyBody =>
      'Planeje sua primeira viagem e ela aparecerá aqui, pronta para retomar quando quiser.';

  @override
  String get tripsDeleteTitle => 'Excluir viagem?';

  @override
  String tripsDeleteBody(String title) {
    return 'Isso remove “$title” das suas viagens salvas. Não pode ser desfeito.';
  }

  @override
  String get tripsDeleted => 'Viagem excluída';

  @override
  String get tripsLiveWeather => 'Clima ao vivo';

  @override
  String get tripsNextUp => 'Próximo';

  @override
  String get tripsSunsetWindow => 'Janela do pôr do sol';

  @override
  String get tripsTimelineSnapshot => 'Instantâneo da linha do tempo';

  @override
  String get tripsOpenTimeline => 'Abrir linha do tempo completa';

  @override
  String get tripsShare => 'Compartilhar';

  @override
  String get shareItineraryFooter =>
      'Planejado com a Luxora, seu companheiro da Flórida emocionalmente inteligente.';

  @override
  String shareSubject(String title) {
    return 'Minha $title';
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
  String get detailPrice => 'Preço';

  @override
  String get detailLocation => 'Localização';

  @override
  String get detailGetDirections => 'Como chegar';

  @override
  String get detailParkMap => 'Mapa do parque';

  @override
  String get detailViewOnMap => 'Ver no mapa';

  @override
  String get detailMapsError =>
      'Não foi possível abrir o mapa neste dispositivo.';

  @override
  String get detailGoogleMaps => 'Google Maps';

  @override
  String get detailAppleMaps => 'Apple Mapas';

  @override
  String get detailOpenInMaps => 'Abrir nos mapas';

  @override
  String detailDriveFromOrlando(String time) {
    return '$time de carro desde Orlando';
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
  String get detailHomeBaseActive => 'A base da sua viagem';

  @override
  String get detailHomeBaseHint => 'A rota do seu dia começa e termina aqui.';

  @override
  String get detailHomeBaseSetSnack => 'Definido como base da sua viagem';

  @override
  String get detailHomeBaseClearedSnack => 'Base removida';

  @override
  String get detailMenuTitle => 'Destaques do cardápio';

  @override
  String get detailMenuDisclaimer =>
      'Seleção de destaques — o cardápio completo e os preços podem variar no local.';

  @override
  String get detailMenuComingSoon =>
      'Ainda estamos preparando este cardápio. Enquanto isso, veja o cardápio e os preços atualizados online.';

  @override
  String get detailViewMenuOnline => 'Ver cardápio online';

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
  String get landingBadge => 'FLÓRIDA · MVP DE ORLANDO';

  @override
  String get landingTitle1 => 'As férias';

  @override
  String get landingTitle2 => 'já começou.';

  @override
  String get landingSubtitle =>
      'Luxora AI é o seu concierge emocionalmente inteligente – joias escondidas, pôr do sol na cobertura e momentos projetados para serem inesquecíveis antes mesmo de você fazer as malas.';

  @override
  String get landingBegin => 'Comece sua jornada';

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
  String get onboardStep1Title => 'Onde os sonhos pousam primeiro';

  @override
  String get onboardStep1Subtitle => 'Para onde você está indo?';

  @override
  String get onboardDestination => 'Destino';

  @override
  String get onboardRegion => 'Região';

  @override
  String get onboardStep2Title => 'Hora de se sentir livre';

  @override
  String get onboardStep2Subtitle => 'Quando começa sua fuga?';

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
  String get onboardPoolside => 'Piscina e descanso';

  @override
  String get onboardAdventure => 'Aventura e ar livre';

  @override
  String get onboardCulture => 'Cultura e passeios';

  @override
  String get dayFlowSubtitle =>
      'Um dia moldado por como você quer se sentir — não uma lista de tarefas.';

  @override
  String get dayFlowMorning => 'MANHÃ';

  @override
  String get dayFlowMidday => 'MEIO-DIA';

  @override
  String get dayFlowAfternoon => 'TARDE';

  @override
  String get dayFlowEvening => 'ANOITECER';

  @override
  String get dayFlowNight => 'NOITE';

  @override
  String get dayFlowReasonMorningPool =>
      'Comece devagar: piscina ou spa antes de o dia começar.';

  @override
  String get dayFlowReasonMorningCalm => 'Um começo suave para definir o tom.';

  @override
  String get dayFlowReasonMiddayAdventure =>
      'Horas de pico de energia: a grande aventura enquanto você está descansado.';

  @override
  String get dayFlowReasonMiddayCulture => 'Passeios com a melhor luz do dia.';

  @override
  String get dayFlowReasonMiddayIcon => 'O momento marcante do dia.';

  @override
  String get dayFlowReasonAfternoonDowntime =>
      'Um descanso à tarde para recarregar.';

  @override
  String get dayFlowReasonAfternoonGem =>
      'Uma joia escondida longe das multidões.';

  @override
  String get dayFlowReasonEveningDining =>
      'A refeição do dia: a sua escolha gastronômica.';

  @override
  String get dayFlowReasonNightOut => 'Um último brilho: uma noite fora.';

  @override
  String weatherToday(String place) {
    return 'Agora em $place';
  }

  @override
  String weatherSunset(String time) {
    return 'Pôr do sol $time';
  }

  @override
  String weatherRainNote(int percent) {
    return '$percent% de chance de chuva — leve um casaco leve.';
  }

  @override
  String get weatherConditionClear => 'Céu limpo';

  @override
  String get weatherConditionPartlyCloudy => 'Parcialmente nublado';

  @override
  String get weatherConditionCloudy => 'Nublado';

  @override
  String get weatherConditionFog => 'Nevoeiro';

  @override
  String get weatherConditionDrizzle => 'Garoa';

  @override
  String get weatherConditionRain => 'Chuva';

  @override
  String get weatherConditionSnow => 'Neve';

  @override
  String get weatherConditionThunder => 'Tempestades';

  @override
  String get dayFlowVibeFoodie => 'Gastronômico';

  @override
  String get dayFlowVibeNightlife => 'Vida noturna';

  @override
  String get dayFlowVibePoolside => 'Piscina';

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
}
