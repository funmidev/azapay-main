part of 'wallet_bloc.dart';

@immutable
abstract class WalletEvent extends Equatable {}

class WalletPage extends WalletEvent {
  @override
  List<Object> get props => [];
}

class ResetWalletPage extends WalletEvent {
  @override
  List<Object> get props => [];
}

class WebWalletTransferSwitchPage extends WalletEvent {
  final int transferswitch;

  WebWalletTransferSwitchPage({this.transferswitch});
  @override
  List<Object> get props => [transferswitch];
}
