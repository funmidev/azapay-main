// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'modifypassword_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$InputDataModifypasswordStateTearOff {
  const _$InputDataModifypasswordStateTearOff();

// ignore: unused_element
  _InputDataModifypasswordState call(
      {String password = '',
      String verificationToken = '',
      bool isPasswordValid = false,
      String message = '',
      bool isTokenValid = false}) {
    return _InputDataModifypasswordState(
      password: password,
      verificationToken: verificationToken,
      isPasswordValid: isPasswordValid,
      message: message,
      isTokenValid: isTokenValid,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $InputDataModifypasswordState = _$InputDataModifypasswordStateTearOff();

/// @nodoc
mixin _$InputDataModifypasswordState {
  String get password;
  String get verificationToken;
  bool get isPasswordValid;
  String get message;
  bool get isTokenValid;

  @JsonKey(ignore: true)
  $InputDataModifypasswordStateCopyWith<InputDataModifypasswordState>
      get copyWith;
}

/// @nodoc
abstract class $InputDataModifypasswordStateCopyWith<$Res> {
  factory $InputDataModifypasswordStateCopyWith(
          InputDataModifypasswordState value,
          $Res Function(InputDataModifypasswordState) then) =
      _$InputDataModifypasswordStateCopyWithImpl<$Res>;
  $Res call(
      {String password,
      String verificationToken,
      bool isPasswordValid,
      String message,
      bool isTokenValid});
}

/// @nodoc
class _$InputDataModifypasswordStateCopyWithImpl<$Res>
    implements $InputDataModifypasswordStateCopyWith<$Res> {
  _$InputDataModifypasswordStateCopyWithImpl(this._value, this._then);

  final InputDataModifypasswordState _value;
  // ignore: unused_field
  final $Res Function(InputDataModifypasswordState) _then;

  @override
  $Res call({
    Object password = freezed,
    Object verificationToken = freezed,
    Object isPasswordValid = freezed,
    Object message = freezed,
    Object isTokenValid = freezed,
  }) {
    return _then(_value.copyWith(
      password: password == freezed ? _value.password : password as String,
      verificationToken: verificationToken == freezed
          ? _value.verificationToken
          : verificationToken as String,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid as bool,
      message: message == freezed ? _value.message : message as String,
      isTokenValid:
          isTokenValid == freezed ? _value.isTokenValid : isTokenValid as bool,
    ));
  }
}

/// @nodoc
abstract class _$InputDataModifypasswordStateCopyWith<$Res>
    implements $InputDataModifypasswordStateCopyWith<$Res> {
  factory _$InputDataModifypasswordStateCopyWith(
          _InputDataModifypasswordState value,
          $Res Function(_InputDataModifypasswordState) then) =
      __$InputDataModifypasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String password,
      String verificationToken,
      bool isPasswordValid,
      String message,
      bool isTokenValid});
}

/// @nodoc
class __$InputDataModifypasswordStateCopyWithImpl<$Res>
    extends _$InputDataModifypasswordStateCopyWithImpl<$Res>
    implements _$InputDataModifypasswordStateCopyWith<$Res> {
  __$InputDataModifypasswordStateCopyWithImpl(
      _InputDataModifypasswordState _value,
      $Res Function(_InputDataModifypasswordState) _then)
      : super(_value, (v) => _then(v as _InputDataModifypasswordState));

  @override
  _InputDataModifypasswordState get _value =>
      super._value as _InputDataModifypasswordState;

  @override
  $Res call({
    Object password = freezed,
    Object verificationToken = freezed,
    Object isPasswordValid = freezed,
    Object message = freezed,
    Object isTokenValid = freezed,
  }) {
    return _then(_InputDataModifypasswordState(
      password: password == freezed ? _value.password : password as String,
      verificationToken: verificationToken == freezed
          ? _value.verificationToken
          : verificationToken as String,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid as bool,
      message: message == freezed ? _value.message : message as String,
      isTokenValid:
          isTokenValid == freezed ? _value.isTokenValid : isTokenValid as bool,
    ));
  }
}

/// @nodoc
class _$_InputDataModifypasswordState
    with DiagnosticableTreeMixin
    implements _InputDataModifypasswordState {
  _$_InputDataModifypasswordState(
      {this.password = '',
      this.verificationToken = '',
      this.isPasswordValid = false,
      this.message = '',
      this.isTokenValid = false})
      : assert(password != null),
        assert(verificationToken != null),
        assert(isPasswordValid != null),
        assert(message != null),
        assert(isTokenValid != null);

  @JsonKey(defaultValue: '')
  @override
  final String password;
  @JsonKey(defaultValue: '')
  @override
  final String verificationToken;
  @JsonKey(defaultValue: false)
  @override
  final bool isPasswordValid;
  @JsonKey(defaultValue: '')
  @override
  final String message;
  @JsonKey(defaultValue: false)
  @override
  final bool isTokenValid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InputDataModifypasswordState(password: $password, verificationToken: $verificationToken, isPasswordValid: $isPasswordValid, message: $message, isTokenValid: $isTokenValid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InputDataModifypasswordState'))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('verificationToken', verificationToken))
      ..add(DiagnosticsProperty('isPasswordValid', isPasswordValid))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('isTokenValid', isTokenValid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InputDataModifypasswordState &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.verificationToken, verificationToken) ||
                const DeepCollectionEquality()
                    .equals(other.verificationToken, verificationToken)) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                const DeepCollectionEquality()
                    .equals(other.isPasswordValid, isPasswordValid)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.isTokenValid, isTokenValid) ||
                const DeepCollectionEquality()
                    .equals(other.isTokenValid, isTokenValid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(verificationToken) ^
      const DeepCollectionEquality().hash(isPasswordValid) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(isTokenValid);

  @JsonKey(ignore: true)
  @override
  _$InputDataModifypasswordStateCopyWith<_InputDataModifypasswordState>
      get copyWith => __$InputDataModifypasswordStateCopyWithImpl<
          _InputDataModifypasswordState>(this, _$identity);
}

abstract class _InputDataModifypasswordState
    implements InputDataModifypasswordState {
  factory _InputDataModifypasswordState(
      {String password,
      String verificationToken,
      bool isPasswordValid,
      String message,
      bool isTokenValid}) = _$_InputDataModifypasswordState;

  @override
  String get password;
  @override
  String get verificationToken;
  @override
  bool get isPasswordValid;
  @override
  String get message;
  @override
  bool get isTokenValid;
  @override
  @JsonKey(ignore: true)
  _$InputDataModifypasswordStateCopyWith<_InputDataModifypasswordState>
      get copyWith;
}
