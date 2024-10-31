// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashier_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashierModelImpl _$$CashierModelImplFromJson(Map<String, dynamic> json) =>
    _$CashierModelImpl(
      id: json['_id'] as String?,
      status: json['status'] as String?,
      totalFee: (json['totalFee'] as num?)?.toInt(),
      patients: json['Patients'] == null
          ? null
          : PatientModel.fromJson(json['Patients'] as Map<String, dynamic>),
      items: (json['Items'] as List<dynamic>?)
          ?.map((e) => CashierItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CashierModelImplToJson(_$CashierModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'status': instance.status,
      'totalFee': instance.totalFee,
      'Patients': instance.patients,
      'Items': instance.items,
    };
