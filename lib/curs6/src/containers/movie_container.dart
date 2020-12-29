import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_atelierul_digital/curs6/src/models/app_state.dart';
import 'package:flutter_atelierul_digital/curs6/src/models/movie.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class MovieContainer extends StatelessWidget {
  const MovieContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<Movie> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Movie>(
      converter: (Store<AppState> store) {
        return store.state.movies.firstWhere((Movie movie) => movie.id == store.state.selectedMovie);
      },
      builder: builder,
    );
  }
}
