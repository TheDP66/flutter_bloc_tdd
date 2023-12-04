import 'package:flutter_dio/domain/entities/movie.dart';
import 'package:flutter_dio/domain/repositories/movie_repository.dart';

class GetTrendingMovies {
  GetTrendingMovies(this.repository);

  final MovieRepository repository;

  Future<List<Movie>> call() async {
    return repository.getTrendingMovies();
  }
}
