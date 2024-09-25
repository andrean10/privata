// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LinksModelImpl _$$LinksModelImplFromJson(Map<String, dynamic> json) =>
    _$LinksModelImpl(
      accountId: json['accountId'] as String?,
      configId: json['configId'] as String?,
      name: json['name'] as String?,
      active: json['active'] as bool?,
      type: json['type'] as String?,
      role: json['role'] as String?,
      roleId: json['roleId'] as String?,
      occupation: json['occupation'] as String?,
      employeeNo: json['employeeNo'] as String?,
      accountToken: json['accountToken'] as String?,
      hospitalId: json['hospitalId'] as String?,
      createdAt: json['createdAt'] as String?,
      createdId: json['createdId'] as String?,
      id: json['id'] as String?,
      note: json['note'] as String?,
      assistPref: json['assistPref'] as String?,
      roleActions: json['RoleActions'] == null
          ? null
          : RoleActionsModel.fromJson(
              json['RoleActions'] as Map<String, dynamic>),
      hospitals: json['Hospitals'] == null
          ? null
          : HospitalModel.fromJson(json['Hospitals'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LinksModelImplToJson(_$LinksModelImpl instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'configId': instance.configId,
      'name': instance.name,
      'active': instance.active,
      'type': instance.type,
      'role': instance.role,
      'roleId': instance.roleId,
      'occupation': instance.occupation,
      'employeeNo': instance.employeeNo,
      'accountToken': instance.accountToken,
      'hospitalId': instance.hospitalId,
      'createdAt': instance.createdAt,
      'createdId': instance.createdId,
      'id': instance.id,
      'note': instance.note,
      'assistPref': instance.assistPref,
      'RoleActions': instance.roleActions,
      'Hospitals': instance.hospitals,
    };
