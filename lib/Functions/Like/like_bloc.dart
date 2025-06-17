import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc({required int initialLike,bool initialIsLiked =false})
      : super(LikeInitial(like: initialLike, isLiked: false)) {
    on<LikePressed>((event, emit) {
      if (state is LikeInitial) {
        final current = state as LikeInitial;
        final newIsLiked = !current.isLiked;
        final newLikeCount = newIsLiked ? current.like + 1 : current.like - 1;

        emit(LikeInitial(like: newLikeCount, isLiked: newIsLiked));
      }
    });
  }
}
