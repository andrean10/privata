import 'package:freezed_annotation/freezed_annotation.dart';

import 'ph/ph_model.dart';

part 'patient_model.freezed.dart';
part 'patient_model.g.dart';

@freezed
class PatientModel with _$PatientModel {
  const factory PatientModel({
    String? nama,
    int? gender,
    String? tanggalLahir,
    List<PHModel>? ph,
    String? religion,
    @JsonKey(name: 'birth_place') String? birthPlace,
    @JsonKey(name: 'address_domicile') String? addressDomicile,
    // Address? address,
    String? status,
    String? job,
    @JsonKey(name: 'blood_type') String? bloodType,
    String? phone,
    String? email,
    @JsonKey(name: 'id_ext') String? idExt,
    String? education,
    // bool? isShareMr,
    String? noKTP,
    // List<PaymentMethod>? paymentMethod,
    // List<Family>? family,
    // BpjsInfo? bpjsInfo,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'created_id') String? createdId,
    @JsonKey(name: 'updated_at') String? updatedAt,
    bool? isNew,
    bool? isDeleted,
    String? id,
    @JsonKey(name: 'id_users') List<String>? idUsers,
    String? ihsId,
    String? hp,
    // CompanyInfo? companyInfo,
    bool? isGenerateMrCode,
    String? motherName,
    List<String>? medicalHistory,
    // List<AllergicHistory>? allergicHistory,
    // List<MedicalHistoryFamily>? medicalHistoryFamily,
    List<String>? medicineHistory,
    bool? isTemporary,
    @JsonKey(name: 'is_medicaboo') bool? isMedicaboo,
    bool? isOA,
    String? patientIhsId,
    String? profilePicture,
    // AllergyIntolerance? allergyIntolerance,
  }) = _PatientModel;

  factory PatientModel.fromJson(Map<String, Object?> json) =>
      _$PatientModelFromJson(json);
}
