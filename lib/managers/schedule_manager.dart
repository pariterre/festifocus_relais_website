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
      starting: DateTime(2025, 10, 6),
      length: const Duration(hours: 9, minutes: 15),
    ),
    ScheduleInfo(
      title: 'Cérémonie d\'ouverture',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 6, 9, 15),
      length: const Duration(minutes: 45),
    ),
    ScheduleInfo(
      title: 'Session de coworking avec Solveig_L_HEVEDER',
      url: 'https://twitch.tv/solveig_l_heveder',
      starting: DateTime(2025, 10, 6, 10, 0),
      length: const Duration(hours: 3),
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 6, 13, 0),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Session de coworking avec MichaelBielli',
      url: 'https://twitch.tv/michaelbielli',
      starting: DateTime(2025, 10, 6, 13, 30),
      length: const Duration(hours: 3),
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 6, 16, 30),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Session de coworking avec Hazylla',
      url: 'https://twitch.tv/hazylla',
      starting: DateTime(2025, 10, 6, 17, 0),
      length: const Duration(hours: 3),
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 6, 20, 0),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Session de coworking avec Pariterre',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 6, 20, 30),
      length: const Duration(hours: 3),
    ),
    ScheduleInfo(
      title: 'Pomo-Tricot',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 6, 23, 30),
      length: const Duration(hours: 3),
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 7, 2, 30),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Session de coworking avec Blackthunder1332',
      url: 'https://twitch.tv/blackthunder1332',
      starting: DateTime(2025, 10, 7, 3, 0),
      length: const Duration(hours: 5),
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 7, 8, 0),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Session de coworking avec LaLoutreBurlesque',
      url: 'https://twitch.tv/laloutreburlesque',
      starting: DateTime(2025, 10, 7, 8, 30),
      length: const Duration(hours: 3),
    ),
    ScheduleInfo(
      title: 'Table ronde avec les animateurs et animatrices',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 7, 11, 30),
      length: const Duration(minutes: 90),
    ),
    ScheduleInfo(
      title: 'Session de coworking avec Dolyta',
      url: 'https://twitch.tv/dolyta',
      starting: DateTime(2025, 10, 7, 13, 0),
      length: const Duration(hours: 3),
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 7, 16, 0),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Session de coworking avec Le_Sketch',
      url: 'https://twitch.tv/le_sketch',
      starting: DateTime(2025, 10, 7, 16, 30),
      length: const Duration(hours: 3),
    ),
    ScheduleInfo(
      title: 'Cuisine d\'une tarte aux bleuets + Pomo-Tricot',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 7, 19, 30),
      length: const Duration(hours: 5),
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 8, 2, 30),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Session de coworking avec WayceUpenFoya',
      url: 'https://twitch.tv/wayceupenfoya',
      starting: DateTime(2025, 10, 8, 3, 0),
      length: const Duration(hours: 4),
    ),
    ScheduleInfo(
      title: 'Pause discussion',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 8, 7, 0),
      length: const Duration(minutes: 30),
    ),
    ScheduleInfo(
      title: 'Session de coworking avec AurorePassionpreneure',
      url: 'https://twitch.tv/aurorepassionpreneure',
      starting: DateTime(2025, 10, 8, 7, 30),
      length: const Duration(hours: 3),
    ),
    ScheduleInfo(
      title: 'Cérémonie de fermeture',
      url: 'https://twitch.tv/pariterre',
      starting: DateTime(2025, 10, 8, 10, 30),
      length: const Duration(minutes: 30),
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
