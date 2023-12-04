
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/usecases/search_movies.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;
  SearchMoviesBloc({required this.searchMovies}) : super(SearchMoviesInitial()) {
    on<GetSearchMoviesEvent>((event, emit) async {
      emit(SearchMoviesLoading());
      final result = await searchMovies(event.query);
      result.fold(
        (failure) => emit(SearchMoviesError(message: failure.message)),
        (movies) => emit(SearchMoviesSuccess(movies: movies)),
      );
    });
  }
}
