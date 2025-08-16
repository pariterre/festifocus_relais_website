import 'package:festifocus_relais_website/models/schedule_info.dart';

class ScheduleManager {
  /// Prepare the singleton
  static ScheduleManager _instance = ScheduleManager._internal();
  static ScheduleManager get instance => _instance;
  ScheduleManager._internal();

  bool get hasEventStarted =>
      DateTime.now().compareTo(DateTime(2024, 10, 24, 9, 15)) > 0;
  bool get hasEventFinished =>
      DateTime.now().compareTo(DateTime(2024, 10, 26, 20)) > 0;

  final eventSchedule = [
    ScheduleInfo(
        title: 'On est fébrile en attendant le début!',
        starting: DateTime(2024, 10, 24),
        length: const Duration(hours: 9, minutes: 15)),
    ScheduleInfo(
        title: 'Cérémonie d\'ouverture',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 24, 9, 15),
        length: const Duration(minutes: 45)),
    ScheduleInfo(
        title: 'LaLoutreBurlesque',
        url: 'https://twitch.tv/laloutreburlesque',
        starting: DateTime(2024, 10, 24, 10),
        length: const Duration(hours: 3)),
    ScheduleInfo(
        title: 'Pause - discussion',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 24, 13),
        length: const Duration(minutes: 30)),
    ScheduleInfo(
        title: 'AlchimisteDesMots',
        url: 'https://twitch.tv/alchimistedesmots',
        starting: DateTime(2024, 10, 24, 13, 30),
        length: const Duration(hours: 3)),
    ScheduleInfo(
        title: 'Pause - discussion',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 24, 16, 30),
        length: const Duration(minutes: 30)),
    ScheduleInfo(
        title: 'WayceUpenFoya',
        url: 'https://twitch.tv/wayceupenfoya',
        starting: DateTime(2024, 10, 24, 17),
        length: const Duration(hours: 3)),
    ScheduleInfo(
        title: 'Pause - discussion',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 24, 20),
        length: const Duration(minutes: 30)),
    ScheduleInfo(
        title: 'Pariterre',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 24, 20, 30),
        length: const Duration(hours: 3)),
    ScheduleInfo(
        title: 'POMO-TRICOT',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 24, 23, 30),
        length: const Duration(hours: 3)),
    ScheduleInfo(
        title: 'Pause - discussion',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 25, 2, 30),
        length: const Duration(minutes: 30)),
    ScheduleInfo(
        title: 'Helene_Ducrocq',
        url: 'https://twitch.tv/helene_ducrocq',
        starting: DateTime(2024, 10, 25, 3),
        length: const Duration(hours: 4)),
    ScheduleInfo(
        title: 'Pause - discussion',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 25, 7),
        length: const Duration(minutes: 30)),
    ScheduleInfo(
        title: 'AurorePassionpreneure',
        url: 'https://twitch.tv/AurorePassionpreneure',
        starting: DateTime(2024, 10, 25, 7, 30),
        length: const Duration(hours: 3)),
    ScheduleInfo(
        title: 'TABLE RONDE',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 25, 10, 30),
        length: const Duration(hours: 1, minutes: 30)),
    ScheduleInfo(
        title: 'LaQueteDuBois',
        url: 'https://twitch.tv/laquetedubois',
        starting: DateTime(2024, 10, 25, 12),
        length: const Duration(hours: 3)),
    ScheduleInfo(
        title: 'Pause - discussion',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 25, 15),
        length: const Duration(minutes: 30)),
    ScheduleInfo(
        title: 'Le_Sketch',
        url: 'https://twitch.tv/le_sketch',
        starting: DateTime(2024, 10, 25, 15, 30),
        length: const Duration(hours: 3)),
    ScheduleInfo(
        title: 'LE D&D D\'HALLOWEEN',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 25, 18, 30),
        length: const Duration(hours: 8, minutes: 30)),
    ScheduleInfo(
        title: 'Solveig_L_HEVEDER',
        url: 'https://twitch.tv/Solveig_L_HEVEDER',
        starting: DateTime(2024, 10, 26, 3),
        length: const Duration(hours: 4)),
    ScheduleInfo(
        title: 'Pause - discussion',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 26, 7),
        length: const Duration(minutes: 30)),
    ScheduleInfo(
        title: 'LineManoury_Auteure',
        url: 'https://twitch.tv/linemanoury_auteure',
        starting: DateTime(2024, 10, 26, 7, 30),
        length: const Duration(hours: 3)),
    ScheduleInfo(
        title: 'Pause - discussion',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 26, 10, 30),
        length: const Duration(minutes: 30)),
    ScheduleInfo(
        title: 'lejournaldaely',
        url: 'https://twitch.tv/lejournaldaely',
        starting: DateTime(2024, 10, 26, 11, 00),
        length: const Duration(hours: 3)),
    ScheduleInfo(
        title: 'Cérémonie de clôture',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 26, 14),
        length: const Duration(minutes: 30)),
  ];
}

class ScheduleManagerMock extends ScheduleManager {
  /// Prepare the singleton
  ScheduleManagerMock._internal() : super._internal();

  static void initializeMock() {
    ScheduleManager._instance = ScheduleManagerMock._internal();
  }

  @override
  bool get hasEventStarted => false;
  @override
  bool get hasEventFinished => false;
}
