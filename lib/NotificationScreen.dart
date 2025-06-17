import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Data/NotificationData.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Notifications',
          style: GoogleFonts.chakraPetch(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => Divider(color: Colors.grey[800], thickness: 0.4),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return InkWell(
            onTap: () {
              // Handle notification tap
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: notif.isRead ? Colors.black : Colors.grey[900],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(notif.imageUrl),
                ),
                title: Text(
                  notif.title,
                  style: GoogleFonts.sora(
                    color: notif.isRead ? Colors.grey[400] : Colors.tealAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  notif.subtitle,
                  style: GoogleFonts.sora(
                    color: Colors.grey[300],
                    fontSize: 13,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(
                  notif.time,
                  style: GoogleFonts.sora(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
