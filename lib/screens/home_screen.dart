import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_7/bloc/music_player_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
      builder: (context, state) {
        Widget musicControls;
        if (state is MusicPlayerPlaying) {
          musicControls = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.read<MusicPlayerBloc>().add(PauseEvent());
                },
                icon: const Icon(Icons.skip_previous),
              ),
              IconButton(
                onPressed: () {
                  context.read<MusicPlayerBloc>().add(PauseEvent());
                },
                icon: const Icon(Icons.pause),
              ),
              IconButton(
                onPressed: () {
                  context.read<MusicPlayerBloc>().add(SkipEvent());
                },
                icon: const Icon(Icons.skip_next),
              ),
            ],
          );
        } else if (state is MusicPlayerPaused) {
          musicControls = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.read<MusicPlayerBloc>().add(PauseEvent());
                },
                icon: const Icon(Icons.skip_previous),
              ),
              IconButton(
                onPressed: () {
                  context.read<MusicPlayerBloc>().add(PlayEvent());
                },
                icon: const Icon(Icons.play_arrow),
              ),
              IconButton(
                onPressed: () {
                  context.read<MusicPlayerBloc>().add(SkipEvent());
                },
                icon: const Icon(Icons.skip_next),
              ),
            ],
          );
        } else {
          musicControls = Container();
        }
        // },);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Music Player'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is MusicPlayerLoading)
                  const CircularProgressIndicator()
                else if (state is MusicPlayerError)
                  Text('Error: ${state.errorMessage}')
                else if (state is MusicPlayerPlaying)
                  Column(
                    children: [
                      Text(
                          'Now playing: ${state.currentSong.title} - ${state.currentSong.artist}'),
                      musicControls,
                    ],
                  )
                else if (state is MusicPlayerPaused)
                  Column(
                    children: [
                      Text(
                          'Now Paused: ${state.currentSong.title} - ${state.currentSong.artist}'),
                      musicControls,
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
