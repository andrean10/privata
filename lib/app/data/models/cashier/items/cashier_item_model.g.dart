// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashierItemModelImpl _$$CashierItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CashierItemModelImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      depotId: json['depotId'] as String?,
      transactionId: json['transactionId'] as String?,
      createdAt: json['createdAt'] as String?,
      createdId: json['createdId'] as String?,
      createdName: json['createdName'] as String?,
      updatedAt: json['updatedAt'] as String?,
      baseFee: (json['baseFee'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      totalFee: (json['totalFee'] as num?)?.toInt(),
      unit: json['unit'] as String?,
      dosage: json['dosage'] as String?,
    );

Map<String, dynamic> _$$CashierItemModelImplToJson(
        _$CashierItemModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'quantity': instance.quantity,
      'depotId': instance.depotId,
      'transactionId': instance.transactionId,
      'createdAt': instance.createdAt,
      'createdId': instance.createdId,
      'createdName': instance.createdName,
      'updatedAt': instance.updatedAt,
      'baseFee': instance.baseFee,
      'discount': instance.discount,
      'totalFee': instance.totalFee,
      'unit': instance.unit,
      'dosage': instance.dosage,
    };
