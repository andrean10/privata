// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescriptions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrescriptionsModelImpl _$$PrescriptionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PrescriptionsModelImpl(
      quantity: (json['quantity'] as num?)?.toInt(),
      basicFee: basicFeeFromJson(json['basicFee']),
      totalFee: (json['totalFee'] as num?)?.toInt(),
      medicineName: json['medicineName'] as String?,
      cigna: json['cigna'] as String?,
      recommendation: (json['recommendation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isDb: json['isDb'] as bool?,
      mrNo: json['mrNo'] as String?,
      patientId: json['patientId'] as String?,
      mrId: json['mrId'] as String?,
      hospitalId: json['hospitalId'] as String?,
      practiceId: json['practiceId'] as String?,
      appointId: json['appointId'] as String?,
      isPriceLock: json['isPriceLock'] as bool?,
      createdName: json['createdName'] as String?,
      createdId: json['createdId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      streakId: json['streakId'] as String?,
      streakName: json['streakName'] as String?,
      id: json['id'] as String?,
      isSatuSehatPrivata: json['isSatuSehatPrivata'] as bool?,
      category: json['category'] as String?,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$$PrescriptionsModelImplToJson(
        _$PrescriptionsModelImpl instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'basicFee': instance.basicFee,
      'totalFee': instance.totalFee,
      'medicineName': instance.medicineName,
      'cigna': instance.cigna,
      'recommendation': instance.recommendation,
      'isDb': instance.isDb,
      'mrNo': instance.mrNo,
      'patientId': instance.patientId,
      'mrId': instance.mrId,
      'hospitalId': instance.hospitalId,
      'practiceId': instance.practiceId,
      'appointId': instance.appointId,
      'isPriceLock': instance.isPriceLock,
      'createdName': instance.createdName,
      'createdId': instance.createdId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'streakId': instance.streakId,
      'streakName': instance.streakName,
      'id': instance.id,
      'isSatuSehatPrivata': instance.isSatuSehatPrivata,
      'category': instance.category,
      'unit': instance.unit,
    };
