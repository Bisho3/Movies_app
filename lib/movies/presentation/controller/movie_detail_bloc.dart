import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/util/enums.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';
import 'package:movie_app/movies/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_recommendations_usecase.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc(this.getMovieDetailUseCase,
      this.getRecommendationUseCase
      )
      : super(const MovieDetailState()) {
    on<GetMovieDetailEvent>(_getMovieDetail);
    on<GetMovieRecommendationEvent>(_getRecommendationsMovie);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;

  FutureOr<void> _getMovieDetail(
      GetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await getMovieDetailUseCase(MovieDetailParameter(movieId: event.id));
    result.fold((l) {
      emit(state.copyWith(
        movieMessage: l.message,
        movieDetailState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        movieDetails: r,
        movieDetailState: RequestState.loaded,
      ));
    });
  }
final GetRecommendationUseCase getRecommendationUseCase;
  FutureOr<void> _getRecommendationsMovie(
      GetMovieRecommendationEvent event, Emitter<MovieDetailState> emit)async {


    final result =
    await getRecommendationUseCase(RecommendationsParameterMovie(movieId: event.id));
    result.fold((l) {
      emit(state.copyWith(
        recommendationsMessage: l.message,
        recommendationsState: RequestState.error,
      ));
    }, (r) {
      emit(state.copyWith(
        recommendationsMovie: r,
        recommendationsState: RequestState.loaded,
      ));
    });

  }
}
