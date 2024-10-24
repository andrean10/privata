// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PracticeModelImpl _$$PracticeModelImplFromJson(Map<String, dynamic> json) =>
    _$PracticeModelImpl(
      totalItem: (json['totalItem'] as num?)?.toInt(),
      totalPage: (json['total_page'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      nama: json['nama'] as String?,
      rs: json['rs'] as String?,
      harga: (json['harga'] as num?)?.toInt(),
      telepon: json['telepon'] as String?,
      pengenal: json['pengenal'] as String?,
      spesialis: json['spesialis'] as String?,
      dokterFkIds: json['dokterFkIds'] as String?,
      rumahSakitId: json['rumahSakitId'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      isVerified: json['is_verified'] as bool?,
      isVisible: json['is_visible'] as bool?,
      rekomendasi: (json['rekomendasi'] as num?)?.toInt(),
      gambarLatar: json['gambar_latar'] as String?,
      kodeDokterBpjs: json['kodeDokterBpjs'] as String?,
      id: json['id'] as String?,
      slugRs: json['slug_rs'] as String?,
      levelDoctor: json['level_doctor'] as bool?,
      noKTP: json['noKTP'] as String?,
      displayQueueName: json['displayQueueName'] as String?,
      updatedAt: json['updatedAt'] as String?,
      updatedId: json['updatedId'] as String?,
      updatedName: json['updatedName'] as String?,
      dkonsulDoctorId: json['dkonsulDoctorId'] as String?,
      createdAt: json['createdAt'] as String?,
      prefixAntrean: json['prefixAntrean'] as String?,
      practitionerIhsId: json['practitionerIhsId'] as String?,
    );

Map<String, dynamic> _$$PracticeModelImplToJson(_$PracticeModelImpl instance) =>
    <String, dynamic>{
      'totalItem': instance.totalItem,
      'total_page': instance.totalPage,
      'current_page': instance.currentPage,
      'nama': instance.nama,
      'rs': instance.rs,
      'harga': instance.harga,
      'telepon': instance.telepon,
      'pengenal': instance.pengenal,
      'spesialis': instance.spesialis,
      'dokterFkIds': instance.dokterFkIds,
      'rumahSakitId': instance.rumahSakitId,
      'gender': instance.gender,
      'is_verified': instance.isVerified,
      'is_visible': instance.isVisible,
      'rekomendasi': instance.rekomendasi,
      'gambar_latar': instance.gambarLatar,
      'kodeDokterBpjs': instance.kodeDokterBpjs,
      'id': instance.id,
      'slug_rs': instance.slugRs,
      'level_doctor': instance.levelDoctor,
      'noKTP': instance.noKTP,
      'displayQueueName': instance.displayQueueName,
      'updatedAt': instance.updatedAt,
      'updatedId': instance.updatedId,
      'updatedName': instance.updatedName,
      'dkonsulDoctorId': instance.dkonsulDoctorId,
      'createdAt': instance.createdAt,
      'prefixAntrean': instance.prefixAntrean,
      'practitionerIhsId': instance.practitionerIhsId,
    };
