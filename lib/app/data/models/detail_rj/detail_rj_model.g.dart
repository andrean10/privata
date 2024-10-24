// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_rj_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailRJModelImpl _$$DetailRJModelImplFromJson(Map<String, dynamic> json) =>
    _$DetailRJModelImpl(
      milis: json['milis'] as String?,
      isBpjs: json['isBpjs'] as bool?,
      mrNo: json['mrNo'] as String?,
      status: json['status'] as String?,
      practiceId: json['practiceId'] as String?,
      appointId: json['appointId'] as String?,
      patientId: json['patientId'] as String?,
      hospitalId: json['hospitalId'] as String?,
      createdName: json['createdName'] as String?,
      createdId: json['createdId'] as String?,
      createdAt: json['createdAt'] as String?,
      isShareRMToc: json['isShareRMToc'] as bool?,
      id: json['id'] as String?,
      vitalSigns: (json['VitalSigns'] as List<dynamic>?)
          ?.map((e) => VitalSignsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      patients: json['Patients'] == null
          ? null
          : RJPatientModel.fromJson(json['Patients'] as Map<String, dynamic>),
      nurseNotes: (json['NurseNotes'] as List<dynamic>?)
          ?.map((e) => NurseNotesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      practices: json['Practices'] == null
          ? null
          : PracticeModel.fromJson(json['Practices'] as Map<String, dynamic>),
      diagnoses: (json['Diagnoses'] as List<dynamic>?)
          ?.map((e) => DiagnosesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DetailRJModelImplToJson(_$DetailRJModelImpl instance) =>
    <String, dynamic>{
      'milis': instance.milis,
      'isBpjs': instance.isBpjs,
      'mrNo': instance.mrNo,
      'status': instance.status,
      'practiceId': instance.practiceId,
      'appointId': instance.appointId,
      'patientId': instance.patientId,
      'hospitalId': instance.hospitalId,
      'createdName': instance.createdName,
      'createdId': instance.createdId,
      'createdAt': instance.createdAt,
      'isShareRMToc': instance.isShareRMToc,
      'id': instance.id,
      'VitalSigns': instance.vitalSigns,
      'Patients': instance.patients,
      'NurseNotes': instance.nurseNotes,
      'Practices': instance.practices,
      'Diagnoses': instance.diagnoses,
    };
