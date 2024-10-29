// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_notes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorNotesModelImpl _$$DoctorNotesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DoctorNotesModelImpl(
      subjective: (json['subjective'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      objective: (json['objective'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      plan: (json['plan'] as List<dynamic>?)?.map((e) => e as String).toList(),
      assessment: (json['assessment'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DoctorNotesModelImplToJson(
        _$DoctorNotesModelImpl instance) =>
    <String, dynamic>{
      'subjective': instance.subjective,
      'objective': instance.objective,
      'plan': instance.plan,
      'assessment': instance.assessment,
    };
