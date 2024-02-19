import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_7/data/models/song_model.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {

  final AudioPlayer _audioPlayer =  AudioPlayer();
  late Song _currentSong;
  final List<Song> _songs = [
    Song(id: 'id', artist: 'artist', title: 'title', url: 'url'),
    Song(id: 'id', artist: 'artist', title: 'title', url: 'url'),
    Song(id: 'id', artist: 'artist', title: 'title', url: 'url'),
    Song(id: 'id', artist: 'artist', title: 'title', url: 'url'),
  ];

  MusicPlayerBloc() : super(MusicPlayerInitial()) {
    on<PlayEvent>((event, emit) async{
      emit(MusicPlayerLoading());
      try {
        _currentSong = _songs.first;
        await _audioPlayer.setSourceUrl(_currentSong.url);
        emit(MusicPlayerPlaying(currentSong: _currentSong));
      } catch (e) {
        emit(MusicPlayerError(errorMessage: 'Error : $e'));
      }
    });
    on<PauseEvent>((event, emit) {
      
    });
    on<SkipEvent>((event, emit) {
      
    });
  }
}
