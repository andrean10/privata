// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorModelImpl _$$DoctorModelImplFromJson(Map<String, dynamic> json) =>
    _$DoctorModelImpl(
      nama: json['nama'] as String?,
      rs: json['rs'] as String?,
      telepon: json['telepon'] as String?,
      pengenal: json['pengenal'] as String?,
      spesialis: json['spesialis'] as String?,
      dokterFkIds: json['dokterFkIds'] as String?,
      rumahSakitId: json['rumahSakitId'] as String?,
      isVerified: json['is_verified'] as bool?,
      isVisible: json['is_visible'] as bool?,
      id: json['id'] as String?,
      slugRs: json['slugRs'] as String?,
      dokters: json['Dokters'] == null
          ? null
          : ItemDoctorModel.fromJson(json['Dokters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DoctorModelImplToJson(_$DoctorModelImpl instance) =>
    <String, dynamic>{
      'nama': instance.nama,
      'rs': instance.rs,
      'telepon': instance.telepon,
      'pengenal': instance.pengenal,
      'spesialis': instance.spesialis,
      'dokterFkIds': instance.dokterFkIds,
      'rumahSakitId': instance.rumahSakitId,
      'is_verified': instance.isVerified,
      'is_visible': instance.isVisible,
      'id': instance.id,
      'slugRs': instance.slugRs,
      'Dokters': instance.dokters,
    };
