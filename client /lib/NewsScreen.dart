import 'dart:developer';

import 'package:closed_network/Components/StoryAvatar.dart';
import 'package:closed_network/Components/VoteBtn.dart';
import 'package:closed_network/StoryViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Data/NewsData.dart';
import 'Data/StoryData.dart';
import 'Functions/Like/like_bloc.dart';
import 'Functions/Vote/vote_bloc.dart';

class CollegeUpdatesScreen extends StatefulWidget {
  const CollegeUpdatesScreen({super.key});

  @override
  State<CollegeUpdatesScreen> createState() => _CollegeUpdatesScreenState();
}

class _CollegeUpdatesScreenState extends State<CollegeUpdatesScreen> {
  String selectedYear = "4";

  /// Ensures the URL has a scheme and is encoded
  String _safeUrl(String raw) {
    final withScheme = raw.startsWith('http') ? raw : 'https://$raw';
    return Uri.encodeFull(withScheme);
  }

  /// Tries to launch the URL; shows a snackbar if it fails
  Future<void> _openLink(BuildContext ctx, String url) async {
    final uri = Uri.parse(_safeUrl(url));

    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched && ctx.mounted) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(content: Text('Could not open link')),
      );
      log('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredUpdates = updates.where((u) => u.year == selectedYear).toList();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Stories ─────────────────────────────────────────────
          SizedBox(
            height: 125,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: stories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final story = stories[index];
                return SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (_) {
                              return BlocProvider(
                                create: (_) => LikeBloc(initialLike: story.likes),
                                child: StoryViewScreen(
                                  stories: stories,
                                  startIndex: index,
                                ),
                              );
                            },
                          ));
                        },
                        child: StoryAvatar(imageUrl: story.image, size: 35),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 60,
                        child: Text(
                          story.title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(color: Colors.white, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Year filter ──────────────────────────────────────────
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            child: DropdownButton<String>(
              dropdownColor: Colors.grey.shade900,
              value: selectedYear,
              style: GoogleFonts.sora(color: Colors.white),
              underline: const SizedBox.shrink(),
              iconEnabledColor: Colors.tealAccent,
              borderRadius: BorderRadius.circular(12),
              items: ['1', '2', '3', '4'].map((year) {
                return DropdownMenuItem(value: year, child: Text('$year Year'));
              }).toList(),
              onChanged: (val) => setState(() => selectedYear = val!),
            ),
          ),

          // Updates list ────────────────────────────────────────
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: filteredUpdates.length,
              itemBuilder: (context, index) {
                final update = filteredUpdates[index];

                return Card(
                  color: const Color(0xFF1A1A1A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          update.title,
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          update.description,
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            BlocProvider(
                              key: ValueKey('$selectedYear-$index'),
                              create: (_) => VoteBloc(votes: update.votes.toDouble()),
                              child: const VoteBTN(),
                            ),
                            const Spacer(),
                            if (update.isDownload)
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.tealAccent,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () => _openLink(context, update.link!),
                                child: Text(
                                  "Download Now",
                                  style: GoogleFonts.sora(fontSize: 13),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
