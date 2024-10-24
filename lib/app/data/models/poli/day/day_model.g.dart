// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DayModelImpl _$$DayModelImplFromJson(Map<String, dynamic> json) =>
    _$DayModelImpl(
      isHoliday: json['isHoliday'] as bool?,
      schedule: (json['schedule'] as List<dynamic>?)
          ?.map((e) => ScheduleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      quotaNonJkn: (json['quotaNonJkn'] as num?)?.toInt(),
      quotaJkn: (json['quotaJkn'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DayModelImplToJson(_$DayModelImpl instance) =>
    <String, dynamic>{
      'isHoliday': instance.isHoliday,
      'schedule': instance.schedule,
      'quotaNonJkn': instance.quotaNonJkn,
      'quotaJkn': instance.quotaJkn,
    };
