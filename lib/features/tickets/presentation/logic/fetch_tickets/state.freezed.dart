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
mixin _$TicketState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TicketEntity> data) data,
    required TResult Function() empty,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TicketEntity> data)? data,
    TResult? Function()? empty,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TicketEntity> data)? data,
    TResult Function()? empty,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TicketStateInitial value) initial,
    required TResult Function(TicketStateLoading value) loading,
    required TResult Function(TicketStateData value) data,
    required TResult Function(TicketStateEmpty value) empty,
    required TResult Function(TicketStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TicketStateInitial value)? initial,
    TResult? Function(TicketStateLoading value)? loading,
    TResult? Function(TicketStateData value)? data,
    TResult? Function(TicketStateEmpty value)? empty,
    TResult? Function(TicketStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketStateInitial value)? initial,
    TResult Function(TicketStateLoading value)? loading,
    TResult Function(TicketStateData value)? data,
    TResult Function(TicketStateEmpty value)? empty,
    TResult Function(TicketStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketStateCopyWith<$Res> {
  factory $TicketStateCopyWith(
          TicketState value, $Res Function(TicketState) then) =
      _$TicketStateCopyWithImpl<$Res, TicketState>;
}

/// @nodoc
class _$TicketStateCopyWithImpl<$Res, $Val extends TicketState>
    implements $TicketStateCopyWith<$Res> {
  _$TicketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TicketStateInitialImplCopyWith<$Res> {
  factory _$$TicketStateInitialImplCopyWith(_$TicketStateInitialImpl value,
          $Res Function(_$TicketStateInitialImpl) then) =
      __$$TicketStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TicketStateInitialImplCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$TicketStateInitialImpl>
    implements _$$TicketStateInitialImplCopyWith<$Res> {
  __$$TicketStateInitialImplCopyWithImpl(_$TicketStateInitialImpl _value,
      $Res Function(_$TicketStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TicketStateInitialImpl implements TicketStateInitial {
  const _$TicketStateInitialImpl();

  @override
  String toString() {
    return 'TicketState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TicketStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TicketEntity> data) data,
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
    TResult? Function(List<TicketEntity> data)? data,
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
    TResult Function(List<TicketEntity> data)? data,
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
    required TResult Function(TicketStateInitial value) initial,
    required TResult Function(TicketStateLoading value) loading,
    required TResult Function(TicketStateData value) data,
    required TResult Function(TicketStateEmpty value) empty,
    required TResult Function(TicketStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TicketStateInitial value)? initial,
    TResult? Function(TicketStateLoading value)? loading,
    TResult? Function(TicketStateData value)? data,
    TResult? Function(TicketStateEmpty value)? empty,
    TResult? Function(TicketStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketStateInitial value)? initial,
    TResult Function(TicketStateLoading value)? loading,
    TResult Function(TicketStateData value)? data,
    TResult Function(TicketStateEmpty value)? empty,
    TResult Function(TicketStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TicketStateInitial implements TicketState {
  const factory TicketStateInitial() = _$TicketStateInitialImpl;
}

/// @nodoc
abstract class _$$TicketStateLoadingImplCopyWith<$Res> {
  factory _$$TicketStateLoadingImplCopyWith(_$TicketStateLoadingImpl value,
          $Res Function(_$TicketStateLoadingImpl) then) =
      __$$TicketStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TicketStateLoadingImplCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$TicketStateLoadingImpl>
    implements _$$TicketStateLoadingImplCopyWith<$Res> {
  __$$TicketStateLoadingImplCopyWithImpl(_$TicketStateLoadingImpl _value,
      $Res Function(_$TicketStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TicketStateLoadingImpl implements TicketStateLoading {
  const _$TicketStateLoadingImpl();

  @override
  String toString() {
    return 'TicketState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TicketStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TicketEntity> data) data,
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
    TResult? Function(List<TicketEntity> data)? data,
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
    TResult Function(List<TicketEntity> data)? data,
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
    required TResult Function(TicketStateInitial value) initial,
    required TResult Function(TicketStateLoading value) loading,
    required TResult Function(TicketStateData value) data,
    required TResult Function(TicketStateEmpty value) empty,
    required TResult Function(TicketStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TicketStateInitial value)? initial,
    TResult? Function(TicketStateLoading value)? loading,
    TResult? Function(TicketStateData value)? data,
    TResult? Function(TicketStateEmpty value)? empty,
    TResult? Function(TicketStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketStateInitial value)? initial,
    TResult Function(TicketStateLoading value)? loading,
    TResult Function(TicketStateData value)? data,
    TResult Function(TicketStateEmpty value)? empty,
    TResult Function(TicketStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TicketStateLoading implements TicketState {
  const factory TicketStateLoading() = _$TicketStateLoadingImpl;
}

/// @nodoc
abstract class _$$TicketStateDataImplCopyWith<$Res> {
  factory _$$TicketStateDataImplCopyWith(_$TicketStateDataImpl value,
          $Res Function(_$TicketStateDataImpl) then) =
      __$$TicketStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TicketEntity> data});
}

/// @nodoc
class __$$TicketStateDataImplCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$TicketStateDataImpl>
    implements _$$TicketStateDataImplCopyWith<$Res> {
  __$$TicketStateDataImplCopyWithImpl(
      _$TicketStateDataImpl _value, $Res Function(_$TicketStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$TicketStateDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
    ));
  }
}

/// @nodoc

class _$TicketStateDataImpl implements TicketStateData {
  const _$TicketStateDataImpl({required final List<TicketEntity> data})
      : _data = data;

  final List<TicketEntity> _data;
  @override
  List<TicketEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'TicketState.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketStateDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketStateDataImplCopyWith<_$TicketStateDataImpl> get copyWith =>
      __$$TicketStateDataImplCopyWithImpl<_$TicketStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TicketEntity> data) data,
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
    TResult? Function(List<TicketEntity> data)? data,
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
    TResult Function(List<TicketEntity> data)? data,
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
    required TResult Function(TicketStateInitial value) initial,
    required TResult Function(TicketStateLoading value) loading,
    required TResult Function(TicketStateData value) data,
    required TResult Function(TicketStateEmpty value) empty,
    required TResult Function(TicketStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TicketStateInitial value)? initial,
    TResult? Function(TicketStateLoading value)? loading,
    TResult? Function(TicketStateData value)? data,
    TResult? Function(TicketStateEmpty value)? empty,
    TResult? Function(TicketStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketStateInitial value)? initial,
    TResult Function(TicketStateLoading value)? loading,
    TResult Function(TicketStateData value)? data,
    TResult Function(TicketStateEmpty value)? empty,
    TResult Function(TicketStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class TicketStateData implements TicketState {
  const factory TicketStateData({required final List<TicketEntity> data}) =
      _$TicketStateDataImpl;

  List<TicketEntity> get data;
  @JsonKey(ignore: true)
  _$$TicketStateDataImplCopyWith<_$TicketStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TicketStateEmptyImplCopyWith<$Res> {
  factory _$$TicketStateEmptyImplCopyWith(_$TicketStateEmptyImpl value,
          $Res Function(_$TicketStateEmptyImpl) then) =
      __$$TicketStateEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TicketStateEmptyImplCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$TicketStateEmptyImpl>
    implements _$$TicketStateEmptyImplCopyWith<$Res> {
  __$$TicketStateEmptyImplCopyWithImpl(_$TicketStateEmptyImpl _value,
      $Res Function(_$TicketStateEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TicketStateEmptyImpl implements TicketStateEmpty {
  const _$TicketStateEmptyImpl();

  @override
  String toString() {
    return 'TicketState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TicketStateEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TicketEntity> data) data,
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
    TResult? Function(List<TicketEntity> data)? data,
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
    TResult Function(List<TicketEntity> data)? data,
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
    required TResult Function(TicketStateInitial value) initial,
    required TResult Function(TicketStateLoading value) loading,
    required TResult Function(TicketStateData value) data,
    required TResult Function(TicketStateEmpty value) empty,
    required TResult Function(TicketStateError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TicketStateInitial value)? initial,
    TResult? Function(TicketStateLoading value)? loading,
    TResult? Function(TicketStateData value)? data,
    TResult? Function(TicketStateEmpty value)? empty,
    TResult? Function(TicketStateError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketStateInitial value)? initial,
    TResult Function(TicketStateLoading value)? loading,
    TResult Function(TicketStateData value)? data,
    TResult Function(TicketStateEmpty value)? empty,
    TResult Function(TicketStateError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class TicketStateEmpty implements TicketState {
  const factory TicketStateEmpty() = _$TicketStateEmptyImpl;
}

/// @nodoc
abstract class _$$TicketStateErrorImplCopyWith<$Res> {
  factory _$$TicketStateErrorImplCopyWith(_$TicketStateErrorImpl value,
          $Res Function(_$TicketStateErrorImpl) then) =
      __$$TicketStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TicketStateErrorImplCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$TicketStateErrorImpl>
    implements _$$TicketStateErrorImplCopyWith<$Res> {
  __$$TicketStateErrorImplCopyWithImpl(_$TicketStateErrorImpl _value,
      $Res Function(_$TicketStateErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TicketStateErrorImpl implements TicketStateError {
  const _$TicketStateErrorImpl();

  @override
  String toString() {
    return 'TicketState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TicketStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TicketEntity> data) data,
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
    TResult? Function(List<TicketEntity> data)? data,
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
    TResult Function(List<TicketEntity> data)? data,
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
    required TResult Function(TicketStateInitial value) initial,
    required TResult Function(TicketStateLoading value) loading,
    required TResult Function(TicketStateData value) data,
    required TResult Function(TicketStateEmpty value) empty,
    required TResult Function(TicketStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TicketStateInitial value)? initial,
    TResult? Function(TicketStateLoading value)? loading,
    TResult? Function(TicketStateData value)? data,
    TResult? Function(TicketStateEmpty value)? empty,
    TResult? Function(TicketStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketStateInitial value)? initial,
    TResult Function(TicketStateLoading value)? loading,
    TResult Function(TicketStateData value)? data,
    TResult Function(TicketStateEmpty value)? empty,
    TResult Function(TicketStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TicketStateError implements TicketState {
  const factory TicketStateError() = _$TicketStateErrorImpl;
}
