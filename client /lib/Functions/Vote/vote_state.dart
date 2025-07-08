part of 'vote_bloc.dart';

@immutable
sealed class VoteState {}

final class VoteInitial extends VoteState {
  final bool UpVoted;
  final bool DownVoted;
  final double Votes;

  VoteInitial({required this.Votes, required this.DownVoted, required this.UpVoted});

}
