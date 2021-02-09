part of 'transactionpin_bloc.dart';

@immutable
abstract class TransactionpinState {}

class TransactionpinInitial extends TransactionpinState {}

@freezed
abstract class TransactionpinLoaded with _$TransactionpinLoaded implements TransactionpinState {
  factory TransactionpinLoaded({String pin, String verificationToken}) = _TransactionpinLoaded;
}

class TransactionpinLoading extends TransactionpinState {}

class TransactionpinError extends TransactionpinState {
  final String responsemessage;
  TransactionpinError({this.responsemessage});
}

class TransactionpinChecked extends TransactionpinState {
  final TransactionPin transactionPin;
  TransactionpinChecked({this.transactionPin});
}

class ConfirmTransactionPinInDB extends TransactionpinState {
  final int pinconfirmation;
  ConfirmTransactionPinInDB({this.pinconfirmation});
}
