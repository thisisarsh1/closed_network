class PostModel {
  final String id;
  final String imageUrl;
  final String username;
  final String description;
  final int likes;
  final int comments;

  PostModel({
    required this.id,
    required this.imageUrl,
    required this.username,
    required this.description,
    required this.likes,
    required this.comments,
  });
}
