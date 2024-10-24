// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SlotModelImpl _$$SlotModelImplFromJson(Map<String, dynamic> json) =>
    _$SlotModelImpl(
      start: (json['start'] as num?)?.toInt(),
      end: (json['end'] as num?)?.toInt(),
      menit: json['menit'],
      maxDuration: (json['maxDuration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SlotModelImplToJson(_$SlotModelImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      'menit': instance.menit,
      'maxDuration': instance.maxDuration,
    };
