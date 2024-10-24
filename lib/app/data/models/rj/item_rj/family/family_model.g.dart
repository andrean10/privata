// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyModelImpl _$$FamilyModelImplFromJson(Map<String, dynamic> json) =>
    _$FamilyModelImpl(
      name: json['name'] as String?,
      relation: json['relation'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      bloodType: json['bloodType'] as String?,
      occupation: json['occupation'] as String?,
      address: json['address'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdId: json['created_id'] as String?,
      updatedId: json['updatedId'] as String?,
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
    );

Map<String, dynamic> _$$FamilyModelImplToJson(_$FamilyModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'relation': instance.relation,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'bloodType': instance.bloodType,
      'occupation': instance.occupation,
      'address': instance.address,
      'created_at': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'created_id': instance.createdId,
      'updatedId': instance.updatedId,
      'id': instance.id,
      'email': instance.email,
      'dateOfBirth': instance.dateOfBirth,
    };
