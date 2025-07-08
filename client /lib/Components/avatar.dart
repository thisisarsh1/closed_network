import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imageUrl;
  final Color statusColor;
  final double size;
  final String heroTag;

  const Avatar({
    super.key,
    String? imageUrl,
    double? size,
    this.statusColor = Colors.transparent,
    String? heroTag,
  })  : imageUrl = imageUrl ??
      'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_1280.png',
        size = size ?? 12,
        heroTag = heroTag ?? 'avatar_default';

  @override
  Widget build(BuildContext context) {
    // Generate truly unique tag by combining heroTag with widget properties
    final uniqueTag = heroTag == 'avatar_default'
        ? 'avatar_${imageUrl.hashCode}_${statusColor.value}_${size.hashCode}_${key.hashCode}'
        : heroTag;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          _ImagePreviewRoute(imageUrl, uniqueTag),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Hero(
            tag: uniqueTag,
            child: CircleAvatar(
              radius: 2 * size,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          if (statusColor != Colors.transparent)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ImagePreviewScreen extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const ImagePreviewScreen(this.imageUrl, this.heroTag, {super.key});

  @override
  Widget build(BuildContext context) {
    final double side = MediaQuery.of(context).size.width * 0.85;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(), // Dismiss on tap outside
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: Center(
            child: GestureDetector(
              onTap: () {}, // Prevent dismissal when tapping the image
              child: Hero(
                tag: heroTag,
                child: SizedBox(
                  width: side,
                  height: side,
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ImagePreviewRoute extends PageRouteBuilder {
  _ImagePreviewRoute(this._imageUrl, this._heroTag)
      : super(
    transitionDuration: const Duration(milliseconds: 550),
    pageBuilder: (context, animation, secondaryAnimation) =>
        ImagePreviewScreen(_imageUrl, _heroTag),
    transitionsBuilder: _buildTransition,
  );

  final String _imageUrl;
  final String _heroTag;

  static Widget _buildTransition(
      BuildContext context,
      Animation<double> anim,
      Animation<double> secondary,
      Widget child) {
    final curved = CurvedAnimation(parent: anim, curve: Curves.easeOutCubic);
    return FadeTransition(
      opacity: curved,
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.7, end: 1.0).animate(curved),
        child: child,
      ),
    );
  }
}