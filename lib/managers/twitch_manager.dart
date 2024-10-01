import 'package:twitch_manager/twitch_app.dart';

class TwitchManager {
  /// Prepare the singleton
  static TwitchManager get instance => _instance;
  static TwitchManager _instance = TwitchManager._internal();
  TwitchManager._internal();

  late final TwitchDebugPanelOptions debugOptions;
  late final TwitchAppInfo appInfo;
  late final bool useMock;
  final Map<String, TwitchAppManager> _managers = {};

  void initialize({
    required TwitchDebugPanelOptions debugOptions,
    required TwitchAppInfo appInfo,
    required bool useMock,
  }) {
    this.debugOptions = debugOptions;
    this.appInfo = appInfo;
    this.useMock = useMock;
  }

  List<String> get streamerIds => _managers.keys.toList();

  bool isStreamerInitialized(String id) => _managers[id]?.api != null;

  Future<String> streamerLogin(String id) async =>
      (await _managers[id]!.api.login(_managers[id]!.api.streamerId))!;

  Future<bool> isStreamerLive(String id) async =>
      isStreamerInitialized(id) &&
      (await _managers[id]!.api.isUserLive(_managers[id]!.api.streamerId))!;

  Future<List<String>?> fetchChatters(String id) async =>
      (await _managers[id]!.api.fetchChatters());

  Future<List<String>?> fetchFollowers(String id,
          {bool includeStreamer = false}) async =>
      (await _managers[id]!
          .api
          .fetchFollowers(includeStreamer: includeStreamer));

  Future<void> addStreamer(
          {required String id, required TwitchAppManager manager}) async =>
      _managers[id] = manager;
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
        debugOptions: debugOptions, appInfo: appInfo, useMock: useMock);
  }

  @override
  List<String> get streamerIds => ['Me', 'You'];

  @override
  bool isStreamerInitialized(String id) => true;

  @override
  Future<String> streamerLogin(String id) async => 'MockStreamer$id';

  @override
  Future<bool> isStreamerLive(String id) async => id == 'Me';

  @override
  Future<List<String>?> fetchChatters(String id) async =>
      ['MockChatter1', 'MockChatter2', 'MockChatter3'];

  @override
  Future<List<String>?> fetchFollowers(String id,
          {bool includeStreamer = false}) async =>
      ['MockChatter1', 'MockChatter2'];
}
