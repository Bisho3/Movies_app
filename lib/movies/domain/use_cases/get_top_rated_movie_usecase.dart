
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMovieUseCase{
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMovieUseCase(this.baseMovieRepository);

  Future <List<Movie>> execute()async{
    return await baseMovieRepository.getTopRatedMovies();
  }
}