import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CommunityDetailsPage extends StatefulWidget {
  final Map<String, dynamic> community;

  const CommunityDetailsPage({super.key, required this.community});

  @override
  State<CommunityDetailsPage> createState() => _CommunityDetailsPageState();
}

class _CommunityDetailsPageState extends State<CommunityDetailsPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  bool _isJoined = false;

  final Map<String, dynamic> _mockData = {
    "announcements": [
      {
        "id": "1",
        "title": "Community Milestone Reached",
        "description":
        "We've successfully grown to over 1000 active members contributing to meaningful discussions.",
        "timestamp": "2024-01-15",
        "priority": "high"
      },
      {
        "id": "2",
        "title": "New Discussion Guidelines",
        "description":
        "Updated community guidelines to ensure better quality discussions and engagement.",
        "timestamp": "2024-01-10",
        "priority": "medium"
      }
    ],
    "discussions": [
      {
        "id": "1",
        "title": "Best practices for mobile app architecture",
        "author": "Sarah Chen",
        "replies": 24,
        "lastActive": "2h ago",
        "tags": ["architecture", "mobile"]
      },
      {
        "id": "2",
        "title": "State management comparison in Flutter",
        "author": "Mike Johnson",
        "replies": 18,
        "lastActive": "4h ago",
        "tags": ["flutter", "state-management"]
      },
      {
        "id": "3",
        "title": "AI integration strategies for developers",
        "author": "Alex Rodriguez",
        "replies": 31,
        "lastActive": "6h ago",
        "tags": ["ai", "development"]
      }
    ],
    "contributors": [
      {
        "id": "1",
        "name": "Sarah Chen",
        "contributions": 142,
        "rank": 1,
        "avatar": "SC"
      },
      {
        "id": "2",
        "name": "Mike Johnson",
        "contributions": 128,
        "rank": 2,
        "avatar": "MJ"
      },
      {
        "id": "3",
        "name": "Alex Rodriguez",
        "contributions": 115,
        "rank": 3,
        "avatar": "AR"
      }
    ]
  };

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCommunityHeader(),
                  const SizedBox(height: 32),
                  _buildStatsSection(),
                  const SizedBox(height: 40),
                  _buildAnnouncementsSection(),
                  const SizedBox(height: 40),
                  _buildDiscussionsSection(),
                  const SizedBox(height: 40),
                  _buildContributorsSection(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildJoinButton(),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.community['name'],
          style: GoogleFonts.sora(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              widget.community['image'],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[900],
                  child: const Icon(Icons.image, color: Colors.grey, size: 64),
                );
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityHeader() {
    return FadeTransition(
      opacity: _fadeController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: (widget.community['tags'] as List)
                .map<Widget>(
                  (tag) => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey[800]!),
                ),
                child: Text(
                  tag,
                  style: GoogleFonts.sora(
                    color: Colors.grey[300],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
                .toList(),
          ),
          const SizedBox(height: 20),
          Text(
            "About",
            style: GoogleFonts.sora(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.community['description'],
            style: GoogleFonts.sora(
              color: Colors.grey[400],
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    final stats = [
      {
        'icon': Icons.group,
        'label': 'Members',
        'value': widget.community['members'].toString()
      },
      {'icon': Icons.chat_bubble_outline, 'label': 'Discussions', 'value': '156'},
      {'icon': Icons.radio_button_checked, 'label': 'Online', 'value': '42'},
    ];

    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: _slideController, curve: Curves.easeOut),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[950],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[800]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: stats
              .map(
                (stat) => _buildStatItem(
              stat['icon'] as IconData,
              stat['label'] as String,
              stat['value'] as String,
            ),
          )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.tealAccent),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.sora(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.sora(
            color: Colors.grey[500],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildAnnouncementsSection() {
    return _buildSection(
      "Announcements",
      Icons.campaign,
      (_mockData['announcements'] as List)
          .map((announcement) => _buildAnnouncementCard(announcement))
          .toList(),
      onSeeAll: () => _navigateToFullList("Announcements"),
    );
  }

  Widget _buildDiscussionsSection() {
    return _buildSection(
      "Recent Discussions",
      Icons.forum,
      (_mockData['discussions'] as List)
          .take(3)
          .map((discussion) => _buildDiscussionCard(discussion))
          .toList(),
      onSeeAll: () => _navigateToFullList("Discussions"),
    );
  }

  Widget _buildContributorsSection() {
    return _buildSection(
      "Top Contributors",
      Icons.leaderboard,
      (_mockData['contributors'] as List)
          .map((contributor) => _buildContributorCard(contributor))
          .toList(),
      showSeeAll: false,
    );
  }

  Widget _buildSection(String title, IconData icon, List<Widget> children,
      {VoidCallback? onSeeAll, bool showSeeAll = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.tealAccent, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: GoogleFonts.sora(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            if (showSeeAll)
              TextButton(
                onPressed: onSeeAll,
                child: Text(
                  "See All",
                  style: GoogleFonts.sora(
                    color: Colors.tealAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        ...children.map(
              (child) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: child,
          ),
        ),
      ],
    );
  }

  Widget _buildAnnouncementCard(Map<String, dynamic> announcement) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[950],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[800]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 16,
                decoration: BoxDecoration(
                  color: announcement['priority'] == 'high'
                      ? Colors.red
                      : Colors.orange,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  announcement['title'],
                  style: GoogleFonts.sora(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              Text(
                announcement['timestamp'],
                style: GoogleFonts.sora(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              announcement['description'],
              style: GoogleFonts.sora(
                color: Colors.grey[400],
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 200.ms).slideY(begin: 0.1);
  }

  Widget _buildDiscussionCard(Map<String, dynamic> discussion) {
    return InkWell(
      onTap: () => _navigateToDiscussion(discussion),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[950],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[800]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              discussion['title'],
              style: GoogleFonts.sora(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "by ${discussion['author']}",
                  style: GoogleFonts.sora(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Icon(Icons.chat_bubble_outline,
                    size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  "${discussion['replies']}",
                  style: GoogleFonts.sora(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  discussion['lastActive'],
                  style: GoogleFonts.sora(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 300.ms).slideY(begin: 0.1);
  }

  Widget _buildContributorCard(Map<String, dynamic> contributor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[950],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[800]!),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.tealAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.tealAccent.withOpacity(0.3)),
            ),
            child: Center(
              child: Text(
                contributor['avatar'],
                style: GoogleFonts.sora(
                  color: Colors.tealAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contributor['name'],
                  style: GoogleFonts.sora(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${contributor['contributions']} contributions",
                  style: GoogleFonts.sora(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: contributor['rank'] == 1
                  ? Colors.amber.withOpacity(0.1)
                  : Colors.grey[800],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "#${contributor['rank']}",
              style: GoogleFonts.sora(
                color:
                contributor['rank'] == 1 ? Colors.amber : Colors.grey[400],
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 400.ms).slideY(begin: 0.1);
  }

  Widget _buildJoinButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: FloatingActionButton.extended(
        backgroundColor: _isJoined ? Colors.grey[800] : Colors.tealAccent,
        foregroundColor: _isJoined ? Colors.white : Colors.black,
        onPressed: () {
          setState(() {
            _isJoined = !_isJoined;
          });
        },
        icon: Icon(_isJoined ? Icons.check : Icons.add),
        label: Text(
          _isJoined ? "Applied" : "Apply",
          style: GoogleFonts.sora(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _navigateToFullList(String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AllItemsPage(title: title, data: _mockData),
      ),
    );
  }

  void _navigateToDiscussion(Map<String, dynamic> discussion) {
    // Navigate to individual discussion
    print("Navigate to discussion: ${discussion['title']}");
  }
}

class AllItemsPage extends StatelessWidget {
  final String title;
  final Map<String, dynamic> data;

  const AllItemsPage({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: GoogleFonts.sora(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: title == "Announcements"
            ? (data['announcements'] as List).length
            : (data['discussions'] as List).length,
        itemBuilder: (context, index) {
          if (title == "Announcements") {
            final announcement = (data['announcements'] as List)[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[950],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[800]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    announcement['title'],
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    announcement['description'],
                    style: GoogleFonts.sora(
                      color: Colors.grey[400],
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            );
          } else {
            final discussion = (data['discussions'] as List)[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[950],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[800]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discussion['title'],
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "by ${discussion['author']} • ${discussion['replies']} replies",
                    style: GoogleFonts.sora(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
