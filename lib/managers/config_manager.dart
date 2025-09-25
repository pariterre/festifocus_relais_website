import 'package:festifocus_relais_website/models/price.dart';
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
  final eventName = 'FestiFocusPocus — 48h — Relais';
  String youtubeEventUrlId = 'eodaPPwvwxw';

  ///
  /// Streamers information
  ///
  final streamersInfo = [
    StreamerInfo(
      'Pariterre',
      description:
          '''Étudiant en musique à une certaine époque, étudiant en kinésiologie à une autre...Alors pourquoi pas compléter un doctorat en Science de l'Activité Physique chez les musiciens?''',
      twitchUrl: 'https://twitch.tv/pariterre',
      presentationYoutubeId: 'TJHV5L9P12k',
    ),
    StreamerInfo(
      'LaLoutreBurlesque',
      description: '''Bienvenue dans ma dictature !
Je suis la Loutre Burlesque et c'est un plaisir de t'accueillir ici.
Je suis rédactrice web de profession, en freelance depuis 2019.
En parallèle, j'écris le tome 1 de ma première saga de fantasy.
Quand j'ai le temps et la motivation, je publie du contenu sur les réseaux sociaux autour des romans (écriture et lecture). Tu me trouveras sur tiktok et Insta sous le nom d'Elya Mallow.
J'anime des streams de coworking pour avancer sur mes différents projets et pour qu'on puisse se motiver tous ensemble.''',
      twitchUrl: 'https://twitch.tv/laloutreburlesque',
    ),
    StreamerInfo(
      'BlackThunder1332',
      description:
          '''Je suis Nico, je prépare l'agreg d'histoire j'ai besoin de bosser! Anecdotes, bonne humeur, motivation au rendez-vous! Nous sommes le Peuple Uni des Bourrins (le PUB) : les bourrins. Un espace sympa, où on passe un bon moment, on s’y file (on ne chôme pas!) et où on y fait de chouettes rencontres!''',
      twitchUrl: 'https://twitch.tv/blackthunder1332',
    ),
    StreamerInfo(
      'hazylla',
      description:
          '''♡ hello, moi c'est Hazylla 🦋. Je me suis lancée sur Twitch pour partager quelques games de TfT et trouver la motivation de finir ma - trop - longue PAL. J'espère vous inspirer à faire de même ou à travailler avec des sessions pomodoro 45/15 du mardi au vendredi !''',
      twitchUrl: 'https://twitch.tv/hazylla',
    ),
    StreamerInfo(
      'AurorePassionpreneure',
      description:
          '''Je t'aide à entreprendre sans burnout (check mon Insta !) | Coworking & Discussion | La streameuse qui te fait déculpabiliser de prendre des pauses | Burnout Survivor | +17ans com' & web | +10ans à accompagner les entrepreneuses | Lives les jeudis et vendredis (en général)''',
      twitchUrl: 'https://twitch.tv/aurorepassionpreneure',
    ),
    StreamerInfo(
      'Dolyta',
      description:
          '''🍁 Bienvenue chez Dolyta ! 🍁Lecture, gaming chill, et vibes automnales cosy 🍂✨ Viens te détendre, découvrir de nouveaux livres et profiter de moments doux, le tout avec une boisson chaude à la main ☕🎮💛''',
      twitchUrl: 'https://twitch.tv/dolyta',
    ),
    StreamerInfo(
      'le_sketch',
      description:
          '''Les lundis et vendredis à 16 h, on discute de marketing & de communication à l'ère numérique. Les samedis à 9 h, on sirote un café gaming instantannant! Je redonne 100 % des revenus de ma chaîne à ma campagne au profit d'Opération Enfant Soleil.''',
      twitchUrl: 'https://twitch.tv/le_sketch',
    ),
    StreamerInfo(
      'WayceUpenFoya',
      description:
          '''J'ai lancé cette chaîne pour partager ma passion pour l'écriture, la lecture et toutes les créations artistiques. Même si vous me verrez aussi jouer à des jeux vidéos et discuter autour de divers sujets, mon but est de partager avec vous ces univers qui me bercent depuis maintenant des années.''',
      twitchUrl: 'https://twitch.tv/wayceupenfoya',
    ),
    StreamerInfo(
      'MichaelBielli',
      description:
          '''Auteur indépendant de Fantasy | Papa de la saga MARDAAS (tome 1, 2 & 3 disponibles sur amazon) | Grand Roi du royaume Coquillette | J'aime bien renifler les livres neufs''',
      twitchUrl: 'https://twitch.tv/michaelbielli',
    ),
    StreamerInfo(
      'Solveig_L_HEVEDER',
      description:
          '''🎇Co-working écriture🎇Autrice indépendante, j'écris dans des genres différents, mais j'essaierai toujours de faire battre vos cœurs avec un peu de romance! Seul problème? Entre le boulot et la famille, les streams sont plus qu'aléatoires ^^' suivez-moi sur insta et discord pour ne pas me rater! ;)''',
      twitchUrl: 'https://twitch.tv/solveig_l_heveder',
    ),
  ];

  final prices = [
    Price(title: 'Un beau sourire', person: 'pariterre'),
    Price(title: 'Un beau sourire', person: 'pariterre'),
    Price(
      title: 'Un beau sourire',
      person: 'pariterre',
      url: 'https://pariterre.net',
    ),
  ];

  ///
  /// Twitch information
  ///
  final twitchAppInfo = TwitchAppInfo(
    appName: 'FestiFocusPocus — 48h — Relais',
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
