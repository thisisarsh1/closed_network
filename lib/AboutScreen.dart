import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_easy_faq/flutter_easy_faq.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  final List<Map<String, String>> faqData = [
    {
      "question": "What is Closed Network?",
      "answer": "Closed Network is a private social platform designed for secure, community-focused communication and content sharing."
    },
    {
      "question": "Who can join the network?",
      "answer": "Only users with verified access credentials or invitations can join. This keeps the environment exclusive and safe."
    },
    {
      "question": "How do I create a post?",
      "answer": "Go to the home screen and tap the post button. You can add text, images, or other content before sliding to confirm."
    },
    {
      "question": "How can I edit my profile?",
      "answer": "Open the drawer menu and tap on 'Profile' to update your name, profile picture, or other personal information."
    },
    {
      "question": "What are communities?",
      "answer": "Communities are interest-based spaces where users can interact, share posts, and participate in discussions."
    },
    {
      "question": "Are my messages private?",
      "answer": "Yes. All chats are end-to-end encrypted and visible only to you and the person you’re communicating with."
    },
    {
      "question": "How do I turn on or off notifications?",
      "answer": "Go to the Settings screen and use the toggle under 'Notifications' to enable or disable alerts."
    },
    {
      "question": "Can I report inappropriate content?",
      "answer": "Yes. Long-press any post and select 'Report' to flag it for review by the moderation team."
    },
    {
      "question": "Is there a way to search for users or posts?",
      "answer": "Use the search icon in the bottom navigation bar to find users, posts, or communities."
    },
    {
      "question": "How do I log out of the app?",
      "answer": "Open the drawer menu, scroll to the bottom, and tap 'Logout' to safely exit your session."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 160, 16, 20),
            children: [
              ...faqData.map((faq) => _buildFAQ(
                question: faq["question"]!,
                answer: faq["answer"]!,
              )),
            ],
          ),
          _buildHeader(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 160,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            border: const Border(
              bottom: BorderSide(color: Colors.tealAccent, width: 0.5),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.info_outline, color: Colors.tealAccent, size: 34),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Closed Network",
                      style: GoogleFonts.chakraPetch(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Frequently Asked Questions about how the app works.",
                      style: GoogleFonts.sora(
                        fontSize: 13.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQ({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF23272A),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF696969), width: 0.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: EasyFaq(
        question: question,
        answer: answer,
        questionTextStyle: GoogleFonts.chakraPetch(
          color: Colors.white,
          fontSize: 17.5,
          fontWeight: FontWeight.w600,
        ),
        anserTextStyle: GoogleFonts.sora(
          color: Colors.grey[300],
          fontSize: 15,
        ),
        expandedIcon: const Icon(Icons.remove, color: Colors.tealAccent),
        collapsedIcon: const Icon(Icons.add, color: Colors.tealAccent),
        backgroundColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}
