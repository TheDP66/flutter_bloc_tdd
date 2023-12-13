// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter_bloc_tdd/core/errors/server_exception.dart';
import 'package:flutter_bloc_tdd/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_bloc_tdd/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  MovieRemoteDataSourceImpl({required this.client});

  final http.Client client;

  static const BASE_URL = "https://api.themoviedb.org/3";
  static const API_KEY = "67a4ffb9514fbbba2f4b126e78da5ee3";

  String genUrl(url) {
    String apiKeyParams = "api_key=$API_KEY";

    return BASE_URL + url + apiKeyParams;
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(Uri.parse(genUrl("/movie/popular?")));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response =
        await client.get(Uri.parse(genUrl("/trending/movie/day?")));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response =
        await client.get(Uri.parse(genUrl("/search/movie?query=$query&")));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }
}
