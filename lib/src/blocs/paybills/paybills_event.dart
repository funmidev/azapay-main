part of 'paybills_bloc.dart';

@immutable
abstract class PaybillsEvent extends Equatable {}

class PayBillsService extends PaybillsEvent {
  final int service;

  PayBillsService({this.service});

  @override
  List<Object> get props => [service];
}

class PayBillsAmount extends PaybillsEvent {
  final double amount;

  PayBillsAmount({this.amount});

  @override
  List<Object> get props => [amount];
}

class PayBillsisRadioSelectedBillCategoryProvider extends PaybillsEvent {
  final int position;

  PayBillsisRadioSelectedBillCategoryProvider({this.position});

  @override
  List<Object> get props => [position];
}

class PayBillsisRadioSelectedBillProductProvider extends PaybillsEvent {
  final int position;

  PayBillsisRadioSelectedBillProductProvider({this.position});

  @override
  List<Object> get props => [position];
}

class PayBillsisRadioSelectedPhoneNumber extends PaybillsEvent {
  final int position;

  PayBillsisRadioSelectedPhoneNumber({this.position});

  @override
  List<Object> get props => [position];
}

class PayBillisRadioSelectedBillSubProductProvider extends PaybillsEvent {
  final int position;

  PayBillisRadioSelectedBillSubProductProvider({this.position});

  @override
  List<Object> get props => [position];
}

class PayBillsCategoryName extends PaybillsEvent {
  final String categoryName;

  PayBillsCategoryName({this.categoryName});

  @override
  List<Object> get props => [categoryName];
}

class PayBillsCategoryId extends PaybillsEvent {
  final String categoryId;

  PayBillsCategoryId({this.categoryId});

  @override
  List<Object> get props => [categoryId];
}

class PayBillsBillCode extends PaybillsEvent {
  final String billCode;
  PayBillsBillCode({this.billCode});

  @override
  List<Object> get props => [billCode];
}

class PayBillsProductCode extends PaybillsEvent {
  final String productCode;
  PayBillsProductCode({this.productCode});

  @override
  List<Object> get props => [productCode];
}

class PayBillsProductName extends PaybillsEvent {
  final String productName;

  PayBillsProductName({this.productName});

  @override
  List<Object> get props => [productName];
}

class PayBillsOthersNumber extends PaybillsEvent {
  final String othersno;

  PayBillsOthersNumber({this.othersno});

  @override
  List<Object> get props => [othersno];
}

class PayBillsSmartCardOrMeterNo extends PaybillsEvent {
  final String smartcardormeterno;

  PayBillsSmartCardOrMeterNo({this.smartcardormeterno});

  @override
  List<Object> get props => [smartcardormeterno];
}

class SendPayBillsRequest extends PaybillsEvent {
  @override
  List<Object> get props => [];
}

class ClearBillService extends PaybillsEvent {
  @override
  List<Object> get props => [];
}

class ClearBillServiceAfterResponse extends PaybillsEvent {
  @override
  List<Object> get props => [];
}

class PayBillsRetrieveName extends PaybillsEvent {


  @override
  List<Object> get props => [];
}