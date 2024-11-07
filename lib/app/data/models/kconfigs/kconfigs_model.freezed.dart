// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kconfigs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KConfigsModel _$KConfigsModelFromJson(Map<String, dynamic> json) {
  return _KConfigsModel.fromJson(json);
}

/// @nodoc
mixin _$KConfigsModel {
  String? get pharmacyAccount => throw _privateConstructorUsedError;
  FormatHeaderPaymentReceiptModel? get formatHeaderPaymentReceipt =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KConfigsModelCopyWith<KConfigsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KConfigsModelCopyWith<$Res> {
  factory $KConfigsModelCopyWith(
          KConfigsModel value, $Res Function(KConfigsModel) then) =
      _$KConfigsModelCopyWithImpl<$Res, KConfigsModel>;
  @useResult
  $Res call(
      {String? pharmacyAccount,
      FormatHeaderPaymentReceiptModel? formatHeaderPaymentReceipt});

  $FormatHeaderPaymentReceiptModelCopyWith<$Res>?
      get formatHeaderPaymentReceipt;
}

/// @nodoc
class _$KConfigsModelCopyWithImpl<$Res, $Val extends KConfigsModel>
    implements $KConfigsModelCopyWith<$Res> {
  _$KConfigsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pharmacyAccount = freezed,
    Object? formatHeaderPaymentReceipt = freezed,
  }) {
    return _then(_value.copyWith(
      pharmacyAccount: freezed == pharmacyAccount
          ? _value.pharmacyAccount
          : pharmacyAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      formatHeaderPaymentReceipt: freezed == formatHeaderPaymentReceipt
          ? _value.formatHeaderPaymentReceipt
          : formatHeaderPaymentReceipt // ignore: cast_nullable_to_non_nullable
              as FormatHeaderPaymentReceiptModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FormatHeaderPaymentReceiptModelCopyWith<$Res>?
      get formatHeaderPaymentReceipt {
    if (_value.formatHeaderPaymentReceipt == null) {
      return null;
    }

    return $FormatHeaderPaymentReceiptModelCopyWith<$Res>(
        _value.formatHeaderPaymentReceipt!, (value) {
      return _then(_value.copyWith(formatHeaderPaymentReceipt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$KConfigsModelImplCopyWith<$Res>
    implements $KConfigsModelCopyWith<$Res> {
  factory _$$KConfigsModelImplCopyWith(
          _$KConfigsModelImpl value, $Res Function(_$KConfigsModelImpl) then) =
      __$$KConfigsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? pharmacyAccount,
      FormatHeaderPaymentReceiptModel? formatHeaderPaymentReceipt});

  @override
  $FormatHeaderPaymentReceiptModelCopyWith<$Res>?
      get formatHeaderPaymentReceipt;
}

/// @nodoc
class __$$KConfigsModelImplCopyWithImpl<$Res>
    extends _$KConfigsModelCopyWithImpl<$Res, _$KConfigsModelImpl>
    implements _$$KConfigsModelImplCopyWith<$Res> {
  __$$KConfigsModelImplCopyWithImpl(
      _$KConfigsModelImpl _value, $Res Function(_$KConfigsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pharmacyAccount = freezed,
    Object? formatHeaderPaymentReceipt = freezed,
  }) {
    return _then(_$KConfigsModelImpl(
      pharmacyAccount: freezed == pharmacyAccount
          ? _value.pharmacyAccount
          : pharmacyAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      formatHeaderPaymentReceipt: freezed == formatHeaderPaymentReceipt
          ? _value.formatHeaderPaymentReceipt
          : formatHeaderPaymentReceipt // ignore: cast_nullable_to_non_nullable
              as FormatHeaderPaymentReceiptModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KConfigsModelImpl implements _KConfigsModel {
  const _$KConfigsModelImpl(
      {this.pharmacyAccount, this.formatHeaderPaymentReceipt});

  factory _$KConfigsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KConfigsModelImplFromJson(json);

  @override
  final String? pharmacyAccount;
  @override
  final FormatHeaderPaymentReceiptModel? formatHeaderPaymentReceipt;

  @override
  String toString() {
    return 'KConfigsModel(pharmacyAccount: $pharmacyAccount, formatHeaderPaymentReceipt: $formatHeaderPaymentReceipt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KConfigsModelImpl &&
            (identical(other.pharmacyAccount, pharmacyAccount) ||
                other.pharmacyAccount == pharmacyAccount) &&
            (identical(other.formatHeaderPaymentReceipt,
                    formatHeaderPaymentReceipt) ||
                other.formatHeaderPaymentReceipt ==
                    formatHeaderPaymentReceipt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, pharmacyAccount, formatHeaderPaymentReceipt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KConfigsModelImplCopyWith<_$KConfigsModelImpl> get copyWith =>
      __$$KConfigsModelImplCopyWithImpl<_$KConfigsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KConfigsModelImplToJson(
      this,
    );
  }
}

abstract class _KConfigsModel implements KConfigsModel {
  const factory _KConfigsModel(
          {final String? pharmacyAccount,
          final FormatHeaderPaymentReceiptModel? formatHeaderPaymentReceipt}) =
      _$KConfigsModelImpl;

  factory _KConfigsModel.fromJson(Map<String, dynamic> json) =
      _$KConfigsModelImpl.fromJson;

  @override
  String? get pharmacyAccount;
  @override
  FormatHeaderPaymentReceiptModel? get formatHeaderPaymentReceipt;
  @override
  @JsonKey(ignore: true)
  _$$KConfigsModelImplCopyWith<_$KConfigsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
