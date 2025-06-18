import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VoteBTN extends StatefulWidget {
  final int initialVotes;

  const VoteBTN({super.key, required this.initialVotes});

  @override
  State<VoteBTN> createState() => _VoteBTNState();
}

enum VoteType { none, upvoted, downvoted }

class _VoteBTNState extends State<VoteBTN> {
  late int votes;
  VoteType voteType = VoteType.none;

  @override
  void initState() {
    super.initState();
    votes = widget.initialVotes;
  }

  void handleUpvote() {
    setState(() {
      if (voteType == VoteType.upvoted) {
        votes -= 1;
        voteType = VoteType.none;
      } else if (voteType == VoteType.downvoted) {
        votes += 2;
        voteType = VoteType.upvoted;
      } else {
        votes += 1;
        voteType = VoteType.upvoted;
      }
    });
  }

  void handleDownvote() {
    setState(() {
      if (voteType == VoteType.downvoted) {
        votes += 1;
        voteType = VoteType.none;
      } else if (voteType == VoteType.upvoted) {
        votes -= 2;
        voteType = VoteType.downvoted;
      } else {
        votes -= 1;
        voteType = VoteType.downvoted;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_upward,
            color:
            voteType == VoteType.upvoted ? Colors.tealAccent : Colors.grey,
          ),
          onPressed: handleUpvote,
        ),
        Text(
          '$votes',
          style: GoogleFonts.sora(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.arrow_downward,
            color: voteType == VoteType.downvoted
                ? Colors.redAccent
                : Colors.grey,
          ),
          onPressed: handleDownvote,
        ),
      ],
    );
  }
}
