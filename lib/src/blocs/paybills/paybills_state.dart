part of 'paybills_bloc.dart';

@immutable
abstract class PaybillsState {}

class PaybillsInitial extends PaybillsState {}

class PaybillsLoading extends PaybillsState {}

// class PaybillsScreen extends PaybillsState {
//   final int service;
//   PaybillsScreen({this.service});
// }

// class PaybillsCategoryLoaded<T> extends PaybillsState {
//   final GetPayBills<T> getPayBills;
//   PaybillsCategoryLoaded({this.getPayBills});
// }

// class PaybillsProductLoading extends PaybillsState {}

// class PaybillsProductLoaded<T> extends PaybillsState {
//   final GetPayBills<T> getPayBills;
//   PaybillsProductLoaded({this.getPayBills});
// }

@freezed
abstract class PaybillsInputData<T, S> with _$PaybillsInputData<T, S> implements PaybillsState {
  factory PaybillsInputData(
      {int service,
      String product,
      @Default('') String phone,
      String categoryName,
      String productCode,
      String billcode,
      String name,
      @Default('') String smartcardormeterNo,
      String categoryId,
      int isRadioSelectedBillCategoryProvider,
      int isRadioSelectedBillProductProvider,
      int isRadioSelectedBillSubProductProvider,
      int isRadioSelectedPhoneNumber,
      @Default(VerifyCustomer(data: VerifyCustomerData(name: ''))) VerifyCustomer verifyCustomer,
      @Default(GetPayBills(data: [])) GetPayBills<T> getPayBillsCategory,
      @Default(GetPayBills(data: [])) GetPayBills<S> getPayBillsProduct,
      @Default(100) int success,
      @Default(100) int error,
      String responsemessage,
      double amount,
      String transactionPin}) = _PaybillsInputData;
}

// class PaybillsVerifiedCustomerOrName extends PaybillsState {
//   PaybillsVerifiedCustomerOrName({this.verifyCustomer});

//   final VerifyCustomer verifyCustomer;
// }

// class PaybillsVerifying extends PaybillsState {}

// class PaybillsShowItemList extends PaybillsState {}

// class PaybillsError extends PaybillsState {
//   final String responseTitle;
//   final String responseMessage;

//   PaybillsError({this.responseTitle, this.responseMessage});
// }

// class PaybillsSuccess extends PaybillsState {
//   final String responseTitle;
//   final String responseMessage;

//   PaybillsSuccess({this.responseTitle, this.responseMessage});
// }
