// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rj_patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RJPatientModelImpl _$$RJPatientModelImplFromJson(Map<String, dynamic> json) =>
    _$RJPatientModelImpl(
      nama: json['nama'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      tanggalLahir: json['tanggalLahir'] as String?,
      ph: (json['ph'] as List<dynamic>?)
          ?.map((e) => PHModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      religion: json['religion'] as String?,
      birthPlace: json['birth_place'] as String?,
      addressDomicile: json['address_domicile'] as String?,
      address: addressFromJson(json['address']),
      status: json['status'] as String?,
      job: json['job'] as String?,
      bloodType: json['blood_type'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      education: json['education'] as String?,
      isShareMr: json['isShareMr'] as bool?,
      noKTP: json['noKTP'] as String?,
      paymentMethod: (json['paymentMethod'] as List<dynamic>?)
          ?.map((e) => PaymentMethodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      family: (json['family'] as List<dynamic>?)
          ?.map((e) => FamilyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] as String?,
      createdId: json['created_id'] as String?,
      updatedAt: json['updated_at'] as String?,
      isNew: json['isNew'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      id: json['id'] as String?,
      idUsers: (json['id_users'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ihsId: json['ihsId'] as String?,
      hp: json['hp'] as String?,
      isGenerateMrCode: json['isGenerateMrCode'] as bool?,
      motherName: json['motherName'] as String?,
      medicalHistory: (json['medicalHistory'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      allergicHistory: (json['allergicHistory'] as List<dynamic>?)
          ?.map((e) => AllergicHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      medicineHistory: (json['medicineHistory'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isTemporary: json['isTemporary'] as bool?,
      isMedicaboo: json['is_medicaboo'] as bool?,
      isOA: json['isOA'] as bool?,
      patientIhsId: json['patientIhsId'] as String?,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$RJPatientModelImplToJson(
        _$RJPatientModelImpl instance) =>
    <String, dynamic>{
      'nama': instance.nama,
      'gender': instance.gender,
      'tanggalLahir': instance.tanggalLahir,
      'ph': instance.ph,
      'religion': instance.religion,
      'birth_place': instance.birthPlace,
      'address_domicile': instance.addressDomicile,
      'address': instance.address,
      'status': instance.status,
      'job': instance.job,
      'blood_type': instance.bloodType,
      'phone': instance.phone,
      'email': instance.email,
      'education': instance.education,
      'isShareMr': instance.isShareMr,
      'noKTP': instance.noKTP,
      'paymentMethod': instance.paymentMethod,
      'family': instance.family,
      'created_at': instance.createdAt,
      'created_id': instance.createdId,
      'updated_at': instance.updatedAt,
      'isNew': instance.isNew,
      'isDeleted': instance.isDeleted,
      'id': instance.id,
      'id_users': instance.idUsers,
      'ihsId': instance.ihsId,
      'hp': instance.hp,
      'isGenerateMrCode': instance.isGenerateMrCode,
      'motherName': instance.motherName,
      'medicalHistory': instance.medicalHistory,
      'allergicHistory': instance.allergicHistory,
      'medicineHistory': instance.medicineHistory,
      'isTemporary': instance.isTemporary,
      'is_medicaboo': instance.isMedicaboo,
      'isOA': instance.isOA,
      'patientIhsId': instance.patientIhsId,
      'profilePicture': instance.profilePicture,
    };
