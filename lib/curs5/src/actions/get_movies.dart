import 'package:flutter_atelierul_digital/curs5/src/models/movie.dart';

class GetMovies {
  const GetMovies();
}

class GetMoviesSuccessful {
  const GetMoviesSuccessful(this.movies);

  final List<Movie> movies;
}

class GetMoviesError {
  const GetMoviesError(this.error);

  final dynamic error;
}
