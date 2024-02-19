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
    Song(id: 'id', artist: 'artist', title: 'title', url: 'A.mp3'),
    // Song(id: 'id', artist: 'artist', title: 'title', url: 'url'),
    // Song(id: 'id', artist: 'artist', title: 'title', url: 'url'),
    // Song(id: 'id', artist: 'artist', title: 'title', url: 'url'),
  ];

  MusicPlayerBloc() : super(MusicPlayerInitial()) {
    on<LoadSongEvent>((event, emit) async{
      emit(MusicPlayerLoading());
      try {
        _currentSong = _songs.first;
        await _audioPlayer.setSourceAsset(_currentSong.url);
        emit(MusicPlayerPaused(currentSong: _currentSong));
      } catch (e) {
        emit(MusicPlayerError(errorMessage: 'Error : $e'));
      }
    });
    on<PlayEvent>((event, emit) {
      _audioPlayer.play(AssetSource('A.mp3'));
      _audioPlayer.getDuration();
      emit(MusicPlayerPlaying(currentSong: _currentSong));
    });
    on<PauseEvent>((event, emit) {
      _audioPlayer.pause();
      _audioPlayer.getDuration();
      emit(MusicPlayerPaused(currentSong: _currentSong));
    });
    on<SkipEvent>((event, emit) {
      
    });
  }
}
