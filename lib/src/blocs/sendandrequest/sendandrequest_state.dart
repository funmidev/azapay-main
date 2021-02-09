part of 'sendandrequest_bloc.dart';

@immutable
abstract class SendandrequestState {}

@freezed
abstract class InputDataFundState with _$InputDataFundState implements SendandrequestState {
  factory InputDataFundState(
      {bool screen,
      double amount,
      @Default(AppStrings.empty) String client,
      @Default(AppStrings.empty) String note,
      @Default(100) int success,
      @Default(100) int error,
      String responsemessage,
      int isRadioSelectedPhoneNumber,
      @Default(false) bool isContactFetched,
      @Default([]) List<DeviceContacts> devicecontact,
      @Default([]) List<Contacts> contacts}) = _InputDataFundState;
}

// class InitialFundState extends SendandrequestState {}

class LoadingFundState extends SendandrequestState {}

// sclass LoadedFundState extends SendandrequestState {}

// class ContactLoadingFundState extends SendandrequestState {}

// @freezed
// abstract class ContactLoadedFundState with _$ContactLoadedFundState implements SendandrequestState {
//   factory ContactLoadedFundState({List<Contact> contact}) = _ContactLoadedFundState;
// }

// // class RecentContactLoadingFundState extends SendandrequestState {}

// @freezed
// abstract class RecentContactLoadedFundState with _$RecentContactLoadedFundState implements SendandrequestState {
//   factory RecentContactLoadedFundState({}) = _RecentContactLoadedFundState;
// }

// class SuccessFundState extends SendandrequestState {
//   final String responseTitle;
//   final String responsemessage;

//   SuccessFundState({this.responseTitle, this.responsemessage});
// }

// class ErrorFundState extends SendandrequestState {
//   final String responseTitle;
//   final String responsemessage;

//   ErrorFundState({this.responseTitle, this.responsemessage});
// }
