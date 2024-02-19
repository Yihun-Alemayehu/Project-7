part of 'music_player_bloc.dart';

abstract class MusicPlayerState extends Equatable {
  const MusicPlayerState();
  
  @override
  List<Object> get props => [];
}

class MusicPlayerInitial extends MusicPlayerState {}

class MusicPlayerLoading extends MusicPlayerState {}

class MusicPlayerPlaying extends MusicPlayerState{}

class MusicPlayerPaused extends MusicPlayerState{}

class MusicPlayerCompleted extends MusicPlayerState{}
