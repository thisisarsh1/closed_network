class NotificationModel {
  final String title;
  final String subtitle;
  final String time;
  final String imageUrl;
  final bool isRead;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.imageUrl,
    this.isRead = false,
  });
}