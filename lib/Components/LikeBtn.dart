import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeBtn extends StatelessWidget {
  const LikeBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 15, // Adjust the size of the button
      circleColor: const CircleColor(
        start: Colors.tealAccent,
        end: Color(0xff0099cc),
      ),
      bubblesColor: const BubblesColor(
        dotPrimaryColor: Colors.pink,
        dotSecondaryColor: Colors.white,
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: isLiked ? Colors.red : Colors.grey.withOpacity(0.5),
          size: 5, // Adjust the size of the icon
        );
      },
    );
  }
}
