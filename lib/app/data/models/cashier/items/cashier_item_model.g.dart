// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashierItemModelImpl _$$CashierItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CashierItemModelImpl(
      id: json['_id'] as String?,
      idToJson: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      procedureId: json['procedureId'] as String?,
      hospitalId: json['hospitalId'] as String?,
      kmrProcedureId: json['kmrProcedureId'] as String?,
      transactionId: json['transactionId'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      baseFee: (json['baseFee'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
      totalFee: (json['totalFee'] as num?)?.toInt(),
      isPriceLock: json['isPriceLock'] as bool?,
      transactionType: json['transactionType'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdId: json['createdId'] as String?,
      medicalHelperIds: json['medicalHelperIds'] as List<dynamic>?,
      discountType: json['discountType'] as String?,
      createdName: json['createdName'] as String?,
      isAdminFee: json['isAdminFee'] as bool?,
      itemsUsed: json['itemsUsed'] as List<dynamic>?,
      tuslahFee: (json['tuslahFee'] as num?)?.toInt(),
      embalaseFee: (json['embalaseFee'] as num?)?.toInt(),
      sellingPrice: (json['sellingPrice'] as List<dynamic>?)
          ?.map((e) => SellingPriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CashierItemModelImplToJson(
    _$CashierItemModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.idToJson,
    'name': instance.name,
    'type': instance.type,
    'procedureId': instance.procedureId,
    'hospitalId': instance.hospitalId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('kmrProcedureId', instance.kmrProcedureId);
  writeNotNull('transactionId', instance.transactionId);
  val['quantity'] = instance.quantity;
  val['baseFee'] = instance.baseFee;
  val['discount'] = instance.discount;
  val['totalFee'] = instance.totalFee;
  val['isPriceLock'] = instance.isPriceLock;
  val['transactionType'] = instance.transactionType;
  val['createdAt'] = instance.createdAt;
  val['updatedAt'] = instance.updatedAt;
  val['createdId'] = instance.createdId;
  val['medicalHelperIds'] = instance.medicalHelperIds;
  writeNotNull('discountType', instance.discountType);
  val['createdName'] = instance.createdName;
  writeNotNull('isAdminFee', instance.isAdminFee);
  val['itemsUsed'] = instance.itemsUsed;
  val['tuslahFee'] = instance.tuslahFee;
  val['embalaseFee'] = instance.embalaseFee;
  val['sellingPrice'] = instance.sellingPrice;
  return val;
}
