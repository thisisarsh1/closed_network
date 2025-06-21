import 'package:closed_network/Functions/Vote/vote_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    context.read<VoteBloc>().add(UpVoted());
  }

  void handleDownvote() {
    context.read<VoteBloc>().add(DownVoted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoteBloc, VoteState>(
      builder: (context, state) {
        final currentState  = state as VoteInitial;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_upward,
                color: currentState.UpVoted ? Colors.tealAccent : Colors
                    .grey,
              ),
              onPressed: handleUpvote,
            ),
            Text(
              "${currentState.Votes.toInt() }",
              style: GoogleFonts.sora(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_downward,
                color: currentState.DownVoted
                    ? Colors.redAccent
                    : Colors
                    .grey,
              ),
              onPressed: handleDownvote,
            ),
          ],

        );
      },
    );
  }
}
