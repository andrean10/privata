// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poli_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoliModelImpl _$$PoliModelImplFromJson(Map<String, dynamic> json) =>
    _$PoliModelImpl(
      poliSakit: json['poliSakit'] as bool?,
      createdAt: json['createdAt'] as String?,
      createdId: json['createdId'] as String?,
      kdPoli: json['kdPoli'] as String?,
      nmPoli: json['nmPoli'] as String?,
      quotaNonJkn: (json['quotaNonJkn'] as num?)?.toInt(),
      senin: json['senin'] == null
          ? null
          : DayModel.fromJson(json['senin'] as Map<String, dynamic>),
      selasa: json['selasa'] == null
          ? null
          : DayModel.fromJson(json['selasa'] as Map<String, dynamic>),
      rabu: json['rabu'] == null
          ? null
          : DayModel.fromJson(json['rabu'] as Map<String, dynamic>),
      kamis: json['kamis'] == null
          ? null
          : DayModel.fromJson(json['kamis'] as Map<String, dynamic>),
      jumat: json['jumat'] == null
          ? null
          : DayModel.fromJson(json['jumat'] as Map<String, dynamic>),
      sabtu: json['sabtu'] == null
          ? null
          : DayModel.fromJson(json['sabtu'] as Map<String, dynamic>),
      minggu: json['minggu'] == null
          ? null
          : DayModel.fromJson(json['minggu'] as Map<String, dynamic>),
      id: json['id'] as String?,
      hospitalId: json['hospitalId'] as String?,
      prefixAntrean: json['prefixAntrean'] as String?,
    );

Map<String, dynamic> _$$PoliModelImplToJson(_$PoliModelImpl instance) =>
    <String, dynamic>{
      'poliSakit': instance.poliSakit,
      'createdAt': instance.createdAt,
      'createdId': instance.createdId,
      'kdPoli': instance.kdPoli,
      'nmPoli': instance.nmPoli,
      'quotaNonJkn': instance.quotaNonJkn,
      'senin': instance.senin,
      'selasa': instance.selasa,
      'rabu': instance.rabu,
      'kamis': instance.kamis,
      'jumat': instance.jumat,
      'sabtu': instance.sabtu,
      'minggu': instance.minggu,
      'id': instance.id,
      'hospitalId': instance.hospitalId,
      'prefixAntrean': instance.prefixAntrean,
    };
