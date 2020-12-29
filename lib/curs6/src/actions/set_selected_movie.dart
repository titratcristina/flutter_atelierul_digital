// File created by
// Lung Razvan <long1eu>
// on 22/12/2020

library set_selected_movie;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_selected_movie.freezed.dart';

@freezed
abstract class SetSelectedMovie with _$SetSelectedMovie {
  const factory SetSelectedMovie(int movieId) = SetSelectedMovie$;
}
