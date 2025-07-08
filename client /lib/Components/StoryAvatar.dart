import 'package:flutter/material.dart';

class StoryAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const StoryAvatar({
    Key? key,
    this.imageUrl,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    // Show with ring if image exists
    if (hasImage) {
      return Container(
        padding: const EdgeInsets.all(3.0), // Gradient border
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.tealAccent
        ),
        child: Container(
          padding: const EdgeInsets.all(3.0), // Inner black border
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          child: CircleAvatar(
            radius: size,
            backgroundColor: Colors.black,
            backgroundImage: NetworkImage(imageUrl!),
          ),
        ),
      );
    }

    // No ring, just add icon
    return CircleAvatar(
      radius: size + 5, // Add some size to make it visually balanced
      backgroundColor: Colors.white10,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
