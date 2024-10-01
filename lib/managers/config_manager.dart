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
  final facebookEventUrl = 'https://facebook.com/events/930492188475716';
  String youtubeEventUrlId = 'eodaPPwvwxw';

  ///
  /// Streamers information
  ///
  final streamersInfo = [
    StreamerInfo(
      'Pariterre',
      description:
          'Étudiant en musique à une certaine époque, étudiant en kinésiologie '
          'à une autre...Alors pourquoi pas compléter un doctorat en Science '
          'de l\'Activité Physique chez les musiciens?',
      twitchUrl: 'https://twitch.tv/Pariterre',
      presentationYoutubeId: 'TJHV5L9P12k',
      philosophyYoutubeId: 'iwt_sJ5KFWM',
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
