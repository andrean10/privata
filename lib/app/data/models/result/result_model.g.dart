// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuccessWithDataImpl<T> _$$SuccessWithDataImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SuccessWithDataImpl<T>(
      fromJsonT(json['data']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SuccessWithDataImplToJson<T>(
  _$SuccessWithDataImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'runtimeType': instance.$type,
    };

_$SuccessWithPagesImpl<T> _$$SuccessWithPagesImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SuccessWithPagesImpl<T>(
      items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
      totalItem: (json['total_item'] as num).toInt(),
      totalPage: (json['total_page'] as num).toInt(),
      currentPage: (json['current_page'] as num).toInt(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SuccessWithPagesImplToJson<T>(
  _$SuccessWithPagesImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items.map(toJsonT).toList(),
      'total_item': instance.totalItem,
      'total_page': instance.totalPage,
      'current_page': instance.currentPage,
      'runtimeType': instance.$type,
    };

_$ErrorImpl<T> _$$ErrorImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ErrorImpl<T>(
      ErrorModel.fromJson(json['error'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorImplToJson<T>(
  _$ErrorImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };
