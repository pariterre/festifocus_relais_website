import 'package:twitch_manager/twitch_app.dart';

class Streamer extends TwitchUser {
  const Streamer({
    required super.userId,
    required super.login,
    required super.displayName,
  });

  Streamer.fromTwitchUser(TwitchUser user)
    : super(
        userId: user.userId,
        login: user.login,
        displayName: user.displayName,
      );
}
