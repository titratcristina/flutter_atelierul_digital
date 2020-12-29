import 'package:flutter_atelierul_digital/curs6/src/actions/get_movies.dart';
import 'package:flutter_atelierul_digital/curs6/src/data/yts_api.dart';
import 'package:flutter_atelierul_digital/curs6/src/models/app_state.dart';
import 'package:flutter_atelierul_digital/curs6/src/models/movie.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class AppMiddleware {
  const AppMiddleware({@required YtsApi ytsApi})
      : assert(ytsApi != null),
        _ytsApi = ytsApi;

  final YtsApi _ytsApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      _getMovies,
    ];
  }

  Future<void> _getMovies(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    if (action is GetMoviesStart) {
      try {
        final List<Movie> movies = await _ytsApi.getMovies(
          store.state.nextPage,
          store.state.quality,
          store.state.genre,
          store.state.orderBy,
        );

        final GetMoviesSuccessful successful = GetMovies.successful(movies);
        store.dispatch(successful);
      } catch (e) {
        final GetMoviesError error = GetMovies.error(e);
        store.dispatch(error);
      }
    }
  }
}
