// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'village_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VillageModel _$VillageModelFromJson(Map<String, dynamic> json) {
  return _VillageModel.fromJson(json);
}

/// @nodoc
mixin _$VillageModel {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_id')
  String? get districtId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VillageModelCopyWith<VillageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VillageModelCopyWith<$Res> {
  factory $VillageModelCopyWith(
          VillageModel value, $Res Function(VillageModel) then) =
      _$VillageModelCopyWithImpl<$Res, VillageModel>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'district_id') String? districtId,
      String? name});
}

/// @nodoc
class _$VillageModelCopyWithImpl<$Res, $Val extends VillageModel>
    implements $VillageModelCopyWith<$Res> {
  _$VillageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? districtId = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VillageModelImplCopyWith<$Res>
    implements $VillageModelCopyWith<$Res> {
  factory _$$VillageModelImplCopyWith(
          _$VillageModelImpl value, $Res Function(_$VillageModelImpl) then) =
      __$$VillageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'district_id') String? districtId,
      String? name});
}

/// @nodoc
class __$$VillageModelImplCopyWithImpl<$Res>
    extends _$VillageModelCopyWithImpl<$Res, _$VillageModelImpl>
    implements _$$VillageModelImplCopyWith<$Res> {
  __$$VillageModelImplCopyWithImpl(
      _$VillageModelImpl _value, $Res Function(_$VillageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? districtId = freezed,
    Object? name = freezed,
  }) {
    return _then(_$VillageModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      districtId: freezed == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
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
class _$VillageModelImpl with DiagnosticableTreeMixin implements _VillageModel {
  const _$VillageModelImpl(
      {required this.id,
      @JsonKey(name: 'district_id') required this.districtId,
      required this.name});

  factory _$VillageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VillageModelImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'district_id')
  final String? districtId;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VillageModel(id: $id, districtId: $districtId, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VillageModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('districtId', districtId))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VillageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, districtId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VillageModelImplCopyWith<_$VillageModelImpl> get copyWith =>
      __$$VillageModelImplCopyWithImpl<_$VillageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VillageModelImplToJson(
      this,
    );
  }
}

abstract class _VillageModel implements VillageModel {
  const factory _VillageModel(
      {required final String? id,
      @JsonKey(name: 'district_id') required final String? districtId,
      required final String? name}) = _$VillageModelImpl;

  factory _VillageModel.fromJson(Map<String, dynamic> json) =
      _$VillageModelImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'district_id')
  String? get districtId;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$VillageModelImplCopyWith<_$VillageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
