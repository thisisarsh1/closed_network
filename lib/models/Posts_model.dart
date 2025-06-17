class PostModel {
  final String id;
  final String imageUrl;
  final String username;
  final String handle;
  final String time;
  final String description;
  final int likes;
  final int comments;
  final int reposts;

  PostModel({
    required this.id,
    required this.imageUrl,
    required this.username,
    required this.handle,
    required this.time,
    required this.description,
    required this.likes,
    required this.comments,
    required this.reposts,
  });
}
