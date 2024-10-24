// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleModelImpl _$$ScheduleModelImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleModelImpl(
      mulai: (json['mulai'] as num?)?.toInt(),
      selesai: (json['selesai'] as num?)?.toInt(),
      menit: (json['menit'] as num?)?.toInt(),
      tipe: (json['tipe'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$ScheduleModelImplToJson(_$ScheduleModelImpl instance) =>
    <String, dynamic>{
      'mulai': instance.mulai,
      'selesai': instance.selesai,
      'menit': instance.menit,
      'tipe': instance.tipe,
      'id': instance.id,
    };
