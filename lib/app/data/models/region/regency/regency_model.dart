import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'regency_model.freezed.dart';
part 'regency_model.g.dart';

@freezed
class RegencyModel with _$RegencyModel {
  const factory RegencyModel({
    required String? id,
    @JsonKey(name: 'province_id') required String? provinceId,
    required String? name,
  }) = _RegencyModel;

  factory RegencyModel.fromJson(Map<String, Object?> json) =>
      _$RegencyModelFromJson(json);
}
