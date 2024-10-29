import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescriptions_model.freezed.dart';
part 'prescriptions_model.g.dart';

@freezed
class PrescriptionsModel with _$PrescriptionsModel {
  const factory PrescriptionsModel({
    int? quantity,
    @JsonKey(fromJson: basicFeeFromJson) num? basicFee,
    int? totalFee,
    String? medicineName,
    String? cigna,
    List<String>? recommendation,
    bool? isDb,
    String? mrNo,
    String? patientId,
    String? mrId,
    String? hospitalId,
    String? practiceId,
    String? appointId,
    bool? isPriceLock,
    String? createdName,
    String? createdId,
    String? createdAt,
    String? updatedAt,
    String? streakId,
    String? streakName,
    String? id,
    bool? isSatuSehatPrivata,
    String? category,
    String? unit,
  }) = _PrescriptionsModel;

  factory PrescriptionsModel.fromJson(Map<String, Object?> json) =>
      _$PrescriptionsModelFromJson(json);
}

int? basicFeeFromJson(dynamic json) {
  if (json is String) {
    return int.tryParse(json) ?? 0;
  } else if (json is int) {
    return json;
  }

  return null;
}
