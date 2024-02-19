part of 'music_player_bloc.dart';

abstract class MusicPlayerState extends Equatable {
  const MusicPlayerState();
  
  @override
  List<Object> get props => [];
}

class MusicPlayerInitial extends MusicPlayerState {}

class MusicPlayerLoading extends MusicPlayerState {}

class MusicPlayerPlaying extends MusicPlayerState{
  final Song currentSong;

  const MusicPlayerPlaying({required this.currentSong});

  @override
  List<Object> get props => [currentSong];
}

class MusicPlayerPaused extends MusicPlayerState{
  final Song currentSong;

  const MusicPlayerPaused({required this.currentSong});

  @override
  List<Object> get props => [currentSong];
}

class MusicPlayerCompleted extends MusicPlayerState{
  final Song currentSong;

  const MusicPlayerCompleted({required this.currentSong});

  @override
  List<Object> get props => [currentSong];
}

class MusicPlayerError extends MusicPlayerState{
  final String errorMessage;

  const MusicPlayerError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}