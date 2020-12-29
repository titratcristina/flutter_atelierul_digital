// File created by
// Lung Razvan <long1eu>
// on 22/12/2020

library update_quality;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_quality.freezed.dart';

@freezed
abstract class UpdateQuality with _$UpdateQuality {
  const factory UpdateQuality(String quality) = _UpdateQuality;
}
