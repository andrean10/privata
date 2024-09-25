// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extra_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExtraModel _$ExtraModelFromJson(Map<String, dynamic> json) {
  return _ExtraModel.fromJson(json);
}

/// @nodoc
mixin _$ExtraModel {
  List<String>? get action => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtraModelCopyWith<ExtraModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraModelCopyWith<$Res> {
  factory $ExtraModelCopyWith(
          ExtraModel value, $Res Function(ExtraModel) then) =
      _$ExtraModelCopyWithImpl<$Res, ExtraModel>;
  @useResult
  $Res call({List<String>? action, String? id});
}

/// @nodoc
class _$ExtraModelCopyWithImpl<$Res, $Val extends ExtraModel>
    implements $ExtraModelCopyWith<$Res> {
  _$ExtraModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtraModelImplCopyWith<$Res>
    implements $ExtraModelCopyWith<$Res> {
  factory _$$ExtraModelImplCopyWith(
          _$ExtraModelImpl value, $Res Function(_$ExtraModelImpl) then) =
      __$$ExtraModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? action, String? id});
}

/// @nodoc
class __$$ExtraModelImplCopyWithImpl<$Res>
    extends _$ExtraModelCopyWithImpl<$Res, _$ExtraModelImpl>
    implements _$$ExtraModelImplCopyWith<$Res> {
  __$$ExtraModelImplCopyWithImpl(
      _$ExtraModelImpl _value, $Res Function(_$ExtraModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? id = freezed,
  }) {
    return _then(_$ExtraModelImpl(
      action: freezed == action
          ? _value._action
          : action // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtraModelImpl implements _ExtraModel {
  const _$ExtraModelImpl({final List<String>? action, this.id})
      : _action = action;

  factory _$ExtraModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtraModelImplFromJson(json);

  final List<String>? _action;
  @override
  List<String>? get action {
    final value = _action;
    if (value == null) return null;
    if (_action is EqualUnmodifiableListView) return _action;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? id;

  @override
  String toString() {
    return 'ExtraModel(action: $action, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtraModelImpl &&
            const DeepCollectionEquality().equals(other._action, _action) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_action), id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtraModelImplCopyWith<_$ExtraModelImpl> get copyWith =>
      __$$ExtraModelImplCopyWithImpl<_$ExtraModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtraModelImplToJson(
      this,
    );
  }
}

abstract class _ExtraModel implements ExtraModel {
  const factory _ExtraModel({final List<String>? action, final String? id}) =
      _$ExtraModelImpl;

  factory _ExtraModel.fromJson(Map<String, dynamic> json) =
      _$ExtraModelImpl.fromJson;

  @override
  List<String>? get action;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$ExtraModelImplCopyWith<_$ExtraModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
