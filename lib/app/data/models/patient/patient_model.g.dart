// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientModelImpl _$$PatientModelImplFromJson(Map<String, dynamic> json) =>
    _$PatientModelImpl(
      nama: json['nama'] as String?,
      tanggalLahir: json['tanggalLahir'] as String?,
      ph: (json['ph'] as List<dynamic>?)
          ?.map((e) => PHModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$PatientModelImplToJson(_$PatientModelImpl instance) =>
    <String, dynamic>{
      'nama': instance.nama,
      'tanggalLahir': instance.tanggalLahir,
      'ph': instance.ph,
      'address': instance.address,
      'phone': instance.phone,
      'id': instance.id,
    };
