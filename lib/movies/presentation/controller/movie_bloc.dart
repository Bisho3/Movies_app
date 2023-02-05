import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/util/enums.dart';
import 'package:movie_app/movies/domain/use_cases/get_now_playing_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_poopular_movie_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_top_rated_movie_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_event.dart';
import 'package:movie_app/movies/presentation/controller/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;

  MovieBloc(
    this.getNowPlayingMovieUseCase,
    this.getPopularMovieUseCase,
    this.getTopRatedMovieUseCase,
  ) : super(const MovieState()) {
    on<GetNowPlayingMovieEvent>(_getNowPlayingMovie);

    on<GetPopularMovieEvent>(_getPopularMovie);

    on<GetTopRatedMovieEvent>(_getTopRatedMovie);
  }

  FutureOr<void> _getNowPlayingMovie(
      GetNowPlayingMovieEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMovieUseCase();

    result.fold((l) {
      emit(
        state.copyWith(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ),
      );
    }, (r) {
      emit(
        state.copyWith(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: r,
        ),
      );
    });
  }

  FutureOr<void> _getPopularMovie(
      GetPopularMovieEvent event, Emitter<MovieState> emit) async {
    final result = await getPopularMovieUseCase();

    result.fold((l) {
      emit(
        state.copyWith(
          popularState: RequestState.error,
          popularMessage: l.message,
        ),
      );
    },
        (r) => {
              emit(
                state.copyWith(
                  popularMovies: r,
                  popularState: RequestState.loaded,
                ),
              ),
            });
  }

  FutureOr<void> _getTopRatedMovie(
      GetTopRatedMovieEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedMovieUseCase();
    result.fold((l) {
      emit(
        state.copyWith(
          topRatedState: RequestState.error,
          topRatedMessage: l.message,
        ),
      );
    },
        (r) => {
              emit(
                state.copyWith(
                  topRatedMovies: r,
                  topRatedState: RequestState.loaded,
                ),
              ),
            });
  }
}
