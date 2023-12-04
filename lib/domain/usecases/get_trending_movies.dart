import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/errors/failure.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await repository.getTrendingMovies();
  }
}
