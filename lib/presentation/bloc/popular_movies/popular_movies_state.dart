part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();
  
  @override
  List<Object> get props => [];
}

final class PopularMoviesInitial extends PopularMoviesState {}
final class PopularMoviesLoading extends PopularMoviesState {}
final class PopularMoviesSuccess extends PopularMoviesState {
  final List<MovieEntity> movies;

  const PopularMoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}
final class PopularMoviesError extends PopularMoviesState {
  final String message;

  const PopularMoviesError({required this.message});

  @override
  List<Object> get props => [message];
}
