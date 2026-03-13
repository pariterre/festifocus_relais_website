import 'package:festifocus_relais_website/models/prize.dart';
import 'package:festifocus_relais_website/models/streamer_info.dart';
import 'package:twitch_manager/twitch_app.dart';

class ConfigManager {
  ///
  /// Prepare the singleton
  ///
  static final ConfigManager _instance = ConfigManager._internal();
  static ConfigManager get instance => _instance;
  ConfigManager._internal();

  ///
  /// General information
  ///
  final eventName = 'FestiFocusSanctusPatricius—48h—Relais';
  String youtubeEventUrlId = '0zIAU_H_K0A';

  ///
  /// Streamers information
  ///
  final streamersInfo = [
    StreamerInfo(
      'DaejeeTV',
      description:
          '''*ೃ༄ 🍃French artist🌻 La légende raconte que je dessine ... et que j'aime les tournesols !''',
      twitchUrl: 'https://twitch.tv/daejeetv',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/0d4d23e5-dc39-45c4-a724-e6a8384c63c2-profile_image-300x300.png',
    ),
    StreamerInfo(
      'deb_auteur_ice_',
      description:
          '''Debdeb enchanté ! Streameur·euse ascendant lurkeur·euse sur les autres stream en pomodoro ! Ici, c'est live coworking avec comme thèmes principaux : /Le plus souvent ♥ Écriture ♥ Lecture ♥ /Rarement mais a le mérite d'exister ♥ Atelier manuel ♥ Couture ♥ Dessin ♥''',
      twitchUrl: 'https://twitch.tv/deb_auteur_ice_',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/975e2ed8-9e6d-4df2-a6bc-f13b75d363a5-profile_image-300x300.png',
    ),
    StreamerInfo(
      'LaLoutreBurlesque',
      description: '''Bienvenue dans ma dictature !
Je suis la Loutre Burlesque et c'est un plaisir de t'accueillir ici.
Je suis rédactrice web de profession, en freelance depuis 2019.
En parallèle, j'écris le tome 1 de ma première saga de fantasy.
Quand j'ai le temps et la motivation, je publie du contenu sur les réseaux sociaux autour des romans (écriture et lecture). Tu me trouveras sur tiktok et Insta sous le nom d'Elya Mallow.
J'anime des streams de coworking pour avancer sur mes différents projets et pour qu'on puisse se motiver tous ensemble.
Livraddict : https://www.livraddict.com/profil/la-loutre-burlesque/
''',
      twitchUrl: 'https://twitch.tv/laloutreburlesque',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/1129954c-5914-4ed1-90c7-05b4f438cd95-profile_image-300x300.png',
    ),
    StreamerInfo(
      'le_sketch',
      description:
          '''Les lundis et vendredis à 16 h, on discute de marketing & de communication à l'ère numérique. Les samedis à 9 h, on sirote un café gaming instantannant! Je redonne 100 % des revenus de ma chaîne à ma campagne au profit d'Opération Enfant Soleil.''',
      twitchUrl: 'https://twitch.tv/le_sketch',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/c201c3cf-b3ee-40b4-9b2c-b2cc964c69e2-profile_image-300x300.png',
    ),
    StreamerInfo(
      'MichaelBielli',
      description:
          '''Auteur indépendant de Fantasy | Papa de la saga MARDAAS (tome 1, 2 & 3 disponibles sur amazon) | Grand Roi du royaume Coquillette | J'aime bien renifler les livres neufs | contact pro : michaelbielli.contact@gmail.com''',
      twitchUrl: 'https://twitch.tv/michaelbielli',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/5aed65a9-678c-40b6-bf1e-acc4ef540fa3-profile_image-300x300.png',
    ),
    StreamerInfo(
      'NutritionSansPression',
      description:
          '''Finissante au bacc en nutrition, je prône la simplicité et une approche sans pression. Entre cooking streams, coworking et jasettes autour de sujets chauds, je rends la nutrition accessible et humaine!''',
      twitchUrl: 'https://twitch.tv/nutritionsanspression',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/34296c06-ed8e-45d9-b614-a782443b7e49-profile_image-300x300.jpeg',
    ),
    StreamerInfo(
      'Pariterre',
      description:
          '''Étudiant en musique à une certaine époque, étudiant en kinésiologie à une autre...Alors pourquoi pas compléter un doctorat en Science de l'Activité Physique chez les musiciens?''',
      twitchUrl: 'https://twitch.tv/pariterre',
      presentationYoutubeId: 'TJHV5L9P12k',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/d38890eb-b9fc-45da-8152-1b574abfc1a6-profile_image-300x300.png',
    ),
    StreamerInfo(
      'skitty_aelcademia',
      description:
          '''Coworking en direct & projets numériques👩🏼‍💻 React d’émissions Tech｜Documentaires 📺 Et quelques pauses gaming de temps en temps 🎮''',
      twitchUrl: 'https://twitch.tv/skitty_aelcademia',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/7a1ebb73-0efe-4488-8c96-27bfb9a03e3b-profile_image-300x300.png',
    ),
    StreamerInfo(
      'Solveig_L_HEVEDER',
      description:
          '''🎇Co-working écriture🎇Autrice indépendante, j'écris dans des genres différents, mais j'essaierai toujours de faire battre vos cœurs avec un peu de romance! Seul problème? Entre le boulot et la famille, les streams sont plus qu'aléatoires ^^' suivez-moi sur insta et discord pour ne pas me rater! ;)''',
      twitchUrl: 'https://twitch.tv/solveig_l_heveder',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/a867d734-6575-4680-8861-eebb58fa66b5-profile_image-300x300.png',
    ),
    StreamerInfo(
      'Thea_Cake',
      description:
          '''Créatrice de contenus, de carnets et autres crafts 🌸 #BookBinding''',
      twitchUrl: 'https://twitch.tv/thea_cake',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/dad0cc68-dbab-481c-be7e-c676b4df126b-profile_image-300x300.jpeg',
    ),
    StreamerInfo(
      'unlivrealamain',
      description:
          '''Bienvenue dans mon petit coin cosy 🕯️✨Moi c'est Ama ! Ici, on lit ensemble, on joue à des jeux chill. Que tu sois là pour te détendre après une longue journée ou pour papoter autour d'un livre, tu es au bon endroit. 🌱 Contact pro : unlivrealamain@gmail.com''',
      twitchUrl: 'https://twitch.tv/unlivrealamain',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/60488391-bf37-43c6-877b-7d8f271b486b-profile_image-300x300.png',
    ),
    StreamerInfo(
      'WayceUpenFoya',
      description:
          '''J'ai lancé cette chaîne pour partager ma passion pour l'écriture, la lecture et toutes les créations artistiques. Même si vous me verrez aussi jouer à des jeux vidéos et discuter autour de divers sujets, mon but est de partager avec vous ces univers qui me bercent depuis maintenant des années.''',
      twitchUrl: 'https://twitch.tv/wayceupenfoya',
      avatarUrl:
          'https://static-cdn.jtvnw.net/jtv_user_pictures/0bd9820a-df73-40ff-951f-95a8a8ae5d2e-profile_image-300x300.png',
    ),
  ];

  final prizes = [
    Prize(title: 'Beaucoup d\'amour', person: 'Pariterre', winner: '@everyone'),
  ];

  ///
  /// Twitch information
  ///
  late final twitchAppInfo = TwitchAppInfo(
    appName: eventName,
    twitchClientId: 'wuxnu9zxzhgu3noztxtgdsulk4c950',
    twitchRedirectUri: Uri.https(
      'twitchauthentication.pariterre.net',
      'twitch_redirect.html',
    ),
    authenticationServerUri: Uri.https(
      'twitchserver.pariterre.net:3000',
      'token',
    ),
    scope: [TwitchAppScope.chatters, TwitchAppScope.readFollowers],
    authenticationFlow: TwitchAuthenticationFlow.implicit,
  );
  final twitchDebugPanel = TwitchDebugPanelOptions(
    chatters: [
      TwitchChatterMock(displayName: 'Chatter1'),
      TwitchChatterMock(displayName: 'Chatter2'),
    ],
  );
}
