import 'package:closed_network/Components/StoryAvatar.dart';
import 'package:closed_network/Components/VoteBtn.dart';
import 'package:closed_network/StoryViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
  String selectedYear = "1";

  @override
  Widget build(BuildContext context) {
    final filteredUpdates = updates.where((u) => u.year == selectedYear).toList();

    return Scaffold(
      backgroundColor: Colors.black,

      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Stories
        SizedBox(
        height: 125, // Total available height
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          itemCount: stories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final story = stories[index];
            return SizedBox(
              height: 100, // keep this < 125 minus padding
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [InkWell(

                  child: StoryAvatar(imageUrl: story.image, size: 35),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return BlocProvider(
  create: (context) => LikeBloc(initialLike: story.likes),
  child: StoryViewScreen(stories: stories,startIndex:stories.indexOf(story),),
);
                    },));
                  },
                ),
                   // size tweaked to fit
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 60,
                    child: Text(
                      story.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sora(color: Colors.white, fontSize: 11),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )

      ,


          // Dropdown filter
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            child: DropdownButton<String>(
              dropdownColor: Colors.grey.shade900,
              value: selectedYear,
              style: GoogleFonts.sora(color: Colors.white),
              underline: Container(),
              iconEnabledColor: Colors.tealAccent,
              borderRadius: BorderRadius.circular(12),
              items: ['1', '2', '3', '4'].map((String year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text('$year Year'),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedYear = val!;
                });
              },
            ),
          ),

          // Updates List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: filteredUpdates.length,
              itemBuilder: (context, index) {
                final update = filteredUpdates[index];
                return Card(
                  color: const Color(0xFF1A1A1A),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(update.title,
                            style: GoogleFonts.sora(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const SizedBox(height: 6),
                        Text(update.description,
                            style: GoogleFonts.sora(fontSize: 14, color: Colors.white70)),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                           BlocProvider(
  create: (context) => VoteBloc( votes: 10),
  child: VoteBTN(initialVotes: 9),
),
                            const Spacer(),
                            if (update.isEvent)
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.tealAccent,
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {},
                                child: Text("Join Now",
                                    style: GoogleFonts.sora(fontSize: 13)),
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
