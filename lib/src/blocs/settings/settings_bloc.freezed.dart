// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

// ignore: unused_element
  _SettingsState call(
      {bool securityvalue = false,
      bool tagvisibilityvalue = false,
      bool alloweveryonevalue = false,
      bool contactsonlyvalue = false}) {
    return _SettingsState(
      securityvalue: securityvalue,
      tagvisibilityvalue: tagvisibilityvalue,
      alloweveryonevalue: alloweveryonevalue,
      contactsonlyvalue: contactsonlyvalue,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SettingsState = _$SettingsStateTearOff();

/// @nodoc
mixin _$SettingsState {
  bool get securityvalue;
  bool get tagvisibilityvalue;
  bool get alloweveryonevalue;
  bool get contactsonlyvalue;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
  $Res call(
      {bool securityvalue,
      bool tagvisibilityvalue,
      bool alloweveryonevalue,
      bool contactsonlyvalue});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;

  @override
  $Res call({
    Object securityvalue = freezed,
    Object tagvisibilityvalue = freezed,
    Object alloweveryonevalue = freezed,
    Object contactsonlyvalue = freezed,
  }) {
    return _then(_value.copyWith(
      securityvalue: securityvalue == freezed
          ? _value.securityvalue
          : securityvalue as bool,
      tagvisibilityvalue: tagvisibilityvalue == freezed
          ? _value.tagvisibilityvalue
          : tagvisibilityvalue as bool,
      alloweveryonevalue: alloweveryonevalue == freezed
          ? _value.alloweveryonevalue
          : alloweveryonevalue as bool,
      contactsonlyvalue: contactsonlyvalue == freezed
          ? _value.contactsonlyvalue
          : contactsonlyvalue as bool,
    ));
  }
}

/// @nodoc
abstract class _$SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(
          _SettingsState value, $Res Function(_SettingsState) then) =
      __$SettingsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool securityvalue,
      bool tagvisibilityvalue,
      bool alloweveryonevalue,
      bool contactsonlyvalue});
}

/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(
      _SettingsState _value, $Res Function(_SettingsState) _then)
      : super(_value, (v) => _then(v as _SettingsState));

  @override
  _SettingsState get _value => super._value as _SettingsState;

  @override
  $Res call({
    Object securityvalue = freezed,
    Object tagvisibilityvalue = freezed,
    Object alloweveryonevalue = freezed,
    Object contactsonlyvalue = freezed,
  }) {
    return _then(_SettingsState(
      securityvalue: securityvalue == freezed
          ? _value.securityvalue
          : securityvalue as bool,
      tagvisibilityvalue: tagvisibilityvalue == freezed
          ? _value.tagvisibilityvalue
          : tagvisibilityvalue as bool,
      alloweveryonevalue: alloweveryonevalue == freezed
          ? _value.alloweveryonevalue
          : alloweveryonevalue as bool,
      contactsonlyvalue: contactsonlyvalue == freezed
          ? _value.contactsonlyvalue
          : contactsonlyvalue as bool,
    ));
  }
}

/// @nodoc
class _$_SettingsState with DiagnosticableTreeMixin implements _SettingsState {
  _$_SettingsState(
      {this.securityvalue = false,
      this.tagvisibilityvalue = false,
      this.alloweveryonevalue = false,
      this.contactsonlyvalue = false})
      : assert(securityvalue != null),
        assert(tagvisibilityvalue != null),
        assert(alloweveryonevalue != null),
        assert(contactsonlyvalue != null);

  @JsonKey(defaultValue: false)
  @override
  final bool securityvalue;
  @JsonKey(defaultValue: false)
  @override
  final bool tagvisibilityvalue;
  @JsonKey(defaultValue: false)
  @override
  final bool alloweveryonevalue;
  @JsonKey(defaultValue: false)
  @override
  final bool contactsonlyvalue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SettingsState(securityvalue: $securityvalue, tagvisibilityvalue: $tagvisibilityvalue, alloweveryonevalue: $alloweveryonevalue, contactsonlyvalue: $contactsonlyvalue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SettingsState'))
      ..add(DiagnosticsProperty('securityvalue', securityvalue))
      ..add(DiagnosticsProperty('tagvisibilityvalue', tagvisibilityvalue))
      ..add(DiagnosticsProperty('alloweveryonevalue', alloweveryonevalue))
      ..add(DiagnosticsProperty('contactsonlyvalue', contactsonlyvalue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsState &&
            (identical(other.securityvalue, securityvalue) ||
                const DeepCollectionEquality()
                    .equals(other.securityvalue, securityvalue)) &&
            (identical(other.tagvisibilityvalue, tagvisibilityvalue) ||
                const DeepCollectionEquality()
                    .equals(other.tagvisibilityvalue, tagvisibilityvalue)) &&
            (identical(other.alloweveryonevalue, alloweveryonevalue) ||
                const DeepCollectionEquality()
                    .equals(other.alloweveryonevalue, alloweveryonevalue)) &&
            (identical(other.contactsonlyvalue, contactsonlyvalue) ||
                const DeepCollectionEquality()
                    .equals(other.contactsonlyvalue, contactsonlyvalue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(securityvalue) ^
      const DeepCollectionEquality().hash(tagvisibilityvalue) ^
      const DeepCollectionEquality().hash(alloweveryonevalue) ^
      const DeepCollectionEquality().hash(contactsonlyvalue);

  @JsonKey(ignore: true)
  @override
  _$SettingsStateCopyWith<_SettingsState> get copyWith =>
      __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  factory _SettingsState(
      {bool securityvalue,
      bool tagvisibilityvalue,
      bool alloweveryonevalue,
      bool contactsonlyvalue}) = _$_SettingsState;

  @override
  bool get securityvalue;
  @override
  bool get tagvisibilityvalue;
  @override
  bool get alloweveryonevalue;
  @override
  bool get contactsonlyvalue;
  @override
  @JsonKey(ignore: true)
  _$SettingsStateCopyWith<_SettingsState> get copyWith;
}
