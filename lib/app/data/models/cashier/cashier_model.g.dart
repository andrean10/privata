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
      payments: (json['Payments'] as List<dynamic>?)
          ?.map((e) => PaymentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      patientName: json['patientName'] as String?,
      patientId: json['patientId'] as String?,
      mrId: json['mrId'] as String?,
      mrNo: json['mrNo'] as String?,
      discount: (json['discount'] as num?)?.toInt(),
      baseFee: (json['baseFee'] as num?)?.toInt(),
      paidFee: (json['paidFee'] as num?)?.toInt(),
      subTotalFee: (json['subTotalFee'] as num?)?.toInt(),
      creditFee: (json['creditFee'] as num?)?.toInt(),
      totalTaxFee: (json['totalTaxFee'] as num?)?.toInt(),
      code: json['code'] as String?,
      createdAt: json['createdAt'] as String?,
      createdId: json['createdId'] as String?,
      createdName: json['createdName'] as String?,
      isBpjs: json['isBpjs'] as bool?,
      isOutcome: json['isOutcome'] as bool?,
      isOnlyPOS: json['isOnlyPOS'] as bool?,
    );

Map<String, dynamic> _$$CashierModelImplToJson(_$CashierModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'status': instance.status,
      'totalFee': instance.totalFee,
      'Patients': instance.patients,
      'Items': instance.items,
      'Payments': instance.payments,
      'patientName': instance.patientName,
      'patientId': instance.patientId,
      'mrId': instance.mrId,
      'mrNo': instance.mrNo,
      'discount': instance.discount,
      'baseFee': instance.baseFee,
      'paidFee': instance.paidFee,
      'subTotalFee': instance.subTotalFee,
      'creditFee': instance.creditFee,
      'totalTaxFee': instance.totalTaxFee,
      'code': instance.code,
      'createdAt': instance.createdAt,
      'createdId': instance.createdId,
      'createdName': instance.createdName,
      'isBpjs': instance.isBpjs,
      'isOutcome': instance.isOutcome,
      'isOnlyPOS': instance.isOnlyPOS,
    };
