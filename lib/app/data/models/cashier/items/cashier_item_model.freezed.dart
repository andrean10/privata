// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashier_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CashierItemModel _$CashierItemModelFromJson(Map<String, dynamic> json) {
  return _CashierItemModel.fromJson(json);
}

/// @nodoc
mixin _$CashierItemModel {
  @JsonKey(name: '_id', includeToJson: false)
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String? get idToJson => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get procedureId => throw _privateConstructorUsedError;
  String? get hospitalId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get kmrProcedureId => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get transactionId => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  int? get baseFee => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;
  int? get totalFee => throw _privateConstructorUsedError;
  bool? get isPriceLock => throw _privateConstructorUsedError;
  String? get transactionType => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get createdId => throw _privateConstructorUsedError;
  List<dynamic>? get medicalHelperIds => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get discountType => throw _privateConstructorUsedError;
  String? get createdName => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  bool? get isAdminFee => throw _privateConstructorUsedError;
  List<dynamic>? get itemsUsed => throw _privateConstructorUsedError;
  int? get tuslahFee => throw _privateConstructorUsedError;
  int? get embalaseFee => throw _privateConstructorUsedError;
  List<SellingPriceModel>? get sellingPrice =>
      throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '1', includeFromJson: false)
  String? get paymentMethodId => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'Normal', includeFromJson: false)
  String? get paymentMethodTipe => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 'normalFee', includeFromJson: false)
  String? get paymentMethodSubTipe => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0, includeFromJson: false)
  int? get paymentMethod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CashierItemModelCopyWith<CashierItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashierItemModelCopyWith<$Res> {
  factory $CashierItemModelCopyWith(
          CashierItemModel value, $Res Function(CashierItemModel) then) =
      _$CashierItemModelCopyWithImpl<$Res, CashierItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id', includeToJson: false) String? id,
      @JsonKey(name: 'id') String? idToJson,
      String? name,
      String? type,
      String? procedureId,
      String? hospitalId,
      @JsonKey(includeIfNull: false) String? kmrProcedureId,
      @JsonKey(includeIfNull: false) String? transactionId,
      int? quantity,
      int? baseFee,
      int? discount,
      int? totalFee,
      bool? isPriceLock,
      String? transactionType,
      String? createdAt,
      String? updatedAt,
      String? createdId,
      List<dynamic>? medicalHelperIds,
      @JsonKey(includeIfNull: false) String? discountType,
      String? createdName,
      @JsonKey(includeIfNull: false) bool? isAdminFee,
      List<dynamic>? itemsUsed,
      int? tuslahFee,
      int? embalaseFee,
      List<SellingPriceModel>? sellingPrice,
      @JsonKey(defaultValue: '1', includeFromJson: false)
      String? paymentMethodId,
      @JsonKey(defaultValue: 'Normal', includeFromJson: false)
      String? paymentMethodTipe,
      @JsonKey(defaultValue: 'normalFee', includeFromJson: false)
      String? paymentMethodSubTipe,
      @JsonKey(defaultValue: 0, includeFromJson: false) int? paymentMethod});
}

/// @nodoc
class _$CashierItemModelCopyWithImpl<$Res, $Val extends CashierItemModel>
    implements $CashierItemModelCopyWith<$Res> {
  _$CashierItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idToJson = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? procedureId = freezed,
    Object? hospitalId = freezed,
    Object? kmrProcedureId = freezed,
    Object? transactionId = freezed,
    Object? quantity = freezed,
    Object? baseFee = freezed,
    Object? discount = freezed,
    Object? totalFee = freezed,
    Object? isPriceLock = freezed,
    Object? transactionType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? createdId = freezed,
    Object? medicalHelperIds = freezed,
    Object? discountType = freezed,
    Object? createdName = freezed,
    Object? isAdminFee = freezed,
    Object? itemsUsed = freezed,
    Object? tuslahFee = freezed,
    Object? embalaseFee = freezed,
    Object? sellingPrice = freezed,
    Object? paymentMethodId = freezed,
    Object? paymentMethodTipe = freezed,
    Object? paymentMethodSubTipe = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idToJson: freezed == idToJson
          ? _value.idToJson
          : idToJson // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      procedureId: freezed == procedureId
          ? _value.procedureId
          : procedureId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: freezed == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      kmrProcedureId: freezed == kmrProcedureId
          ? _value.kmrProcedureId
          : kmrProcedureId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      baseFee: freezed == baseFee
          ? _value.baseFee
          : baseFee // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalFee: freezed == totalFee
          ? _value.totalFee
          : totalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      isPriceLock: freezed == isPriceLock
          ? _value.isPriceLock
          : isPriceLock // ignore: cast_nullable_to_non_nullable
              as bool?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      medicalHelperIds: freezed == medicalHelperIds
          ? _value.medicalHelperIds
          : medicalHelperIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdName: freezed == createdName
          ? _value.createdName
          : createdName // ignore: cast_nullable_to_non_nullable
              as String?,
      isAdminFee: freezed == isAdminFee
          ? _value.isAdminFee
          : isAdminFee // ignore: cast_nullable_to_non_nullable
              as bool?,
      itemsUsed: freezed == itemsUsed
          ? _value.itemsUsed
          : itemsUsed // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tuslahFee: freezed == tuslahFee
          ? _value.tuslahFee
          : tuslahFee // ignore: cast_nullable_to_non_nullable
              as int?,
      embalaseFee: freezed == embalaseFee
          ? _value.embalaseFee
          : embalaseFee // ignore: cast_nullable_to_non_nullable
              as int?,
      sellingPrice: freezed == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as List<SellingPriceModel>?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodTipe: freezed == paymentMethodTipe
          ? _value.paymentMethodTipe
          : paymentMethodTipe // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodSubTipe: freezed == paymentMethodSubTipe
          ? _value.paymentMethodSubTipe
          : paymentMethodSubTipe // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashierItemModelImplCopyWith<$Res>
    implements $CashierItemModelCopyWith<$Res> {
  factory _$$CashierItemModelImplCopyWith(_$CashierItemModelImpl value,
          $Res Function(_$CashierItemModelImpl) then) =
      __$$CashierItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id', includeToJson: false) String? id,
      @JsonKey(name: 'id') String? idToJson,
      String? name,
      String? type,
      String? procedureId,
      String? hospitalId,
      @JsonKey(includeIfNull: false) String? kmrProcedureId,
      @JsonKey(includeIfNull: false) String? transactionId,
      int? quantity,
      int? baseFee,
      int? discount,
      int? totalFee,
      bool? isPriceLock,
      String? transactionType,
      String? createdAt,
      String? updatedAt,
      String? createdId,
      List<dynamic>? medicalHelperIds,
      @JsonKey(includeIfNull: false) String? discountType,
      String? createdName,
      @JsonKey(includeIfNull: false) bool? isAdminFee,
      List<dynamic>? itemsUsed,
      int? tuslahFee,
      int? embalaseFee,
      List<SellingPriceModel>? sellingPrice,
      @JsonKey(defaultValue: '1', includeFromJson: false)
      String? paymentMethodId,
      @JsonKey(defaultValue: 'Normal', includeFromJson: false)
      String? paymentMethodTipe,
      @JsonKey(defaultValue: 'normalFee', includeFromJson: false)
      String? paymentMethodSubTipe,
      @JsonKey(defaultValue: 0, includeFromJson: false) int? paymentMethod});
}

/// @nodoc
class __$$CashierItemModelImplCopyWithImpl<$Res>
    extends _$CashierItemModelCopyWithImpl<$Res, _$CashierItemModelImpl>
    implements _$$CashierItemModelImplCopyWith<$Res> {
  __$$CashierItemModelImplCopyWithImpl(_$CashierItemModelImpl _value,
      $Res Function(_$CashierItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idToJson = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? procedureId = freezed,
    Object? hospitalId = freezed,
    Object? kmrProcedureId = freezed,
    Object? transactionId = freezed,
    Object? quantity = freezed,
    Object? baseFee = freezed,
    Object? discount = freezed,
    Object? totalFee = freezed,
    Object? isPriceLock = freezed,
    Object? transactionType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? createdId = freezed,
    Object? medicalHelperIds = freezed,
    Object? discountType = freezed,
    Object? createdName = freezed,
    Object? isAdminFee = freezed,
    Object? itemsUsed = freezed,
    Object? tuslahFee = freezed,
    Object? embalaseFee = freezed,
    Object? sellingPrice = freezed,
    Object? paymentMethodId = freezed,
    Object? paymentMethodTipe = freezed,
    Object? paymentMethodSubTipe = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(_$CashierItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idToJson: freezed == idToJson
          ? _value.idToJson
          : idToJson // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      procedureId: freezed == procedureId
          ? _value.procedureId
          : procedureId // ignore: cast_nullable_to_non_nullable
              as String?,
      hospitalId: freezed == hospitalId
          ? _value.hospitalId
          : hospitalId // ignore: cast_nullable_to_non_nullable
              as String?,
      kmrProcedureId: freezed == kmrProcedureId
          ? _value.kmrProcedureId
          : kmrProcedureId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      baseFee: freezed == baseFee
          ? _value.baseFee
          : baseFee // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalFee: freezed == totalFee
          ? _value.totalFee
          : totalFee // ignore: cast_nullable_to_non_nullable
              as int?,
      isPriceLock: freezed == isPriceLock
          ? _value.isPriceLock
          : isPriceLock // ignore: cast_nullable_to_non_nullable
              as bool?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdId: freezed == createdId
          ? _value.createdId
          : createdId // ignore: cast_nullable_to_non_nullable
              as String?,
      medicalHelperIds: freezed == medicalHelperIds
          ? _value._medicalHelperIds
          : medicalHelperIds // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdName: freezed == createdName
          ? _value.createdName
          : createdName // ignore: cast_nullable_to_non_nullable
              as String?,
      isAdminFee: freezed == isAdminFee
          ? _value.isAdminFee
          : isAdminFee // ignore: cast_nullable_to_non_nullable
              as bool?,
      itemsUsed: freezed == itemsUsed
          ? _value._itemsUsed
          : itemsUsed // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      tuslahFee: freezed == tuslahFee
          ? _value.tuslahFee
          : tuslahFee // ignore: cast_nullable_to_non_nullable
              as int?,
      embalaseFee: freezed == embalaseFee
          ? _value.embalaseFee
          : embalaseFee // ignore: cast_nullable_to_non_nullable
              as int?,
      sellingPrice: freezed == sellingPrice
          ? _value._sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as List<SellingPriceModel>?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodTipe: freezed == paymentMethodTipe
          ? _value.paymentMethodTipe
          : paymentMethodTipe // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethodSubTipe: freezed == paymentMethodSubTipe
          ? _value.paymentMethodSubTipe
          : paymentMethodSubTipe // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CashierItemModelImpl implements _CashierItemModel {
  const _$CashierItemModelImpl(
      {@JsonKey(name: '_id', includeToJson: false) this.id,
      @JsonKey(name: 'id') this.idToJson,
      this.name,
      this.type,
      this.procedureId,
      this.hospitalId,
      @JsonKey(includeIfNull: false) this.kmrProcedureId,
      @JsonKey(includeIfNull: false) this.transactionId,
      this.quantity,
      this.baseFee,
      this.discount,
      this.totalFee,
      this.isPriceLock,
      this.transactionType,
      this.createdAt,
      this.updatedAt,
      this.createdId,
      final List<dynamic>? medicalHelperIds,
      @JsonKey(includeIfNull: false) this.discountType,
      this.createdName,
      @JsonKey(includeIfNull: false) this.isAdminFee,
      final List<dynamic>? itemsUsed,
      this.tuslahFee,
      this.embalaseFee,
      final List<SellingPriceModel>? sellingPrice,
      @JsonKey(defaultValue: '1', includeFromJson: false) this.paymentMethodId,
      @JsonKey(defaultValue: 'Normal', includeFromJson: false)
      this.paymentMethodTipe,
      @JsonKey(defaultValue: 'normalFee', includeFromJson: false)
      this.paymentMethodSubTipe,
      @JsonKey(defaultValue: 0, includeFromJson: false) this.paymentMethod})
      : _medicalHelperIds = medicalHelperIds,
        _itemsUsed = itemsUsed,
        _sellingPrice = sellingPrice;

  factory _$CashierItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashierItemModelImplFromJson(json);

  @override
  @JsonKey(name: '_id', includeToJson: false)
  final String? id;
  @override
  @JsonKey(name: 'id')
  final String? idToJson;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? procedureId;
  @override
  final String? hospitalId;
  @override
  @JsonKey(includeIfNull: false)
  final String? kmrProcedureId;
  @override
  @JsonKey(includeIfNull: false)
  final String? transactionId;
  @override
  final int? quantity;
  @override
  final int? baseFee;
  @override
  final int? discount;
  @override
  final int? totalFee;
  @override
  final bool? isPriceLock;
  @override
  final String? transactionType;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? createdId;
  final List<dynamic>? _medicalHelperIds;
  @override
  List<dynamic>? get medicalHelperIds {
    final value = _medicalHelperIds;
    if (value == null) return null;
    if (_medicalHelperIds is EqualUnmodifiableListView)
      return _medicalHelperIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(includeIfNull: false)
  final String? discountType;
  @override
  final String? createdName;
  @override
  @JsonKey(includeIfNull: false)
  final bool? isAdminFee;
  final List<dynamic>? _itemsUsed;
  @override
  List<dynamic>? get itemsUsed {
    final value = _itemsUsed;
    if (value == null) return null;
    if (_itemsUsed is EqualUnmodifiableListView) return _itemsUsed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? tuslahFee;
  @override
  final int? embalaseFee;
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
  @JsonKey(defaultValue: '1', includeFromJson: false)
  final String? paymentMethodId;
  @override
  @JsonKey(defaultValue: 'Normal', includeFromJson: false)
  final String? paymentMethodTipe;
  @override
  @JsonKey(defaultValue: 'normalFee', includeFromJson: false)
  final String? paymentMethodSubTipe;
  @override
  @JsonKey(defaultValue: 0, includeFromJson: false)
  final int? paymentMethod;

  @override
  String toString() {
    return 'CashierItemModel(id: $id, idToJson: $idToJson, name: $name, type: $type, procedureId: $procedureId, hospitalId: $hospitalId, kmrProcedureId: $kmrProcedureId, transactionId: $transactionId, quantity: $quantity, baseFee: $baseFee, discount: $discount, totalFee: $totalFee, isPriceLock: $isPriceLock, transactionType: $transactionType, createdAt: $createdAt, updatedAt: $updatedAt, createdId: $createdId, medicalHelperIds: $medicalHelperIds, discountType: $discountType, createdName: $createdName, isAdminFee: $isAdminFee, itemsUsed: $itemsUsed, tuslahFee: $tuslahFee, embalaseFee: $embalaseFee, sellingPrice: $sellingPrice, paymentMethodId: $paymentMethodId, paymentMethodTipe: $paymentMethodTipe, paymentMethodSubTipe: $paymentMethodSubTipe, paymentMethod: $paymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashierItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idToJson, idToJson) ||
                other.idToJson == idToJson) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.procedureId, procedureId) ||
                other.procedureId == procedureId) &&
            (identical(other.hospitalId, hospitalId) ||
                other.hospitalId == hospitalId) &&
            (identical(other.kmrProcedureId, kmrProcedureId) ||
                other.kmrProcedureId == kmrProcedureId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.baseFee, baseFee) || other.baseFee == baseFee) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.totalFee, totalFee) ||
                other.totalFee == totalFee) &&
            (identical(other.isPriceLock, isPriceLock) ||
                other.isPriceLock == isPriceLock) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdId, createdId) ||
                other.createdId == createdId) &&
            const DeepCollectionEquality()
                .equals(other._medicalHelperIds, _medicalHelperIds) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.createdName, createdName) ||
                other.createdName == createdName) &&
            (identical(other.isAdminFee, isAdminFee) ||
                other.isAdminFee == isAdminFee) &&
            const DeepCollectionEquality()
                .equals(other._itemsUsed, _itemsUsed) &&
            (identical(other.tuslahFee, tuslahFee) ||
                other.tuslahFee == tuslahFee) &&
            (identical(other.embalaseFee, embalaseFee) ||
                other.embalaseFee == embalaseFee) &&
            const DeepCollectionEquality()
                .equals(other._sellingPrice, _sellingPrice) &&
            (identical(other.paymentMethodId, paymentMethodId) ||
                other.paymentMethodId == paymentMethodId) &&
            (identical(other.paymentMethodTipe, paymentMethodTipe) ||
                other.paymentMethodTipe == paymentMethodTipe) &&
            (identical(other.paymentMethodSubTipe, paymentMethodSubTipe) ||
                other.paymentMethodSubTipe == paymentMethodSubTipe) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        idToJson,
        name,
        type,
        procedureId,
        hospitalId,
        kmrProcedureId,
        transactionId,
        quantity,
        baseFee,
        discount,
        totalFee,
        isPriceLock,
        transactionType,
        createdAt,
        updatedAt,
        createdId,
        const DeepCollectionEquality().hash(_medicalHelperIds),
        discountType,
        createdName,
        isAdminFee,
        const DeepCollectionEquality().hash(_itemsUsed),
        tuslahFee,
        embalaseFee,
        const DeepCollectionEquality().hash(_sellingPrice),
        paymentMethodId,
        paymentMethodTipe,
        paymentMethodSubTipe,
        paymentMethod
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CashierItemModelImplCopyWith<_$CashierItemModelImpl> get copyWith =>
      __$$CashierItemModelImplCopyWithImpl<_$CashierItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashierItemModelImplToJson(
      this,
    );
  }
}

abstract class _CashierItemModel implements CashierItemModel {
  const factory _CashierItemModel(
      {@JsonKey(name: '_id', includeToJson: false) final String? id,
      @JsonKey(name: 'id') final String? idToJson,
      final String? name,
      final String? type,
      final String? procedureId,
      final String? hospitalId,
      @JsonKey(includeIfNull: false) final String? kmrProcedureId,
      @JsonKey(includeIfNull: false) final String? transactionId,
      final int? quantity,
      final int? baseFee,
      final int? discount,
      final int? totalFee,
      final bool? isPriceLock,
      final String? transactionType,
      final String? createdAt,
      final String? updatedAt,
      final String? createdId,
      final List<dynamic>? medicalHelperIds,
      @JsonKey(includeIfNull: false) final String? discountType,
      final String? createdName,
      @JsonKey(includeIfNull: false) final bool? isAdminFee,
      final List<dynamic>? itemsUsed,
      final int? tuslahFee,
      final int? embalaseFee,
      final List<SellingPriceModel>? sellingPrice,
      @JsonKey(defaultValue: '1', includeFromJson: false)
      final String? paymentMethodId,
      @JsonKey(defaultValue: 'Normal', includeFromJson: false)
      final String? paymentMethodTipe,
      @JsonKey(defaultValue: 'normalFee', includeFromJson: false)
      final String? paymentMethodSubTipe,
      @JsonKey(defaultValue: 0, includeFromJson: false)
      final int? paymentMethod}) = _$CashierItemModelImpl;

  factory _CashierItemModel.fromJson(Map<String, dynamic> json) =
      _$CashierItemModelImpl.fromJson;

  @override
  @JsonKey(name: '_id', includeToJson: false)
  String? get id;
  @override
  @JsonKey(name: 'id')
  String? get idToJson;
  @override
  String? get name;
  @override
  String? get type;
  @override
  String? get procedureId;
  @override
  String? get hospitalId;
  @override
  @JsonKey(includeIfNull: false)
  String? get kmrProcedureId;
  @override
  @JsonKey(includeIfNull: false)
  String? get transactionId;
  @override
  int? get quantity;
  @override
  int? get baseFee;
  @override
  int? get discount;
  @override
  int? get totalFee;
  @override
  bool? get isPriceLock;
  @override
  String? get transactionType;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  String? get createdId;
  @override
  List<dynamic>? get medicalHelperIds;
  @override
  @JsonKey(includeIfNull: false)
  String? get discountType;
  @override
  String? get createdName;
  @override
  @JsonKey(includeIfNull: false)
  bool? get isAdminFee;
  @override
  List<dynamic>? get itemsUsed;
  @override
  int? get tuslahFee;
  @override
  int? get embalaseFee;
  @override
  List<SellingPriceModel>? get sellingPrice;
  @override
  @JsonKey(defaultValue: '1', includeFromJson: false)
  String? get paymentMethodId;
  @override
  @JsonKey(defaultValue: 'Normal', includeFromJson: false)
  String? get paymentMethodTipe;
  @override
  @JsonKey(defaultValue: 'normalFee', includeFromJson: false)
  String? get paymentMethodSubTipe;
  @override
  @JsonKey(defaultValue: 0, includeFromJson: false)
  int? get paymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$CashierItemModelImplCopyWith<_$CashierItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
