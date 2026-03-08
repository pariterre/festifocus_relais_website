import 'package:festifocus_relais_website/models/item_serializable.dart';
import 'package:festifocus_relais_website/models/twitch_user_extension.dart';
import 'package:twitch_manager/twitch_app.dart';

class Chatter implements ItemSerializable {
  final TwitchUser user;
  @override
  String get id => user.userId;

  // _duration and _fromStreamers is expected to always be in sync
  bool isBanned;
  final Map<String, int> _watchTimes;

  int get totalWatchingTime =>
      _watchTimes.values.fold(0, (prev, e) => prev + e);
  int watchingTime({required String of}) {
    return _watchTimes[of] ?? -1;
  }

  Iterable<String> get streamerIds => [..._watchTimes.keys];

  void addStreamer(String streamerId) => _watchTimes[streamerId] = 0;

  void incrementTimeWatching(int deltaTime, {required String of}) {
    if (!hasViewedStreamer(of)) addStreamer(of);
    _watchTimes[of] = _watchTimes[of]! + deltaTime;
  }

  bool get isEmpty => _watchTimes.isEmpty;
  bool get isNotEmpty => !isEmpty;

  bool hasViewedStreamer(String streamerId) =>
      _watchTimes.containsKey(streamerId);
  bool hasNotViewedStreamer(String streamerId) =>
      !hasViewedStreamer(streamerId);

  Chatter({required this.user}) : isBanned = false, _watchTimes = {};

  Chatter.fromSerialized(Map<String, dynamic> map)
    : user = TwitchUserExtension.fromSerialized(map['user']),
      isBanned = map['is_banned'] ?? false,
      _watchTimes =
          (map['watch_times'] as Map?)?.map(
            (key, value) => MapEntry(key, value as int),
          ) ??
          {};

  @override
  Map<String, dynamic> get serializedMap => {
    'user': user.serialized,
    'is_banned': isBanned,
    'watch_times': _watchTimes.map((key, value) => MapEntry(key, value)),
  };
}
