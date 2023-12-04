part of 'trending_movies_bloc.dart';

abstract class TrendingMoviesState extends Equatable {
  const TrendingMoviesState();
  
  @override
  List<Object> get props => [];
}

final class TrendingMoviesInitial extends TrendingMoviesState {}
final class TrendingMoviesLoading extends TrendingMoviesState {}
final class TrendingMoviesSuccess extends TrendingMoviesState {
  final List<MovieEntity> movies;

  const TrendingMoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}
final class TrendingMoviesError extends TrendingMoviesState {
  final String message;

  const TrendingMoviesError({required this.message});

  @override
  List<Object> get props => [message];
}
