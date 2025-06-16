import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imageUrl;
  final Color statusColor;
  final double size;
  const Avatar({
    super.key,
    String? imageUrl,
    double? size,
    this.statusColor = Colors.transparent,
  }) : imageUrl = imageUrl ?? 'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_1280.png',
    size =size??12;


  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: (2*size), // Reduced radius for a smaller avatar
          backgroundImage: NetworkImage(imageUrl),
        ),
        if (statusColor != Colors.transparent)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size, // Reduced width for a smaller status indicator
              height: size, // Reduced height for a smaller status indicator
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 1, // Slightly reduced border width
                ),
              ),
            ),
          ),
      ],
    );
  }
}
