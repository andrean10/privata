// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_rj_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemRJModelImpl _$$ItemRJModelImplFromJson(Map<String, dynamic> json) =>
    _$ItemRJModelImpl(
      bpjsTreatment: json['bpjsTreatment'] as String?,
      poli: json['poli'] as String?,
      pasienFkId: json['pasienFkId'] as String?,
      praktekFkId: json['praktekFkId'] as String?,
      day: json['day'] as String?,
      appDate: json['appDate'] as String?,
      date: json['date'] as String?,
      mulai: (json['mulai'] as num?)?.toInt(),
      selesai: (json['selesai'] as num?)?.toInt(),
      estimateTime: (json['estimateTime'] as num?)?.toInt(),
      consultPlanDuration: json['consultPlanDuration'],
      status: json['status'] as String?,
      isMedicaboo: json['is_medicaboo'] as bool?,
      rumahSakitId: json['rumahSakitId'] as String?,
      hp: json['hp'] as String?,
      idExt: json['id_ext'] as String?,
      paymentMethod: json['payment_method'] as String?,
      createdAt: json['createdAt'] as String?,
      confirmed: json['confirmed'] as bool?,
      startWaitingTime: (json['startWaitingTime'] as num?)?.toInt(),
      startEngageTime: (json['startEngageTime'] as num?)?.toInt(),
      procedurePlan: json['procedurePlan'] as String?,
      complaint: json['complaint'] as String?,
      triase: json['triase'] as String?,
      isBpjs: json['isBpjs'] as bool?,
      finishedDate: json['finishedDate'] as String?,
      finishedId: json['finishedId'] as String?,
      isPayFirst: json['isPayFirst'] as bool?,
      uniqueCode: json['uniqueCode'] as String?,
      isAntrolFKTP: json['isAntrolFKTP'] as bool?,
      isAntrolFKTPV2: json['isAntrolFKTPV2'] as bool?,
      id: json['id'] as String?,
      doctorName: json['doctorName'] as String?,
      createdName: json['createdName'] as String?,
      pasiens: json['Pasiens'] == null
          ? null
          : PatientModel.fromJson(json['Pasiens'] as Map<String, dynamic>),
      encounterId: json['encounterId'] as String?,
    );

Map<String, dynamic> _$$ItemRJModelImplToJson(_$ItemRJModelImpl instance) =>
    <String, dynamic>{
      'bpjsTreatment': instance.bpjsTreatment,
      'poli': instance.poli,
      'pasienFkId': instance.pasienFkId,
      'praktekFkId': instance.praktekFkId,
      'day': instance.day,
      'appDate': instance.appDate,
      'date': instance.date,
      'mulai': instance.mulai,
      'selesai': instance.selesai,
      'estimateTime': instance.estimateTime,
      'consultPlanDuration': instance.consultPlanDuration,
      'status': instance.status,
      'is_medicaboo': instance.isMedicaboo,
      'rumahSakitId': instance.rumahSakitId,
      'hp': instance.hp,
      'id_ext': instance.idExt,
      'payment_method': instance.paymentMethod,
      'createdAt': instance.createdAt,
      'confirmed': instance.confirmed,
      'startWaitingTime': instance.startWaitingTime,
      'startEngageTime': instance.startEngageTime,
      'procedurePlan': instance.procedurePlan,
      'complaint': instance.complaint,
      'triase': instance.triase,
      'isBpjs': instance.isBpjs,
      'finishedDate': instance.finishedDate,
      'finishedId': instance.finishedId,
      'isPayFirst': instance.isPayFirst,
      'uniqueCode': instance.uniqueCode,
      'isAntrolFKTP': instance.isAntrolFKTP,
      'isAntrolFKTPV2': instance.isAntrolFKTPV2,
      'id': instance.id,
      'doctorName': instance.doctorName,
      'createdName': instance.createdName,
      'Pasiens': instance.pasiens,
      'encounterId': instance.encounterId,
    };
