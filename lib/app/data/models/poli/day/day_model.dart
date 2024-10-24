import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'schedule/schedule_model.dart';

part 'day_model.freezed.dart';
part 'day_model.g.dart';

@freezed
class DayModel with _$DayModel {
  const factory DayModel({
    bool? isHoliday,
    List<ScheduleModel>? schedule,
    int? quotaNonJkn,
    int? quotaJkn,
  }) = _DayModel;

  factory DayModel.fromJson(Map<String, Object?> json) =>
      _$DayModelFromJson(json);
}
