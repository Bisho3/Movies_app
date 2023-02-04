import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/util/enums.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/use_cases/get_now_playing_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_event.dart';
import 'package:movie_app/movies/presentation/controller/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(const MovieState()) {
    on<GetNowPlayingMovieEvent>((event, emit) async {
      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      BaseMovieRepository baseMovieRepository =
          MovieRepository(baseMovieRemoteDataSource);
      final result =
          await GetNowPlayingMovieUseCase(baseMovieRepository).execute();
      emit(const MovieState(nowPlayingState: RequestState.loaded));
      result.fold((l) {
        emit(MovieState(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        ));
      }, (r) {
        emit(MovieState(
          nowPlayingState: RequestState.loaded,
          nowPlayingMovies: r,
        ));
      });

    });
  }
}
