import 'package:flutter_bloc_tdd/domain/entities/movie.dart';

class MovieModel {
  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  final int id;
  final String title;
  final String overview;
  final String posterPath;

  //  Convert JSON into MovieModel
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }

  // Convert MovieModel into JSON
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
    };
  }

  // Convert movie to entity
  Movie toEntity() {
    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
    );
  }
}
