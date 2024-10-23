import 'package:pomodautomne/models/streamer_info.dart';
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
  final eventName = 'Pomod\'Automne - 48h - Relais';
  String youtubeEventUrlId = 'eodaPPwvwxw';

  ///
  /// Streamers information
  ///
  final streamersInfo = [
    StreamerInfo(
      'AlchimisteDesMots',
      description:
          'A la tête d\'un atelier magique de messages précieux, j\'aime faire '
          'des expériences avec les mots et les papiers, un peu comme une '
          'alchimiste, quoi... 🤭 Bienvenue dans une safeplace où les lives '
          'buguent et les 🐈, le 🐕 & les 🙎‍♂️ sont à rôder pas loin (du stream '
          'cool pas prise de tête en somme)',
      twitchUrl: 'https://twitch.tv/alchimistedesmots',
    ),
    StreamerInfo(
      'Helene_Ducrocq',
      description: 'Bienvenue dans mon studio de création ! Découvre mon '
          'quotidien de réalisatrice de films d\'animation, d\'illustratrice, '
          'd\'autrice de livres et d\'artiste. Ici, on coworke pour parler '
          'créativité, coups de coeur et je réalise en direct mes prochains '
          'projets (4 films en animation, 1 livre, 1 expo).',
      twitchUrl: 'https://twitch.tv/helene_ducrocq',
    ),
    StreamerInfo(
      'LaLoutreBurlesque',
      description: 'Tant qu\'il y a de la loutre il y a de l\'espoir.',
      twitchUrl: 'https://twitch.tv/laloutreburlesque',
    ),
    StreamerInfo(
      'LaQueteDuBois',
      description:
          'Étant concepteur ébéniste je veux vous présenter mon atelier, '
          'partagé mon savoir et si le temps si prête jouer a quelque jeux '
          'qui m\'inspire.',
      twitchUrl: 'https://twitch.tv/laquetedubois',
    ),
    StreamerInfo(
      'LineManoury_Auteure',
      description:
          'Grande lectrice, autrice, et désormais correctrice/bêta-lectrice '
          'professionnelle, je vous propose des sessions de co-working, '
          'principalement autour des livres (donc lecture et écriture), mais '
          'rien ne vous empêche de nous joindre pour bosser sur tout '
          'autre chose :D',
      twitchUrl: 'https://twitch.tv/linemanoury_auteure',
    ),
    StreamerInfo(
      'lejournaldaely',
      description: 'Amoureuse des livres 📚, du café ☕, du chocolat 🍫 et des '
          'chats 😻Tricoteuse compulsive 🧶Vous trouverez ici des lives '
          'principalement autour de la lecture (RWM, Bookhaul, Challenges '
          'Littéraires, Bilan du mois etc), des séances papotage, des sessions '
          'de loisirs créatifs et un peu de gaming !',
      twitchUrl: 'https://twitch.tv/lejournaldaely',
    ),
    StreamerInfo(
      'Le_Sketch',
      description:
          'Mon nom c\'est Michel, j\'suis un vieux geek aux lunettes orange. '
          'Les lundis et vendredis à 16 h, on discute de marketing & de '
          'communication à l\'ère numérique. Les samedis à 9 h, on sirote un '
          'café gaming. Je redonne 100 % des revenus de ma chaîne à ma campagne '
          'au profit d\'Opération Enfant Soleil.',
      twitchUrl: 'https://twitch.tv/le_sketch',
    ),
    StreamerInfo(
      'Pariterre',
      description:
          'Étudiant en musique à une certaine époque, étudiant en kinésiologie '
          'à une autre...Alors pourquoi pas compléter un doctorat en Science '
          'de l\'Activité Physique chez les musiciens?',
      twitchUrl: 'https://twitch.tv/pariterre',
      presentationYoutubeId: 'TJHV5L9P12k',
      philosophyYoutubeId: 'iwt_sJ5KFWM',
    ),
    StreamerInfo(
      'Piickwiic',
      description:
          'Coucou par ici, moi c\'est Anais. J\'ai 38 ans, deux enfants, et un '
          'chat qui répond au doux nom de Minette. C\'est même devenue la '
          'mascotte de la chaine ! Cette chaine parle de livres, de coloriages, '
          'mais pas que ! Si le coeur vous en dit, venez me faire un petit '
          'coucou pendant un live :) ',
      twitchUrl: 'https://twitch.tv/piickwiic',
    ),
    StreamerInfo(
      'Solveig_L_HEVEDER',
      description:
          '🎇Co-working écriture🎇Autrice indépendante, j\'écris dans des genres '
          'différents, mais j\'essaierai toujours de faire battre vos cœurs avec '
          'un peu de romance! Seul problème? Entre le boulot et la famille, les '
          'streams sont plus qu\'aléatoires ^^\' suivez-moi sur insta et discord '
          'pour ne pas me rater! ;)',
      twitchUrl: 'https://twitch.tv/piickwiic',
    ),
    StreamerInfo(
      'WayceUpenFoya',
      description:
          'J\'ai lancé cette chaîne pour partager ma passion pour l\'écriture, '
          'la lecture et toutes les créations artistiques. Même si vous me '
          'verrez aussi jouer à des jeux vidéos et discuter autour de divers '
          'sujets, mon but est de partager avec vous ces univers qui me bercent '
          'depuis maintenant des années.',
      twitchUrl: 'https://twitch.tv/wayceupenfoya',
    ),
  ];

  final prizes = [];

  ///
  /// Twitch information
  ///
  final twichAppInfo = TwitchAppInfo(
    appName: 'Pomod\'Automne - 48h - Relais',
    twitchClientId: 'wuxnu9zxzhgu3noztxtgdsulk4c950',
    twitchRedirectUri:
        Uri.https('twitchauthentication.pariterre.net', 'twitch_redirect.html'),
    authenticationServerUri:
        Uri.https('twitchserver.pariterre.net:3000', 'token'),
    scope: [TwitchAppScope.chatters, TwitchAppScope.readFollowers],
  );
  final twitchDebugPanel = TwitchDebugPanelOptions(
    chatters: [
      TwitchChatterMock(displayName: 'Chatter1'),
      TwitchChatterMock(displayName: 'Chatter2'),
    ],
  );
}
