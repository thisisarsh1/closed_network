import 'package:closed_network/Components/LikeBtn.dart';
import 'package:closed_network/Components/avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
final List<Map<String, dynamic>> dummyPosts = [
  {
    'username': 'LunaChaser',
    'handle': '@luna_chase',
    'time': '2h',
    'text': 'Feeling the cosmic vibes ✨🌌 #ClosedNetwork',
    'image': 'https://picsum.photos/id/1011/400/200',
    'likes': 120,
    'comments': 35,
    'reposts': 10,
  },
  {
    'username': 'NeonSynth',
    'handle': '@neonsynthwave',
    'time': '1h',
    'text': 'This UI slaps fr 🤯🔥 #GenZDesign',
    'image': 'https://picsum.photos/id/1012/400/200',
    'likes': 89,
    'comments': 12,
    'reposts': 6,
  },
  {
    'username': 'TechSorcerer',
    'handle': '@theaiwizard',
    'time': '3h',
    'text': 'Flutter + TealAccent = perfection 😤 #ClosedNetwork',
    'image': 'https://picsum.photos/id/1013/400/200',
    'likes': 42,
    'comments': 9,
    'reposts': 3,
  },
  {
    'username': 'PixelDaze',
    'handle': '@pixelateddream',
    'time': '5h',
    'text': 'Mood board just got an upgrade 🚀📱',
    'image': 'https://picsum.photos/id/1014/400/200',
    'likes': 60,
    'comments': 20,
    'reposts': 4,
  },
  {
    'username': 'EchoNova',
    'handle': '@echonova',
    'time': '1d',
    'text': 'Y’all seen the new Closed Network drop? 👀🔥',
    'image': 'https://picsum.photos/id/1015/400/200',
    'likes': 150,
    'comments': 25,
    'reposts': 8,
  },
  {
    'username': 'CodeFairy',
    'handle': '@flutterfairy',
    'time': '6h',
    'text': 'Widget trees > Real trees 🪵😂',
    'image': 'https://picsum.photos/id/1016/400/200',
    'likes': 70,
    'comments': 18,
    'reposts': 5,
  },
  {
    'username': 'SynthTide',
    'handle': '@synthytide',
    'time': '9h',
    'text': 'Closed Network > Twitter any day 💅🏽',
    'image': 'https://picsum.photos/id/1017/400/200',
    'likes': 99,
    'comments': 11,
    'reposts': 7,
  },
  {
    'username': 'ByteMeNot',
    'handle': '@bitSnacc',
    'time': '7h',
    'text': 'Caught feelings... for this UI 😍',
    'image': 'https://picsum.photos/id/1018/400/200',
    'likes': 115,
    'comments': 19,
    'reposts': 12,
  },
  {
    'username': 'QuantumQueen',
    'handle': '@quantumcutie',
    'time': '4h',
    'text': 'Reality check: still scrolling 🌀',
    'image': 'https://picsum.photos/id/1019/400/200',
    'likes': 80,
    'comments': 16,
    'reposts': 4,
  },
  {
    'username': 'CloudShifter',
    'handle': '@cloudshifted',
    'time': '30m',
    'text': 'Caught between pixels and dreams 🖤',
    'image': 'https://picsum.photos/id/1020/400/200',
    'likes': 55,
    'comments': 13,
    'reposts': 2,
  },
];class HomePosts extends StatelessWidget {
  const HomePosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: dummyPosts.length,
        itemBuilder: (context, index) {
          final post = dummyPosts[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Avatar(),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post['username'],
                                style: GoogleFonts.sora(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${post['handle']} · ${post['time']}',
                                style: GoogleFonts.sora(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        post['text'],
                        style: GoogleFonts.sora(
                          color: Colors.grey[300],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          post['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const LikeButton(),
                              const SizedBox(width: 4),
                              Text(
                                '${post['likes']}',
                                style: GoogleFonts.sora(
                                  fontSize: 13,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.chat_bubble_outline, color: Colors.tealAccent, size: 18),
                              const SizedBox(width: 4),
                              Text(
                                '${post['comments']}',
                                style: GoogleFonts.sora(
                                  fontSize: 13,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.repeat, color: Colors.tealAccent, size: 18),
                              const SizedBox(width: 4),
                              Text(
                                '${post['reposts']}',
                                style: GoogleFonts.sora(
                                  fontSize: 13,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.share_outlined, color: Colors.tealAccent),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey, // Color of the divider
                thickness: 0.5, // Thickness of the divider
                indent: 0, // Indent from the left
                endIndent: 0, // Indent from the right
              ),
            ],
          );
        },
      ),
    );
  }
}
