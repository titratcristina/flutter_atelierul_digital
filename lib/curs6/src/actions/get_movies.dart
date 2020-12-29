library get_movies;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_atelierul_digital/curs6/src/models/movie.dart';

part 'get_movies.freezed.dart';

@freezed
abstract class GetMovies with _$GetMovies {
  const factory GetMovies() = GetMoviesStart;

  const factory GetMovies.successful(List<Movie> movies) = GetMoviesSuccessful;

  const factory GetMovies.error(dynamic error) = GetMoviesError;
}
