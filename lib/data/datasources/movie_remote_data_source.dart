import 'dart:convert';
import 'package:movie_app_clean_architecture/core/errors/exception.dart';
import 'package:movie_app_clean_architecture/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> searchMovies(String query);
  Future<List<MovieModel>> getPopularMovies();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = 'YOUR_API_KEY';
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();

      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/trending/movie/day?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();

      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
   final response = await client.get(
      Uri.parse('$baseUrl/search/movie?query=$query&api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();

      return movies;
    } else {
      throw ServerException();
    }
  }
}
