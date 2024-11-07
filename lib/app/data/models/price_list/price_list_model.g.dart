// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceListModelImpl _$$PriceListModelImplFromJson(Map<String, dynamic> json) =>
    _$PriceListModelImpl(
      id_: json['_id'] as String?,
      basicFee: (json['basicFee'] as num?)?.toInt(),
      name: json['name'] as String?,
      sellingPrice: (json['sellingPrice'] as List<dynamic>?)
          ?.map((e) => SellingPriceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalFee: (json['totalFee'] as num?)?.toInt(),
      totalTaxFee: (json['totalTaxFee'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$PriceListModelImplToJson(
        _$PriceListModelImpl instance) =>
    <String, dynamic>{
      'basicFee': instance.basicFee,
      'name': instance.name,
      'sellingPrice': instance.sellingPrice,
      'totalFee': instance.totalFee,
      'totalTaxFee': instance.totalTaxFee,
      'type': instance.type,
    };
