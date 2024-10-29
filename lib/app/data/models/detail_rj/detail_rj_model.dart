import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:privata/app/data/models/rj/item_rj/patient/rj_patient_model.dart';
import 'package:privata/app/data/models/rj/item_rj/practice/practice_model.dart';

import '../rj/item_rj/vital_signs/vital_signs_model.dart';

import 'appointment/appointment_model.dart';
import 'diagnoses/diagnoses_model.dart';
import 'doctor_notes/doctor_notes_model.dart';
import 'nurse_notes/nurse_notes_model.dart';
import 'prescriptions/prescriptions_model.dart';
import 'procedure/procedure_model.dart';

part 'detail_rj_model.freezed.dart';
part 'detail_rj_model.g.dart';

@freezed
class DetailRJModel with _$DetailRJModel {
  const factory DetailRJModel({
    String? milis,
    bool? isBpjs,
    String? mrNo,
    String? status,
    String? practiceId,
    String? appointId,
    String? patientId,
    String? hospitalId,
    String? createdName,
    String? createdId,
    String? createdAt,
    bool? isShareRMToc,
    String? id,
    @JsonKey(name: 'VitalSigns') List<VitalSignsModel>? vitalSigns,
    @JsonKey(name: 'Patients') RJPatientModel? patients,
    @JsonKey(name: 'DoctorNotes') List<DoctorNotesModel>? doctorNotes,
    @JsonKey(name: 'NurseNotes') List<NurseNotesModel>? nurseNotes,
    @JsonKey(name: 'Prescriptions') List<PrescriptionsModel>? prescriptions,
    // List<Null>? scourPrescriptions,
    @JsonKey(name: 'Procedures') List<ProcedureModel>? procedures,
    @JsonKey(name: 'Appointments') AppointmentModel? appointments,
    @JsonKey(name: 'Practices') PracticeModel? practices,
    @JsonKey(name: 'Diagnoses') List<DiagnosesModel>? diagnoses,
    // List<Null>? kRecipeNotes,
  }) = _DetailRJModel;

  factory DetailRJModel.fromJson(Map<String, Object?> json) =>
      _$DetailRJModelFromJson(json);
}
