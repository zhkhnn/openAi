// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_ai_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OpenAiState {
  OpenAiStatus get mainStatus => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;
  Message? get request => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  Message? get response => throw _privateConstructorUsedError;

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpenAiStateCopyWith<OpenAiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAiStateCopyWith<$Res> {
  factory $OpenAiStateCopyWith(
          OpenAiState value, $Res Function(OpenAiState) then) =
      _$OpenAiStateCopyWithImpl<$Res, OpenAiState>;
  @useResult
  $Res call(
      {OpenAiStatus mainStatus,
      List<Message> messages,
      Message? request,
      String? errorMessage,
      Message? response});

  $OpenAiStatusCopyWith<$Res> get mainStatus;
}

/// @nodoc
class _$OpenAiStateCopyWithImpl<$Res, $Val extends OpenAiState>
    implements $OpenAiStateCopyWith<$Res> {
  _$OpenAiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainStatus = null,
    Object? messages = null,
    Object? request = freezed,
    Object? errorMessage = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      mainStatus: null == mainStatus
          ? _value.mainStatus
          : mainStatus // ignore: cast_nullable_to_non_nullable
              as OpenAiStatus,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as Message?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Message?,
    ) as $Val);
  }

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OpenAiStatusCopyWith<$Res> get mainStatus {
    return $OpenAiStatusCopyWith<$Res>(_value.mainStatus, (value) {
      return _then(_value.copyWith(mainStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpenAiStateImplCopyWith<$Res>
    implements $OpenAiStateCopyWith<$Res> {
  factory _$$OpenAiStateImplCopyWith(
          _$OpenAiStateImpl value, $Res Function(_$OpenAiStateImpl) then) =
      __$$OpenAiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OpenAiStatus mainStatus,
      List<Message> messages,
      Message? request,
      String? errorMessage,
      Message? response});

  @override
  $OpenAiStatusCopyWith<$Res> get mainStatus;
}

/// @nodoc
class __$$OpenAiStateImplCopyWithImpl<$Res>
    extends _$OpenAiStateCopyWithImpl<$Res, _$OpenAiStateImpl>
    implements _$$OpenAiStateImplCopyWith<$Res> {
  __$$OpenAiStateImplCopyWithImpl(
      _$OpenAiStateImpl _value, $Res Function(_$OpenAiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainStatus = null,
    Object? messages = null,
    Object? request = freezed,
    Object? errorMessage = freezed,
    Object? response = freezed,
  }) {
    return _then(_$OpenAiStateImpl(
      mainStatus: null == mainStatus
          ? _value.mainStatus
          : mainStatus // ignore: cast_nullable_to_non_nullable
              as OpenAiStatus,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      request: freezed == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as Message?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }
}

/// @nodoc

class _$OpenAiStateImpl implements _OpenAiState {
  const _$OpenAiStateImpl(
      {this.mainStatus = const OpenAiInitial(),
      final List<Message> messages = const [],
      this.request,
      this.errorMessage,
      this.response = null})
      : _messages = messages;

  @override
  @JsonKey()
  final OpenAiStatus mainStatus;
  final List<Message> _messages;
  @override
  @JsonKey()
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final Message? request;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final Message? response;

  @override
  String toString() {
    return 'OpenAiState(mainStatus: $mainStatus, messages: $messages, request: $request, errorMessage: $errorMessage, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAiStateImpl &&
            (identical(other.mainStatus, mainStatus) ||
                other.mainStatus == mainStatus) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mainStatus,
      const DeepCollectionEquality().hash(_messages),
      request,
      errorMessage,
      response);

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAiStateImplCopyWith<_$OpenAiStateImpl> get copyWith =>
      __$$OpenAiStateImplCopyWithImpl<_$OpenAiStateImpl>(this, _$identity);
}

abstract class _OpenAiState implements OpenAiState {
  const factory _OpenAiState(
      {final OpenAiStatus mainStatus,
      final List<Message> messages,
      final Message? request,
      final String? errorMessage,
      final Message? response}) = _$OpenAiStateImpl;

  @override
  OpenAiStatus get mainStatus;
  @override
  List<Message> get messages;
  @override
  Message? get request;
  @override
  String? get errorMessage;
  @override
  Message? get response;

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAiStateImplCopyWith<_$OpenAiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OpenAiStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function() failure,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function()? failure,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function()? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OpenAiInitial value) initial,
    required TResult Function(OpenAiSuccess value) success,
    required TResult Function(OpenAiFailure value) failure,
    required TResult Function(OpenAiLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OpenAiInitial value)? initial,
    TResult? Function(OpenAiSuccess value)? success,
    TResult? Function(OpenAiFailure value)? failure,
    TResult? Function(OpenAiLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpenAiInitial value)? initial,
    TResult Function(OpenAiSuccess value)? success,
    TResult Function(OpenAiFailure value)? failure,
    TResult Function(OpenAiLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAiStatusCopyWith<$Res> {
  factory $OpenAiStatusCopyWith(
          OpenAiStatus value, $Res Function(OpenAiStatus) then) =
      _$OpenAiStatusCopyWithImpl<$Res, OpenAiStatus>;
}

/// @nodoc
class _$OpenAiStatusCopyWithImpl<$Res, $Val extends OpenAiStatus>
    implements $OpenAiStatusCopyWith<$Res> {
  _$OpenAiStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpenAiStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OpenAiInitialImplCopyWith<$Res> {
  factory _$$OpenAiInitialImplCopyWith(
          _$OpenAiInitialImpl value, $Res Function(_$OpenAiInitialImpl) then) =
      __$$OpenAiInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenAiInitialImplCopyWithImpl<$Res>
    extends _$OpenAiStatusCopyWithImpl<$Res, _$OpenAiInitialImpl>
    implements _$$OpenAiInitialImplCopyWith<$Res> {
  __$$OpenAiInitialImplCopyWithImpl(
      _$OpenAiInitialImpl _value, $Res Function(_$OpenAiInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenAiStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OpenAiInitialImpl implements OpenAiInitial {
  const _$OpenAiInitialImpl();

  @override
  String toString() {
    return 'OpenAiStatus.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenAiInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function() failure,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function()? failure,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function()? failure,
    TResult Function()? loading,
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
    required TResult Function(OpenAiInitial value) initial,
    required TResult Function(OpenAiSuccess value) success,
    required TResult Function(OpenAiFailure value) failure,
    required TResult Function(OpenAiLoading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OpenAiInitial value)? initial,
    TResult? Function(OpenAiSuccess value)? success,
    TResult? Function(OpenAiFailure value)? failure,
    TResult? Function(OpenAiLoading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpenAiInitial value)? initial,
    TResult Function(OpenAiSuccess value)? success,
    TResult Function(OpenAiFailure value)? failure,
    TResult Function(OpenAiLoading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class OpenAiInitial implements OpenAiStatus {
  const factory OpenAiInitial() = _$OpenAiInitialImpl;
}

/// @nodoc
abstract class _$$OpenAiSuccessImplCopyWith<$Res> {
  factory _$$OpenAiSuccessImplCopyWith(
          _$OpenAiSuccessImpl value, $Res Function(_$OpenAiSuccessImpl) then) =
      __$$OpenAiSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenAiSuccessImplCopyWithImpl<$Res>
    extends _$OpenAiStatusCopyWithImpl<$Res, _$OpenAiSuccessImpl>
    implements _$$OpenAiSuccessImplCopyWith<$Res> {
  __$$OpenAiSuccessImplCopyWithImpl(
      _$OpenAiSuccessImpl _value, $Res Function(_$OpenAiSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenAiStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OpenAiSuccessImpl implements OpenAiSuccess {
  const _$OpenAiSuccessImpl();

  @override
  String toString() {
    return 'OpenAiStatus.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenAiSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function() failure,
    required TResult Function() loading,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function()? failure,
    TResult? Function()? loading,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function()? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OpenAiInitial value) initial,
    required TResult Function(OpenAiSuccess value) success,
    required TResult Function(OpenAiFailure value) failure,
    required TResult Function(OpenAiLoading value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OpenAiInitial value)? initial,
    TResult? Function(OpenAiSuccess value)? success,
    TResult? Function(OpenAiFailure value)? failure,
    TResult? Function(OpenAiLoading value)? loading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpenAiInitial value)? initial,
    TResult Function(OpenAiSuccess value)? success,
    TResult Function(OpenAiFailure value)? failure,
    TResult Function(OpenAiLoading value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class OpenAiSuccess implements OpenAiStatus {
  const factory OpenAiSuccess() = _$OpenAiSuccessImpl;
}

/// @nodoc
abstract class _$$OpenAiFailureImplCopyWith<$Res> {
  factory _$$OpenAiFailureImplCopyWith(
          _$OpenAiFailureImpl value, $Res Function(_$OpenAiFailureImpl) then) =
      __$$OpenAiFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenAiFailureImplCopyWithImpl<$Res>
    extends _$OpenAiStatusCopyWithImpl<$Res, _$OpenAiFailureImpl>
    implements _$$OpenAiFailureImplCopyWith<$Res> {
  __$$OpenAiFailureImplCopyWithImpl(
      _$OpenAiFailureImpl _value, $Res Function(_$OpenAiFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenAiStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OpenAiFailureImpl implements OpenAiFailure {
  const _$OpenAiFailureImpl();

  @override
  String toString() {
    return 'OpenAiStatus.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenAiFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function() failure,
    required TResult Function() loading,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function()? failure,
    TResult? Function()? loading,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function()? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OpenAiInitial value) initial,
    required TResult Function(OpenAiSuccess value) success,
    required TResult Function(OpenAiFailure value) failure,
    required TResult Function(OpenAiLoading value) loading,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OpenAiInitial value)? initial,
    TResult? Function(OpenAiSuccess value)? success,
    TResult? Function(OpenAiFailure value)? failure,
    TResult? Function(OpenAiLoading value)? loading,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpenAiInitial value)? initial,
    TResult Function(OpenAiSuccess value)? success,
    TResult Function(OpenAiFailure value)? failure,
    TResult Function(OpenAiLoading value)? loading,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class OpenAiFailure implements OpenAiStatus {
  const factory OpenAiFailure() = _$OpenAiFailureImpl;
}

/// @nodoc
abstract class _$$OpenAiLoadingImplCopyWith<$Res> {
  factory _$$OpenAiLoadingImplCopyWith(
          _$OpenAiLoadingImpl value, $Res Function(_$OpenAiLoadingImpl) then) =
      __$$OpenAiLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenAiLoadingImplCopyWithImpl<$Res>
    extends _$OpenAiStatusCopyWithImpl<$Res, _$OpenAiLoadingImpl>
    implements _$$OpenAiLoadingImplCopyWith<$Res> {
  __$$OpenAiLoadingImplCopyWithImpl(
      _$OpenAiLoadingImpl _value, $Res Function(_$OpenAiLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OpenAiStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OpenAiLoadingImpl implements OpenAiLoading {
  const _$OpenAiLoadingImpl();

  @override
  String toString() {
    return 'OpenAiStatus.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenAiLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() success,
    required TResult Function() failure,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? success,
    TResult? Function()? failure,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? success,
    TResult Function()? failure,
    TResult Function()? loading,
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
    required TResult Function(OpenAiInitial value) initial,
    required TResult Function(OpenAiSuccess value) success,
    required TResult Function(OpenAiFailure value) failure,
    required TResult Function(OpenAiLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OpenAiInitial value)? initial,
    TResult? Function(OpenAiSuccess value)? success,
    TResult? Function(OpenAiFailure value)? failure,
    TResult? Function(OpenAiLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpenAiInitial value)? initial,
    TResult Function(OpenAiSuccess value)? success,
    TResult Function(OpenAiFailure value)? failure,
    TResult Function(OpenAiLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OpenAiLoading implements OpenAiStatus {
  const factory OpenAiLoading() = _$OpenAiLoadingImpl;
}
