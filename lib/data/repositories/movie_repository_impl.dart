import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_tdd/core/errors/server_failure.dart';
import 'package:flutter_bloc_tdd/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_bloc_tdd/data/models/movie_model.dart';
import 'package:flutter_bloc_tdd/domain/entities/movie.dart';
import 'package:flutter_bloc_tdd/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl({required this.remoteDataSource});

  final MovieRemoteDataSource remoteDataSource;

  @override
  Future<Either<ServerFailure, List<Movie>>> getPopularMovies() async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.getPopularMovies();
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getTrendingMovies() async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.getTrendingMovies();
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> searchMovies(String query) async {
    try {
      final List<MovieModel> movieModels =
          await remoteDataSource.searchMovies(query);
      final List<Movie> movies =
          movieModels.map((model) => model.toEntity()).toList();
      return Right(movies);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
