part of 'vote_bloc.dart';

@immutable
sealed class VoteEvent {}
class UpVoted extends VoteEvent{}
class DownVoted extends VoteEvent{}