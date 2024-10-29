// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientModelImpl _$$PatientModelImplFromJson(Map<String, dynamic> json) =>
    _$PatientModelImpl(
      nama: json['nama'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      tanggalLahir: json['tanggalLahir'] as String?,
      ph: (json['ph'] as List<dynamic>?)
          ?.map((e) => PHModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: addressFromJson(json['address']),
      phone: json['phone'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$PatientModelImplToJson(_$PatientModelImpl instance) =>
    <String, dynamic>{
      'nama': instance.nama,
      'gender': instance.gender,
      'tanggalLahir': instance.tanggalLahir,
      'ph': instance.ph,
      'address': instance.address,
      'phone': instance.phone,
      'id': instance.id,
    };
