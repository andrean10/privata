// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ph_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PHModelImpl _$$PHModelImplFromJson(Map<String, dynamic> json) =>
    _$PHModelImpl(
      code: json['code'] as String?,
      idRs: json['id_rs'] as String?,
      date: json['date'] as String?,
      id: json['id'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => TagsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PHModelImplToJson(_$PHModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id_rs': instance.idRs,
      'date': instance.date,
      'id': instance.id,
      'tags': instance.tags,
    };
