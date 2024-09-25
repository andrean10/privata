import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'village_model.freezed.dart';
part 'village_model.g.dart';

@freezed
class VillageModel with _$VillageModel {
  const factory VillageModel({
    required String? id,
    @JsonKey(name: 'district_id') required String? districtId,
    required String? name,
  }) = _VillageModel;

  factory VillageModel.fromJson(Map<String, Object?> json) =>
      _$VillageModelFromJson(json);
}
