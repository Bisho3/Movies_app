import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app/movies/domain/use_cases/get_movie_detail_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_now_playing_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_poopular_movie_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_recommendations_usecase.dart';
import 'package:movie_app/movies/domain/use_cases/get_top_rated_movie_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movie_detail_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator{
  void init(){
    ///=========movie bloc ==========///
    sl.registerFactory(() => MovieBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailBloc(sl(),sl()));
    ///============ use case====///
    sl.registerLazySingleton(() =>GetNowPlayingMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    ///============== repository==========///
    sl.registerLazySingleton<BaseMovieRepository>(() =>MovieRepository(sl()));
    ///============ Data Source==========///
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() =>MovieRemoteDataSource());
  }
}