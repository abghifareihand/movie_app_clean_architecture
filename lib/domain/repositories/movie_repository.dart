import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/errors/failure.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies();
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query);
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
}
