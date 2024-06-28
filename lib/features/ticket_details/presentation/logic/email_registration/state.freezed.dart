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
mixin _$EmailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() data,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? data,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? data,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailStateInitial value) initial,
    required TResult Function(EmailStateLoading value) loading,
    required TResult Function(EmailStateEmpty value) empty,
    required TResult Function(EmailStateData value) data,
    required TResult Function(EmailStateErrror value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailStateInitial value)? initial,
    TResult? Function(EmailStateLoading value)? loading,
    TResult? Function(EmailStateEmpty value)? empty,
    TResult? Function(EmailStateData value)? data,
    TResult? Function(EmailStateErrror value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailStateInitial value)? initial,
    TResult Function(EmailStateLoading value)? loading,
    TResult Function(EmailStateEmpty value)? empty,
    TResult Function(EmailStateData value)? data,
    TResult Function(EmailStateErrror value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailStateCopyWith<$Res> {
  factory $EmailStateCopyWith(
          EmailState value, $Res Function(EmailState) then) =
      _$EmailStateCopyWithImpl<$Res, EmailState>;
}

/// @nodoc
class _$EmailStateCopyWithImpl<$Res, $Val extends EmailState>
    implements $EmailStateCopyWith<$Res> {
  _$EmailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmailStateInitialImplCopyWith<$Res> {
  factory _$$EmailStateInitialImplCopyWith(_$EmailStateInitialImpl value,
          $Res Function(_$EmailStateInitialImpl) then) =
      __$$EmailStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailStateInitialImplCopyWithImpl<$Res>
    extends _$EmailStateCopyWithImpl<$Res, _$EmailStateInitialImpl>
    implements _$$EmailStateInitialImplCopyWith<$Res> {
  __$$EmailStateInitialImplCopyWithImpl(_$EmailStateInitialImpl _value,
      $Res Function(_$EmailStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmailStateInitialImpl implements EmailStateInitial {
  const _$EmailStateInitialImpl();

  @override
  String toString() {
    return 'EmailState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() data,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? data,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? data,
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
    required TResult Function(EmailStateInitial value) initial,
    required TResult Function(EmailStateLoading value) loading,
    required TResult Function(EmailStateEmpty value) empty,
    required TResult Function(EmailStateData value) data,
    required TResult Function(EmailStateErrror value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailStateInitial value)? initial,
    TResult? Function(EmailStateLoading value)? loading,
    TResult? Function(EmailStateEmpty value)? empty,
    TResult? Function(EmailStateData value)? data,
    TResult? Function(EmailStateErrror value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailStateInitial value)? initial,
    TResult Function(EmailStateLoading value)? loading,
    TResult Function(EmailStateEmpty value)? empty,
    TResult Function(EmailStateData value)? data,
    TResult Function(EmailStateErrror value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class EmailStateInitial implements EmailState {
  const factory EmailStateInitial() = _$EmailStateInitialImpl;
}

/// @nodoc
abstract class _$$EmailStateLoadingImplCopyWith<$Res> {
  factory _$$EmailStateLoadingImplCopyWith(_$EmailStateLoadingImpl value,
          $Res Function(_$EmailStateLoadingImpl) then) =
      __$$EmailStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailStateLoadingImplCopyWithImpl<$Res>
    extends _$EmailStateCopyWithImpl<$Res, _$EmailStateLoadingImpl>
    implements _$$EmailStateLoadingImplCopyWith<$Res> {
  __$$EmailStateLoadingImplCopyWithImpl(_$EmailStateLoadingImpl _value,
      $Res Function(_$EmailStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmailStateLoadingImpl implements EmailStateLoading {
  const _$EmailStateLoadingImpl();

  @override
  String toString() {
    return 'EmailState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() data,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? data,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? data,
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
    required TResult Function(EmailStateInitial value) initial,
    required TResult Function(EmailStateLoading value) loading,
    required TResult Function(EmailStateEmpty value) empty,
    required TResult Function(EmailStateData value) data,
    required TResult Function(EmailStateErrror value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailStateInitial value)? initial,
    TResult? Function(EmailStateLoading value)? loading,
    TResult? Function(EmailStateEmpty value)? empty,
    TResult? Function(EmailStateData value)? data,
    TResult? Function(EmailStateErrror value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailStateInitial value)? initial,
    TResult Function(EmailStateLoading value)? loading,
    TResult Function(EmailStateEmpty value)? empty,
    TResult Function(EmailStateData value)? data,
    TResult Function(EmailStateErrror value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EmailStateLoading implements EmailState {
  const factory EmailStateLoading() = _$EmailStateLoadingImpl;
}

/// @nodoc
abstract class _$$EmailStateEmptyImplCopyWith<$Res> {
  factory _$$EmailStateEmptyImplCopyWith(_$EmailStateEmptyImpl value,
          $Res Function(_$EmailStateEmptyImpl) then) =
      __$$EmailStateEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailStateEmptyImplCopyWithImpl<$Res>
    extends _$EmailStateCopyWithImpl<$Res, _$EmailStateEmptyImpl>
    implements _$$EmailStateEmptyImplCopyWith<$Res> {
  __$$EmailStateEmptyImplCopyWithImpl(
      _$EmailStateEmptyImpl _value, $Res Function(_$EmailStateEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmailStateEmptyImpl implements EmailStateEmpty {
  const _$EmailStateEmptyImpl();

  @override
  String toString() {
    return 'EmailState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailStateEmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() data,
    required TResult Function() error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? data,
    TResult? Function()? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? data,
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
    required TResult Function(EmailStateInitial value) initial,
    required TResult Function(EmailStateLoading value) loading,
    required TResult Function(EmailStateEmpty value) empty,
    required TResult Function(EmailStateData value) data,
    required TResult Function(EmailStateErrror value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailStateInitial value)? initial,
    TResult? Function(EmailStateLoading value)? loading,
    TResult? Function(EmailStateEmpty value)? empty,
    TResult? Function(EmailStateData value)? data,
    TResult? Function(EmailStateErrror value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailStateInitial value)? initial,
    TResult Function(EmailStateLoading value)? loading,
    TResult Function(EmailStateEmpty value)? empty,
    TResult Function(EmailStateData value)? data,
    TResult Function(EmailStateErrror value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmailStateEmpty implements EmailState {
  const factory EmailStateEmpty() = _$EmailStateEmptyImpl;
}

/// @nodoc
abstract class _$$EmailStateDataImplCopyWith<$Res> {
  factory _$$EmailStateDataImplCopyWith(_$EmailStateDataImpl value,
          $Res Function(_$EmailStateDataImpl) then) =
      __$$EmailStateDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailStateDataImplCopyWithImpl<$Res>
    extends _$EmailStateCopyWithImpl<$Res, _$EmailStateDataImpl>
    implements _$$EmailStateDataImplCopyWith<$Res> {
  __$$EmailStateDataImplCopyWithImpl(
      _$EmailStateDataImpl _value, $Res Function(_$EmailStateDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmailStateDataImpl implements EmailStateData {
  const _$EmailStateDataImpl();

  @override
  String toString() {
    return 'EmailState.data()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailStateDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() data,
    required TResult Function() error,
  }) {
    return data();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? data,
    TResult? Function()? error,
  }) {
    return data?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? data,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailStateInitial value) initial,
    required TResult Function(EmailStateLoading value) loading,
    required TResult Function(EmailStateEmpty value) empty,
    required TResult Function(EmailStateData value) data,
    required TResult Function(EmailStateErrror value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailStateInitial value)? initial,
    TResult? Function(EmailStateLoading value)? loading,
    TResult? Function(EmailStateEmpty value)? empty,
    TResult? Function(EmailStateData value)? data,
    TResult? Function(EmailStateErrror value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailStateInitial value)? initial,
    TResult Function(EmailStateLoading value)? loading,
    TResult Function(EmailStateEmpty value)? empty,
    TResult Function(EmailStateData value)? data,
    TResult Function(EmailStateErrror value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class EmailStateData implements EmailState {
  const factory EmailStateData() = _$EmailStateDataImpl;
}

/// @nodoc
abstract class _$$EmailStateErrrorImplCopyWith<$Res> {
  factory _$$EmailStateErrrorImplCopyWith(_$EmailStateErrrorImpl value,
          $Res Function(_$EmailStateErrrorImpl) then) =
      __$$EmailStateErrrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailStateErrrorImplCopyWithImpl<$Res>
    extends _$EmailStateCopyWithImpl<$Res, _$EmailStateErrrorImpl>
    implements _$$EmailStateErrrorImplCopyWith<$Res> {
  __$$EmailStateErrrorImplCopyWithImpl(_$EmailStateErrrorImpl _value,
      $Res Function(_$EmailStateErrrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmailStateErrrorImpl implements EmailStateErrror {
  const _$EmailStateErrrorImpl();

  @override
  String toString() {
    return 'EmailState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailStateErrrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function() data,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function()? data,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function()? data,
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
    required TResult Function(EmailStateInitial value) initial,
    required TResult Function(EmailStateLoading value) loading,
    required TResult Function(EmailStateEmpty value) empty,
    required TResult Function(EmailStateData value) data,
    required TResult Function(EmailStateErrror value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailStateInitial value)? initial,
    TResult? Function(EmailStateLoading value)? loading,
    TResult? Function(EmailStateEmpty value)? empty,
    TResult? Function(EmailStateData value)? data,
    TResult? Function(EmailStateErrror value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailStateInitial value)? initial,
    TResult Function(EmailStateLoading value)? loading,
    TResult Function(EmailStateEmpty value)? empty,
    TResult Function(EmailStateData value)? data,
    TResult Function(EmailStateErrror value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class EmailStateErrror implements EmailState {
  const factory EmailStateErrror() = _$EmailStateErrrorImpl;
}
