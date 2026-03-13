class ScheduleInfo {
  final String title;
  final DateTime starting;
  final Duration length;
  final String? url;
  final String? avatarUrl;

  const ScheduleInfo({
    required this.title,
    this.url,
    required this.starting,
    required this.length,
    this.avatarUrl,
  });

  DateTime get ending => starting.add(length);
}
