// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drugs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DrugsModelImpl _$$DrugsModelImplFromJson(Map<String, dynamic> json) =>
    _$DrugsModelImpl(
      medicineName: json['medicineName'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      unit: json['unit'] as String?,
      rule: json['rule'] as String?,
    );

Map<String, dynamic> _$$DrugsModelImplToJson(_$DrugsModelImpl instance) =>
    <String, dynamic>{
      'medicineName': instance.medicineName,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'rule': instance.rule,
    };
