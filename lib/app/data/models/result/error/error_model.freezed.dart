// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) {
  return _ErrorModel.fromJson(json);
}

/// @nodoc
mixin _$ErrorModel {
  String? get name => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorModelCopyWith<ErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorModelCopyWith<$Res> {
  factory $ErrorModelCopyWith(
          ErrorModel value, $Res Function(ErrorModel) then) =
      _$ErrorModelCopyWithImpl<$Res, ErrorModel>;
  @useResult
  $Res call(
      {String? name,
      int status,
      String? message,
      int statusCode,
      String? code});
}

/// @nodoc
class _$ErrorModelCopyWithImpl<$Res, $Val extends ErrorModel>
    implements $ErrorModelCopyWith<$Res> {
  _$ErrorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = null,
    Object? message = freezed,
    Object? statusCode = null,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorModelImplCopyWith<$Res>
    implements $ErrorModelCopyWith<$Res> {
  factory _$$ErrorModelImplCopyWith(
          _$ErrorModelImpl value, $Res Function(_$ErrorModelImpl) then) =
      __$$ErrorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      int status,
      String? message,
      int statusCode,
      String? code});
}

/// @nodoc
class __$$ErrorModelImplCopyWithImpl<$Res>
    extends _$ErrorModelCopyWithImpl<$Res, _$ErrorModelImpl>
    implements _$$ErrorModelImplCopyWith<$Res> {
  __$$ErrorModelImplCopyWithImpl(
      _$ErrorModelImpl _value, $Res Function(_$ErrorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? status = null,
    Object? message = freezed,
    Object? statusCode = null,
    Object? code = freezed,
  }) {
    return _then(_$ErrorModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorModelImpl implements _ErrorModel {
  const _$ErrorModelImpl(
      {this.name,
      required this.status,
      this.message,
      required this.statusCode,
      this.code});

  factory _$ErrorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorModelImplFromJson(json);

  @override
  final String? name;
  @override
  final int status;
  @override
  final String? message;
  @override
  final int statusCode;
  @override
  final String? code;

  @override
  String toString() {
    return 'ErrorModel(name: $name, status: $status, message: $message, statusCode: $statusCode, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, status, message, statusCode, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorModelImplCopyWith<_$ErrorModelImpl> get copyWith =>
      __$$ErrorModelImplCopyWithImpl<_$ErrorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorModelImplToJson(
      this,
    );
  }
}

abstract class _ErrorModel implements ErrorModel {
  const factory _ErrorModel(
      {final String? name,
      required final int status,
      final String? message,
      required final int statusCode,
      final String? code}) = _$ErrorModelImpl;

  factory _ErrorModel.fromJson(Map<String, dynamic> json) =
      _$ErrorModelImpl.fromJson;

  @override
  String? get name;
  @override
  int get status;
  @override
  String? get message;
  @override
  int get statusCode;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$ErrorModelImplCopyWith<_$ErrorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
