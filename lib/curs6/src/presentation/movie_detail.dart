// File created by
// Lung Razvan <long1eu>
// on 22/12/2020

import 'package:flutter/material.dart';
import 'package:flutter_atelierul_digital/curs6/src/containers/movie_container.dart';
import 'package:flutter_atelierul_digital/curs6/src/models/movie.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MovieContainer(
      builder: (BuildContext context, Movie movie) {
        return Scaffold(
          appBar: AppBar(
            title: Text(movie.title),
          ),
          body: Image.network(movie.largeCoverImage),
        );
      },
    );
  }
}
