part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetails;
  final RequestState movieDetailState;
  final String movieMessage;
  final List<Recommendation> recommendationsMovie;
  final RequestState recommendationsState;
  final String recommendationsMessage;

  const MovieDetailState({
    this.movieDetails,
    this.movieDetailState = RequestState.loading,
    this.movieMessage = '',
    this.recommendationsMovie = const [],
    this.recommendationsMessage = '',
    this.recommendationsState = RequestState.loading,
  });

  MovieDetailState copyWith({
    MovieDetail? movieDetails,
    RequestState? movieDetailState,
    String? movieMessage,
    List<Recommendation>? recommendationsMovie,
    RequestState? recommendationsState,
    String? recommendationsMessage,
  }) {
    return MovieDetailState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailState: movieDetailState ?? this.movieDetailState,
        movieMessage: movieMessage ?? this.movieMessage,
        recommendationsMessage: recommendationsMessage ??
            this.recommendationsMessage,
        recommendationsMovie: recommendationsMovie ?? this.recommendationsMovie,
        recommendationsState: recommendationsState ?? this.recommendationsState
    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetails,
        movieDetailState,
        movieMessage,
        recommendationsMovie,
        recommendationsState,
        recommendationsMessage,
      ];
}
