import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  MusicPlayerBloc() : super(MusicPlayerInitial()) {
    on<PlayEvent>((event, emit) {
      
    });
    on<PauseEvent>((event, emit) {
      
    });
    on<SkipEvent>((event, emit) {
      
    });
  }
}
