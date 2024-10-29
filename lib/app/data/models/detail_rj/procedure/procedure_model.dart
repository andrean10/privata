import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure_model.freezed.dart';
part 'procedure_model.g.dart';

@freezed
class ProcedureModel with _$ProcedureModel {
  const factory ProcedureModel({
    String? id,
    String? procedureId,
    String? procedureName,
    int? basicFee,
    int? quantity,
    int? discountFee,
    int? totalFee,
    String? streakId,
    String? streakName,
    String? createdId,
    String? createdAt,
    String? createdName,
    bool? isPriceLock,
    String? discountType,
  }) = _ProcedureModel;

  factory ProcedureModel.fromJson(Map<String, Object?> json) =>
      _$ProcedureModelFromJson(json);
}
