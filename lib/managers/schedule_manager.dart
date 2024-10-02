import 'package:pomodautomne/managers/config_manager.dart';
import 'package:pomodautomne/models/schedule_info.dart';

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
        url: ConfigManager.instance.facebookEventUrl,
        starting: DateTime(2024, 10, 24),
        length: const Duration(hours: 9, minutes: 15)),
    ScheduleInfo(
        title: 'Cérémonie d\'ouverture',
        url: 'https://twitch.tv/pariterre',
        starting: DateTime(2024, 10, 24, 9, 15),
        length: const Duration(minutes: 45)),
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
