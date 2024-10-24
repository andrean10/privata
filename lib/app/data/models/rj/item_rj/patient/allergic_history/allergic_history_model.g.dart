// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allergic_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllergicHistoryModelImpl _$$AllergicHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AllergicHistoryModelImpl(
      code: json['code'] as String?,
      display: json['display'] as String?,
      system: json['system'] as String?,
      id: json['id'] as String?,
      status: json['status'] as String?,
      category: json['category'] as String?,
      criticality: json['criticality'] as String?,
    );

Map<String, dynamic> _$$AllergicHistoryModelImplToJson(
        _$AllergicHistoryModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'display': instance.display,
      'system': instance.system,
      'id': instance.id,
      'status': instance.status,
      'category': instance.category,
      'criticality': instance.criticality,
    };
