// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceListModel _$PriceListModelFromJson(Map<String, dynamic> json) {
  return _PriceListModel.fromJson(json);
}

/// @nodoc
mixin _$PriceListModel {
  @JsonKey(name: '_id', includeToJson: false)
  String? get id_ => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', includeFromJson: false)
  String? get id => throw _privateConstructorUsedError;
  int? get basicFee => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<SellingPriceModel>? get sellingPrice =>
      throw _privateConstructorUsedError;
  int? get totalFee => throw _privateConstructorUsedError;
  int? get totalTaxFee => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceListModelCopyWith<PriceListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceListModelCopyWith<$Res> {
  factory $PriceListModelCopyWith(
          PriceListModel value, $Res Function(PriceListModel) then) =
      _$PriceListModelCopyWithImpl<$Res, PriceListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id', includeToJson: false) String? id_,
      @JsonKey(name: 'id', includeFromJson: false) String? id,
      int? basicFee,
      String? name,
      List<SellingPriceModel>? sellingPrice,
      int? totalFee,
      int? totalTaxFee,
      String? type});
}

/// @nodoc
class _$PriceListModelCopyWithImpl<$Res, $Val extends PriceListModel>
    implements $PriceListModelCopyWith<$Res> {
  _$PriceListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_ = freezed,
    Object? id = freezed,
    Object? basicFee = freezed,
    Object? name = freezed,
    Object? sellingPrice = freezed,
    Object? totalFee = freezed,
    Object? totalTaxFee = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id_: freezed == id_
          ? _value.id_
          : id_ // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      basicFee: freezed == basicFee
          ? _value.basicFee
          : basicFee // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sellingPrice: freezed == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as List<SellingPriceModel>?,
      totalFee: freezed == totalFee
          ? _value.totalFee
          : totalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTaxFee: freezed == totalTaxFee
          ? _value.totalTaxFee
          : totalTaxFee // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceListModelImplCopyWith<$Res>
    implements $PriceListModelCopyWith<$Res> {
  factory _$$PriceListModelImplCopyWith(_$PriceListModelImpl value,
          $Res Function(_$PriceListModelImpl) then) =
      __$$PriceListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id', includeToJson: false) String? id_,
      @JsonKey(name: 'id', includeFromJson: false) String? id,
      int? basicFee,
      String? name,
      List<SellingPriceModel>? sellingPrice,
      int? totalFee,
      int? totalTaxFee,
      String? type});
}

/// @nodoc
class __$$PriceListModelImplCopyWithImpl<$Res>
    extends _$PriceListModelCopyWithImpl<$Res, _$PriceListModelImpl>
    implements _$$PriceListModelImplCopyWith<$Res> {
  __$$PriceListModelImplCopyWithImpl(
      _$PriceListModelImpl _value, $Res Function(_$PriceListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id_ = freezed,
    Object? id = freezed,
    Object? basicFee = freezed,
    Object? name = freezed,
    Object? sellingPrice = freezed,
    Object? totalFee = freezed,
    Object? totalTaxFee = freezed,
    Object? type = freezed,
  }) {
    return _then(_$PriceListModelImpl(
      id_: freezed == id_
          ? _value.id_
          : id_ // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      basicFee: freezed == basicFee
          ? _value.basicFee
          : basicFee // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sellingPrice: freezed == sellingPrice
          ? _value._sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as List<SellingPriceModel>?,
      totalFee: freezed == totalFee
          ? _value.totalFee
          : totalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTaxFee: freezed == totalTaxFee
          ? _value.totalTaxFee
          : totalTaxFee // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceListModelImpl implements _PriceListModel {
  const _$PriceListModelImpl(
      {@JsonKey(name: '_id', includeToJson: false) this.id_,
      @JsonKey(name: 'id', includeFromJson: false) this.id,
      this.basicFee,
      this.name,
      final List<SellingPriceModel>? sellingPrice,
      this.totalFee,
      this.totalTaxFee,
      this.type})
      : _sellingPrice = sellingPrice;

  factory _$PriceListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceListModelImplFromJson(json);

  @override
  @JsonKey(name: '_id', includeToJson: false)
  final String? id_;
  @override
  @JsonKey(name: 'id', includeFromJson: false)
  final String? id;
  @override
  final int? basicFee;
  @override
  final String? name;
  final List<SellingPriceModel>? _sellingPrice;
  @override
  List<SellingPriceModel>? get sellingPrice {
    final value = _sellingPrice;
    if (value == null) return null;
    if (_sellingPrice is EqualUnmodifiableListView) return _sellingPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalFee;
  @override
  final int? totalTaxFee;
  @override
  final String? type;

  @override
  String toString() {
    return 'PriceListModel(id_: $id_, id: $id, basicFee: $basicFee, name: $name, sellingPrice: $sellingPrice, totalFee: $totalFee, totalTaxFee: $totalTaxFee, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceListModelImpl &&
            (identical(other.id_, id_) || other.id_ == id_) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.basicFee, basicFee) ||
                other.basicFee == basicFee) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._sellingPrice, _sellingPrice) &&
            (identical(other.totalFee, totalFee) ||
                other.totalFee == totalFee) &&
            (identical(other.totalTaxFee, totalTaxFee) ||
                other.totalTaxFee == totalTaxFee) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id_,
      id,
      basicFee,
      name,
      const DeepCollectionEquality().hash(_sellingPrice),
      totalFee,
      totalTaxFee,
      type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceListModelImplCopyWith<_$PriceListModelImpl> get copyWith =>
      __$$PriceListModelImplCopyWithImpl<_$PriceListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceListModelImplToJson(
      this,
    );
  }
}

abstract class _PriceListModel implements PriceListModel {
  const factory _PriceListModel(
      {@JsonKey(name: '_id', includeToJson: false) final String? id_,
      @JsonKey(name: 'id', includeFromJson: false) final String? id,
      final int? basicFee,
      final String? name,
      final List<SellingPriceModel>? sellingPrice,
      final int? totalFee,
      final int? totalTaxFee,
      final String? type}) = _$PriceListModelImpl;

  factory _PriceListModel.fromJson(Map<String, dynamic> json) =
      _$PriceListModelImpl.fromJson;

  @override
  @JsonKey(name: '_id', includeToJson: false)
  String? get id_;
  @override
  @JsonKey(name: 'id', includeFromJson: false)
  String? get id;
  @override
  int? get basicFee;
  @override
  String? get name;
  @override
  List<SellingPriceModel>? get sellingPrice;
  @override
  int? get totalFee;
  @override
  int? get totalTaxFee;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$PriceListModelImplCopyWith<_$PriceListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
