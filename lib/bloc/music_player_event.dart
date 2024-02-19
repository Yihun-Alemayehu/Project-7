part of 'music_player_bloc.dart';

abstract class MusicPlayerEvent extends Equatable {
  const MusicPlayerEvent();

  @override
  List<Object> get props => [];
}

class PauseEvent extends MusicPlayerEvent {}

class PlayEvent extends MusicPlayerEvent {}

class SkipEvent extends MusicPlayerEvent {}