// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rj_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RJModelImpl _$$RJModelImplFromJson(Map<String, dynamic> json) =>
    _$RJModelImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemRJModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItem: (json['total_item'] as num?)?.toInt(),
      totalPage: (json['total_page'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RJModelImplToJson(_$RJModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total_item': instance.totalItem,
      'total_page': instance.totalPage,
      'current_page': instance.currentPage,
    };
