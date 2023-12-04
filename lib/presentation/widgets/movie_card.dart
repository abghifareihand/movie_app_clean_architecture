import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/domain/entities/movie_entity.dart';


class MovieCard extends StatelessWidget {
  const MovieCard(this.movie, {super.key});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Ink.image(
          image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}