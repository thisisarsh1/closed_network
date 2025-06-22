import 'package:closed_network/Components/LikeBtn.dart';
import 'package:closed_network/Components/TapLike.dart';
import 'package:closed_network/Components/avatar.dart';
import 'package:closed_network/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CreatePostScreen.dart';
import 'Functions/Like/like_bloc.dart';
import 'SearchScreen.dart';
import 'Data/PostData.dart';

class HomePosts extends StatelessWidget {
  const HomePosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CreatePostScreen(),
            ),
          );
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Colors.tealAccent, Colors.cyanAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 25,
                spreadRadius: 7,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ).animate().scale(duration: 300.ms).fadeIn(),




      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return BlocProvider(
            create: (context) => LikeBloc(initialLike: post.likes),
            child: Column(
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



                        TapLike(
                          image: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostDetailScreen(post: post),
                                  ),
                                );
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Skeleton
                                  Container(
                                    width: double.infinity,

                                    decoration: BoxDecoration(
                                      color: Colors.grey[900],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  )
                                      .animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1.2.seconds)
                                      .fadeIn(duration: 400.ms),

                                  // Image with fade animation
                                  Image.network(
                                    post.imageUrl,
                                    width: double.infinity,

                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return AnimatedSwitcher(
                                          duration: 500.ms,
                                          child: child,
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),


                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                LikeBtn(initialLikes: post.likes),
                                const SizedBox(width: 4),

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
                            Icon(
                                Icons.share_outlined, color: Colors.tealAccent),
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
            ),
          );
        },
      ),
    );
  }
}
