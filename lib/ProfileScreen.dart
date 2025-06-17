import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'models/UserModel.dart';
import 'EditProfile.dart';
import 'Components/avatar.dart';
import 'Data/UserData.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final List<Map<String, String>> posts = List.generate(
    8,
        (index) =>
    {
      'text': 'This is a sample post #${index +
          1} by Rehbar Khan. Flutter is 🔥.',
      'timestamp': '${index + 1}h ago',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          // Cover & Profile Image Stack
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Image.network(
                  user.coverImageUrl,
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 12,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Avatar(imageUrl: user.profileImageUrl, size: 20),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 20,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.tealAccent),
                      backgroundColor: Colors.black.withOpacity(0.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: Icon(Icons.edit, color: Colors.tealAccent, size: 18),
                    label: Text(
                      "Edit Profile",
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.tealAccent,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              EditProfilePage(initialData: {
                                'name': user.name,
                                'handle': user.handle,
                                'bio': user.bio,
                                'location': user.location,
                                'website': user.website,
                                'profileImageUrl': user.profileImageUrl,
                                'coverImageUrl': user.coverImageUrl,
                              }),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Name, Handle, Stats, Bio, Meta Info
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: GoogleFonts.chakraPetch(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    user.handle,
                    style: GoogleFonts.sora(fontSize: 15, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user.bio,
                    style: GoogleFonts.sora(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(user.location,
                          style: GoogleFonts.sora(
                              fontSize: 14, color: Colors.grey)),
                      const SizedBox(width: 12),
                      Icon(Icons.link, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        user.website,
                        style: GoogleFonts.sora(
                            fontSize: 14, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Joined ${DateFormat('MMMM yyyy').format(user.joinDate)}',
                    style: GoogleFonts.sora(color: Colors.grey, fontSize: 13),
                  ),
                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${user.following}',
                            style: GoogleFonts.sora(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Following',
                            style: GoogleFonts.sora(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${user.followers}',
                            style: GoogleFonts.sora(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Followers',
                            style: GoogleFonts.sora(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildPopularityIndicator(user.followers, user.following),
                          Text(
                            'Popularity',
                            style: GoogleFonts.sora(fontSize: 13, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Divider(color: Colors.grey.shade800),
                ],
              ),
            ),
          ),

          // Posts List
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final post = posts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage(
                                  user.profileImageUrl),
                            ),
                            const SizedBox(width: 10),
                            Text(user.name,
                                style: GoogleFonts.sora(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 6),
                            Text(user.handle,
                                style: GoogleFonts.sora(
                                    color: Colors.grey.shade500, fontSize: 13)),
                            const Spacer(),
                            Text(post['timestamp']!,
                                style: GoogleFonts.sora(
                                    color: Colors.grey.shade500, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post['text']!,
                          style: GoogleFonts.sora(color: Colors.white,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularityIndicator(int followers, int following) {
    if (following == 0) return const SizedBox(); // Prevent divide-by-zero

    double score = (followers / following) * 100;
    double delta = 2.5; // Example: Replace with actual dynamic logic if needed
    bool isPositive = delta >= 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [

          Row(
            children: [
              Icon(
                isPositive ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: isPositive ? Colors.greenAccent : Colors.redAccent,
                size: 20,
              ),
              Text(
                '${delta.abs().toStringAsFixed(1)}%',
                style: GoogleFonts.sora(
                  fontSize: 13,
                  color: isPositive ? Colors.greenAccent : Colors.redAccent,
                ),
              ),
            ],
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.info_outline,
            size: 15,
            color: Colors.grey.shade500,
          ),
        ],
      ),
    );
  }
}