import 'package:festifocus_relais_website/managers/config_manager.dart';
import 'package:festifocus_relais_website/models/schedule_info.dart';

class ScheduleManager {
  /// Prepare the singleton
  static ScheduleManager _instance = ScheduleManager._internal();
  static ScheduleManager get instance => _instance;
  ScheduleManager._internal();

  bool get hasEventStarted =>
      DateTime.now().compareTo(eventSchedule.first.starting) > 0;
  bool get hasEventFinished =>
      DateTime.now().compareTo(
        eventSchedule.last.starting.add(eventSchedule.last.length),
      ) >
      0;

  final eventSchedule = [
    ScheduleInfo(
      title: 'On est fébrile en attendant le début!',
      starting: DateTime(2026, 3, 25),
      length: const Duration(hours: 8, minutes: 15),
    ),
    ScheduleInfo(
      title: 'Cérémonie d\'ouverture',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 25, 8, 15),
      length: const Duration(minutes: 45),
    ),
    ScheduleInfo(
      title: 'Coworking avec DaejeeTV',
      url: 'https://twitch.tv/daejeetv',
      starting: DateTime(2026, 3, 25, 9, 0),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'DaejeeTV')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 25, 12, 0),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Coworking avec Solveig_L_HEVEDER',
      url: 'https://twitch.tv/solveig_l_heveder',
      starting: DateTime(2026, 3, 25, 12, 30),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'Solveig_L_HEVEDER')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 25, 15, 30),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Coworking avec Pariterre',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 25, 16, 0),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'Pariterre')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 25, 19, 0),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Coworking avec NutritionSansPression',
      url: 'https://twitch.tv/nutritionsanspression',
      starting: DateTime(2026, 3, 25, 19, 30),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'NutritionSansPression')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Pomo-Tricot',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 25, 22, 30),
      length: const Duration(hours: 3),
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 26, 1, 30),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Coworking avec WayceUpenFoya',
      url: 'https://twitch.tv/wayceupenfoya',
      starting: DateTime(2026, 3, 26, 2, 0),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'WayceUpenFoya')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/wayceupenfoya',
      starting: DateTime(2026, 3, 26, 5, 0),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Coworking avec deb_auteur_ice_',
      url: 'https://twitch.tv/deb_auteur_ice_',
      starting: DateTime(2026, 3, 26, 5, 30),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'deb_auteur_ice_')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 26, 8, 30),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Coworking avec LaLoutreBurlesque',
      url: 'https://twitch.tv/laloutreburlesque',
      starting: DateTime(2026, 3, 26, 9, 0),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'LaLoutreBurlesque')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Table ronde avec les animateurs et animatrices',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 26, 12, 0),
      length: const Duration(minutes: 90),
    ),
    ScheduleInfo(
      title: 'Coworking avec unlivrealamain',
      url: 'https://twitch.tv/unlivrealamain',
      starting: DateTime(2026, 3, 26, 13, 30),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'unlivrealamain')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 26, 16, 30),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Coworking avec le_sketch',
      url: 'https://twitch.tv/le_sketch',
      starting: DateTime(2026, 3, 26, 17, 0),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'le_sketch')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Pomo-Tricot',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 26, 20, 0),
      length: const Duration(hours: 3, minutes: 30),
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 27, 1, 30),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Coworking avec Thea_Cake',
      url: 'https://twitch.tv/thea_cake',
      starting: DateTime(2026, 3, 27, 2, 0),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'Thea_Cake')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/thea_cake',
      starting: DateTime(2026, 3, 27, 5, 0),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Coworking avec MichaelBielli',
      url: 'https://twitch.tv/michaelbielli',
      starting: DateTime(2026, 3, 27, 5, 30),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'MichaelBielli')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 27, 8, 30),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Coworking avec skitty_aelcademia',
      url: 'https://twitch.tv/skitty_aelcademia',
      starting: DateTime(2026, 3, 27, 9, 0),
      length: const Duration(hours: 3),
      avatarUrl: ConfigManager.instance.streamersInfo
          .firstWhere((element) => element.name == 'skitty_aelcademia')
          .avatarUrl,
    ),
    ScheduleInfo(
      title: 'Cérémonie de fermeture',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2026, 3, 27, 12, 0),
      length: const Duration(hours: 1),
    ),
  ];
}

class ScheduleManagerMock extends ScheduleManager {
  /// Prepare the singleton
  ScheduleManagerMock._internal() : super._internal();

  static void initializeMock() {
    ScheduleManager._instance = ScheduleManagerMock._internal();
  }

  @override
  bool get hasEventStarted => true;
  @override
  bool get hasEventFinished => true;
}
