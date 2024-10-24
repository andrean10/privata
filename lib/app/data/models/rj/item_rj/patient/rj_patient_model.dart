import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:privata/app/data/models/rj/item_rj/patient/allergic_history/allergic_history_model.dart';

import '../../../patient/address/address_model.dart';
import '../family/family_model.dart';
import 'payment_method/payment_method_model.dart';
import 'ph/ph_model.dart';

part 'rj_patient_model.freezed.dart';
part 'rj_patient_model.g.dart';

@freezed
class RJPatientModel with _$RJPatientModel {
  const factory RJPatientModel({
    String? nama,
    int? gender,
    String? tanggalLahir,
    List<PHModel>? ph,
    String? religion,
    @JsonKey(name: 'birth_place') String? birthPlace,
    @JsonKey(name: 'address_domicile') String? addressDomicile,
    @JsonKey(fromJson: addressFromJson) AddressModel? address,
    String? status,
    String? job,
    @JsonKey(name: 'blood_type') String? bloodType,
    String? phone,
    String? email,
    // @JsonKey(name: 'id_ext') String? idExt,
    String? education,
    bool? isShareMr,
    String? noKTP,
    List<PaymentMethodModel>? paymentMethod,
    List<FamilyModel>? family,
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
    List<AllergicHistoryModel>? allergicHistory,
    // List<MedicalHistoryFamily>? medicalHistoryFamily,
    List<String>? medicineHistory,
    bool? isTemporary,
    @JsonKey(name: 'is_medicaboo') bool? isMedicaboo,
    bool? isOA,
    String? patientIhsId,
    String? profilePicture,
    // AllergyIntolerance? allergyIntolerance,
  }) = _RJPatientModel;

  factory RJPatientModel.fromJson(Map<String, Object?> json) =>
      _$RJPatientModelFromJson(json);
}

AddressModel? addressFromJson(dynamic json) {
  if (json is Map<String, dynamic>) {
    return AddressModel.fromJson(json);
  } else if (json is String) {
    return const AddressModel(
      jalan: '',
      city: '',
      district: '',
      postcode: '',
      region: '',
      post: 0,
    );
  }

  return null;
}
