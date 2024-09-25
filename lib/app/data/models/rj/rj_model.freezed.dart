// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rj_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RJModel _$RJModelFromJson(Map<String, dynamic> json) {
  return _RJModel.fromJson(json);
}

/// @nodoc
mixin _$RJModel {
  List<ItemRJModel> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_item')
  int? get totalItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_page')
  int? get totalPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RJModelCopyWith<RJModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RJModelCopyWith<$Res> {
  factory $RJModelCopyWith(RJModel value, $Res Function(RJModel) then) =
      _$RJModelCopyWithImpl<$Res, RJModel>;
  @useResult
  $Res call(
      {List<ItemRJModel> items,
      @JsonKey(name: 'total_item') int? totalItem,
      @JsonKey(name: 'total_page') int? totalPage,
      @JsonKey(name: 'current_page') int? currentPage});
}

/// @nodoc
class _$RJModelCopyWithImpl<$Res, $Val extends RJModel>
    implements $RJModelCopyWith<$Res> {
  _$RJModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalItem = freezed,
    Object? totalPage = freezed,
    Object? currentPage = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemRJModel>,
      totalItem: freezed == totalItem
          ? _value.totalItem
          : totalItem // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RJModelImplCopyWith<$Res> implements $RJModelCopyWith<$Res> {
  factory _$$RJModelImplCopyWith(
          _$RJModelImpl value, $Res Function(_$RJModelImpl) then) =
      __$$RJModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ItemRJModel> items,
      @JsonKey(name: 'total_item') int? totalItem,
      @JsonKey(name: 'total_page') int? totalPage,
      @JsonKey(name: 'current_page') int? currentPage});
}

/// @nodoc
class __$$RJModelImplCopyWithImpl<$Res>
    extends _$RJModelCopyWithImpl<$Res, _$RJModelImpl>
    implements _$$RJModelImplCopyWith<$Res> {
  __$$RJModelImplCopyWithImpl(
      _$RJModelImpl _value, $Res Function(_$RJModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalItem = freezed,
    Object? totalPage = freezed,
    Object? currentPage = freezed,
  }) {
    return _then(_$RJModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemRJModel>,
      totalItem: freezed == totalItem
          ? _value.totalItem
          : totalItem // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      currentPage: freezed == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RJModelImpl implements _RJModel {
  const _$RJModelImpl(
      {required final List<ItemRJModel> items,
      @JsonKey(name: 'total_item') required this.totalItem,
      @JsonKey(name: 'total_page') required this.totalPage,
      @JsonKey(name: 'current_page') required this.currentPage})
      : _items = items;

  factory _$RJModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RJModelImplFromJson(json);

  final List<ItemRJModel> _items;
  @override
  List<ItemRJModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'total_item')
  final int? totalItem;
  @override
  @JsonKey(name: 'total_page')
  final int? totalPage;
  @override
  @JsonKey(name: 'current_page')
  final int? currentPage;

  @override
  String toString() {
    return 'RJModel(items: $items, totalItem: $totalItem, totalPage: $totalPage, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RJModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalItem, totalItem) ||
                other.totalItem == totalItem) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      totalItem,
      totalPage,
      currentPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RJModelImplCopyWith<_$RJModelImpl> get copyWith =>
      __$$RJModelImplCopyWithImpl<_$RJModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RJModelImplToJson(
      this,
    );
  }
}

abstract class _RJModel implements RJModel {
  const factory _RJModel(
          {required final List<ItemRJModel> items,
          @JsonKey(name: 'total_item') required final int? totalItem,
          @JsonKey(name: 'total_page') required final int? totalPage,
          @JsonKey(name: 'current_page') required final int? currentPage}) =
      _$RJModelImpl;

  factory _RJModel.fromJson(Map<String, dynamic> json) = _$RJModelImpl.fromJson;

  @override
  List<ItemRJModel> get items;
  @override
  @JsonKey(name: 'total_item')
  int? get totalItem;
  @override
  @JsonKey(name: 'total_page')
  int? get totalPage;
  @override
  @JsonKey(name: 'current_page')
  int? get currentPage;
  @override
  @JsonKey(ignore: true)
  _$$RJModelImplCopyWith<_$RJModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
