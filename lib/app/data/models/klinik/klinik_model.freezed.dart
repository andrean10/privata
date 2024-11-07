// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'klinik_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KlinikModel _$KlinikModelFromJson(Map<String, dynamic> json) {
  return _KlinikModel.fromJson(json);
}

/// @nodoc
mixin _$KlinikModel {
  String? get logo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KlinikModelCopyWith<KlinikModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KlinikModelCopyWith<$Res> {
  factory $KlinikModelCopyWith(
          KlinikModel value, $Res Function(KlinikModel) then) =
      _$KlinikModelCopyWithImpl<$Res, KlinikModel>;
  @useResult
  $Res call({String? logo});
}

/// @nodoc
class _$KlinikModelCopyWithImpl<$Res, $Val extends KlinikModel>
    implements $KlinikModelCopyWith<$Res> {
  _$KlinikModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = freezed,
  }) {
    return _then(_value.copyWith(
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KlinikModelImplCopyWith<$Res>
    implements $KlinikModelCopyWith<$Res> {
  factory _$$KlinikModelImplCopyWith(
          _$KlinikModelImpl value, $Res Function(_$KlinikModelImpl) then) =
      __$$KlinikModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? logo});
}

/// @nodoc
class __$$KlinikModelImplCopyWithImpl<$Res>
    extends _$KlinikModelCopyWithImpl<$Res, _$KlinikModelImpl>
    implements _$$KlinikModelImplCopyWith<$Res> {
  __$$KlinikModelImplCopyWithImpl(
      _$KlinikModelImpl _value, $Res Function(_$KlinikModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? logo = freezed,
  }) {
    return _then(_$KlinikModelImpl(
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KlinikModelImpl implements _KlinikModel {
  const _$KlinikModelImpl({this.logo});

  factory _$KlinikModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KlinikModelImplFromJson(json);

  @override
  final String? logo;

  @override
  String toString() {
    return 'KlinikModel(logo: $logo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KlinikModelImpl &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, logo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KlinikModelImplCopyWith<_$KlinikModelImpl> get copyWith =>
      __$$KlinikModelImplCopyWithImpl<_$KlinikModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KlinikModelImplToJson(
      this,
    );
  }
}

abstract class _KlinikModel implements KlinikModel {
  const factory _KlinikModel({final String? logo}) = _$KlinikModelImpl;

  factory _KlinikModel.fromJson(Map<String, dynamic> json) =
      _$KlinikModelImpl.fromJson;

  @override
  String? get logo;
  @override
  @JsonKey(ignore: true)
  _$$KlinikModelImplCopyWith<_$KlinikModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
