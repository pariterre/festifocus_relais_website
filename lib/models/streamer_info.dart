class StreamerInfo {
  final String name;
  final String description;
  final String twitchUrl;
  final String? personalWebSite;
  final String? presentationYoutubeId;

  StreamerInfo(
    this.name, {
    required this.description,
    required this.twitchUrl,
    this.personalWebSite,
    this.presentationYoutubeId,
  });
}
