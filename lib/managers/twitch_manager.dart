import 'package:festifocus_relais_website/managers/chatters_manager.dart';
import 'package:festifocus_relais_website/models/streamer.dart';
import 'package:twitch_manager/twitch_app.dart';

class TwitchManager {
  /// Prepare the singleton
  static TwitchManager get instance => _instance;
  static TwitchManager _instance = TwitchManager._internal();
  TwitchManager._internal();

  late final TwitchDebugPanelOptions debugOptions;
  late final TwitchAppInfo appInfo;
  late final bool useMock;
  final Map<Streamer, TwitchAppManager> _managers = {};

  void initialize({
    required TwitchDebugPanelOptions debugOptions,
    required TwitchAppInfo appInfo,
    required bool useMock,
  }) {
    this.debugOptions = debugOptions;
    this.appInfo = appInfo;
    this.useMock = useMock;
  }

  List<Streamer> get streamers => [..._managers.keys];
  List<String> get streamerIds => streamers.map((e) => e.userId).toList();

  bool isStreamerInitialized(Streamer streamer) =>
      _managers[streamer]?.api != null;

  Future<bool> isStreamerLive(Streamer streamer) async =>
      isStreamerInitialized(streamer) &&
      (await _managers[streamer]!.api.isUserLive(userId: streamer.userId))!;

  Future<Streamer?> streamerFromManager({
    required TwitchAppManager manager,
  }) async {
    final user = await manager.api.user(userId: manager.api.streamerId);
    return user == null ? null : Streamer.fromTwitchUser(user);
  }

  Future<Iterable<TwitchUser>?> fetchChatters(Streamer streamer) async =>
      (await _managers[streamer]!.api.fetchChatters());

  Future<Iterable<TwitchUser>?> fetchFollowers(
    Streamer streamer, {
    bool includeStreamer = false,
  }) async => (await _managers[streamer]!.api.fetchFollowers(
    includeStreamer: includeStreamer,
  ));

  void addStreamer({
    required Streamer streamer,
    required TwitchAppManager manager,
  }) {
    _managers[streamer] = manager;
    ChattersManager.instance.updateStreamerInfo(streamer);
  }
}

class TwitchManagerMock extends TwitchManager {
  TwitchManagerMock._internal() : super._internal();

  static void initializeMock() {
    TwitchManager._instance = TwitchManagerMock._internal();
  }

  @override
  void initialize({
    required TwitchDebugPanelOptions debugOptions,
    required TwitchAppInfo appInfo,
    bool useMock = true,
  }) {
    if (!useMock) throw Exception('Cannot use mock with a non-mock manager');

    super.initialize(
      debugOptions: debugOptions,
      appInfo: appInfo,
      useMock: useMock,
    );
  }

  static int _streamerFromManagerCounter = 0;
  @override
  Future<Streamer?> streamerFromManager({
    required TwitchAppManager manager,
  }) async {
    _streamerFromManagerCounter++;

    final user = await super.streamerFromManager(manager: manager);
    return user == null
        ? null
        : Streamer(
            displayName: '${user.displayName}_$_streamerFromManagerCounter',
            login: '${user.login}_$_streamerFromManagerCounter',
            userId: '${user.userId}_$_streamerFromManagerCounter',
          );
  }

  @override
  bool isStreamerInitialized(Streamer streamer) => true;

  @override
  Future<bool> isStreamerLive(Streamer streamer) async =>
      streamer.login == 'me';

  @override
  Future<Iterable<TwitchUser>?> fetchChatters(Streamer streamer) async => [
    TwitchUser(
      userId: '00000001',
      login: 'mockchatter1',
      displayName: 'MockChatter1',
    ),
    TwitchUser(
      userId: '00000002',
      login: 'mockchatter2',
      displayName: 'MockChatter2',
    ),
    TwitchUser(
      userId: '00000003',
      login: 'mockchatter3',
      displayName: 'MockChatter3',
    ),
  ];

  @override
  Future<Iterable<TwitchUser>?> fetchFollowers(
    Streamer streamer, {
    bool includeStreamer = false,
  }) async => [
    TwitchUser(
      userId: '00000001',
      login: 'mockfollower1',
      displayName: 'MockFollower1',
    ),
    TwitchUser(
      userId: '00000002',
      login: 'mockfollower2',
      displayName: 'MockFollower2',
    ),
  ];
}
