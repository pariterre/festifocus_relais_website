import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festifocus_relais_website/firebase_options.dart';
import 'package:festifocus_relais_website/managers/config_manager.dart';
import 'package:festifocus_relais_website/managers/schedule_manager.dart';
import 'package:festifocus_relais_website/managers/theme_manager.dart';
import 'package:festifocus_relais_website/managers/twitch_manager.dart';
import 'package:festifocus_relais_website/screens/administration_login_page.dart';
import 'package:festifocus_relais_website/screens/connect_streamers_page.dart';
import 'package:festifocus_relais_website/screens/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  await _initializeIntl();
  await _initializeManagers(
    useTwitchMock: const bool.fromEnvironment(
      'FESTIFOCUS_USE_TWITCH_MOCK',
      defaultValue: false,
    ),
    useDatabaseEmulator: const bool.fromEnvironment(
      'FESTIFOCUS_USE_DATABASE_EMULATOR',
      defaultValue: false,
    ),
    useScheduleManagerMock: const bool.fromEnvironment(
      'FESTIFOCUS_USE_SCHEDULE_MANAGER_MOCK',
      defaultValue: false,
    ),
  );
  runApp(
    const MyApp(
      isAdmistration: bool.fromEnvironment('FESTIFOCUS_IS_ADMINISTRATION'),
    ),
  );
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
      initialRoute: isAdmistration
          ? AdministrationLoginPage.route
          : MainPage.route,
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
