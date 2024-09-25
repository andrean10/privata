// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_doctor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResultDoctorModel _$ResultDoctorModelFromJson(Map<String, dynamic> json) {
  return _ResultDoctorModel.fromJson(json);
}

/// @nodoc
mixin _$ResultDoctorModel {
  List<DoctorModel> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_item')
  int get totalItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_page')
  int get totalPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultDoctorModelCopyWith<ResultDoctorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultDoctorModelCopyWith<$Res> {
  factory $ResultDoctorModelCopyWith(
          ResultDoctorModel value, $Res Function(ResultDoctorModel) then) =
      _$ResultDoctorModelCopyWithImpl<$Res, ResultDoctorModel>;
  @useResult
  $Res call(
      {List<DoctorModel> items,
      @JsonKey(name: 'total_item') int totalItem,
      @JsonKey(name: 'total_page') int totalPage,
      @JsonKey(name: 'current_page') int currentPage});
}

/// @nodoc
class _$ResultDoctorModelCopyWithImpl<$Res, $Val extends ResultDoctorModel>
    implements $ResultDoctorModelCopyWith<$Res> {
  _$ResultDoctorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalItem = null,
    Object? totalPage = null,
    Object? currentPage = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DoctorModel>,
      totalItem: null == totalItem
          ? _value.totalItem
          : totalItem // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultDoctorModelImplCopyWith<$Res>
    implements $ResultDoctorModelCopyWith<$Res> {
  factory _$$ResultDoctorModelImplCopyWith(_$ResultDoctorModelImpl value,
          $Res Function(_$ResultDoctorModelImpl) then) =
      __$$ResultDoctorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DoctorModel> items,
      @JsonKey(name: 'total_item') int totalItem,
      @JsonKey(name: 'total_page') int totalPage,
      @JsonKey(name: 'current_page') int currentPage});
}

/// @nodoc
class __$$ResultDoctorModelImplCopyWithImpl<$Res>
    extends _$ResultDoctorModelCopyWithImpl<$Res, _$ResultDoctorModelImpl>
    implements _$$ResultDoctorModelImplCopyWith<$Res> {
  __$$ResultDoctorModelImplCopyWithImpl(_$ResultDoctorModelImpl _value,
      $Res Function(_$ResultDoctorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalItem = null,
    Object? totalPage = null,
    Object? currentPage = null,
  }) {
    return _then(_$ResultDoctorModelImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DoctorModel>,
      totalItem: null == totalItem
          ? _value.totalItem
          : totalItem // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultDoctorModelImpl implements _ResultDoctorModel {
  const _$ResultDoctorModelImpl(
      {required final List<DoctorModel> items,
      @JsonKey(name: 'total_item') required this.totalItem,
      @JsonKey(name: 'total_page') required this.totalPage,
      @JsonKey(name: 'current_page') required this.currentPage})
      : _items = items;

  factory _$ResultDoctorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultDoctorModelImplFromJson(json);

  final List<DoctorModel> _items;
  @override
  List<DoctorModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'total_item')
  final int totalItem;
  @override
  @JsonKey(name: 'total_page')
  final int totalPage;
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;

  @override
  String toString() {
    return 'ResultDoctorModel(items: $items, totalItem: $totalItem, totalPage: $totalPage, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultDoctorModelImpl &&
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
  _$$ResultDoctorModelImplCopyWith<_$ResultDoctorModelImpl> get copyWith =>
      __$$ResultDoctorModelImplCopyWithImpl<_$ResultDoctorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultDoctorModelImplToJson(
      this,
    );
  }
}

abstract class _ResultDoctorModel implements ResultDoctorModel {
  const factory _ResultDoctorModel(
          {required final List<DoctorModel> items,
          @JsonKey(name: 'total_item') required final int totalItem,
          @JsonKey(name: 'total_page') required final int totalPage,
          @JsonKey(name: 'current_page') required final int currentPage}) =
      _$ResultDoctorModelImpl;

  factory _ResultDoctorModel.fromJson(Map<String, dynamic> json) =
      _$ResultDoctorModelImpl.fromJson;

  @override
  List<DoctorModel> get items;
  @override
  @JsonKey(name: 'total_item')
  int get totalItem;
  @override
  @JsonKey(name: 'total_page')
  int get totalPage;
  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(ignore: true)
  _$$ResultDoctorModelImplCopyWith<_$ResultDoctorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
