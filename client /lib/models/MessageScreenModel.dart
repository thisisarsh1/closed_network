
class MessageModel {
  final String name;
  final String handle;
  final String imageUrl;
  final String lastMessage;
  final String time;
  final bool isUnread;

  MessageModel({
    required this.name,
    required this.handle,
    required this.imageUrl,
    required this.lastMessage,
    required this.time,
    required this.isUnread,
  });
}