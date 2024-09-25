// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegencyModel _$RegencyModelFromJson(Map<String, dynamic> json) {
  return _RegencyModel.fromJson(json);
}

/// @nodoc
mixin _$RegencyModel {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'province_id')
  String? get provinceId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegencyModelCopyWith<RegencyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegencyModelCopyWith<$Res> {
  factory $RegencyModelCopyWith(
          RegencyModel value, $Res Function(RegencyModel) then) =
      _$RegencyModelCopyWithImpl<$Res, RegencyModel>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'province_id') String? provinceId,
      String? name});
}

/// @nodoc
class _$RegencyModelCopyWithImpl<$Res, $Val extends RegencyModel>
    implements $RegencyModelCopyWith<$Res> {
  _$RegencyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? provinceId = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegencyModelImplCopyWith<$Res>
    implements $RegencyModelCopyWith<$Res> {
  factory _$$RegencyModelImplCopyWith(
          _$RegencyModelImpl value, $Res Function(_$RegencyModelImpl) then) =
      __$$RegencyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'province_id') String? provinceId,
      String? name});
}

/// @nodoc
class __$$RegencyModelImplCopyWithImpl<$Res>
    extends _$RegencyModelCopyWithImpl<$Res, _$RegencyModelImpl>
    implements _$$RegencyModelImplCopyWith<$Res> {
  __$$RegencyModelImplCopyWithImpl(
      _$RegencyModelImpl _value, $Res Function(_$RegencyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? provinceId = freezed,
    Object? name = freezed,
  }) {
    return _then(_$RegencyModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceId: freezed == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegencyModelImpl with DiagnosticableTreeMixin implements _RegencyModel {
  const _$RegencyModelImpl(
      {required this.id,
      @JsonKey(name: 'province_id') required this.provinceId,
      required this.name});

  factory _$RegencyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegencyModelImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'province_id')
  final String? provinceId;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegencyModel(id: $id, provinceId: $provinceId, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegencyModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('provinceId', provinceId))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegencyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, provinceId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegencyModelImplCopyWith<_$RegencyModelImpl> get copyWith =>
      __$$RegencyModelImplCopyWithImpl<_$RegencyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegencyModelImplToJson(
      this,
    );
  }
}

abstract class _RegencyModel implements RegencyModel {
  const factory _RegencyModel(
      {required final String? id,
      @JsonKey(name: 'province_id') required final String? provinceId,
      required final String? name}) = _$RegencyModelImpl;

  factory _RegencyModel.fromJson(Map<String, dynamic> json) =
      _$RegencyModelImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'province_id')
  String? get provinceId;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$RegencyModelImplCopyWith<_$RegencyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
