import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.title,
    required super.voteAverage,
    required super.overview,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids'].map((element) => element)),
        id: json['id'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        overview: json['overview'],
        releaseDate: json['release_date'],
      );
}
