import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/errors/exception.dart';
import 'package:movie_app_clean_architecture/core/errors/failure.dart';
import 'package:movie_app_clean_architecture/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app_clean_architecture/data/models/movie_model.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.getPopularMovies();
      final List<MovieEntity> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTrendingMovies() async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.getTrendingMovies();
      final List<MovieEntity> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> searchMovies(String query) async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.searchMovies(query);
      final List<MovieEntity> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    }
  }
}
