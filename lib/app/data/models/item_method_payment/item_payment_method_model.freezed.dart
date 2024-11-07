// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_payment_method_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemPaymentMethodModel _$ItemPaymentMethodModelFromJson(
    Map<String, dynamic> json) {
  return _ItemPaymentMethodModel.fromJson(json);
}

/// @nodoc
mixin _$ItemPaymentMethodModel {
  @JsonKey(fromJson: idFromJson)
  String? get id => throw _privateConstructorUsedError;
  String? get nama => throw _privateConstructorUsedError;
  String? get tipe => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemPaymentMethodModelCopyWith<ItemPaymentMethodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemPaymentMethodModelCopyWith<$Res> {
  factory $ItemPaymentMethodModelCopyWith(ItemPaymentMethodModel value,
          $Res Function(ItemPaymentMethodModel) then) =
      _$ItemPaymentMethodModelCopyWithImpl<$Res, ItemPaymentMethodModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: idFromJson) String? id, String? nama, String? tipe});
}

/// @nodoc
class _$ItemPaymentMethodModelCopyWithImpl<$Res,
        $Val extends ItemPaymentMethodModel>
    implements $ItemPaymentMethodModelCopyWith<$Res> {
  _$ItemPaymentMethodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nama = freezed,
    Object? tipe = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      tipe: freezed == tipe
          ? _value.tipe
          : tipe // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemPaymentMethodModelImplCopyWith<$Res>
    implements $ItemPaymentMethodModelCopyWith<$Res> {
  factory _$$ItemPaymentMethodModelImplCopyWith(
          _$ItemPaymentMethodModelImpl value,
          $Res Function(_$ItemPaymentMethodModelImpl) then) =
      __$$ItemPaymentMethodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: idFromJson) String? id, String? nama, String? tipe});
}

/// @nodoc
class __$$ItemPaymentMethodModelImplCopyWithImpl<$Res>
    extends _$ItemPaymentMethodModelCopyWithImpl<$Res,
        _$ItemPaymentMethodModelImpl>
    implements _$$ItemPaymentMethodModelImplCopyWith<$Res> {
  __$$ItemPaymentMethodModelImplCopyWithImpl(
      _$ItemPaymentMethodModelImpl _value,
      $Res Function(_$ItemPaymentMethodModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? nama = freezed,
    Object? tipe = freezed,
  }) {
    return _then(_$ItemPaymentMethodModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      nama: freezed == nama
          ? _value.nama
          : nama // ignore: cast_nullable_to_non_nullable
              as String?,
      tipe: freezed == tipe
          ? _value.tipe
          : tipe // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemPaymentMethodModelImpl implements _ItemPaymentMethodModel {
  const _$ItemPaymentMethodModelImpl(
      {@JsonKey(fromJson: idFromJson) this.id, this.nama, this.tipe});

  factory _$ItemPaymentMethodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemPaymentMethodModelImplFromJson(json);

  @override
  @JsonKey(fromJson: idFromJson)
  final String? id;
  @override
  final String? nama;
  @override
  final String? tipe;

  @override
  String toString() {
    return 'ItemPaymentMethodModel(id: $id, nama: $nama, tipe: $tipe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemPaymentMethodModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nama, nama) || other.nama == nama) &&
            (identical(other.tipe, tipe) || other.tipe == tipe));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nama, tipe);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemPaymentMethodModelImplCopyWith<_$ItemPaymentMethodModelImpl>
      get copyWith => __$$ItemPaymentMethodModelImplCopyWithImpl<
          _$ItemPaymentMethodModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemPaymentMethodModelImplToJson(
      this,
    );
  }
}

abstract class _ItemPaymentMethodModel implements ItemPaymentMethodModel {
  const factory _ItemPaymentMethodModel(
      {@JsonKey(fromJson: idFromJson) final String? id,
      final String? nama,
      final String? tipe}) = _$ItemPaymentMethodModelImpl;

  factory _ItemPaymentMethodModel.fromJson(Map<String, dynamic> json) =
      _$ItemPaymentMethodModelImpl.fromJson;

  @override
  @JsonKey(fromJson: idFromJson)
  String? get id;
  @override
  String? get nama;
  @override
  String? get tipe;
  @override
  @JsonKey(ignore: true)
  _$$ItemPaymentMethodModelImplCopyWith<_$ItemPaymentMethodModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
