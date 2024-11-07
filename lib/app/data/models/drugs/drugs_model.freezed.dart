// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drugs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DrugsModel _$DrugsModelFromJson(Map<String, dynamic> json) {
  return _DrugsModel.fromJson(json);
}

/// @nodoc
mixin _$DrugsModel {
  String? get medicineName => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  String? get rule => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrugsModelCopyWith<DrugsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugsModelCopyWith<$Res> {
  factory $DrugsModelCopyWith(
          DrugsModel value, $Res Function(DrugsModel) then) =
      _$DrugsModelCopyWithImpl<$Res, DrugsModel>;
  @useResult
  $Res call({String? medicineName, int? quantity, String? unit, String? rule});
}

/// @nodoc
class _$DrugsModelCopyWithImpl<$Res, $Val extends DrugsModel>
    implements $DrugsModelCopyWith<$Res> {
  _$DrugsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicineName = freezed,
    Object? quantity = freezed,
    Object? unit = freezed,
    Object? rule = freezed,
  }) {
    return _then(_value.copyWith(
      medicineName: freezed == medicineName
          ? _value.medicineName
          : medicineName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      rule: freezed == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrugsModelImplCopyWith<$Res>
    implements $DrugsModelCopyWith<$Res> {
  factory _$$DrugsModelImplCopyWith(
          _$DrugsModelImpl value, $Res Function(_$DrugsModelImpl) then) =
      __$$DrugsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? medicineName, int? quantity, String? unit, String? rule});
}

/// @nodoc
class __$$DrugsModelImplCopyWithImpl<$Res>
    extends _$DrugsModelCopyWithImpl<$Res, _$DrugsModelImpl>
    implements _$$DrugsModelImplCopyWith<$Res> {
  __$$DrugsModelImplCopyWithImpl(
      _$DrugsModelImpl _value, $Res Function(_$DrugsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medicineName = freezed,
    Object? quantity = freezed,
    Object? unit = freezed,
    Object? rule = freezed,
  }) {
    return _then(_$DrugsModelImpl(
      medicineName: freezed == medicineName
          ? _value.medicineName
          : medicineName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      rule: freezed == rule
          ? _value.rule
          : rule // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DrugsModelImpl implements _DrugsModel {
  const _$DrugsModelImpl(
      {this.medicineName, this.quantity, this.unit, this.rule});

  factory _$DrugsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrugsModelImplFromJson(json);

  @override
  final String? medicineName;
  @override
  final int? quantity;
  @override
  final String? unit;
  @override
  final String? rule;

  @override
  String toString() {
    return 'DrugsModel(medicineName: $medicineName, quantity: $quantity, unit: $unit, rule: $rule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrugsModelImpl &&
            (identical(other.medicineName, medicineName) ||
                other.medicineName == medicineName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.rule, rule) || other.rule == rule));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, medicineName, quantity, unit, rule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DrugsModelImplCopyWith<_$DrugsModelImpl> get copyWith =>
      __$$DrugsModelImplCopyWithImpl<_$DrugsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrugsModelImplToJson(
      this,
    );
  }
}

abstract class _DrugsModel implements DrugsModel {
  const factory _DrugsModel(
      {final String? medicineName,
      final int? quantity,
      final String? unit,
      final String? rule}) = _$DrugsModelImpl;

  factory _DrugsModel.fromJson(Map<String, dynamic> json) =
      _$DrugsModelImpl.fromJson;

  @override
  String? get medicineName;
  @override
  int? get quantity;
  @override
  String? get unit;
  @override
  String? get rule;
  @override
  @JsonKey(ignore: true)
  _$$DrugsModelImplCopyWith<_$DrugsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
