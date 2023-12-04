import 'package:flutter_dio/data/models/movie_models.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrendingMovies();

  Future<List<MovieModel>> searchMovies();

  Future<List<MovieModel>> getPopularMovies();
}
