// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientServerImpl _$$PatientServerImplFromJson(Map<String, dynamic> json) =>
    _$PatientServerImpl(
      nama: json['nama'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      tanggalLahir: json['tanggalLahir'] as String?,
      ph: (json['ph'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      religion: json['religion'] as String?,
      birthPlace: json['birth_place'] as String?,
      addressDomicile: json['address_domicile'] as String?,
      address: json['address'] as Map<String, dynamic>?,
      status: json['status'] as String?,
      job: json['job'] as String?,
      bloodType: json['blood_type'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      education: json['education'] as String?,
      isShareMr: json['isShareMr'] as bool?,
      noKTP: json['noKTP'] as String?,
      paymentMethod: (json['paymentMethod'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      family: (json['family'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      createdAt: json['created_at'] as String?,
      hp: json['hp'] as String?,
      isGenerateMrCode: json['isGenerateMrCode'] as bool?,
      profilePicture: json['profilePicture'] as String?,
    );

Map<String, dynamic> _$$PatientServerImplToJson(_$PatientServerImpl instance) =>
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
      'hp': instance.hp,
      'isGenerateMrCode': instance.isGenerateMrCode,
      'profilePicture': instance.profilePicture,
    };
