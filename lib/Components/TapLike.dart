import 'package:flutter/material.dart';

class TapLike extends StatefulWidget {
  final Widget image;
  final VoidCallback onLike;

  const TapLike({
    super.key,
    required this.image,
    required this.onLike,
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
    widget.onLike();

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
  }
}
