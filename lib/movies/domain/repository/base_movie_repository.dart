import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/movie_details.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';
import 'package:movie_app/movies/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_recommendations_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetailMovies(MovieDetailParameter parameter);

  Future<Either<Failure, List<Recommendation>>> getRecommendationsMovies(RecommendationsParameterMovie parameter);

}
