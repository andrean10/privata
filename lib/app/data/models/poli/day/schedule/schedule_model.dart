import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'schedule_model.freezed.dart';
part 'schedule_model.g.dart';

@freezed
class ScheduleModel with _$ScheduleModel {
  const factory ScheduleModel({
    int? mulai,
    int? selesai,
    int? menit,
    List<String>? tipe,
    String? id,
  }) = _ScheduleModel;

  factory ScheduleModel.fromJson(Map<String, Object?> json) =>
      _$ScheduleModelFromJson(json);
}
