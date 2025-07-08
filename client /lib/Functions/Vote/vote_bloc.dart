import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'vote_event.dart';
part 'vote_state.dart';

class VoteBloc extends Bloc<VoteEvent, VoteState> {
  VoteBloc({required double votes}) : super(VoteInitial(DownVoted:false, UpVoted: false, Votes: votes)) {
    on<UpVoted>((event, emit) {
    final currentState = state as VoteInitial;
    if(currentState.DownVoted==true){
      final currentvotes = currentState.Votes+2;
      emit(VoteInitial(Votes: currentvotes, DownVoted: false, UpVoted: true));
    }
    else if(currentState.DownVoted==false&&currentState.UpVoted==false){
      final currentvotes = currentState.Votes+1;
      emit(VoteInitial(Votes: currentvotes, DownVoted: false, UpVoted: true));

    }
    else if(currentState.UpVoted==true) {
      final currentvotes = currentState.Votes-1;
      emit(VoteInitial(Votes: currentvotes, DownVoted: false, UpVoted: false));

    }

    });
    on<DownVoted>((event, emit) {
      final currentstate = state as VoteInitial;
      if(currentstate.DownVoted==true){
        final currentvotes = currentstate.Votes+1;
        emit(VoteInitial(Votes: currentvotes, DownVoted: false, UpVoted: false));
      }
      else if(currentstate.DownVoted==false&&currentstate.UpVoted==false){
        final currentvotes = currentstate.Votes-1;
        emit(VoteInitial(Votes: currentvotes, DownVoted: true, UpVoted: false));

      }
      else if (currentstate.UpVoted==true) {
        final currentvotes = currentstate.Votes-2;

        emit(VoteInitial(Votes: currentvotes, DownVoted: true, UpVoted: false));

      }

    });
  }
}
