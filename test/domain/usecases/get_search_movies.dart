import 'package:flutter_dio/domain/entities/movie.dart';
import 'package:flutter_dio/domain/repositories/movie_repository.dart';
import 'package:flutter_dio/domain/usecases/search_movies.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_trending_movie_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
  });

  const tQuery = "Inception";

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

  test("should get movies from the query from the repository", () async {
    // arrange
    when(mockMovieRepository.searchMovies(any))
        .thenAnswer((_) async => tMoviesList);

    // act
    final result = await usecase.call(tQuery);

    // assert
    expect(result, tMoviesList);
    verify(mockMovieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
