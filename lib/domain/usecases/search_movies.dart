import 'package:flutter_dio/domain/entities/movie.dart';
import 'package:flutter_dio/domain/repositories/movie_repository.dart';

class SearchMovies {
  SearchMovies(this.repository);

  final MovieRepository repository;

  Future<List<Movie>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
