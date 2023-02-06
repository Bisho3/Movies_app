import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_usecase.dart';
import 'package:movie_app/movies/domain/entities/recommendations.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>,RecommendationsParameterMovie>{
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationsParameterMovie parameter) async{
   return await baseMovieRepository.getRecommendationsMovies(parameter);
  }

}


class RecommendationsParameterMovie extends Equatable {
  final int movieId;

  const RecommendationsParameterMovie({
    required this.movieId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}
