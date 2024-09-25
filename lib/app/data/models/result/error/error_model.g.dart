// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorModelImpl _$$ErrorModelImplFromJson(Map<String, dynamic> json) =>
    _$ErrorModelImpl(
      name: json['name'] as String?,
      status: (json['status'] as num).toInt(),
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$ErrorModelImplToJson(_$ErrorModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'code': instance.code,
    };
