import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_tdd/core/errors/server_exception.dart';
import 'package:flutter_bloc_tdd/core/errors/server_failure.dart';
import 'package:flutter_bloc_tdd/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_bloc_tdd/data/models/movie_model.dart';
import 'package:flutter_bloc_tdd/data/repositories/movie_repository_impl.dart';
import 'package:flutter_bloc_tdd/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])
void main() {
  late MovieRepositoryImpl repository;
  late MockMovieRemoteDataSource mockMovieRemoteDataSource;

  setUp(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();
    repository = MovieRepositoryImpl(
      remoteDataSource: mockMovieRemoteDataSource,
    );
  });

  const String tQuery = "Inception";

  final tMovieModelList = [
    MovieModel(
      id: 1,
      title: "Text Movie 1",
      overview: "Desc 1",
      posterPath: "/images1",
    ),
    MovieModel(
      id: 2,
      title: "Text Movie 2",
      overview: "Desc 2",
      posterPath: "/images2",
    ),
  ];

  final tMoviesList = [
    const Movie(
      id: 1,
      title: "Text Movie 1",
      overview: "Desc 1",
      posterPath: "/images1",
    ),
    const Movie(
      id: 2,
      title: "Text Movie 2",
      overview: "Desc 2",
      posterPath: "/images2",
    ),
  ];

  test("should get trending movies from the remote data source", () async {
    // arrange
    when(mockMovieRemoteDataSource.getTrendingMovies())
        .thenAnswer((_) async => tMovieModelList);

    // act
    final result = await repository.getTrendingMovies();

    // assert
    verify(mockMovieRemoteDataSource.getTrendingMovies());
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test("should get popular movies from the remote data source", () async {
    // arrange
    when(mockMovieRemoteDataSource.getPopularMovies())
        .thenAnswer((_) async => tMovieModelList);

    // act
    final result = await repository.getPopularMovies();

    // assert
    verify(mockMovieRemoteDataSource.getPopularMovies());
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test("should search movies from the remote data source", () async {
    // arrange
    when(mockMovieRemoteDataSource.searchMovies(tQuery))
        .thenAnswer((_) async => tMovieModelList);

    // act
    final result = await repository.searchMovies(tQuery);

    // assert
    verify(mockMovieRemoteDataSource.searchMovies(tQuery));
    expect(result, isA<Right<Failure, List<Movie>>>());
  });

  test(
      'should return ServerFailure when the call to remote data source is unsuccessful',
      () async {
    // arrange
    when(mockMovieRemoteDataSource.getTrendingMovies())
        .thenThrow(ServerException());

    // act
    final result = await repository.getTrendingMovies();

    // assert
    expect(result, isA<Left<ServerFailure, List<Movie>>>());
  });

  test(
      'should return ServerFailure when the call to remote data source is unsuccessful',
      () async {
    // arrange
    when(mockMovieRemoteDataSource.getPopularMovies())
        .thenThrow(ServerException());

    // act
    final result = await repository.getPopularMovies();

    // assert
    expect(result, isA<Left<ServerFailure, List<Movie>>>());
  });

  test(
      'should return ServerFailure when the call to remote data source is unsuccessful',
      () async {
    // arrange
    when(mockMovieRemoteDataSource.searchMovies(tQuery))
        .thenThrow(ServerException());

    // act
    final result = await repository.searchMovies(tQuery);

    // assert
    expect(result, isA<Left<ServerFailure, List<Movie>>>());
  });
}
