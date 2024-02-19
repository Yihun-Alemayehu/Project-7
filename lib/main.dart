import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_7/bloc/music_player_bloc.dart';
import 'package:project_7/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MusicPlayerBloc()..add(LoadSongEvent()),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
