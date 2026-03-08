import 'package:twitch_manager/twitch_app.dart';

extension TwitchUserExtension on TwitchUser {
  Map<String, dynamic> get serialized => {
    'user_id': userId,
    'login': login,
    'display_name': displayName,
  };

  static TwitchUser fromSerialized(Map<String, dynamic> map) => TwitchUser(
    userId: map['user_id'] ?? '',
    login: map['login'] ?? '',
    displayName: map['display_name'] ?? '',
  );
}
