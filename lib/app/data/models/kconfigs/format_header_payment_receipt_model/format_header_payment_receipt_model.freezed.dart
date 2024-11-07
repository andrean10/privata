// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'format_header_payment_receipt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FormatHeaderPaymentReceiptModel _$FormatHeaderPaymentReceiptModelFromJson(
    Map<String, dynamic> json) {
  return _FormatHeaderPaymentReceiptModel.fromJson(json);
}

/// @nodoc
mixin _$FormatHeaderPaymentReceiptModel {
  String? get clinicName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get npwp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FormatHeaderPaymentReceiptModelCopyWith<FormatHeaderPaymentReceiptModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormatHeaderPaymentReceiptModelCopyWith<$Res> {
  factory $FormatHeaderPaymentReceiptModelCopyWith(
          FormatHeaderPaymentReceiptModel value,
          $Res Function(FormatHeaderPaymentReceiptModel) then) =
      _$FormatHeaderPaymentReceiptModelCopyWithImpl<$Res,
          FormatHeaderPaymentReceiptModel>;
  @useResult
  $Res call({String? clinicName, String? address, String? phone, String? npwp});
}

/// @nodoc
class _$FormatHeaderPaymentReceiptModelCopyWithImpl<$Res,
        $Val extends FormatHeaderPaymentReceiptModel>
    implements $FormatHeaderPaymentReceiptModelCopyWith<$Res> {
  _$FormatHeaderPaymentReceiptModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicName = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? npwp = freezed,
  }) {
    return _then(_value.copyWith(
      clinicName: freezed == clinicName
          ? _value.clinicName
          : clinicName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      npwp: freezed == npwp
          ? _value.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormatHeaderPaymentReceiptModelImplCopyWith<$Res>
    implements $FormatHeaderPaymentReceiptModelCopyWith<$Res> {
  factory _$$FormatHeaderPaymentReceiptModelImplCopyWith(
          _$FormatHeaderPaymentReceiptModelImpl value,
          $Res Function(_$FormatHeaderPaymentReceiptModelImpl) then) =
      __$$FormatHeaderPaymentReceiptModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clinicName, String? address, String? phone, String? npwp});
}

/// @nodoc
class __$$FormatHeaderPaymentReceiptModelImplCopyWithImpl<$Res>
    extends _$FormatHeaderPaymentReceiptModelCopyWithImpl<$Res,
        _$FormatHeaderPaymentReceiptModelImpl>
    implements _$$FormatHeaderPaymentReceiptModelImplCopyWith<$Res> {
  __$$FormatHeaderPaymentReceiptModelImplCopyWithImpl(
      _$FormatHeaderPaymentReceiptModelImpl _value,
      $Res Function(_$FormatHeaderPaymentReceiptModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clinicName = freezed,
    Object? address = freezed,
    Object? phone = freezed,
    Object? npwp = freezed,
  }) {
    return _then(_$FormatHeaderPaymentReceiptModelImpl(
      clinicName: freezed == clinicName
          ? _value.clinicName
          : clinicName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      npwp: freezed == npwp
          ? _value.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FormatHeaderPaymentReceiptModelImpl
    implements _FormatHeaderPaymentReceiptModel {
  const _$FormatHeaderPaymentReceiptModelImpl(
      {this.clinicName, this.address, this.phone, this.npwp});

  factory _$FormatHeaderPaymentReceiptModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FormatHeaderPaymentReceiptModelImplFromJson(json);

  @override
  final String? clinicName;
  @override
  final String? address;
  @override
  final String? phone;
  @override
  final String? npwp;

  @override
  String toString() {
    return 'FormatHeaderPaymentReceiptModel(clinicName: $clinicName, address: $address, phone: $phone, npwp: $npwp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormatHeaderPaymentReceiptModelImpl &&
            (identical(other.clinicName, clinicName) ||
                other.clinicName == clinicName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.npwp, npwp) || other.npwp == npwp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clinicName, address, phone, npwp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FormatHeaderPaymentReceiptModelImplCopyWith<
          _$FormatHeaderPaymentReceiptModelImpl>
      get copyWith => __$$FormatHeaderPaymentReceiptModelImplCopyWithImpl<
          _$FormatHeaderPaymentReceiptModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FormatHeaderPaymentReceiptModelImplToJson(
      this,
    );
  }
}

abstract class _FormatHeaderPaymentReceiptModel
    implements FormatHeaderPaymentReceiptModel {
  const factory _FormatHeaderPaymentReceiptModel(
      {final String? clinicName,
      final String? address,
      final String? phone,
      final String? npwp}) = _$FormatHeaderPaymentReceiptModelImpl;

  factory _FormatHeaderPaymentReceiptModel.fromJson(Map<String, dynamic> json) =
      _$FormatHeaderPaymentReceiptModelImpl.fromJson;

  @override
  String? get clinicName;
  @override
  String? get address;
  @override
  String? get phone;
  @override
  String? get npwp;
  @override
  @JsonKey(ignore: true)
  _$$FormatHeaderPaymentReceiptModelImplCopyWith<
          _$FormatHeaderPaymentReceiptModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
