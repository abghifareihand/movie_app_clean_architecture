import 'package:get_it/get_it.dart';
import 'package:movie_app_clean_architecture/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app_clean_architecture/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_popular_movies.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_trending_movies.dart';
import 'package:movie_app_clean_architecture/domain/usecases/search_movies.dart';
import 'package:movie_app_clean_architecture/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  // Bloc
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(getIt()));

  // Repository
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(client: getIt()));

  // Http service
  getIt.registerLazySingleton(() => http.Client());
}