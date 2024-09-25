import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'district_model.freezed.dart';
part 'district_model.g.dart';

@freezed
class DistrictModel with _$DistrictModel {
  const factory DistrictModel({
    required String? id,
    @JsonKey(name: 'regency_id') required String? regencyId,
    required String? name,
  }) = _DistrictModel;

  factory DistrictModel.fromJson(Map<String, Object?> json) =>
      _$DistrictModelFromJson(json);
}
