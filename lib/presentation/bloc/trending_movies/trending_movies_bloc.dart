
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';
import 'package:movie_app_clean_architecture/domain/usecases/get_trending_movies.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies;
  TrendingMoviesBloc({required this.getTrendingMovies}) : super(TrendingMoviesInitial()) {
    on<GetTrendingMoviesEvent>((event, emit) async {
     emit(TrendingMoviesLoading());
      final result = await getTrendingMovies();
      result.fold(
        (failure) => emit(TrendingMoviesError(message: failure.message)),
        (movies) => emit(TrendingMoviesSuccess(movies: movies)),
      );
    });
  }
}
