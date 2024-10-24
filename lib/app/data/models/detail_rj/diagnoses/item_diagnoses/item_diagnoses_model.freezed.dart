// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_diagnoses_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemDiagnosesModel _$ItemDiagnosesModelFromJson(Map<String, dynamic> json) {
  return _ItemDiagnosesModel.fromJson(json);
}

/// @nodoc
mixin _$ItemDiagnosesModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isStroke => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDiagnosesModelCopyWith<ItemDiagnosesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDiagnosesModelCopyWith<$Res> {
  factory $ItemDiagnosesModelCopyWith(
          ItemDiagnosesModel value, $Res Function(ItemDiagnosesModel) then) =
      _$ItemDiagnosesModelCopyWithImpl<$Res, ItemDiagnosesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? code,
      String? description,
      @JsonKey(includeFromJson: false, includeToJson: false) bool isStroke});
}

/// @nodoc
class _$ItemDiagnosesModelCopyWithImpl<$Res, $Val extends ItemDiagnosesModel>
    implements $ItemDiagnosesModelCopyWith<$Res> {
  _$ItemDiagnosesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? isStroke = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isStroke: null == isStroke
          ? _value.isStroke
          : isStroke // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemDiagnosesModelImplCopyWith<$Res>
    implements $ItemDiagnosesModelCopyWith<$Res> {
  factory _$$ItemDiagnosesModelImplCopyWith(_$ItemDiagnosesModelImpl value,
          $Res Function(_$ItemDiagnosesModelImpl) then) =
      __$$ItemDiagnosesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? code,
      String? description,
      @JsonKey(includeFromJson: false, includeToJson: false) bool isStroke});
}

/// @nodoc
class __$$ItemDiagnosesModelImplCopyWithImpl<$Res>
    extends _$ItemDiagnosesModelCopyWithImpl<$Res, _$ItemDiagnosesModelImpl>
    implements _$$ItemDiagnosesModelImplCopyWith<$Res> {
  __$$ItemDiagnosesModelImplCopyWithImpl(_$ItemDiagnosesModelImpl _value,
      $Res Function(_$ItemDiagnosesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? description = freezed,
    Object? isStroke = null,
  }) {
    return _then(_$ItemDiagnosesModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isStroke: null == isStroke
          ? _value.isStroke
          : isStroke // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDiagnosesModelImpl implements _ItemDiagnosesModel {
  const _$ItemDiagnosesModelImpl(
      {@JsonKey(name: '_id') this.id,
      this.code,
      this.description,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.isStroke = false});

  factory _$ItemDiagnosesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemDiagnosesModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? code;
  @override
  final String? description;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool isStroke;

  @override
  String toString() {
    return 'ItemDiagnosesModel(id: $id, code: $code, description: $description, isStroke: $isStroke)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemDiagnosesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isStroke, isStroke) ||
                other.isStroke == isStroke));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, description, isStroke);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDiagnosesModelImplCopyWith<_$ItemDiagnosesModelImpl> get copyWith =>
      __$$ItemDiagnosesModelImplCopyWithImpl<_$ItemDiagnosesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDiagnosesModelImplToJson(
      this,
    );
  }
}

abstract class _ItemDiagnosesModel implements ItemDiagnosesModel {
  const factory _ItemDiagnosesModel(
      {@JsonKey(name: '_id') final String? id,
      final String? code,
      final String? description,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool isStroke}) = _$ItemDiagnosesModelImpl;

  factory _ItemDiagnosesModel.fromJson(Map<String, dynamic> json) =
      _$ItemDiagnosesModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get code;
  @override
  String? get description;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get isStroke;
  @override
  @JsonKey(ignore: true)
  _$$ItemDiagnosesModelImplCopyWith<_$ItemDiagnosesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
