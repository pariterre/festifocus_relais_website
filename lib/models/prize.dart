class Prize {
  final String title;
  final String person;
  final String? url;
  final String? winner;

  const Prize({
    required this.title,
    required this.person,
    this.url,
    this.winner,
  });
}
