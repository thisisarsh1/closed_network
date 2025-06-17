import 'package:closed_network/Components/avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Data/messageScreenData.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Messages',
          style: GoogleFonts.chakraPetch(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          final msg = messageList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: const Color(0xFF1C1C1E),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              leading:Avatar(imageUrl: msg.imageUrl,size: 14,),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    msg.name,
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    msg.time,
                    style: GoogleFonts.sora(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                msg.lastMessage,
                style: GoogleFonts.sora(
                  color: msg.isUnread ? Colors.tealAccent : Colors.grey[400],
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                // Navigate to detailed chat view (to be implemented)
              },
            ),
          );
        },
      ),
    );
  }
}