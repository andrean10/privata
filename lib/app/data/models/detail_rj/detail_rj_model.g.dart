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
      doctorNotes: (json['DoctorNotes'] as List<dynamic>?)
          ?.map((e) => DoctorNotesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nurseNotes: (json['NurseNotes'] as List<dynamic>?)
          ?.map((e) => NurseNotesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      prescriptions: (json['Prescriptions'] as List<dynamic>?)
          ?.map((e) => PrescriptionsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      procedures: (json['Procedures'] as List<dynamic>?)
          ?.map((e) => ProcedureModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      appointments: json['Appointments'] == null
          ? null
          : AppointmentModel.fromJson(
              json['Appointments'] as Map<String, dynamic>),
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
      'DoctorNotes': instance.doctorNotes,
      'NurseNotes': instance.nurseNotes,
      'Prescriptions': instance.prescriptions,
      'Procedures': instance.procedures,
      'Appointments': instance.appointments,
      'Practices': instance.practices,
      'Diagnoses': instance.diagnoses,
    };
