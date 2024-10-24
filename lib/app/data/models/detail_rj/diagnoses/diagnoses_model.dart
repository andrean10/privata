import 'package:freezed_annotation/freezed_annotation.dart';

import 'item_name_diagnoses/item_name_diagnoses_model.dart';

part 'diagnoses_model.freezed.dart';
part 'diagnoses_model.g.dart';

@freezed
class DiagnosesModel with _$DiagnosesModel {
  const factory DiagnosesModel({
    String? id,
    List<ItemNameDiagnosesModel>? name,
    String? createdId,
    String? createdAt,
    String? createdName,
    String? updatedAt,
    String? streakId,
    String? streakAt,
    String? streakName,
  }) = _DiagnosesModel;

  factory DiagnosesModel.fromJson(Map<String, Object?> json) =>
      _$DiagnosesModelFromJson(json);
}
