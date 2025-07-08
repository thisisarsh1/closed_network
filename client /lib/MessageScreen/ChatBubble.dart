import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:voice_message_package/voice_message_package.dart';

import 'MessageModel.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (message.message != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(30)),
            child: Text(message.message!,
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
          )
        ],
        if (message.photo != null) ...[
          Container(
              height: 230,
              width: 230,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover,
                ),
              ))
        ],
        if (message.audio != null) ...[
          // VoiceMessageView(
          //   backgroundColor: Colors.grey.withOpacity(0.1),
          //   circlesColor: Colors.blue,
          //   activeSliderColor: Colors.blue,
          //   notActiveSliderColor: Colors.transparent,
          //   controller: VoiceController(
          //     maxDuration: const Duration(seconds: 10),
          //     isFile: false,
          //     onComplete: () {},
          //     onPause: () {},
          //     onPlaying: () {},
          //     onError: (err) {},
          //   ),
          //   innerPadding: 12,
          //   cornerRadius: 20,
          // ),
        ]
      ],
    );
  }
}
