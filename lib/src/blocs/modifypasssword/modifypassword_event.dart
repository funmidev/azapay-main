part of 'modifypassword_bloc.dart';

@immutable
abstract class ModifypasswordEvent extends Equatable {}

class ModifyPasswordChanged extends ModifypasswordEvent {
  final String password;

  ModifyPasswordChanged({this.password});

  @override
  List<Object> get props => [password];
}

class ModifyPasswordToken extends ModifypasswordEvent {
  final String verificationToken;

  ModifyPasswordToken({this.verificationToken});

  @override
  List<Object> get props => [verificationToken];
}

class ClearModifyPassword extends ModifypasswordEvent {
  @override
  List<Object> get props => [];
}

class FormSubmitModifyPassword extends ModifypasswordEvent {
  @override
  List<Object> get props => [];
}

// class TriggerModifyPasswordTokenApi extends ModifypasswordEvent {
//   @override
//   List<Object> get props => [];
// }
