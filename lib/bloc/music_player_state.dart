part of 'music_player_bloc.dart';

sealed class MusicPlayerState extends Equatable {
  const MusicPlayerState();
  
  @override
  List<Object> get props => [];
}

final class MusicPlayerInitial extends MusicPlayerState {}
