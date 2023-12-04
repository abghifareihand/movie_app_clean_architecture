part of 'search_movies_bloc.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();
  
  @override
  List<Object> get props => [];
}

final class SearchMoviesInitial extends SearchMoviesState {}
final class SearchMoviesLoading extends SearchMoviesState {}
final class SearchMoviesSuccess extends SearchMoviesState {
  final List<MovieEntity> movies;

  const SearchMoviesSuccess({required this.movies});

  @override
  List<Object> get props => [movies];
}
final class SearchMoviesError extends SearchMoviesState {
  final String message;

  const SearchMoviesError({required this.message});

  @override
  List<Object> get props => [message];
}
