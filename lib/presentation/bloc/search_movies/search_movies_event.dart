part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => [];
}


class GetSearchMoviesEvent extends SearchMoviesEvent {
  final String query;

  const GetSearchMoviesEvent({required this.query});

  @override
  List<Object> get props => [query];
}