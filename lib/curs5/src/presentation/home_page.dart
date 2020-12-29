import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_atelierul_digital/curs5/src/containers/is_loading_container.dart';
import 'package:flutter_atelierul_digital/curs5/src/containers/movies_container.dart';
import 'package:flutter_atelierul_digital/curs5/src/models/movie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IsLoadingContainer(
      builder: (BuildContext context, bool isLoading) {
        return Scaffold(
          appBar: AppBar(),
          body: Builder(
            builder: (BuildContext context) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return MoviesContainer(
                builder: (BuildContext context, BuiltList<Movie> movies) {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      crossAxisCount: 3,
                    ),
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Movie movie = movies[index];

                      return GridTile(
                        child: Image.network(movie.mediumCoverImage),
                        footer: GridTileBar(
                          title: Text(movie.title),
                          subtitle: Text(movie.genres.join(', ')),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
