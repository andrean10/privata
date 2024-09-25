// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      email: json['email'] as String?,
      emailVerified: json['emailVerified'] as bool?,
      notifSubscribe: json['notifSubscribe'] as bool?,
      hp: json['hp'] as String?,
      nama: json['nama'] as String?,
      platform: json['platform'] as String?,
      id: json['id'] as String?,
      isPartner: json['is_partner'] as bool?,
      isNeedChangePassword: json['isNeedChangePassword'] as bool?,
      lastLogin: json['last_login'] as String?,
      isPhoneVerified: json['isPhoneVerified'] as bool?,
      lastChangePassword: json['lastChangePassword'] as String?,
      createdDate: json['created_date'] as String?,
      occupation: json['occupation'] as String?,
      employeeNo: json['employeeNo'] as String?,
      uniqueCode: json['uniqueCode'] as String?,
      links: (json['Links'] as List<dynamic>?)
          ?.map((e) => LinksModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'emailVerified': instance.emailVerified,
      'notifSubscribe': instance.notifSubscribe,
      'hp': instance.hp,
      'nama': instance.nama,
      'platform': instance.platform,
      'id': instance.id,
      'is_partner': instance.isPartner,
      'isNeedChangePassword': instance.isNeedChangePassword,
      'last_login': instance.lastLogin,
      'isPhoneVerified': instance.isPhoneVerified,
      'lastChangePassword': instance.lastChangePassword,
      'created_date': instance.createdDate,
      'occupation': instance.occupation,
      'employeeNo': instance.employeeNo,
      'uniqueCode': instance.uniqueCode,
      'Links': instance.links,
    };
