// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_payment_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemPaymentMethodModelImpl _$$ItemPaymentMethodModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemPaymentMethodModelImpl(
      id: idFromJson(json['id']),
      nama: json['nama'] as String?,
      tipe: json['tipe'] as String?,
    );

Map<String, dynamic> _$$ItemPaymentMethodModelImplToJson(
        _$ItemPaymentMethodModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'tipe': instance.tipe,
    };
