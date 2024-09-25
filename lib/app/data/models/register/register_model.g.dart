// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterModelImpl _$$RegisterModelImplFromJson(Map<String, dynamic> json) =>
    _$RegisterModelImpl(
      links: (json['Links'] as List<dynamic>?)
          ?.map((e) => LinksModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['email'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      hp: json['hp'] as String?,
      nama: json['nama'] as String?,
      password: json['password'] as String?,
      username: json['username'] as String?,
      from: json['from'] as String?,
    );

Map<String, dynamic> _$$RegisterModelImplToJson(_$RegisterModelImpl instance) =>
    <String, dynamic>{
      'Links': instance.links,
      'email': instance.email,
      'gender': instance.gender,
      'hp': instance.hp,
      'nama': instance.nama,
      'password': instance.password,
      'username': instance.username,
      'from': instance.from,
    };
