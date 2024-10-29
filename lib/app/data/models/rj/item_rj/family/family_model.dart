import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_model.freezed.dart';
part 'family_model.g.dart';

@freezed
class FamilyModel with _$FamilyModel {
  const factory FamilyModel({
    String? name,
    String? relation,
    int? gender,
    String? phoneNumber,
    String? bloodType,
    String? occupation,
    String? address,
    @JsonKey(name: 'created_at') String? createdAt,
    String? updatedAt,
    @JsonKey(name: 'created_id') String? createdId,
    String? updatedId,
    @JsonKey(fromJson: idFromJson) int? id,
    String? email,
    String? dateOfBirth,
    // FullAddress? fullAddress,
  }) = _FamilyModel;

  factory FamilyModel.fromJson(Map<String, Object?> json) =>
      _$FamilyModelFromJson(json);
}

int? idFromJson(dynamic json) {
  if (json is String) {
    return int.tryParse(json) ?? 0;
  } else if (json is int) {
    return json;
  }

  return null;
}

