part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailEvent extends MovieDetailEvent {
  final int id;

  @override
  List<Object> get props => [id];

  const GetMovieDetailEvent({required this.id});
}

class GetMovieRecommendationEvent extends MovieDetailEvent {
  final int id;

  const GetMovieRecommendationEvent({required this.id});

  @override
  List<Object> get props => [id];
}
