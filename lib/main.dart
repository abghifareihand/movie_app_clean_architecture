import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/injection.dart';
import 'package:movie_app_clean_architecture/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/pages/home_page.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<PopularMoviesBloc>()..add(GetPopularMoviesEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<TrendingMoviesBloc>()..add(GetTrendingMoviesEvent()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
