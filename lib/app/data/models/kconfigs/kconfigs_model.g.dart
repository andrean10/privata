// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kconfigs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KConfigsModelImpl _$$KConfigsModelImplFromJson(Map<String, dynamic> json) =>
    _$KConfigsModelImpl(
      pharmacyAccount: json['pharmacyAccount'] as String?,
      formatHeaderPaymentReceipt: json['formatHeaderPaymentReceipt'] == null
          ? null
          : FormatHeaderPaymentReceiptModel.fromJson(
              json['formatHeaderPaymentReceipt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$KConfigsModelImplToJson(_$KConfigsModelImpl instance) =>
    <String, dynamic>{
      'pharmacyAccount': instance.pharmacyAccount,
      'formatHeaderPaymentReceipt': instance.formatHeaderPaymentReceipt,
    };
