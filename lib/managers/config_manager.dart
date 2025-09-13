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
  final eventName = 'FestiFocus \u2015 Relais';
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
  final twichAppInfo = TwitchAppInfo(
    appName: 'FestiFocus \u2015 Relais',
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
  );
  final twitchDebugPanel = TwitchDebugPanelOptions(
    chatters: [
      TwitchChatterMock(displayName: 'Chatter1'),
      TwitchChatterMock(displayName: 'Chatter2'),
    ],
  );
}
