part of 'sendandrequest_bloc.dart';

@freezed
abstract class SendandrequestEvent with _$SendandrequestEvent {
  factory SendandrequestEvent.contacts({double amount, bool screen}) = _Contacts;
  factory SendandrequestEvent.addnote({String note}) = _AddNote;
  factory SendandrequestEvent.clientid({String clientid}) = _Client;
  factory SendandrequestEvent.isRadioSelectedPhoneNumber({int selecteditem}) = _IsRadioSelectedPhoneNumber;
  factory SendandrequestEvent.isContactFetched({bool fetched}) = _IsContactFetched;
  factory SendandrequestEvent.submit({String pin}) = _Submit;
  factory SendandrequestEvent.clear({@Default(false) bool exit}) = _Clear;
}

// class SendAndRequestContacts extends SendandrequestEvent {
//   @override
//   List<Object> get props => [];
// }

// class SendAndRequestAmount extends SendandrequestEvent {
//   final Fund amount;

//   SendAndRequestAmount({this.amount});

//   @override
//   List<Object> get props => [amount];
// }

// class SendAndRequestAddNote extends SendandrequestEvent {
//   final Fund note;

//   SendAndRequestAddNote({this.note});

//   @override
//   List<Object> get props => [note];
// }

// class SendAndRequestPageIdentifier extends SendandrequestEvent {
//   final Fund whichscreen;

//   SendAndRequestPageIdentifier({this.whichscreen});
//   @override
//   List<Object> get props => [whichscreen];
// }

// class SendAndRequestNumber extends SendandrequestEvent {
//   final Fund client;
//   SendAndRequestNumber({this.client});
//   @override
//   List<Object> get props => [client];
// }

// class FundSubmission extends SendandrequestEvent {
//   @override
//   List<Object> get props => [];
// }

// class ClearSendAndRequest extends SendandrequestEvent {
//   @override
//   List<Object> get props => [];
// }
