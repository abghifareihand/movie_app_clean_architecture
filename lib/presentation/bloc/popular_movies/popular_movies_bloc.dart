
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_popular_movies.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;
  PopularMoviesBloc({required this.getPopularMovies}) : super(PopularMoviesInitial()) {
    on<GetPopularMoviesEvent>((event, emit) async {
     emit(PopularMoviesLoading());
      final result = await getPopularMovies();
      result.fold(
        (failure) => emit(PopularMoviesError(message: failure.message)),
        (movies) => emit(PopularMoviesSuccess(movies: movies)),
      );
    });
  }
}
