// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      username: json['username'] as String,
      password: json['password'] as String,
      location: json['location'] == null
          ? null
          : PositionModel.fromJson(json['location'] as Map<String, dynamic>),
      isMobile: json['isMobile'] as bool? ?? true,
      deviceName: json['deviceName'] as String? ?? '-',
      browserName: json['browserName'] as String? ?? '-',
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'location': instance.location,
      'isMobile': instance.isMobile,
      'deviceName': instance.deviceName,
      'browserName': instance.browserName,
    };
