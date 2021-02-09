// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transactionpin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TransactionpinLoadedTearOff {
  const _$TransactionpinLoadedTearOff();

// ignore: unused_element
  _TransactionpinLoaded call({String pin, String verificationToken}) {
    return _TransactionpinLoaded(
      pin: pin,
      verificationToken: verificationToken,
    );
  }
}

// ignore: unused_element
const $TransactionpinLoaded = _$TransactionpinLoadedTearOff();

mixin _$TransactionpinLoaded {
  String get pin;
  String get verificationToken;

  $TransactionpinLoadedCopyWith<TransactionpinLoaded> get copyWith;
}

abstract class $TransactionpinLoadedCopyWith<$Res> {
  factory $TransactionpinLoadedCopyWith(TransactionpinLoaded value,
          $Res Function(TransactionpinLoaded) then) =
      _$TransactionpinLoadedCopyWithImpl<$Res>;
  $Res call({String pin, String verificationToken});
}

class _$TransactionpinLoadedCopyWithImpl<$Res>
    implements $TransactionpinLoadedCopyWith<$Res> {
  _$TransactionpinLoadedCopyWithImpl(this._value, this._then);

  final TransactionpinLoaded _value;
  // ignore: unused_field
  final $Res Function(TransactionpinLoaded) _then;

  @override
  $Res call({
    Object pin = freezed,
    Object verificationToken = freezed,
  }) {
    return _then(_value.copyWith(
      pin: pin == freezed ? _value.pin : pin as String,
      verificationToken: verificationToken == freezed
          ? _value.verificationToken
          : verificationToken as String,
    ));
  }
}

abstract class _$TransactionpinLoadedCopyWith<$Res>
    implements $TransactionpinLoadedCopyWith<$Res> {
  factory _$TransactionpinLoadedCopyWith(_TransactionpinLoaded value,
          $Res Function(_TransactionpinLoaded) then) =
      __$TransactionpinLoadedCopyWithImpl<$Res>;
  @override
  $Res call({String pin, String verificationToken});
}

class __$TransactionpinLoadedCopyWithImpl<$Res>
    extends _$TransactionpinLoadedCopyWithImpl<$Res>
    implements _$TransactionpinLoadedCopyWith<$Res> {
  __$TransactionpinLoadedCopyWithImpl(
      _TransactionpinLoaded _value, $Res Function(_TransactionpinLoaded) _then)
      : super(_value, (v) => _then(v as _TransactionpinLoaded));

  @override
  _TransactionpinLoaded get _value => super._value as _TransactionpinLoaded;

  @override
  $Res call({
    Object pin = freezed,
    Object verificationToken = freezed,
  }) {
    return _then(_TransactionpinLoaded(
      pin: pin == freezed ? _value.pin : pin as String,
      verificationToken: verificationToken == freezed
          ? _value.verificationToken
          : verificationToken as String,
    ));
  }
}

class _$_TransactionpinLoaded
    with DiagnosticableTreeMixin
    implements _TransactionpinLoaded {
  _$_TransactionpinLoaded({this.pin, this.verificationToken});

  @override
  final String pin;
  @override
  final String verificationToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransactionpinLoaded(pin: $pin, verificationToken: $verificationToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransactionpinLoaded'))
      ..add(DiagnosticsProperty('pin', pin))
      ..add(DiagnosticsProperty('verificationToken', verificationToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionpinLoaded &&
            (identical(other.pin, pin) ||
                const DeepCollectionEquality().equals(other.pin, pin)) &&
            (identical(other.verificationToken, verificationToken) ||
                const DeepCollectionEquality()
                    .equals(other.verificationToken, verificationToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pin) ^
      const DeepCollectionEquality().hash(verificationToken);

  @override
  _$TransactionpinLoadedCopyWith<_TransactionpinLoaded> get copyWith =>
      __$TransactionpinLoadedCopyWithImpl<_TransactionpinLoaded>(
          this, _$identity);
}

abstract class _TransactionpinLoaded implements TransactionpinLoaded {
  factory _TransactionpinLoaded({String pin, String verificationToken}) =
      _$_TransactionpinLoaded;

  @override
  String get pin;
  @override
  String get verificationToken;
  @override
  _$TransactionpinLoadedCopyWith<_TransactionpinLoaded> get copyWith;
}
