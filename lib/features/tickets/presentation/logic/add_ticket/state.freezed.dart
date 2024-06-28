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
mixin _$AddTicketState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddTicketStateInitial value) initial,
    required TResult Function(AddTicketStateError value) error,
    required TResult Function(AddTicketStateLoading value) loading,
    required TResult Function(AddTicketStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddTicketStateInitial value)? initial,
    TResult? Function(AddTicketStateError value)? error,
    TResult? Function(AddTicketStateLoading value)? loading,
    TResult? Function(AddTicketStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddTicketStateInitial value)? initial,
    TResult Function(AddTicketStateError value)? error,
    TResult Function(AddTicketStateLoading value)? loading,
    TResult Function(AddTicketStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTicketStateCopyWith<$Res> {
  factory $AddTicketStateCopyWith(
          AddTicketState value, $Res Function(AddTicketState) then) =
      _$AddTicketStateCopyWithImpl<$Res, AddTicketState>;
}

/// @nodoc
class _$AddTicketStateCopyWithImpl<$Res, $Val extends AddTicketState>
    implements $AddTicketStateCopyWith<$Res> {
  _$AddTicketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddTicketStateInitialImplCopyWith<$Res> {
  factory _$$AddTicketStateInitialImplCopyWith(
          _$AddTicketStateInitialImpl value,
          $Res Function(_$AddTicketStateInitialImpl) then) =
      __$$AddTicketStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddTicketStateInitialImplCopyWithImpl<$Res>
    extends _$AddTicketStateCopyWithImpl<$Res, _$AddTicketStateInitialImpl>
    implements _$$AddTicketStateInitialImplCopyWith<$Res> {
  __$$AddTicketStateInitialImplCopyWithImpl(_$AddTicketStateInitialImpl _value,
      $Res Function(_$AddTicketStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddTicketStateInitialImpl implements AddTicketStateInitial {
  const _$AddTicketStateInitialImpl();

  @override
  String toString() {
    return 'AddTicketState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTicketStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() data,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? data,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? data,
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
    required TResult Function(AddTicketStateInitial value) initial,
    required TResult Function(AddTicketStateError value) error,
    required TResult Function(AddTicketStateLoading value) loading,
    required TResult Function(AddTicketStateData value) data,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddTicketStateInitial value)? initial,
    TResult? Function(AddTicketStateError value)? error,
    TResult? Function(AddTicketStateLoading value)? loading,
    TResult? Function(AddTicketStateData value)? data,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddTicketStateInitial value)? initial,
    TResult Function(AddTicketStateError value)? error,
    TResult Function(AddTicketStateLoading value)? loading,
    TResult Function(AddTicketStateData value)? data,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AddTicketStateInitial implements AddTicketState {
  const factory AddTicketStateInitial() = _$AddTicketStateInitialImpl;
}

/// @nodoc
abstract class _$$AddTicketStateErrorImplCopyWith<$Res> {
  factory _$$AddTicketStateErrorImplCopyWith(_$AddTicketStateErrorImpl value,
          $Res Function(_$AddTicketStateErrorImpl) then) =
      __$$AddTicketStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddTicketStateErrorImplCopyWithImpl<$Res>
    extends _$AddTicketStateCopyWithImpl<$Res, _$AddTicketStateErrorImpl>
    implements _$$AddTicketStateErrorImplCopyWith<$Res> {
  __$$AddTicketStateErrorImplCopyWithImpl(_$AddTicketStateErrorImpl _value,
      $Res Function(_$AddTicketStateErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddTicketStateErrorImpl implements AddTicketStateError {
  const _$AddTicketStateErrorImpl();

  @override
  String toString() {
    return 'AddTicketState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTicketStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() data,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? data,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? data,
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
    required TResult Function(AddTicketStateInitial value) initial,
    required TResult Function(AddTicketStateError value) error,
    required TResult Function(AddTicketStateLoading value) loading,
    required TResult Function(AddTicketStateData value) data,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddTicketStateInitial value)? initial,
    TResult? Function(AddTicketStateError value)? error,
    TResult? Function(AddTicketStateLoading value)? loading,
    TResult? Function(AddTicketStateData value)? data,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddTicketStateInitial value)? initial,
    TResult Function(AddTicketStateError value)? error,
    TResult Function(AddTicketStateLoading value)? loading,
    TResult Function(AddTicketStateData value)? data,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AddTicketStateError implements AddTicketState {
  const factory AddTicketStateError() = _$AddTicketStateErrorImpl;
}

/// @nodoc
abstract class _$$AddTicketStateLoadingImplCopyWith<$Res> {
  factory _$$AddTicketStateLoadingImplCopyWith(
          _$AddTicketStateLoadingImpl value,
          $Res Function(_$AddTicketStateLoadingImpl) then) =
      __$$AddTicketStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddTicketStateLoadingImplCopyWithImpl<$Res>
    extends _$AddTicketStateCopyWithImpl<$Res, _$AddTicketStateLoadingImpl>
    implements _$$AddTicketStateLoadingImplCopyWith<$Res> {
  __$$AddTicketStateLoadingImplCopyWithImpl(_$AddTicketStateLoadingImpl _value,
      $Res Function(_$AddTicketStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddTicketStateLoadingImpl implements AddTicketStateLoading {
  const _$AddTicketStateLoadingImpl();

  @override
  String toString() {
    return 'AddTicketState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTicketStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() data,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? data,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? data,
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
    required TResult Function(AddTicketStateInitial value) initial,
    required TResult Function(AddTicketStateError value) error,
    required TResult Function(AddTicketStateLoading value) loading,
    required TResult Function(AddTicketStateData value) data,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddTicketStateInitial value)? initial,
    TResult? Function(AddTicketStateError value)? error,
    TResult? Function(AddTicketStateLoading value)? loading,
    TResult? Function(AddTicketStateData value)? data,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddTicketStateInitial value)? initial,
    TResult Function(AddTicketStateError value)? error,
    TResult Function(AddTicketStateLoading value)? loading,
    TResult Function(AddTicketStateData value)? data,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AddTicketStateLoading implements AddTicketState {
  const factory AddTicketStateLoading() = _$AddTicketStateLoadingImpl;
}

/// @nodoc
abstract class _$$AddTicketStateDataImplCopyWith<$Res> {
  factory _$$AddTicketStateDataImplCopyWith(_$AddTicketStateDataImpl value,
          $Res Function(_$AddTicketStateDataImpl) then) =
      __$$AddTicketStateDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddTicketStateDataImplCopyWithImpl<$Res>
    extends _$AddTicketStateCopyWithImpl<$Res, _$AddTicketStateDataImpl>
    implements _$$AddTicketStateDataImplCopyWith<$Res> {
  __$$AddTicketStateDataImplCopyWithImpl(_$AddTicketStateDataImpl _value,
      $Res Function(_$AddTicketStateDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddTicketStateDataImpl implements AddTicketStateData {
  const _$AddTicketStateDataImpl();

  @override
  String toString() {
    return 'AddTicketState.data()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddTicketStateDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() error,
    required TResult Function() loading,
    required TResult Function() data,
  }) {
    return data();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? error,
    TResult? Function()? loading,
    TResult? Function()? data,
  }) {
    return data?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? error,
    TResult Function()? loading,
    TResult Function()? data,
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
    required TResult Function(AddTicketStateInitial value) initial,
    required TResult Function(AddTicketStateError value) error,
    required TResult Function(AddTicketStateLoading value) loading,
    required TResult Function(AddTicketStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddTicketStateInitial value)? initial,
    TResult? Function(AddTicketStateError value)? error,
    TResult? Function(AddTicketStateLoading value)? loading,
    TResult? Function(AddTicketStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddTicketStateInitial value)? initial,
    TResult Function(AddTicketStateError value)? error,
    TResult Function(AddTicketStateLoading value)? loading,
    TResult Function(AddTicketStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class AddTicketStateData implements AddTicketState {
  const factory AddTicketStateData() = _$AddTicketStateDataImpl;
}
