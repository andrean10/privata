// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnoses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiagnosesModelImpl _$$DiagnosesModelImplFromJson(Map<String, dynamic> json) =>
    _$DiagnosesModelImpl(
      id: json['id'] as String?,
      name: (json['name'] as List<dynamic>?)
          ?.map(
              (e) => ItemNameDiagnosesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdId: json['createdId'] as String?,
      createdAt: json['createdAt'] as String?,
      createdName: json['createdName'] as String?,
      updatedAt: json['updatedAt'] as String?,
      streakId: json['streakId'] as String?,
      streakAt: json['streakAt'] as String?,
      streakName: json['streakName'] as String?,
    );

Map<String, dynamic> _$$DiagnosesModelImplToJson(
        _$DiagnosesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdId': instance.createdId,
      'createdAt': instance.createdAt,
      'createdName': instance.createdName,
      'updatedAt': instance.updatedAt,
      'streakId': instance.streakId,
      'streakAt': instance.streakAt,
      'streakName': instance.streakName,
    };
