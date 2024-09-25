import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'province_model.freezed.dart';
part 'province_model.g.dart';

@freezed
class ProvinceModel with _$ProvinceModel {
  const factory ProvinceModel({
    required String? id,
    required String? name,
  }) = _ProvinceModel;

  factory ProvinceModel.fromJson(Map<String, Object?> json) =>
      _$ProvinceModelFromJson(json);
}
