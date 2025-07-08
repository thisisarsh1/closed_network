
import '../models/NotificationModel.dart';

final List<NotificationModel> notifications = [
  NotificationModel(
    title: "New Follower",
    subtitle: "@astro.witch started following you",
    time: "2m ago",
    imageUrl: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde",
  ),
  NotificationModel(
    title: "Post Liked",
    subtitle: "@cyberninja liked your post",
    time: "10m ago",
    imageUrl: "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
  ),
  NotificationModel(
    title: "Comment",
    subtitle: "@hackerboi replied to your comment",
    time: "1h ago",
    imageUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
  ),
  NotificationModel(
    title: "Mention",
    subtitle: "You were mentioned in a post",
    time: "3h ago",
    imageUrl: "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
  ),
  NotificationModel(
    title: "New Community Event",
    subtitle: "Join the AI hackathon this weekend!",
    time: "5h ago",
    imageUrl: "https://images.unsplash.com/photo-1520813792240-56fc4a3765a7",
  ),
];
