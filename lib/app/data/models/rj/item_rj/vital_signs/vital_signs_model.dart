import 'package:freezed_annotation/freezed_annotation.dart';

part 'vital_signs_model.freezed.dart';
part 'vital_signs_model.g.dart';

@freezed
class VitalSignsModel with _$VitalSignsModel {
  const factory VitalSignsModel({
    int? height,
    int? weight,
    int? temperature,
    int? heartPulse,
    int? repiratoryRate,
    int? sistole,
    int? diastole,
    int? bloodSugar,
    int? oxygenSaturation,
    int? lingkarPerut,
    String? mrNo,
    String? mrId,
    String? patientId,
    String? hospitalId,
    String? practiceId,
    String? appointId,
    String? createdName,
    String? createdId,
    String? createdAt,
    String? id,
    bool? submitted,
    int? compiled,
  }) = _VitalSignsModel;

  factory VitalSignsModel.fromJson(Map<String, Object?> json) =>
      _$VitalSignsModelFromJson(json);
}
