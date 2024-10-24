import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_diagnoses_model.freezed.dart';
part 'item_diagnoses_model.g.dart';

@freezed
class ItemDiagnosesModel with _$ItemDiagnosesModel {
  const factory ItemDiagnosesModel({
    @JsonKey(name: '_id') String? id,
    String? code,
    String? description,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    @Default(false)
    bool isStroke,
  }) = _ItemDiagnosesModel;

  factory ItemDiagnosesModel.fromJson(Map<String, Object?> json) =>
      _$ItemDiagnosesModelFromJson(json);
}
