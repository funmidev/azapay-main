// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'wallet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WalletStateLoadedTearOff {
  const _$WalletStateLoadedTearOff();

// ignore: unused_element
  _WalletStateLoaded call(
      {Wallet wallet = const Wallet(),
      List<Contacts> contacts = const [],
      int transferswitch = 0}) {
    return _WalletStateLoaded(
      wallet: wallet,
      contacts: contacts,
      transferswitch: transferswitch,
    );
  }
}

// ignore: unused_element
const $WalletStateLoaded = _$WalletStateLoadedTearOff();

mixin _$WalletStateLoaded {
  Wallet get wallet;
  List<Contacts> get contacts;
  int get transferswitch;

  $WalletStateLoadedCopyWith<WalletStateLoaded> get copyWith;
}

abstract class $WalletStateLoadedCopyWith<$Res> {
  factory $WalletStateLoadedCopyWith(
          WalletStateLoaded value, $Res Function(WalletStateLoaded) then) =
      _$WalletStateLoadedCopyWithImpl<$Res>;
  $Res call({Wallet wallet, List<Contacts> contacts, int transferswitch});
}

class _$WalletStateLoadedCopyWithImpl<$Res>
    implements $WalletStateLoadedCopyWith<$Res> {
  _$WalletStateLoadedCopyWithImpl(this._value, this._then);

  final WalletStateLoaded _value;
  // ignore: unused_field
  final $Res Function(WalletStateLoaded) _then;

  @override
  $Res call({
    Object wallet = freezed,
    Object contacts = freezed,
    Object transferswitch = freezed,
  }) {
    return _then(_value.copyWith(
      wallet: wallet == freezed ? _value.wallet : wallet as Wallet,
      contacts:
          contacts == freezed ? _value.contacts : contacts as List<Contacts>,
      transferswitch: transferswitch == freezed
          ? _value.transferswitch
          : transferswitch as int,
    ));
  }
}

abstract class _$WalletStateLoadedCopyWith<$Res>
    implements $WalletStateLoadedCopyWith<$Res> {
  factory _$WalletStateLoadedCopyWith(
          _WalletStateLoaded value, $Res Function(_WalletStateLoaded) then) =
      __$WalletStateLoadedCopyWithImpl<$Res>;
  @override
  $Res call({Wallet wallet, List<Contacts> contacts, int transferswitch});
}

class __$WalletStateLoadedCopyWithImpl<$Res>
    extends _$WalletStateLoadedCopyWithImpl<$Res>
    implements _$WalletStateLoadedCopyWith<$Res> {
  __$WalletStateLoadedCopyWithImpl(
      _WalletStateLoaded _value, $Res Function(_WalletStateLoaded) _then)
      : super(_value, (v) => _then(v as _WalletStateLoaded));

  @override
  _WalletStateLoaded get _value => super._value as _WalletStateLoaded;

  @override
  $Res call({
    Object wallet = freezed,
    Object contacts = freezed,
    Object transferswitch = freezed,
  }) {
    return _then(_WalletStateLoaded(
      wallet: wallet == freezed ? _value.wallet : wallet as Wallet,
      contacts:
          contacts == freezed ? _value.contacts : contacts as List<Contacts>,
      transferswitch: transferswitch == freezed
          ? _value.transferswitch
          : transferswitch as int,
    ));
  }
}

class _$_WalletStateLoaded
    with DiagnosticableTreeMixin
    implements _WalletStateLoaded {
  _$_WalletStateLoaded(
      {this.wallet = const Wallet(),
      this.contacts = const [],
      this.transferswitch = 0})
      : assert(wallet != null),
        assert(contacts != null),
        assert(transferswitch != null);

  @JsonKey(defaultValue: const Wallet())
  @override
  final Wallet wallet;
  @JsonKey(defaultValue: const [])
  @override
  final List<Contacts> contacts;
  @JsonKey(defaultValue: 0)
  @override
  final int transferswitch;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WalletStateLoaded(wallet: $wallet, contacts: $contacts, transferswitch: $transferswitch)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WalletStateLoaded'))
      ..add(DiagnosticsProperty('wallet', wallet))
      ..add(DiagnosticsProperty('contacts', contacts))
      ..add(DiagnosticsProperty('transferswitch', transferswitch));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WalletStateLoaded &&
            (identical(other.wallet, wallet) ||
                const DeepCollectionEquality().equals(other.wallet, wallet)) &&
            (identical(other.contacts, contacts) ||
                const DeepCollectionEquality()
                    .equals(other.contacts, contacts)) &&
            (identical(other.transferswitch, transferswitch) ||
                const DeepCollectionEquality()
                    .equals(other.transferswitch, transferswitch)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(wallet) ^
      const DeepCollectionEquality().hash(contacts) ^
      const DeepCollectionEquality().hash(transferswitch);

  @override
  _$WalletStateLoadedCopyWith<_WalletStateLoaded> get copyWith =>
      __$WalletStateLoadedCopyWithImpl<_WalletStateLoaded>(this, _$identity);
}

abstract class _WalletStateLoaded implements WalletStateLoaded {
  factory _WalletStateLoaded(
      {Wallet wallet,
      List<Contacts> contacts,
      int transferswitch}) = _$_WalletStateLoaded;

  @override
  Wallet get wallet;
  @override
  List<Contacts> get contacts;
  @override
  int get transferswitch;
  @override
  _$WalletStateLoadedCopyWith<_WalletStateLoaded> get copyWith;
}
