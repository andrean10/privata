// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      jalan: json['jalan'] as String?,
      region: json['region'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      postcode: json['postcode'] as String?,
      post: (json['post'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'jalan': instance.jalan,
      'region': instance.region,
      'city': instance.city,
      'district': instance.district,
      'postcode': instance.postcode,
      'post': instance.post,
    };
