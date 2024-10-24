import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:privata/app/data/models/poli/day/day_model.dart';

part 'poli_model.freezed.dart';
part 'poli_model.g.dart';

@freezed
class PoliModel with _$PoliModel {
  const factory PoliModel({
    required bool? poliSakit,
    String? createdAt,
    String? createdId,
    String? kdPoli,
    String? nmPoli,
    int? quotaNonJkn,
    DayModel? senin,
    DayModel? selasa,
    DayModel? rabu,
    DayModel? kamis,
    DayModel? jumat,
    DayModel? sabtu,
    DayModel? minggu,
    String? id,
    String? hospitalId,
    String? prefixAntrean,
  }) = _PoliModel;

  factory PoliModel.fromJson(Map<String, Object?> json) =>
      _$PoliModelFromJson(json);
}
