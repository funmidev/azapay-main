part of 'bank_bloc.dart';

@immutable
abstract class BankState {}

class BankInitial extends BankState {}

class BankLoading extends BankState {}

@freezed
abstract class BankLoaded with _$BankLoaded implements BankState {
  factory BankLoaded(
      {@Default(AppStrings.empty) String bankcode,
      String bankname,
      String acctnumber,
      String acctname,
      String amount,
      String note,
      @Default(AppStrings.empty) String searchtext,
      String bankaccountType,
      int isRadioSelectedBank,
      int isRadioSelectedAccountType,
      @Default(100) int success,
      @Default(100) int error,
      String responsemessage,
      @Default([]) List<BankList> banklist,
      @Default(LinkBank(data: [])) LinkBank linkbank}) = _BankLoaded;
}
