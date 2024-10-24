import 'package:freezed_annotation/freezed_annotation.dart';

import '../vital_signs/vital_signs_model.dart';

part 'mrs_model.freezed.dart';
part 'mrs_model.g.dart';

@freezed
class MrsModel with _$MrsModel {
  const factory MrsModel({
    String? appointId,
    String? id,
    // List<Diagnoses>? diagnoses,
    // List<ScourPrescriptions>? scourPrescriptions,
    // List<Prescriptions>? prescriptions,
    // List<Null>? skrinning,
    // List<Null>? surat,
    // List<Null>? procedures,
    // List<KMCUPlans>? kMCUPlans,
    // List<Null>? psychosocialSpirituals,
    List<VitalSignsModel>? vitalSigns,
  }) = _MrsModel;

  factory MrsModel.fromJson(Map<String, Object?> json) =>
      _$MrsModelFromJson(json);
}
