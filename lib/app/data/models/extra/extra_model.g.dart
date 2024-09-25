// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtraModelImpl _$$ExtraModelImplFromJson(Map<String, dynamic> json) =>
    _$ExtraModelImpl(
      action:
          (json['action'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$ExtraModelImplToJson(_$ExtraModelImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'id': instance.id,
    };
