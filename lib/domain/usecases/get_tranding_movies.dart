import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_tdd/core/errors/server_failure.dart';
import 'package:flutter_bloc_tdd/domain/entities/movie.dart';
import 'package:flutter_bloc_tdd/domain/repositories/movie_repository.dart';

class GetTrendingMovies {
  GetTrendingMovies(this.repository);

  final MovieRepository repository;

  Future<Either<Failure, List<Movie>>> call() async {
    return repository.getTrendingMovies();
  }
}
