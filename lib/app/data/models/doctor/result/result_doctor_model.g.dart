// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultDoctorModelImpl _$$ResultDoctorModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResultDoctorModelImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalItem: (json['total_item'] as num).toInt(),
      totalPage: (json['total_page'] as num).toInt(),
      currentPage: (json['current_page'] as num).toInt(),
    );

Map<String, dynamic> _$$ResultDoctorModelImplToJson(
        _$ResultDoctorModelImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total_item': instance.totalItem,
      'total_page': instance.totalPage,
      'current_page': instance.currentPage,
    };
