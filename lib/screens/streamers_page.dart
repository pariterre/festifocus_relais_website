import 'package:festifocus_relais_website/managers/config_manager.dart';
import 'package:festifocus_relais_website/managers/theme_manager.dart';
import 'package:festifocus_relais_website/models/streamer_info.dart';
import 'package:festifocus_relais_website/widgets/animated_expanding_card.dart';
import 'package:festifocus_relais_website/widgets/tab_container.dart';
import 'package:festifocus_relais_website/widgets/youtube_box.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class StreamersPage extends StatelessWidget {
  const StreamersPage({super.key, required this.maxWidth});

  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final cm = ConfigManager.instance;

    final streamerInfoSorted = [...cm.streamersInfo]
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return TabContainer(
      maxWidth: maxWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'ANIMATEURS ET ANIMATRICES',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          ...streamerInfoSorted.map((e) => _StreamerCard(streamerInfo: e)),
          SizedBox(height: MediaQuery.of(context).size.height - 375),
        ],
      ),
    );
  }
}

class _StreamerCard extends StatelessWidget {
  const _StreamerCard({required this.streamerInfo});

  final StreamerInfo streamerInfo;
  @override
  Widget build(BuildContext context) {
    final tm = ThemeManager.instance;

    return AnimatedExpandingCard(
      expandedColor: tm.colorButtonSelected,
      closedColor: tm.colorButtonUnselected,
      header: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              streamerInfo.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse(streamerInfo.twitchUrl));
              },
              child: Text(
                streamerInfo.twitchUrl,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      builder: (context, isExpanded) => isExpanded
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text.rich(
                          TextSpan(text: streamerInfo.description),
                        ),
                      ),
                      if (streamerInfo.personalWebSite != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 4),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                  Uri.parse(streamerInfo.personalWebSite!),
                                );
                              },
                              child: Text(
                                streamerInfo.personalWebSite!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 12),
                      if (streamerInfo.presentationYoutubeId == null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vidéo de présentation',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const Text('À venir'),
                          ],
                        )
                      else
                        _VideoWithTitle(
                          title: 'Qui suis-je?',
                          videoId: streamerInfo.presentationYoutubeId!,
                        ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}

class _VideoWithTitle extends StatelessWidget {
  const _VideoWithTitle({required this.title, required this.videoId});

  final String title;
  final String videoId;

  @override
  Widget build(BuildContext context) {
    final controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        YoutubeBox(controller: controller, videoId: videoId, widthRatio: 0.8),
      ],
    );
  }
}
