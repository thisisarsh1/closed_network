import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:closed_network/Components/avatar.dart';

import 'EditProfile.dart';



class Profile extends StatelessWidget {
   Profile({super.key});

  final Map<String, dynamic> userProfile = const {
    'name': 'Rehbar Khan',
    'handle': '@rehbarkhan',
    'bio': 'Builder @ Learno | Co-founder | Web3 Dev | Flutter & AI enthusiast',
    'location': 'India',
    'website': 'https://rehbarkhan.dev',
    'joinDate': 'Joined August 2020',
    'following': 340,
    'followers': 1120,
    'profileImageUrl': 'https://i.imgur.com/6VBx3io.png',
    'coverImageUrl': 'https://images.unsplash.com/photo-1503264116251-35a269479413?auto=format&fit=crop&w=1400&q=80',
  };

  final List<Map<String, String>> posts = List.generate(
    20,
        (index) => {
      'text': 'This is a sample post #${index + 1} by Rehbar Khan. Flutter is 🔥.',
      'timestamp': '2h ago',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            floating: false,
            pinned: true,
            backgroundColor: Colors.black,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Stack(
                children: [
                  Image.network(
                    userProfile['coverImageUrl'],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black87],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Avatar(size: 20,),

                  ),
                ],
              ),
            ),
          ),

          // Profile Info
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userProfile['name'],
                              style: GoogleFonts.chakraPetch(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              userProfile['handle'],
                              style: GoogleFonts.sora(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return EditProfilePage(initialData: userProfile,);
                          },));
                        },
                        icon: const Icon(Icons.edit, size: 16, color: Colors.white),
                        label: Text(
                          "Edit",
                          style: GoogleFonts.sora(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          backgroundColor: const Color(0xFF1A1A1A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 10),
                  Text(
                    userProfile['bio'],
                    style: GoogleFonts.sora(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        userProfile['location'],
                        style: GoogleFonts.sora(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.link, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        userProfile['website'],
                        style: GoogleFonts.sora(fontSize: 14, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    userProfile['joinDate'],
                    style: GoogleFonts.sora(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Text(
                        '${userProfile['following']} Following',
                        style: GoogleFonts.sora(fontSize: 15, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '${userProfile['followers']} Followers',
                        style: GoogleFonts.sora(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Divider(indent: 0,endIndent: 0,color: Colors.white,height: 0.5,)
                ],

              ),

            ),

          ),

          // Posts
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final post = posts[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 16,
                              backgroundImage: NetworkImage('https://i.imgur.com/6VBx3io.png'),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              userProfile['name'],
                              style: GoogleFonts.sora(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              userProfile['handle'],
                              style: GoogleFonts.sora(color: Colors.grey, fontSize: 13),
                            ),
                            const Spacer(),
                            Text(
                              post['timestamp']!,
                              style: GoogleFonts.sora(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post['text']!,
                          style: GoogleFonts.sora(color: Colors.white, fontSize: 14),
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
}
