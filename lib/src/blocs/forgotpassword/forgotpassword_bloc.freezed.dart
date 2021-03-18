// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'forgotpassword_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$InputDataForgotpasswordStateTearOff {
  const _$InputDataForgotpasswordStateTearOff();

// ignore: unused_element
  _InputDataForgotpasswordState call(
      {String azatag = '',
      AcquireResetToken acquireResetToken =
          const AcquireResetToken(status: 100),
      String message = ''}) {
    return _InputDataForgotpasswordState(
      azatag: azatag,
      acquireResetToken: acquireResetToken,
      message: message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $InputDataForgotpasswordState = _$InputDataForgotpasswordStateTearOff();

/// @nodoc
mixin _$InputDataForgotpasswordState {
  String get azatag;
  AcquireResetToken get acquireResetToken;
  String get message;

  @JsonKey(ignore: true)
  $InputDataForgotpasswordStateCopyWith<InputDataForgotpasswordState>
      get copyWith;
}

/// @nodoc
abstract class $InputDataForgotpasswordStateCopyWith<$Res> {
  factory $InputDataForgotpasswordStateCopyWith(
          InputDataForgotpasswordState value,
          $Res Function(InputDataForgotpasswordState) then) =
      _$InputDataForgotpasswordStateCopyWithImpl<$Res>;
  $Res call(
      {String azatag, AcquireResetToken acquireResetToken, String message});
}

/// @nodoc
class _$InputDataForgotpasswordStateCopyWithImpl<$Res>
    implements $InputDataForgotpasswordStateCopyWith<$Res> {
  _$InputDataForgotpasswordStateCopyWithImpl(this._value, this._then);

  final InputDataForgotpasswordState _value;
  // ignore: unused_field
  final $Res Function(InputDataForgotpasswordState) _then;

  @override
  $Res call({
    Object azatag = freezed,
    Object acquireResetToken = freezed,
    Object message = freezed,
  }) {
    return _then(_value.copyWith(
      azatag: azatag == freezed ? _value.azatag : azatag as String,
      acquireResetToken: acquireResetToken == freezed
          ? _value.acquireResetToken
          : acquireResetToken as AcquireResetToken,
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
abstract class _$InputDataForgotpasswordStateCopyWith<$Res>
    implements $InputDataForgotpasswordStateCopyWith<$Res> {
  factory _$InputDataForgotpasswordStateCopyWith(
          _InputDataForgotpasswordState value,
          $Res Function(_InputDataForgotpasswordState) then) =
      __$InputDataForgotpasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String azatag, AcquireResetToken acquireResetToken, String message});
}

/// @nodoc
class __$InputDataForgotpasswordStateCopyWithImpl<$Res>
    extends _$InputDataForgotpasswordStateCopyWithImpl<$Res>
    implements _$InputDataForgotpasswordStateCopyWith<$Res> {
  __$InputDataForgotpasswordStateCopyWithImpl(
      _InputDataForgotpasswordState _value,
      $Res Function(_InputDataForgotpasswordState) _then)
      : super(_value, (v) => _then(v as _InputDataForgotpasswordState));

  @override
  _InputDataForgotpasswordState get _value =>
      super._value as _InputDataForgotpasswordState;

  @override
  $Res call({
    Object azatag = freezed,
    Object acquireResetToken = freezed,
    Object message = freezed,
  }) {
    return _then(_InputDataForgotpasswordState(
      azatag: azatag == freezed ? _value.azatag : azatag as String,
      acquireResetToken: acquireResetToken == freezed
          ? _value.acquireResetToken
          : acquireResetToken as AcquireResetToken,
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$_InputDataForgotpasswordState
    with DiagnosticableTreeMixin
    implements _InputDataForgotpasswordState {
  _$_InputDataForgotpasswordState(
      {this.azatag = '',
      this.acquireResetToken = const AcquireResetToken(status: 100),
      this.message = ''})
      : assert(azatag != null),
        assert(acquireResetToken != null),
        assert(message != null);

  @JsonKey(defaultValue: '')
  @override
  final String azatag;
  @JsonKey(defaultValue: const AcquireResetToken(status: 100))
  @override
  final AcquireResetToken acquireResetToken;
  @JsonKey(defaultValue: '')
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InputDataForgotpasswordState(azatag: $azatag, acquireResetToken: $acquireResetToken, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InputDataForgotpasswordState'))
      ..add(DiagnosticsProperty('azatag', azatag))
      ..add(DiagnosticsProperty('acquireResetToken', acquireResetToken))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InputDataForgotpasswordState &&
            (identical(other.azatag, azatag) ||
                const DeepCollectionEquality().equals(other.azatag, azatag)) &&
            (identical(other.acquireResetToken, acquireResetToken) ||
                const DeepCollectionEquality()
                    .equals(other.acquireResetToken, acquireResetToken)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(azatag) ^
      const DeepCollectionEquality().hash(acquireResetToken) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$InputDataForgotpasswordStateCopyWith<_InputDataForgotpasswordState>
      get copyWith => __$InputDataForgotpasswordStateCopyWithImpl<
          _InputDataForgotpasswordState>(this, _$identity);
}

abstract class _InputDataForgotpasswordState
    implements InputDataForgotpasswordState {
  factory _InputDataForgotpasswordState(
      {String azatag,
      AcquireResetToken acquireResetToken,
      String message}) = _$_InputDataForgotpasswordState;

  @override
  String get azatag;
  @override
  AcquireResetToken get acquireResetToken;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$InputDataForgotpasswordStateCopyWith<_InputDataForgotpasswordState>
      get copyWith;
}
