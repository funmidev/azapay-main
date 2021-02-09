// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'qrscan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$QrScanLoadedTearOff {
  const _$QrScanLoadedTearOff();

// ignore: unused_element
  _QrScanLoaded call(
      {String result,
      double amount,
      int screen,
      int success = 100,
      int error = 100,
      String responsemessage}) {
    return _QrScanLoaded(
      result: result,
      amount: amount,
      screen: screen,
      success: success,
      error: error,
      responsemessage: responsemessage,
    );
  }
}

// ignore: unused_element
const $QrScanLoaded = _$QrScanLoadedTearOff();

mixin _$QrScanLoaded {
  String get result;
  double get amount;
  int get screen;
  int get success;
  int get error;
  String get responsemessage;

  $QrScanLoadedCopyWith<QrScanLoaded> get copyWith;
}

abstract class $QrScanLoadedCopyWith<$Res> {
  factory $QrScanLoadedCopyWith(
          QrScanLoaded value, $Res Function(QrScanLoaded) then) =
      _$QrScanLoadedCopyWithImpl<$Res>;
  $Res call(
      {String result,
      double amount,
      int screen,
      int success,
      int error,
      String responsemessage});
}

class _$QrScanLoadedCopyWithImpl<$Res> implements $QrScanLoadedCopyWith<$Res> {
  _$QrScanLoadedCopyWithImpl(this._value, this._then);

  final QrScanLoaded _value;
  // ignore: unused_field
  final $Res Function(QrScanLoaded) _then;

  @override
  $Res call({
    Object result = freezed,
    Object amount = freezed,
    Object screen = freezed,
    Object success = freezed,
    Object error = freezed,
    Object responsemessage = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed ? _value.result : result as String,
      amount: amount == freezed ? _value.amount : amount as double,
      screen: screen == freezed ? _value.screen : screen as int,
      success: success == freezed ? _value.success : success as int,
      error: error == freezed ? _value.error : error as int,
      responsemessage: responsemessage == freezed
          ? _value.responsemessage
          : responsemessage as String,
    ));
  }
}

abstract class _$QrScanLoadedCopyWith<$Res>
    implements $QrScanLoadedCopyWith<$Res> {
  factory _$QrScanLoadedCopyWith(
          _QrScanLoaded value, $Res Function(_QrScanLoaded) then) =
      __$QrScanLoadedCopyWithImpl<$Res>;
  @override
  $Res call(
      {String result,
      double amount,
      int screen,
      int success,
      int error,
      String responsemessage});
}

class __$QrScanLoadedCopyWithImpl<$Res> extends _$QrScanLoadedCopyWithImpl<$Res>
    implements _$QrScanLoadedCopyWith<$Res> {
  __$QrScanLoadedCopyWithImpl(
      _QrScanLoaded _value, $Res Function(_QrScanLoaded) _then)
      : super(_value, (v) => _then(v as _QrScanLoaded));

  @override
  _QrScanLoaded get _value => super._value as _QrScanLoaded;

  @override
  $Res call({
    Object result = freezed,
    Object amount = freezed,
    Object screen = freezed,
    Object success = freezed,
    Object error = freezed,
    Object responsemessage = freezed,
  }) {
    return _then(_QrScanLoaded(
      result: result == freezed ? _value.result : result as String,
      amount: amount == freezed ? _value.amount : amount as double,
      screen: screen == freezed ? _value.screen : screen as int,
      success: success == freezed ? _value.success : success as int,
      error: error == freezed ? _value.error : error as int,
      responsemessage: responsemessage == freezed
          ? _value.responsemessage
          : responsemessage as String,
    ));
  }
}

class _$_QrScanLoaded with DiagnosticableTreeMixin implements _QrScanLoaded {
  _$_QrScanLoaded(
      {this.result,
      this.amount,
      this.screen,
      this.success = 100,
      this.error = 100,
      this.responsemessage})
      : assert(success != null),
        assert(error != null);

  @override
  final String result;
  @override
  final double amount;
  @override
  final int screen;
  @JsonKey(defaultValue: 100)
  @override
  final int success;
  @JsonKey(defaultValue: 100)
  @override
  final int error;
  @override
  final String responsemessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'QrScanLoaded(result: $result, amount: $amount, screen: $screen, success: $success, error: $error, responsemessage: $responsemessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'QrScanLoaded'))
      ..add(DiagnosticsProperty('result', result))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('screen', screen))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('responsemessage', responsemessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QrScanLoaded &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.screen, screen) ||
                const DeepCollectionEquality().equals(other.screen, screen)) &&
            (identical(other.success, success) ||
                const DeepCollectionEquality()
                    .equals(other.success, success)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.responsemessage, responsemessage) ||
                const DeepCollectionEquality()
                    .equals(other.responsemessage, responsemessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(result) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(screen) ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(responsemessage);

  @override
  _$QrScanLoadedCopyWith<_QrScanLoaded> get copyWith =>
      __$QrScanLoadedCopyWithImpl<_QrScanLoaded>(this, _$identity);
}

abstract class _QrScanLoaded implements QrScanLoaded {
  factory _QrScanLoaded(
      {String result,
      double amount,
      int screen,
      int success,
      int error,
      String responsemessage}) = _$_QrScanLoaded;

  @override
  String get result;
  @override
  double get amount;
  @override
  int get screen;
  @override
  int get success;
  @override
  int get error;
  @override
  String get responsemessage;
  @override
  _$QrScanLoadedCopyWith<_QrScanLoaded> get copyWith;
}
