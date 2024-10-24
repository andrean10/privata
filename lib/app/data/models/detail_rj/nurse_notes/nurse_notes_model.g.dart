// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nurse_notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NurseNotesModelImpl _$$NurseNotesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NurseNotesModelImpl(
      situation: (json['situation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      background: (json['background'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      assessment: (json['assessment'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      recommendation: (json['recommendation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      freeText: json['freeText'] as String?,
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
    );

Map<String, dynamic> _$$NurseNotesModelImplToJson(
        _$NurseNotesModelImpl instance) =>
    <String, dynamic>{
      'situation': instance.situation,
      'background': instance.background,
      'assessment': instance.assessment,
      'recommendation': instance.recommendation,
      'freeText': instance.freeText,
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
    };
