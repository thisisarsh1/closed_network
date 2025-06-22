import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc({required int initialLike,bool initialIsLiked =false})
      : super(LikeInitial(like: initialLike, isLiked: false)) {
    on<LikePressed>((event, emit) {
      final current = state as LikeInitial;

      if (state is LikeInitial&&!current.isLiked) {
        final current = state as LikeInitial;
        final newIsLiked = !current.isLiked;
        final newLikeCount = current.like + 1;

        emit(LikeInitial(like: newLikeCount, isLiked: newIsLiked));
      }
      else if (state is LikeInitial&&current.isLiked){
        emit(LikeInitial(like: current.like-1, isLiked: !current.isLiked));

      }
    });

  }
}
