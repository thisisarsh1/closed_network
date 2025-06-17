import 'package:closed_network/Components/LikeBtn.dart';
import 'package:closed_network/Components/TapLike.dart';
import 'package:closed_network/Components/avatar.dart';
import 'package:closed_network/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

import 'SearchScreen.dart';
import 'Data/PostData.dart';

class HomePosts extends StatelessWidget {
  const HomePosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 0,
                ),
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
                                post.username,
                                style: GoogleFonts.chakraPetch(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${post.handle} ·',
                                    style: GoogleFonts.sora(
                                      color: Colors.tealAccent,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    ' ${post.time}',
                                    style: GoogleFonts.sora(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        post.description,
                        style: GoogleFonts.sora(
                          color: Colors.grey[300],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // TapLike(
                      //   image: ClipRRect(
                      //     borderRadius: BorderRadius.circular(12),
                      //     child: Image.network(
                      //       post.imageUrl,
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      //
                      //   onLike: () {},
                      // ),

                      TapLike(
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PostDetailScreen(post: post),
                                ),
                              );
                            },

                            child: Image.network(
                              post.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onLike: () {

                        },
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
                                '${post.likes}',
                                style: GoogleFonts.sora(
                                  fontSize: 13,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.tealAccent,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${post.comments}',
                                style: GoogleFonts.sora(
                                  fontSize: 13,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.repeat,
                                color: Colors.tealAccent,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${post.reposts}',
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
                color: Colors.grey,
                thickness: 0.5,
                indent: 0,
                endIndent: 0,
              ),
            ],
          );
        },
      ),
    );
  }
}
