import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CommunityDetailsPage extends StatelessWidget {
  final Map<String, dynamic> community;

  const CommunityDetailsPage({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                community['name'],
                style: GoogleFonts.sora(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Image.network(
                community['image'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tags
                  Wrap(
                    spacing: 8,
                    children: community['tags']
                        .map<Widget>((tag) => Chip(
                      label: Text(tag),
                      backgroundColor: Colors.grey[850],
                      labelStyle: GoogleFonts.sora(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                    ))
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                  // About
                  _sectionTitle("About"),
                  const SizedBox(height: 8),
                  Text(
                    community['description'],
                    style: GoogleFonts.sora(
                      color: Colors.grey[300],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStat(Icons.group_outlined, "Members",
                          community['members'].toString()),
                      _buildStat(Icons.post_add_outlined, "Posts", "142"),
                      _buildStat(Icons.circle, "Online", "35"),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Announcements
                  _buildSectionWithSeeAll(
                      context, "📢 Announcements", _buildAnnouncements()),
                  const SizedBox(height: 28),
                  // Discussions
                  _buildSectionWithSeeAll(
                      context, "💬 Discussions", _buildDiscussions()),
                  const SizedBox(height: 28),
                  // Contributors
                  _sectionTitle("🏆 Top Contributors"),
                  _buildLeaderBoard(),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.tealAccent,
        foregroundColor: Colors.black,
        onPressed: () {
          // Navigate to chat
        },
        icon: const Icon(Icons.forum_outlined),
        label: const Text("Discuss"),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.sora(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildStat(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 22, color: Colors.tealAccent),
        const SizedBox(height: 4),
        Text(
          value,
          style: GoogleFonts.sora(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.sora(
            color: Colors.white60,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionWithSeeAll(
      BuildContext context, String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _sectionTitle(title),
            TextButton(
              onPressed: () {
                // Navigate to a page showing all items
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllItemsPage(title: title),
                  ),
                );
              },
              child: Text(
                "See All",
                style: GoogleFonts.sora(
                  color: Colors.tealAccent,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }

  Widget _buildAnnouncements() {
    final announcements = [
      {
        'title': "🎉 1K+ Members!",
        'desc': "Thanks to all of you, we've reached an amazing milestone. Keep growing!"
      },
      {
        'title': "🚀 New GenAI Group",
        'desc': "Join the GenAI sub-community to explore and build with AI & ML tools."
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: announcements.map((a) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  a['title']!,
                  style: GoogleFonts.sora(
                    color: Colors.tealAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  a['desc']!,
                  style: GoogleFonts.sora(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 500.ms).slideX(begin: 0.1);
        }).toList(),
      ),
    );
  }

  Widget _buildDiscussions() {
    final discussions = [
      {
        'title': "Tips for mastering Flutter animations?",
        'author': "Rehan"
      },
      {
        'title': "Gen AI tools for mobile apps?",
        'author': "Zara"
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: discussions.map((d) {
          return InkWell(
            onTap: () {
              // Navigate to full discussion
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const Icon(Icons.chat_bubble_outline,
                      color: Colors.tealAccent),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          d['title']!,
                          style: GoogleFonts.sora(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "by ${d['author']}",
                          style: GoogleFonts.sora(
                            color: Colors.white60,
                            fontSize: 11.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.white30, size: 16),
                ],
              ),
            ),
          ).animate().fadeIn(duration: 500.ms).slideX(begin: 0.1);
        }).toList(),
      ),
    );
  }

  Widget _buildLeaderBoard() {
    final contributors = [
      {'name': 'Riya', 'contributions': 124},
      {'name': 'Rahul', 'contributions': 110},
      {'name': 'Megha', 'contributions': 95},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: contributors.map((c) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                const Icon(Icons.emoji_events_outlined,
                    color: Colors.tealAccent),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "${c['name']}",
                    style: GoogleFonts.sora(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),
                Text(
                  "${c['contributions']} pts",
                  style: GoogleFonts.sora(
                    color: Colors.white60,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 500.ms).slideX(begin: 0.1);
        }).toList(),
      ),
    );
  }
}

class AllItemsPage extends StatelessWidget {
  final String title;

  const AllItemsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text("Page for all $title"),
      ),
    );
  }
}
