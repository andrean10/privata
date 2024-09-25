// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_actions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoleActionsModel _$RoleActionsModelFromJson(Map<String, dynamic> json) {
  return _RoleActionsModel.fromJson(json);
}

/// @nodoc
mixin _$RoleActionsModel {
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isLocal => throw _privateConstructorUsedError;
  ExtraModel? get extra => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get createdId => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoleActionsModelCopyWith<RoleActionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoleActionsModelCopyWith<$Res> {
  factory $RoleActionsModelCopyWith(
          RoleActionsModel value, $Res Function(RoleActionsModel) then) =
      _$RoleActionsModelCopyWithImpl<$Res, RoleActionsModel>;
  @useResult
  $Res call(
      {String? name,
      String? type,
      bool? isLocal,
      ExtraModel? extra,
      String? createdAt,
      String? createdId,
      String? id});

  $ExtraModelCopyWith<$Res>? get extra;
}

/// @nodoc
class _$RoleActionsModelCopyWithImpl<$Res, $Val extends RoleActionsModel>
    implements $RoleActionsModelCopyWith<$Res> {
  _$RoleActionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? isLocal = freezed,
    Object? extra = freezed,
    Object? createdAt = freezed,
    Object? createdId = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as ExtraModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtraModelCopyWith<$Res>? get extra {
    if (_value.extra == null) {
      return null;
    }

    return $ExtraModelCopyWith<$Res>(_value.extra!, (value) {
      return _then(_value.copyWith(extra: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoleActionsModelImplCopyWith<$Res>
    implements $RoleActionsModelCopyWith<$Res> {
  factory _$$RoleActionsModelImplCopyWith(_$RoleActionsModelImpl value,
          $Res Function(_$RoleActionsModelImpl) then) =
      __$$RoleActionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? type,
      bool? isLocal,
      ExtraModel? extra,
      String? createdAt,
      String? createdId,
      String? id});

  @override
  $ExtraModelCopyWith<$Res>? get extra;
}

/// @nodoc
class __$$RoleActionsModelImplCopyWithImpl<$Res>
    extends _$RoleActionsModelCopyWithImpl<$Res, _$RoleActionsModelImpl>
    implements _$$RoleActionsModelImplCopyWith<$Res> {
  __$$RoleActionsModelImplCopyWithImpl(_$RoleActionsModelImpl _value,
      $Res Function(_$RoleActionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? isLocal = freezed,
    Object? extra = freezed,
    Object? createdAt = freezed,
    Object? createdId = freezed,
    Object? id = freezed,
  }) {
    return _then(_$RoleActionsModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocal: freezed == isLocal
          ? _value.isLocal
          : isLocal // ignore: cast_nullable_to_non_nullable
              as bool?,
      extra: freezed == extra
          ? _value.extra
          : extra // ignore: cast_nullable_to_non_nullable
              as ExtraModel?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoleActionsModelImpl implements _RoleActionsModel {
  const _$RoleActionsModelImpl(
      {this.name,
      this.type,
      this.isLocal,
      this.extra,
      this.createdAt,
      this.createdId,
      this.id});

  factory _$RoleActionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoleActionsModelImplFromJson(json);

  @override
  final String? name;
  @override
  final String? type;
  @override
  final bool? isLocal;
  @override
  final ExtraModel? extra;
  @override
  final String? createdAt;
  @override
  final String? createdId;
  @override
  final String? id;

  @override
  String toString() {
    return 'RoleActionsModel(name: $name, type: $type, isLocal: $isLocal, extra: $extra, createdAt: $createdAt, createdId: $createdId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoleActionsModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isLocal, isLocal) || other.isLocal == isLocal) &&
            (identical(other.extra, extra) || other.extra == extra) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdId, createdId) ||
                other.createdId == createdId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, type, isLocal, extra, createdAt, createdId, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoleActionsModelImplCopyWith<_$RoleActionsModelImpl> get copyWith =>
      __$$RoleActionsModelImplCopyWithImpl<_$RoleActionsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoleActionsModelImplToJson(
      this,
    );
  }
}

abstract class _RoleActionsModel implements RoleActionsModel {
  const factory _RoleActionsModel(
      {final String? name,
      final String? type,
      final bool? isLocal,
      final ExtraModel? extra,
      final String? createdAt,
      final String? createdId,
      final String? id}) = _$RoleActionsModelImpl;

  factory _RoleActionsModel.fromJson(Map<String, dynamic> json) =
      _$RoleActionsModelImpl.fromJson;

  @override
  String? get name;
  @override
  String? get type;
  @override
  bool? get isLocal;
  @override
  ExtraModel? get extra;
  @override
  String? get createdAt;
  @override
  String? get createdId;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$RoleActionsModelImplCopyWith<_$RoleActionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
