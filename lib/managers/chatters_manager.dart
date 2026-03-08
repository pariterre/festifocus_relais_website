import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festifocus_relais_website/managers/twitch_manager.dart';
import 'package:festifocus_relais_website/models/chatter.dart';
import 'package:festifocus_relais_website/models/custom_listener.dart';
import 'package:festifocus_relais_website/models/firebase_updater.dart';
import 'package:festifocus_relais_website/models/streamer.dart';
import 'package:festifocus_relais_website/models/twitch_user_extension.dart';
import 'package:quiver/collection.dart';

class ChattersManager extends DelegatingList<Chatter>
    with CustomListener, FirebaseUpdater<Chatter> {
  final List<Chatter> _chatters = [];

  @override
  List<Chatter> get delegate => _chatters;

  @override
  String get pathToData => 'chatters_H2026';

  // Prepare the singleton
  static ChattersManager get instance => _instance;
  static final ChattersManager _instance = ChattersManager._internal();
  ChattersManager._internal() {
    initializeFirebaseUpdater();
  }

  @override
  void add(Chatter value) {
    super.add(value);
    setToDatabase(value);
    notifyListeners();
  }

  void toggleIsBan(Chatter chatter) {
    chatter.isBanned = !chatter.isBanned;
    setToDatabase(chatter);
    notifyListeners();
  }

  ///
  /// Time in seconds between each time the chatters are updated
  ///
  int get deltaTime => 60;
  @override
  Duration get updateInterval => const Duration(seconds: 10);

  void startMonitoring() async {
    for (final streamer in TwitchManager.instance.streamers) {
      Timer.periodic(
        Duration(seconds: deltaTime),
        (timer) async => _addTime(streamer: streamer),
      );
    }
  }

  void _addTime({required Streamer streamer}) async {
    // If the user is not live, do not add time to their viewers
    final tm = TwitchManager.instance;
    if (!(await tm.isStreamerLive(streamer))) return;

    final currentChatters = await tm.fetchChatters(streamer);
    if (currentChatters == null) return;

    // Get the followers of the current streamer
    final followers = (await tm.fetchFollowers(
      streamer,
      includeStreamer: true,
    ))!;

    for (final user in currentChatters) {
      // Check if it is a new chatter
      if (!any((chatter) => chatter.user == user)) {
        add(Chatter(user: user));
      }
      final currentChatter = firstWhere((chatter) => chatter.user == user);

      // The chatter must be a follower of the streamer
      if (!followers.contains(currentChatter.user)) continue;

      // Check if it is the first time on a specific channel
      if (currentChatter.hasNotViewedStreamer(streamer.userId)) {
        currentChatter.addStreamer(streamer.userId);
      }

      // Add one time increment to the user
      currentChatter.incrementTimeWatching(deltaTime, of: streamer.userId);

      // Update the provider
      setToDatabase(currentChatter);
      notifyListeners();
    }
  }

  @override
  Chatter deserialize(Map<String, dynamic> map) => Chatter.fromSerialized(map);

  @override
  void updateAllItems(List<Chatter> items) {
    for (final chatter in items) {
      final index = indexWhere(
        (element) => element.user.login == chatter.user.login,
      );
      if (index == -1) {
        super.add(chatter);
      } else {
        _chatters[index] = chatter;
      }
    }
    notifyListeners();
  }

  Future<void> updateStreamerInfo(Streamer streamer) async {
    await FirebaseFirestore.instance
        .collection(pathToData)
        .doc('streamers')
        .set({
          'all': {streamer.userId: streamer.serialized},
        }, SetOptions(merge: true));
  }

  bool _isFetchingMutex = false;
  final Map<String, Streamer> _streamersCache = {};
  Future<Streamer?> fetchStreamerInfo(String streamerId) async {
    while (_isFetchingMutex) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    if (_streamersCache.containsKey(streamerId)) {
      return _streamersCache[streamerId]!;
    }
    _isFetchingMutex = true;

    final streamers = await FirebaseFirestore.instance
        .collection(pathToData)
        .doc('streamers')
        .get();

    // Since we fetch all streamers, use this opportunity to refesh the cache
    _streamersCache.clear();
    for (final data in streamers.data()?['all']?.values ?? []) {
      final streamer = Streamer.fromTwitchUser(
        TwitchUserExtension.fromSerialized(data),
      );
      _streamersCache[streamer.userId] = streamer;
    }

    _isFetchingMutex = false;
    return _streamersCache[streamerId];
  }
}
