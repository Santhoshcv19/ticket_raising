// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LogState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<LogEntity> data) data,
    required TResult Function() empty,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<LogEntity> data)? data,
    TResult? Function()? empty,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<LogEntity> data)? data,
    TResult Function()? empty,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogStateInitial value) initial,
    required TResult Function(LogStateLoading value) loading,
    required TResult Function(LogStatedata value) data,
    required TResult Function(LogStateEmpty value) empty,
    required TResult Function(LogStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogStateInitial value)? initial,
    TResult? Function(LogStateLoading value)? loading,
    TResult? Function(LogStatedata value)? data,
    TResult? Function(LogStateEmpty value)? empty,
    TResult? Function(LogStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogStateInitial value)? initial,
    TResult Function(LogStateLoading value)? loading,
    TResult Function(LogStatedata value)? data,
    TResult Function(LogStateEmpty value)? empty,
    TResult Function(LogStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogStateCopyWith<$Res> {
  factory $LogStateCopyWith(LogState value, $Res Function(LogState) then) =
      _$LogStateCopyWithImpl<$Res, LogState>;
}

/// @nodoc
class _$LogStateCopyWithImpl<$Res, $Val extends LogState>
    implements $LogStateCopyWith<$Res> {
  _$LogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LogStateInitialImplCopyWith<$Res> {
  factory _$$LogStateInitialImplCopyWith(_$LogStateInitialImpl value,
          $Res Function(_$LogStateInitialImpl) then) =
      __$$LogStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogStateInitialImplCopyWithImpl<$Res>
    extends _$LogStateCopyWithImpl<$Res, _$LogStateInitialImpl>
    implements _$$LogStateInitialImplCopyWith<$Res> {
  __$$LogStateInitialImplCopyWithImpl(
      _$LogStateInitialImpl _value, $Res Function(_$LogStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogStateInitialImpl implements LogStateInitial {
  const _$LogStateInitialImpl();

  @override
  String toString() {
    return 'LogState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<LogEntity> data) data,
    required TResult Function() empty,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<LogEntity> data)? data,
    TResult? Function()? empty,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<LogEntity> data)? data,
    TResult Function()? empty,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogStateInitial value) initial,
    required TResult Function(LogStateLoading value) loading,
    required TResult Function(LogStatedata value) data,
    required TResult Function(LogStateEmpty value) empty,
    required TResult Function(LogStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogStateInitial value)? initial,
    TResult? Function(LogStateLoading value)? loading,
    TResult? Function(LogStatedata value)? data,
    TResult? Function(LogStateEmpty value)? empty,
    TResult? Function(LogStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogStateInitial value)? initial,
    TResult Function(LogStateLoading value)? loading,
    TResult Function(LogStatedata value)? data,
    TResult Function(LogStateEmpty value)? empty,
    TResult Function(LogStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LogStateInitial implements LogState {
  const factory LogStateInitial() = _$LogStateInitialImpl;
}

/// @nodoc
abstract class _$$LogStateLoadingImplCopyWith<$Res> {
  factory _$$LogStateLoadingImplCopyWith(_$LogStateLoadingImpl value,
          $Res Function(_$LogStateLoadingImpl) then) =
      __$$LogStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogStateLoadingImplCopyWithImpl<$Res>
    extends _$LogStateCopyWithImpl<$Res, _$LogStateLoadingImpl>
    implements _$$LogStateLoadingImplCopyWith<$Res> {
  __$$LogStateLoadingImplCopyWithImpl(
      _$LogStateLoadingImpl _value, $Res Function(_$LogStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogStateLoadingImpl implements LogStateLoading {
  const _$LogStateLoadingImpl();

  @override
  String toString() {
    return 'LogState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<LogEntity> data) data,
    required TResult Function() empty,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<LogEntity> data)? data,
    TResult? Function()? empty,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<LogEntity> data)? data,
    TResult Function()? empty,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogStateInitial value) initial,
    required TResult Function(LogStateLoading value) loading,
    required TResult Function(LogStatedata value) data,
    required TResult Function(LogStateEmpty value) empty,
    required TResult Function(LogStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogStateInitial value)? initial,
    TResult? Function(LogStateLoading value)? loading,
    TResult? Function(LogStatedata value)? data,
    TResult? Function(LogStateEmpty value)? empty,
    TResult? Function(LogStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogStateInitial value)? initial,
    TResult Function(LogStateLoading value)? loading,
    TResult Function(LogStatedata value)? data,
    TResult Function(LogStateEmpty value)? empty,
    TResult Function(LogStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LogStateLoading implements LogState {
  const factory LogStateLoading() = _$LogStateLoadingImpl;
}

/// @nodoc
abstract class _$$LogStatedataImplCopyWith<$Res> {
  factory _$$LogStatedataImplCopyWith(
          _$LogStatedataImpl value, $Res Function(_$LogStatedataImpl) then) =
      __$$LogStatedataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<LogEntity> data});
}

/// @nodoc
class __$$LogStatedataImplCopyWithImpl<$Res>
    extends _$LogStateCopyWithImpl<$Res, _$LogStatedataImpl>
    implements _$$LogStatedataImplCopyWith<$Res> {
  __$$LogStatedataImplCopyWithImpl(
      _$LogStatedataImpl _value, $Res Function(_$LogStatedataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LogStatedataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LogEntity>,
    ));
  }
}

/// @nodoc

class _$LogStatedataImpl implements LogStatedata {
  const _$LogStatedataImpl({required final List<LogEntity> data})
      : _data = data;

  final List<LogEntity> _data;
  @override
  List<LogEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LogState.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogStatedataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogStatedataImplCopyWith<_$LogStatedataImpl> get copyWith =>
      __$$LogStatedataImplCopyWithImpl<_$LogStatedataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<LogEntity> data) data,
    required TResult Function() empty,
    required TResult Function() error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<LogEntity> data)? data,
    TResult? Function()? empty,
    TResult? Function()? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<LogEntity> data)? data,
    TResult Function()? empty,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogStateInitial value) initial,
    required TResult Function(LogStateLoading value) loading,
    required TResult Function(LogStatedata value) data,
    required TResult Function(LogStateEmpty value) empty,
    required TResult Function(LogStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogStateInitial value)? initial,
    TResult? Function(LogStateLoading value)? loading,
    TResult? Function(LogStatedata value)? data,
    TResult? Function(LogStateEmpty value)? empty,
    TResult? Function(LogStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogStateInitial value)? initial,
    TResult Function(LogStateLoading value)? loading,
    TResult Function(LogStatedata value)? data,
    TResult Function(LogStateEmpty value)? empty,
    TResult Function(LogStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class LogStatedata implements LogState {
  const factory LogStatedata({required final List<LogEntity> data}) =
      _$LogStatedataImpl;

  List<LogEntity> get data;
  @JsonKey(ignore: true)
  _$$LogStatedataImplCopyWith<_$LogStatedataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogStateEmptyImplCopyWith<$Res> {
  factory _$$LogStateEmptyImplCopyWith(
          _$LogStateEmptyImpl value, $Res Function(_$LogStateEmptyImpl) then) =
      __$$LogStateEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogStateEmptyImplCopyWithImpl<$Res>
    extends _$LogStateCopyWithImpl<$Res, _$LogStateEmptyImpl>
    implements _$$LogStateEmptyImplCopyWith<$Res> {
  __$$LogStateEmptyImplCopyWithImpl(
      _$LogStateEmptyImpl _value, $Res Function(_$LogStateEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogStateEmptyImpl implements LogStateEmpty {
  const _$LogStateEmptyImpl();

  @override
  String toString() {
    return 'LogState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogStateEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<LogEntity> data) data,
    required TResult Function() empty,
    required TResult Function() error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<LogEntity> data)? data,
    TResult? Function()? empty,
    TResult? Function()? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<LogEntity> data)? data,
    TResult Function()? empty,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogStateInitial value) initial,
    required TResult Function(LogStateLoading value) loading,
    required TResult Function(LogStatedata value) data,
    required TResult Function(LogStateEmpty value) empty,
    required TResult Function(LogStateError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogStateInitial value)? initial,
    TResult? Function(LogStateLoading value)? loading,
    TResult? Function(LogStatedata value)? data,
    TResult? Function(LogStateEmpty value)? empty,
    TResult? Function(LogStateError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogStateInitial value)? initial,
    TResult Function(LogStateLoading value)? loading,
    TResult Function(LogStatedata value)? data,
    TResult Function(LogStateEmpty value)? empty,
    TResult Function(LogStateError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class LogStateEmpty implements LogState {
  const factory LogStateEmpty() = _$LogStateEmptyImpl;
}

/// @nodoc
abstract class _$$LogStateErrorImplCopyWith<$Res> {
  factory _$$LogStateErrorImplCopyWith(
          _$LogStateErrorImpl value, $Res Function(_$LogStateErrorImpl) then) =
      __$$LogStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogStateErrorImplCopyWithImpl<$Res>
    extends _$LogStateCopyWithImpl<$Res, _$LogStateErrorImpl>
    implements _$$LogStateErrorImplCopyWith<$Res> {
  __$$LogStateErrorImplCopyWithImpl(
      _$LogStateErrorImpl _value, $Res Function(_$LogStateErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogStateErrorImpl implements LogStateError {
  const _$LogStateErrorImpl();

  @override
  String toString() {
    return 'LogState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<LogEntity> data) data,
    required TResult Function() empty,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<LogEntity> data)? data,
    TResult? Function()? empty,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<LogEntity> data)? data,
    TResult Function()? empty,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogStateInitial value) initial,
    required TResult Function(LogStateLoading value) loading,
    required TResult Function(LogStatedata value) data,
    required TResult Function(LogStateEmpty value) empty,
    required TResult Function(LogStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogStateInitial value)? initial,
    TResult? Function(LogStateLoading value)? loading,
    TResult? Function(LogStatedata value)? data,
    TResult? Function(LogStateEmpty value)? empty,
    TResult? Function(LogStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogStateInitial value)? initial,
    TResult Function(LogStateLoading value)? loading,
    TResult Function(LogStatedata value)? data,
    TResult Function(LogStateEmpty value)? empty,
    TResult Function(LogStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LogStateError implements LogState {
  const factory LogStateError() = _$LogStateErrorImpl;
}
