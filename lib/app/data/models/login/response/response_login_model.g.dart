// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseLoginModelImpl _$$ResponseLoginModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseLoginModelImpl(
      id: json['id'] as String?,
      created: json['created'] as String?,
      userId: json['userId'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      timestamp: (json['timestamp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ResponseLoginModelImplToJson(
        _$ResponseLoginModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created,
      'userId': instance.userId,
      'user': instance.user,
      'timestamp': instance.timestamp,
    };
