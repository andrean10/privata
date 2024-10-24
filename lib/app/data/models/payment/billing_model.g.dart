// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillingModelImpl _$$BillingModelImplFromJson(Map<String, dynamic> json) =>
    _$BillingModelImpl(
      token: json['token'] as String?,
      url: json['redirect_url'] as String?,
    );

Map<String, dynamic> _$$BillingModelImplToJson(_$BillingModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'redirect_url': instance.url,
    };
