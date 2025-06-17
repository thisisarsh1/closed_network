part of 'like_bloc.dart';

@immutable
sealed class LikeState {}

final class LikeInitial extends LikeState {
  final int like;
  final bool isLiked;
  LikeInitial({required this.isLiked, required this.like});
}
