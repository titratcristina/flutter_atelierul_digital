import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_atelierul_digital/curs5/src/actions/get_movies.dart';
import 'package:flutter_atelierul_digital/curs5/src/data/yts_api.dart';
import 'package:flutter_atelierul_digital/curs5/src/middleware/app_middleware.dart';
import 'package:flutter_atelierul_digital/curs5/src/models/app_state.dart';
import 'package:flutter_atelierul_digital/curs5/src/presentation/home_page.dart';
import 'package:flutter_atelierul_digital/curs5/src/reducer/reducer.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';

void main() {
  final Client client = Client();
  final YtsApi ytsApi = YtsApi(client: client);
  final AppMiddleware middleware = AppMiddleware(ytsApi: ytsApi);
  final AppState initialState = AppState.initialState();
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: initialState,
    middleware: middleware.middleware,
  );

  store.dispatch(const GetMovies());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, @required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
