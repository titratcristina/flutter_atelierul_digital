// File created by
// Lung Razvan <long1eu>
// on 22/12/2020

library update_genre;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_genre.freezed.dart';

@freezed
abstract class UpdateGenre with _$UpdateGenre {
  const factory UpdateGenre(String genre) = _UpdateGenre;
}
