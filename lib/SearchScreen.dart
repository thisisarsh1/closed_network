import 'package:closed_network/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Data/PostData.dart';
import 'Functions/Like/like_bloc.dart';
import 'models/Posts_model.dart';

class ChoiceChipWidget extends StatefulWidget {
  const ChoiceChipWidget({super.key});

  @override
  _ChoiceChipWidgetState createState() => _ChoiceChipWidgetState();
}

class _ChoiceChipWidgetState extends State<ChoiceChipWidget> {
  int? _selectedIndex; // Track the selected index

  final List<String> _options = [
    'Canteen',
    'Labs',
    'Fests',
    'Coding',
    'Workshops',
    'Library',
    'Sports',
    'Hackathons'
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // Set a fixed height for the horizontal list
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List<Widget>.generate(
          _options.length,
              (int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ChoiceChip(
                label: Text(_options[index]),
                selected: _selectedIndex == index,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedIndex = selected ? index : null;
                  });
                },
                selectedColor: Colors.tealAccent,
                backgroundColor: Colors.grey[850],
                labelStyle: TextStyle(
                  color: _selectedIndex == index ? Colors.black : Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(color: Colors.transparent),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class MasonryGridViewWidget extends StatefulWidget {
  const MasonryGridViewWidget({super.key});

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
            // ChoiceChipWidget for categories
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: ChoiceChipWidget(),
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
                          builder: (_) => BlocProvider(
                            create: (context) =>
                                LikeBloc(initialLike: post.likes),
                            child: PostDetailScreen(post: post),
                          ),
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
}
