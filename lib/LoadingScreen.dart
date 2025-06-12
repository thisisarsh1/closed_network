import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      body: Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: Colors.white,
          size: 200,
        ),
      ),
    );
  }
}
