// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'signin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$InputDataSigninStateTearOff {
  const _$InputDataSigninStateTearOff();

// ignore: unused_element
  _InputDataSigninState call(
      {String azatag = '',
      String password = '',
      BasicResponse<String> basicResponse =
          const BasicResponse<String>(status: 100, message: '')}) {
    return _InputDataSigninState(
      azatag: azatag,
      password: password,
      basicResponse: basicResponse,
    );
  }
}

// ignore: unused_element
const $InputDataSigninState = _$InputDataSigninStateTearOff();

mixin _$InputDataSigninState {
  String get azatag;
  String get password;
  BasicResponse<String> get basicResponse;

  $InputDataSigninStateCopyWith<InputDataSigninState> get copyWith;
}

abstract class $InputDataSigninStateCopyWith<$Res> {
  factory $InputDataSigninStateCopyWith(InputDataSigninState value,
          $Res Function(InputDataSigninState) then) =
      _$InputDataSigninStateCopyWithImpl<$Res>;
  $Res call(
      {String azatag, String password, BasicResponse<String> basicResponse});
}

class _$InputDataSigninStateCopyWithImpl<$Res>
    implements $InputDataSigninStateCopyWith<$Res> {
  _$InputDataSigninStateCopyWithImpl(this._value, this._then);

  final InputDataSigninState _value;
  // ignore: unused_field
  final $Res Function(InputDataSigninState) _then;

  @override
  $Res call({
    Object azatag = freezed,
    Object password = freezed,
    Object basicResponse = freezed,
  }) {
    return _then(_value.copyWith(
      azatag: azatag == freezed ? _value.azatag : azatag as String,
      password: password == freezed ? _value.password : password as String,
      basicResponse: basicResponse == freezed
          ? _value.basicResponse
          : basicResponse as BasicResponse<String>,
    ));
  }
}

abstract class _$InputDataSigninStateCopyWith<$Res>
    implements $InputDataSigninStateCopyWith<$Res> {
  factory _$InputDataSigninStateCopyWith(_InputDataSigninState value,
          $Res Function(_InputDataSigninState) then) =
      __$InputDataSigninStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String azatag, String password, BasicResponse<String> basicResponse});
}

class __$InputDataSigninStateCopyWithImpl<$Res>
    extends _$InputDataSigninStateCopyWithImpl<$Res>
    implements _$InputDataSigninStateCopyWith<$Res> {
  __$InputDataSigninStateCopyWithImpl(
      _InputDataSigninState _value, $Res Function(_InputDataSigninState) _then)
      : super(_value, (v) => _then(v as _InputDataSigninState));

  @override
  _InputDataSigninState get _value => super._value as _InputDataSigninState;

  @override
  $Res call({
    Object azatag = freezed,
    Object password = freezed,
    Object basicResponse = freezed,
  }) {
    return _then(_InputDataSigninState(
      azatag: azatag == freezed ? _value.azatag : azatag as String,
      password: password == freezed ? _value.password : password as String,
      basicResponse: basicResponse == freezed
          ? _value.basicResponse
          : basicResponse as BasicResponse<String>,
    ));
  }
}

class _$_InputDataSigninState
    with DiagnosticableTreeMixin
    implements _InputDataSigninState {
  _$_InputDataSigninState(
      {this.azatag = '',
      this.password = '',
      this.basicResponse =
          const BasicResponse<String>(status: 100, message: '')})
      : assert(azatag != null),
        assert(password != null),
        assert(basicResponse != null);

  @JsonKey(defaultValue: '')
  @override
  final String azatag;
  @JsonKey(defaultValue: '')
  @override
  final String password;
  @JsonKey(defaultValue: const BasicResponse<String>(status: 100, message: ''))
  @override
  final BasicResponse<String> basicResponse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InputDataSigninState(azatag: $azatag, password: $password, basicResponse: $basicResponse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InputDataSigninState'))
      ..add(DiagnosticsProperty('azatag', azatag))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('basicResponse', basicResponse));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InputDataSigninState &&
            (identical(other.azatag, azatag) ||
                const DeepCollectionEquality().equals(other.azatag, azatag)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.basicResponse, basicResponse) ||
                const DeepCollectionEquality()
                    .equals(other.basicResponse, basicResponse)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(azatag) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(basicResponse);

  @override
  _$InputDataSigninStateCopyWith<_InputDataSigninState> get copyWith =>
      __$InputDataSigninStateCopyWithImpl<_InputDataSigninState>(
          this, _$identity);
}

abstract class _InputDataSigninState implements InputDataSigninState {
  factory _InputDataSigninState(
      {String azatag,
      String password,
      BasicResponse<String> basicResponse}) = _$_InputDataSigninState;

  @override
  String get azatag;
  @override
  String get password;
  @override
  BasicResponse<String> get basicResponse;
  @override
  _$InputDataSigninStateCopyWith<_InputDataSigninState> get copyWith;
}
