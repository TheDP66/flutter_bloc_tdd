import 'package:flutter_dio/domain/entities/movie.dart';
import 'package:flutter_dio/domain/repositories/movie_repository.dart';
import 'package:flutter_dio/domain/usecases/get_popular_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_trending_movie_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late GetPopularMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetPopularMovies(mockMovieRepository);
  });

  final tMoviesList = [
    Movie(
      id: 1,
      title: "Text Movie 1",
      overview: "Desc 1",
      posterPath: "/images1",
    ),
    Movie(
      id: 2,
      title: "Text Movie 2",
      overview: "Desc 2",
      posterPath: "/images2",
    ),
  ];

  test("should get popular movies from the repository", () async {
    // arrange
    when(mockMovieRepository.getPopularMovies())
        .thenAnswer((_) async => tMoviesList);

    // act
    final result = await usecase();

    // assert
    expect(result, tMoviesList);
    verify(mockMovieRepository.getPopularMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
