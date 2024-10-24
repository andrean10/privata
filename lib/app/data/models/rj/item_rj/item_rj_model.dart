import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:privata/app/data/models/rj/item_rj/vital_signs/vital_signs_model.dart';

import 'mrs/mrs_model.dart';
import 'patient/rj_patient_model.dart';
import 'practice/practice_model.dart';

part 'item_rj_model.freezed.dart';
part 'item_rj_model.g.dart';

@freezed
class ItemRJModel with _$ItemRJModel {
  const factory ItemRJModel({
    MrsModel? mrs,
    String? bpjsTreatment,
    String? poli,
    String? pasienFkId,
    dynamic praktekFkId,
    String? day,
    String? appDate,
    String? date,
    int? mulai,
    int? selesai,
    int? estimateTime,
    dynamic consultPlanDuration,
    String? status,
    @JsonKey(name: 'is_medicaboo') bool? isMedicaboo,
    String? rumahSakitId,
    String? hp,
    @JsonKey(name: 'id_ext') String? idExt,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    // List<Null>? mcuPlans,
    String? createdAt,
    bool? confirmed,
    int? startWaitingTime,
    int? startEngageTime,
    String? procedurePlan,
    String? complaint,
    String? triase,
    VitalSignsModel? vitalSign,
    bool? isBpjs,
    String? finishedDate,
    String? finishedId,
    bool? isPayFirst,
    // List<Null>? plannedPacketProcedures,
    String? uniqueCode,
    // bool? isAntrolFKTP,
    bool? isAntrolFKTPV2,
    String? id,
    // List<Null>? createdPlannedProcedure,
    String? doctorName,
    String? createdName,
    @JsonKey(name: 'Pasiens') RJPatientModel? pasiens,
    @JsonKey(name: 'Prakteks') PracticeModel? prakteks,
    String? encounterId,
  }) = _ItemRJModel;

  factory ItemRJModel.fromJson(Map<String, Object?> json) =>
      _$ItemRJModelFromJson(json);
}
