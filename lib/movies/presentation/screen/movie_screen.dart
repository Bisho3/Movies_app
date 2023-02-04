import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movie_event.dart';
import 'package:movie_app/movies/presentation/controller/movie_state.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context){
          return MovieBloc()..add(GetNowPlayingMovieEvent());
        },
        child: BlocBuilder<MovieBloc,MovieState>(
          builder: (context,state){
            print(state);
            return Scaffold();
          },
        ));
  }
}
