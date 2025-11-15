class AppNotificationModel {
  final String id;
  final String title;
  final String body;
  final DateTime date;
  final bool read;

  AppNotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    this.read = false,
  });
}
