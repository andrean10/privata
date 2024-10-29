// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_procedure_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemProcedureModelImpl _$$ItemProcedureModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ItemProcedureModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      basicFee: (json['basicFee'] as num?)?.toInt(),
      totalFee: (json['totalFee'] as num?)?.toInt(),
      isPriceLock: json['isPriceLock'] as bool?,
    );

Map<String, dynamic> _$$ItemProcedureModelImplToJson(
        _$ItemProcedureModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'basicFee': instance.basicFee,
      'totalFee': instance.totalFee,
      'isPriceLock': instance.isPriceLock,
    };
