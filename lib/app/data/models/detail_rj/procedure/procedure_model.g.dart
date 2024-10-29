// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcedureModelImpl _$$ProcedureModelImplFromJson(Map<String, dynamic> json) =>
    _$ProcedureModelImpl(
      id: json['id'] as String?,
      procedureId: json['procedureId'] as String?,
      procedureName: json['procedureName'] as String?,
      basicFee: (json['basicFee'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      discountFee: (json['discountFee'] as num?)?.toInt(),
      totalFee: (json['totalFee'] as num?)?.toInt(),
      streakId: json['streakId'] as String?,
      streakName: json['streakName'] as String?,
      createdId: json['createdId'] as String?,
      createdAt: json['createdAt'] as String?,
      createdName: json['createdName'] as String?,
      isPriceLock: json['isPriceLock'] as bool?,
      discountType: json['discountType'] as String?,
    );

Map<String, dynamic> _$$ProcedureModelImplToJson(
        _$ProcedureModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'procedureId': instance.procedureId,
      'procedureName': instance.procedureName,
      'basicFee': instance.basicFee,
      'quantity': instance.quantity,
      'discountFee': instance.discountFee,
      'totalFee': instance.totalFee,
      'streakId': instance.streakId,
      'streakName': instance.streakName,
      'createdId': instance.createdId,
      'createdAt': instance.createdAt,
      'createdName': instance.createdName,
      'isPriceLock': instance.isPriceLock,
      'discountType': instance.discountType,
    };
