// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vital_signs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VitalSignsModelImpl _$$VitalSignsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VitalSignsModelImpl(
      height: (json['height'] as num?)?.toInt(),
      weight: (json['weight'] as num?)?.toInt(),
      temperature: (json['temperature'] as num?)?.toInt(),
      heartPulse: (json['heartPulse'] as num?)?.toInt(),
      repiratoryRate: (json['repiratoryRate'] as num?)?.toInt(),
      sistole: (json['sistole'] as num?)?.toInt(),
      diastole: (json['diastole'] as num?)?.toInt(),
      bloodSugar: (json['bloodSugar'] as num?)?.toInt(),
      oxygenSaturation: (json['oxygenSaturation'] as num?)?.toInt(),
      lingkarPerut: (json['lingkarPerut'] as num?)?.toInt(),
      mrNo: json['mrNo'] as String?,
      mrId: json['mrId'] as String?,
      patientId: json['patientId'] as String?,
      hospitalId: json['hospitalId'] as String?,
      practiceId: json['practiceId'] as String?,
      appointId: json['appointId'] as String?,
      createdName: json['createdName'] as String?,
      createdId: json['createdId'] as String?,
      createdAt: json['createdAt'] as String?,
      id: json['id'] as String?,
      submitted: json['submitted'] as bool?,
      compiled: (json['compiled'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VitalSignsModelImplToJson(
        _$VitalSignsModelImpl instance) =>
    <String, dynamic>{
      'height': instance.height,
      'weight': instance.weight,
      'temperature': instance.temperature,
      'heartPulse': instance.heartPulse,
      'repiratoryRate': instance.repiratoryRate,
      'sistole': instance.sistole,
      'diastole': instance.diastole,
      'bloodSugar': instance.bloodSugar,
      'oxygenSaturation': instance.oxygenSaturation,
      'lingkarPerut': instance.lingkarPerut,
      'mrNo': instance.mrNo,
      'mrId': instance.mrId,
      'patientId': instance.patientId,
      'hospitalId': instance.hospitalId,
      'practiceId': instance.practiceId,
      'appointId': instance.appointId,
      'createdName': instance.createdName,
      'createdId': instance.createdId,
      'createdAt': instance.createdAt,
      'id': instance.id,
      'submitted': instance.submitted,
      'compiled': instance.compiled,
    };
