import 'package:closed_network/Functions/Like/like_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TapLike extends StatefulWidget {
  final Widget image;

  const TapLike({
    super.key,
    required this.image,
  });

  @override
  State<TapLike> createState() => _TapLikeState();
}

class _TapLikeState extends State<TapLike> with SingleTickerProviderStateMixin {
  bool _showHeart = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 0.6, end: 1.4)
        .chain(CurveTween(curve: Curves.easeOutBack))
        .animate(_controller);
  }

  void _handleDoubleTap() {
    setState(() => _showHeart = true);
    _controller.forward(from: 0);

    /// 🔥 Trigger the LikePressed event in the bloc
    context.read<LikeBloc>().add(LikePressed());

    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) setState(() => _showHeart = false);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeBloc, LikeState>(
      builder: (context, state) {
        int likeCount = 0;
        if (state is LikeInitial) {
          likeCount = state.like;
        }

        return GestureDetector(
          onDoubleTap: _handleDoubleTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              widget.image,
              if (_showHeart)
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 80,
                  ),
                ),

            ],
          ),
        );
      },
    );
  }
}
