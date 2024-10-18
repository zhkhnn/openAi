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
  Message? get message => throw _privateConstructorUsedError;

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
  $Res call({Message? message});
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
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
    ) as $Val);
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
  $Res call({Message? message});
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
    Object? message = freezed,
  }) {
    return _then(_$OpenAiStateImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }
}

/// @nodoc

class _$OpenAiStateImpl implements _OpenAiState {
  const _$OpenAiStateImpl({this.message = null});

  @override
  @JsonKey()
  final Message? message;

  @override
  String toString() {
    return 'OpenAiState(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAiStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAiStateImplCopyWith<_$OpenAiStateImpl> get copyWith =>
      __$$OpenAiStateImplCopyWithImpl<_$OpenAiStateImpl>(this, _$identity);
}

abstract class _OpenAiState implements OpenAiState {
  const factory _OpenAiState({final Message? message}) = _$OpenAiStateImpl;

  @override
  Message? get message;

  /// Create a copy of OpenAiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenAiStateImplCopyWith<_$OpenAiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
