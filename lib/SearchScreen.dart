import 'package:closed_network/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/Posts_model.dart';
final List<PostModel> posts = [

  PostModel(
    id: '1',
    imageUrl: 'https://images.unsplash.com/photo-1615729947596-a598e5de0ab3?w=800',
    username: 'astro.witch',
    description: 'Stars don’t compete. They shine 🌌',
    likes: 1013,
    comments: 76,
  ),
  PostModel(
    id: '2',
    imageUrl: 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?q=80&w=2948',
    username: 'cloudwalker',
    description: 'Just me and the mountains ⛰️',
    likes: 678,
    comments: 35,
  ),
  PostModel(
    id: '3',
    imageUrl: 'https://images.unsplash.com/photo-1472396961693-142e6e269027?w=800',
    username: 'zeno',
    description: 'Waves of peace.',
    likes: 192,
    comments: 23,
  ),
  PostModel(
    id: '4',
    imageUrl: 'https://images.unsplash.com/photo-1540206395-68808572332f?w=800',
    username: 'techie123',
    description: 'Nature meets tech.',
    likes: 422,
    comments: 18,
  ),
  PostModel(
    id: '5',
    imageUrl: 'https://images.unsplash.com/photo-1586348943529-beaae6c28db9?w=800',
    username: 'vibin.viraat',
    description: 'Sunset vibes only 🌅',
    likes: 865,
    comments: 47,
  ),
  PostModel(
    id: '6',
    imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800',
    username: 'artsy.ali',
    description: 'Painted by the universe.',
    likes: 744,
    comments: 51,
  ),
  PostModel(
    id: '7',
    imageUrl: 'https://images.unsplash.com/photo-1593642634367-d91a135587b5?w=800',
    username: 'dev.junkie',
    description: 'Code & coffee kinda day ☕💻',
    likes: 502,
    comments: 40,
  ),
  PostModel(
    id: '8',
    imageUrl: 'https://images.unsplash.com/photo-1472396961693-142e6e269027?w=800',
    username: 'zeno',
    description: 'Waves of peace.',
    likes: 192,
    comments: 23,
  ),
  PostModel(
    id: '9',
    imageUrl: 'https://images.unsplash.com/photo-1540206395-68808572332f?w=800',
    username: 'techie123',
    description: 'Nature meets tech.',
    likes: 422,
    comments: 18,
  ),
  PostModel(
    id: '10',
    imageUrl: 'https://images.unsplash.com/photo-1586348943529-beaae6c28db9?w=800',
    username: 'vibin.viraat',
    description: 'Sunset vibes only 🌅',
    likes: 865,
    comments: 47,
  ),


];

class MasonryGridViewWidget extends StatefulWidget {
  MasonryGridViewWidget({super.key});

  @override
  State<MasonryGridViewWidget> createState() => _MasonryGridViewWidgetState();
}

class _MasonryGridViewWidgetState extends State<MasonryGridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  style: GoogleFonts.sora(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
            // Masonry Grid
            Expanded(
              child: MasonryGridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PostDetailScreen(post: post),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Hero(
                          tag: post.id,
                          child: Image.network(post.imageUrl, fit: BoxFit.cover),
                        ),
                      ),
                    ),

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZcaNJcoE9hJ20j1K8H7Ml6872NyPN5zaJjQ&s',
    'https://images.unsplash.com/photo-1472396961693-142e6e269027?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fHwy',
    'https://images.unsplash.com/photo-1615729947596-a598e5de0ab3?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fG5hdHVyZXxlbnwwfHwwfHx8Mg%3D%3D',
    'https://images.unsplash.com/photo-1469474968028-56623f02e42e?q=80&w=2948&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1540206395-68808572332f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fG5hdHVyZXxlbnwwfHwwfHx8Mg%3D%3D',
    'https://images.unsplash.com/photo-1586348943529-beaae6c28db9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzZ8fG5hdHVyZXxlbnwwfHwwfHx8Mg%3D%3D',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZcaNJcoE9hJ20j1K8H7Ml6872NyPN5zaJjQ&s',
    'https://images.unsplash.com/photo-1472396961693-142e6e269027?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fHwy',
    'https://images.unsplash.com/photo-1615729947596-a598e5de0ab3?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fG5hdHVyZXxlbnwwfHwwfHx8Mg%3D%3D',
    'https://images.unsplash.com/photo-1469474968028-56623f02e42e?q=80&w=2948&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1540206395-68808572332f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fG5hdHVyZXxlbnwwfHwwfHx8Mg%3D%3D',
    'https://images.unsplash.com/photo-1586348943529-beaae6c28db9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzZ8fG5hdHVyZXxlbnwwfHwwfHx8Mg%3D%3D',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZcaNJcoE9hJ20j1K8H7Ml6872NyPN5zaJjQ&s',
    'https://images.unsplash.com/photo-1472396961693-142e6e269027?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bmF0dXJlfGVufDB8fDB8fHwy',
    'https://images.unsplash.com/photo-1615729947596-a598e5de0ab3?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fG5hdHVyZXxlbnwwfHwwfHx8Mg%3D%3D',
    'https://images.unsplash.com/photo-1469474968028-56623f02e42e?q=80&w=2948&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1540206395-68808572332f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fG5hdHVyZXxlbnwwfHwwfHx8Mg%3D%3D',
    'https://images.unsplash.com/photo-1586348943529-beaae6c28db9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzZ8fG5hdHVyZXxlbnwwfHwwfHx8Mg%3D%3D',
  ];
}
