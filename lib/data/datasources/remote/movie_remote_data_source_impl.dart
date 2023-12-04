import 'package:flutter_dio/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_dio/data/models/movie_models.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() {
    // TODO: implement getTrendingMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> searchMovies() {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
