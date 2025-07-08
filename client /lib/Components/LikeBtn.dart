import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import '../Functions/Like/like_bloc.dart';

class LikeBtn extends StatelessWidget {
  final int initialLikes;
  final bool? initialIsLiked;

  const LikeBtn({
    super.key,
    required this.initialLikes,
    this.initialIsLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LikeBloc, LikeState>(
        builder: (context, state) {
          bool isLiked = false;
          int likeCount = 0;

          if (state is LikeInitial) {
             isLiked = state.isLiked;
             likeCount = state.like;
          }

          return LikeButton(
            size: 25,
            isLiked: isLiked,
            likeCount: likeCount,
            likeCountAnimationType: LikeCountAnimationType.part,
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
                size: 25,
              );
            },
            onTap: (isCurrentlyLiked) async {
              context.read<LikeBloc>().add(LikePressed());
              return !isCurrentlyLiked;
            },
          );
        },
      );

  }
}
