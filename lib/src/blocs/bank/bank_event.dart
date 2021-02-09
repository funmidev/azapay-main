part of 'bank_bloc.dart';

@immutable
abstract class BankEvent {}

class FetchListBank extends BankEvent {}

class FetchLinkBank extends BankEvent {}

class SubmitLinkBankAccount extends BankEvent {
  final int option;
  final String pin;

  SubmitLinkBankAccount({this.option, this.pin});
}

class SearchBankList extends BankEvent {
  final String search;
  SearchBankList({this.search});
}

class BankId extends BankEvent {
  final String bankcode;

  BankId({this.bankcode});
}

class BankName extends BankEvent {
  final String bankname;

  BankName({this.bankname});
}

class AccountNumber extends BankEvent {
  final String number;
  final String bankcode;
  AccountNumber({this.number, this.bankcode});
}

class AccountName extends BankEvent {
  final String name;

  AccountName({this.name});
}

class TransferAmount extends BankEvent {
  final String amount;

  TransferAmount({this.amount});
}

class TransferNote extends BankEvent {
  final String note;

  TransferNote({this.note});
}

class IsRadioSelectedBank extends BankEvent {
  final int selecteditem;

  IsRadioSelectedBank({this.selecteditem});
}

class IsRadioSelectedAccountType extends BankEvent {
  final int selecteditem;

  IsRadioSelectedAccountType({this.selecteditem});
}

class BankAccountType extends BankEvent {
  final String accountType;

  BankAccountType({this.accountType});
}

class ClearBankForm extends BankEvent {}
