import 'package:flutter_dio/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTrendingMovies();
  Future<List<Movie>> searchMovies(String query);
  Future<List<Movie>> getPopularMovies();
}
