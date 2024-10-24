import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_name_diagnoses_model.freezed.dart';
part 'item_name_diagnoses_model.g.dart';

@freezed
class ItemNameDiagnosesModel with _$ItemNameDiagnosesModel {
  const factory ItemNameDiagnosesModel({
    String? id,
    bool? isICD10,
    String? keyword,
  }) = _ItemNameDiagnosesModel;

  factory ItemNameDiagnosesModel.fromJson(Map<String, Object?> json) =>
      _$ItemNameDiagnosesModelFromJson(json);
}
