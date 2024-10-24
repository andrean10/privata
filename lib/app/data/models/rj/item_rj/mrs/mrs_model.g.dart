// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mrs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MrsModelImpl _$$MrsModelImplFromJson(Map<String, dynamic> json) =>
    _$MrsModelImpl(
      appointId: json['appointId'] as String?,
      id: json['id'] as String?,
      vitalSigns: (json['vitalSigns'] as List<dynamic>?)
          ?.map((e) => VitalSignsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MrsModelImplToJson(_$MrsModelImpl instance) =>
    <String, dynamic>{
      'appointId': instance.appointId,
      'id': instance.id,
      'vitalSigns': instance.vitalSigns,
    };
