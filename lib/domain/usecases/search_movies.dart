import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/errors/failure.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
