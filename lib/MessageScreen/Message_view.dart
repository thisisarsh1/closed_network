// message_viewer.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ChatBubble.dart';
import 'MessageModel.dart';

class MessageViewer extends StatelessWidget {
  const MessageViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: const BackButton(color: Colors.white),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              '1000 WAYS TO DIE',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.info_outline, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      body: ListView.separated(
        reverse: true,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
        itemBuilder: (context, index) {
          return ChatBubble(message: messages[index]);
        },
        itemCount: messages.length,
      ),
      bottomSheet: const MessageSheet(),
    );
  }
}

class MessageSheet extends StatefulWidget {
  const MessageSheet({super.key});

  @override
  State<MessageSheet> createState() => _MessageSheetState();
}

class _MessageSheetState extends State<MessageSheet> {
  final FocusNode _focus = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.image, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.gif, color: Colors.white),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focus,
              style: GoogleFonts.sora(
                color: Colors.white, // Set text color to white
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: 'Start a message',
                hintStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey, // Hint text color
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: InputBorder.none,
              ),
            ),

          ),
          IconButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                // Handle sending the message
                _controller.clear();
              }
            },
            icon: const Icon(Icons.send, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
