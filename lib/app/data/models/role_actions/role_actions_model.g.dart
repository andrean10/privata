// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_actions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoleActionsModelImpl _$$RoleActionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RoleActionsModelImpl(
      name: json['name'] as String?,
      type: json['type'] as String?,
      isLocal: json['isLocal'] as bool?,
      extra: json['extra'] == null
          ? null
          : ExtraModel.fromJson(json['extra'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      createdId: json['createdId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$RoleActionsModelImplToJson(
        _$RoleActionsModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'isLocal': instance.isLocal,
      'extra': instance.extra,
      'createdAt': instance.createdAt,
      'createdId': instance.createdId,
      'id': instance.id,
    };
