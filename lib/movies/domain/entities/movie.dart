import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String releaseDate;

  const Movie(
      {required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.title,
      required this.voteAverage,
      required this.overview,
      required this.releaseDate});

  @override
  List<Object?> get props => [
        backdropPath,
        genreIds,
        id,
        title,
        voteAverage,
        overview,
        releaseDate,
      ];
}
