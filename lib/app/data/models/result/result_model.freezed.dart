// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResultModel<T> _$ResultModelFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  switch (json['runtimeType']) {
    case 'successWithData':
      return SuccessWithData<T>.fromJson(json, fromJsonT);
    case 'successWithPages':
      return SuccessWithPages<T>.fromJson(json, fromJsonT);
    case 'error':
      return Error<T>.fromJson(json, fromJsonT);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ResultModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ResultModel<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) successWithData,
    required TResult Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)
        successWithPages,
    required TResult Function(ErrorModel error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? successWithData,
    TResult? Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)?
        successWithPages,
    TResult? Function(ErrorModel error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? successWithData,
    TResult Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)?
        successWithPages,
    TResult Function(ErrorModel error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessWithData<T> value) successWithData,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessWithData<T> value)? successWithData,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessWithData<T> value)? successWithData,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultModelCopyWith<T, $Res> {
  factory $ResultModelCopyWith(
          ResultModel<T> value, $Res Function(ResultModel<T>) then) =
      _$ResultModelCopyWithImpl<T, $Res, ResultModel<T>>;
}

/// @nodoc
class _$ResultModelCopyWithImpl<T, $Res, $Val extends ResultModel<T>>
    implements $ResultModelCopyWith<T, $Res> {
  _$ResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessWithDataImplCopyWith<T, $Res> {
  factory _$$SuccessWithDataImplCopyWith(_$SuccessWithDataImpl<T> value,
          $Res Function(_$SuccessWithDataImpl<T>) then) =
      __$$SuccessWithDataImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SuccessWithDataImplCopyWithImpl<T, $Res>
    extends _$ResultModelCopyWithImpl<T, $Res, _$SuccessWithDataImpl<T>>
    implements _$$SuccessWithDataImplCopyWith<T, $Res> {
  __$$SuccessWithDataImplCopyWithImpl(_$SuccessWithDataImpl<T> _value,
      $Res Function(_$SuccessWithDataImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessWithDataImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$SuccessWithDataImpl<T> implements SuccessWithData<T> {
  const _$SuccessWithDataImpl(this.data, {final String? $type})
      : $type = $type ?? 'successWithData';

  factory _$SuccessWithDataImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$SuccessWithDataImplFromJson(json, fromJsonT);

  @override
  final T data;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ResultModel<$T>.successWithData(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessWithDataImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessWithDataImplCopyWith<T, _$SuccessWithDataImpl<T>> get copyWith =>
      __$$SuccessWithDataImplCopyWithImpl<T, _$SuccessWithDataImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) successWithData,
    required TResult Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)
        successWithPages,
    required TResult Function(ErrorModel error) error,
  }) {
    return successWithData(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? successWithData,
    TResult? Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)?
        successWithPages,
    TResult? Function(ErrorModel error)? error,
  }) {
    return successWithData?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? successWithData,
    TResult Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)?
        successWithPages,
    TResult Function(ErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (successWithData != null) {
      return successWithData(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessWithData<T> value) successWithData,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Error<T> value) error,
  }) {
    return successWithData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessWithData<T> value)? successWithData,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Error<T> value)? error,
  }) {
    return successWithData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessWithData<T> value)? successWithData,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (successWithData != null) {
      return successWithData(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$SuccessWithDataImplToJson<T>(this, toJsonT);
  }
}

abstract class SuccessWithData<T> implements ResultModel<T> {
  const factory SuccessWithData(final T data) = _$SuccessWithDataImpl<T>;

  factory SuccessWithData.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$SuccessWithDataImpl<T>.fromJson;

  T get data;
  @JsonKey(ignore: true)
  _$$SuccessWithDataImplCopyWith<T, _$SuccessWithDataImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessWithPagesImplCopyWith<T, $Res> {
  factory _$$SuccessWithPagesImplCopyWith(_$SuccessWithPagesImpl<T> value,
          $Res Function(_$SuccessWithPagesImpl<T>) then) =
      __$$SuccessWithPagesImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call(
      {List<T> items,
      @JsonKey(name: 'total_item') int totalItem,
      @JsonKey(name: 'total_page') int totalPage,
      @JsonKey(name: 'current_page') int currentPage});
}

/// @nodoc
class __$$SuccessWithPagesImplCopyWithImpl<T, $Res>
    extends _$ResultModelCopyWithImpl<T, $Res, _$SuccessWithPagesImpl<T>>
    implements _$$SuccessWithPagesImplCopyWith<T, $Res> {
  __$$SuccessWithPagesImplCopyWithImpl(_$SuccessWithPagesImpl<T> _value,
      $Res Function(_$SuccessWithPagesImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalItem = null,
    Object? totalPage = null,
    Object? currentPage = null,
  }) {
    return _then(_$SuccessWithPagesImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
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
@JsonSerializable(genericArgumentFactories: true)
class _$SuccessWithPagesImpl<T> implements SuccessWithPages<T> {
  const _$SuccessWithPagesImpl(
      {required final List<T> items,
      @JsonKey(name: 'total_item') required this.totalItem,
      @JsonKey(name: 'total_page') required this.totalPage,
      @JsonKey(name: 'current_page') required this.currentPage,
      final String? $type})
      : _items = items,
        $type = $type ?? 'successWithPages';

  factory _$SuccessWithPagesImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$SuccessWithPagesImplFromJson(json, fromJsonT);

  final List<T> _items;
  @override
  List<T> get items {
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

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ResultModel<$T>.successWithPages(items: $items, totalItem: $totalItem, totalPage: $totalPage, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessWithPagesImpl<T> &&
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
  _$$SuccessWithPagesImplCopyWith<T, _$SuccessWithPagesImpl<T>> get copyWith =>
      __$$SuccessWithPagesImplCopyWithImpl<T, _$SuccessWithPagesImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) successWithData,
    required TResult Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)
        successWithPages,
    required TResult Function(ErrorModel error) error,
  }) {
    return successWithPages(items, totalItem, totalPage, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? successWithData,
    TResult? Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)?
        successWithPages,
    TResult? Function(ErrorModel error)? error,
  }) {
    return successWithPages?.call(items, totalItem, totalPage, currentPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? successWithData,
    TResult Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)?
        successWithPages,
    TResult Function(ErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (successWithPages != null) {
      return successWithPages(items, totalItem, totalPage, currentPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessWithData<T> value) successWithData,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Error<T> value) error,
  }) {
    return successWithPages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessWithData<T> value)? successWithData,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Error<T> value)? error,
  }) {
    return successWithPages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessWithData<T> value)? successWithData,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (successWithPages != null) {
      return successWithPages(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$SuccessWithPagesImplToJson<T>(this, toJsonT);
  }
}

abstract class SuccessWithPages<T> implements ResultModel<T> {
  const factory SuccessWithPages(
          {required final List<T> items,
          @JsonKey(name: 'total_item') required final int totalItem,
          @JsonKey(name: 'total_page') required final int totalPage,
          @JsonKey(name: 'current_page') required final int currentPage}) =
      _$SuccessWithPagesImpl<T>;

  factory SuccessWithPages.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$SuccessWithPagesImpl<T>.fromJson;

  List<T> get items;
  @JsonKey(name: 'total_item')
  int get totalItem;
  @JsonKey(name: 'total_page')
  int get totalPage;
  @JsonKey(name: 'current_page')
  int get currentPage;
  @JsonKey(ignore: true)
  _$$SuccessWithPagesImplCopyWith<T, _$SuccessWithPagesImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ErrorModel error});

  $ErrorModelCopyWith<$Res> get error;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$ResultModelCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl<T>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ErrorModelCopyWith<$Res> get error {
    return $ErrorModelCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl(this.error, {final String? $type})
      : $type = $type ?? 'error';

  factory _$ErrorImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ErrorImplFromJson(json, fromJsonT);

  @override
  final ErrorModel error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ResultModel<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) successWithData,
    required TResult Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)
        successWithPages,
    required TResult Function(ErrorModel error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T data)? successWithData,
    TResult? Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)?
        successWithPages,
    TResult? Function(ErrorModel error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? successWithData,
    TResult Function(
            List<T> items,
            @JsonKey(name: 'total_item') int totalItem,
            @JsonKey(name: 'total_page') int totalPage,
            @JsonKey(name: 'current_page') int currentPage)?
        successWithPages,
    TResult Function(ErrorModel error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuccessWithData<T> value) successWithData,
    required TResult Function(SuccessWithPages<T> value) successWithPages,
    required TResult Function(Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuccessWithData<T> value)? successWithData,
    TResult? Function(SuccessWithPages<T> value)? successWithPages,
    TResult? Function(Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuccessWithData<T> value)? successWithData,
    TResult Function(SuccessWithPages<T> value)? successWithPages,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ErrorImplToJson<T>(this, toJsonT);
  }
}

abstract class Error<T> implements ResultModel<T> {
  const factory Error(final ErrorModel error) = _$ErrorImpl<T>;

  factory Error.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ErrorImpl<T>.fromJson;

  ErrorModel get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
