import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_tdd/domain/entities/movie.dart';
import 'package:flutter_bloc_tdd/domain/repositories/movie_repository.dart';
import 'package:flutter_bloc_tdd/domain/usecases/search_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_trending_movie_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late MockMovieRepository mockMovieRepository;
  late SearchMovies usecase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
  });

  const String tQuery = 'Inception';

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

  test('should get movies from the query from the repository', () async {
    // arrange
    when(mockMovieRepository.searchMovies(any))
        .thenAnswer((_) async => Right(tMoviesList));

    // act
    final result = await usecase(tQuery);

    // assert
    expect(result, equals(Right(tMoviesList)));
    verify(mockMovieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
