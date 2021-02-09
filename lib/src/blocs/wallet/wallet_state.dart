part of 'wallet_bloc.dart';

@immutable
abstract class WalletState {}

class WalletStateInitial extends WalletState {
  final bool value;
  WalletStateInitial({this.value = true});
}

@freezed
abstract class WalletStateLoaded with _$WalletStateLoaded implements WalletState {
  factory WalletStateLoaded(
      {@Default(Wallet()) Wallet wallet,
      @Default([]) List<Contacts> contacts,
      @Default(0) int transferswitch}) = _WalletStateLoaded;
}
