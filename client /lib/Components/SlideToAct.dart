import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideToActWidget extends StatefulWidget {
  final Future<void> Function() onSubmit;
  final String text;
  final bool enabled;

  const SlideToActWidget({
    super.key,
    required this.onSubmit,
    required this.text,
    required this.enabled,
  });

  @override
  State<SlideToActWidget> createState() => _SlideToActWidgetState();
}

class _SlideToActWidgetState extends State<SlideToActWidget> {
  final GlobalKey<SlideActionState> _slideActionKey = GlobalKey<SlideActionState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SlideAction(
        key: _slideActionKey,
        enabled: widget.enabled,
        text: widget.text,
        textColor: Colors.black,
        innerColor: Colors.white,
        outerColor: Colors.tealAccent[700],
        sliderButtonIcon: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        onSubmit: () async {
          await widget.onSubmit(); // ✅ Now it calls the passed function
        },
      ),
    );
  }
}
