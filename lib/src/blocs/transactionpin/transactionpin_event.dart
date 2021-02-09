part of 'transactionpin_bloc.dart';

@immutable
abstract class TransactionpinEvent extends Equatable {}

class SetTransactionPin extends TransactionpinEvent {
  @override
  List<Object> get props => [];
}

class TransactionPinInput extends TransactionpinEvent {
  final String pin;
  final String verificationToken;
  final int pinOrverificationToken; //pin=0,verificationtoken=1
  TransactionPinInput({this.pin, this.verificationToken, this.pinOrverificationToken});

  @override
  List<Object> get props => [pin];
}

class CheckTransactionPin extends TransactionpinEvent {
  final String pin;
  CheckTransactionPin({this.pin});
  @override
  List<Object> get props => [pin];
}

class ClearTransactionPin extends TransactionpinEvent {
  @override
  List<Object> get props => [];
}

class ConfirmTransactionPin extends TransactionpinEvent {
  final int change;
  ConfirmTransactionPin({this.change});
  @override
  List<Object> get props => [];
}
