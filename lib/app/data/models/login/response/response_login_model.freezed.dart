// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseLoginModel _$ResponseLoginModelFromJson(Map<String, dynamic> json) {
  return _ResponseLoginModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseLoginModel {
  String? get id => throw _privateConstructorUsedError; // int? ttl,
  String? get created => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseLoginModelCopyWith<ResponseLoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseLoginModelCopyWith<$Res> {
  factory $ResponseLoginModelCopyWith(
          ResponseLoginModel value, $Res Function(ResponseLoginModel) then) =
      _$ResponseLoginModelCopyWithImpl<$Res, ResponseLoginModel>;
  @useResult
  $Res call(
      {String? id,
      String? created,
      String? userId,
      UserModel? user,
      int? timestamp});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ResponseLoginModelCopyWithImpl<$Res, $Val extends ResponseLoginModel>
    implements $ResponseLoginModelCopyWith<$Res> {
  _$ResponseLoginModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? created = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponseLoginModelImplCopyWith<$Res>
    implements $ResponseLoginModelCopyWith<$Res> {
  factory _$$ResponseLoginModelImplCopyWith(_$ResponseLoginModelImpl value,
          $Res Function(_$ResponseLoginModelImpl) then) =
      __$$ResponseLoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? created,
      String? userId,
      UserModel? user,
      int? timestamp});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ResponseLoginModelImplCopyWithImpl<$Res>
    extends _$ResponseLoginModelCopyWithImpl<$Res, _$ResponseLoginModelImpl>
    implements _$$ResponseLoginModelImplCopyWith<$Res> {
  __$$ResponseLoginModelImplCopyWithImpl(_$ResponseLoginModelImpl _value,
      $Res Function(_$ResponseLoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? created = freezed,
    Object? userId = freezed,
    Object? user = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$ResponseLoginModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseLoginModelImpl implements _ResponseLoginModel {
  const _$ResponseLoginModelImpl(
      {this.id, this.created, this.userId, this.user, this.timestamp});

  factory _$ResponseLoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseLoginModelImplFromJson(json);

  @override
  final String? id;
// int? ttl,
  @override
  final String? created;
  @override
  final String? userId;
  @override
  final UserModel? user;
  @override
  final int? timestamp;

  @override
  String toString() {
    return 'ResponseLoginModel(id: $id, created: $created, userId: $userId, user: $user, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseLoginModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, created, userId, user, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseLoginModelImplCopyWith<_$ResponseLoginModelImpl> get copyWith =>
      __$$ResponseLoginModelImplCopyWithImpl<_$ResponseLoginModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseLoginModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseLoginModel implements ResponseLoginModel {
  const factory _ResponseLoginModel(
      {final String? id,
      final String? created,
      final String? userId,
      final UserModel? user,
      final int? timestamp}) = _$ResponseLoginModelImpl;

  factory _ResponseLoginModel.fromJson(Map<String, dynamic> json) =
      _$ResponseLoginModelImpl.fromJson;

  @override
  String? get id;
  @override // int? ttl,
  String? get created;
  @override
  String? get userId;
  @override
  UserModel? get user;
  @override
  int? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$ResponseLoginModelImplCopyWith<_$ResponseLoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
