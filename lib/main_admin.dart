import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pomodautomne/firebase_options.dart';
import 'package:pomodautomne/managers/config_manager.dart';
import 'package:pomodautomne/managers/schedule_manager.dart';
import 'package:pomodautomne/managers/theme_manager.dart';
import 'package:pomodautomne/managers/twitch_manager.dart';
import 'package:pomodautomne/screens/connect_streamers_page.dart';
import 'package:pomodautomne/screens/main_page.dart';
import 'package:pomodautomne/screens/administration_login_page.dart';

void main() async {
  await _initializeIntl();
  await _initializeManagers(
    useTwitchMock: false,
    useDatabaseEmulator: false,
    useScheduleManagerMock: false,
  );
  runApp(const MyApp(isAdmistration: true));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isAdmistration});

  final bool isAdmistration;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le ${ConfigManager.instance.eventName}',
      theme: ThemeManager.instance.themeData,
      routes: {
        AdministrationLoginPage.route: (context) =>
            const AdministrationLoginPage(),
        ConnectStreamersPage.route: (context) => const ConnectStreamersPage(),
        MainPage.route: (context) => MainPage(isAdmistration: isAdmistration),
      },
      initialRoute:
          isAdmistration ? AdministrationLoginPage.route : MainPage.route,
      debugShowCheckedModeBanner: false,
    );
  }
}

Future<void> _initializeIntl() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'fr_CA';
  await initializeDateFormatting();
}

Future<void> _initializeManagers({
  required bool useTwitchMock,
  required bool useDatabaseEmulator,
  required bool useScheduleManagerMock,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  if (useTwitchMock) TwitchManagerMock.initializeMock();
  TwitchManager.instance.initialize(
    useMock: useTwitchMock,
    debugOptions: ConfigManager.instance.twitchDebugPanel,
    appInfo: ConfigManager.instance.twichAppInfo,
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (useDatabaseEmulator) {
    FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }

  if (useScheduleManagerMock) {
    ScheduleManagerMock.initializeMock();
  }
}
