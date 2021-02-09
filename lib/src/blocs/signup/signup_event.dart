part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {}

class EmailSignUp extends SignupEvent {
  final String email;
  EmailSignUp({this.email});
  @override
  List<Object> get props => [email];
}

class PhonenoSignUp extends SignupEvent {
  final String phoneno;
  PhonenoSignUp({this.phoneno});
  @override
  List<Object> get props => [phoneno];
}

class OtpCodeSignUp extends SignupEvent {
  final String otpcode;
  OtpCodeSignUp({this.otpcode});
  @override
  List<Object> get props => [otpcode];
}

class FirstNameSignUp extends SignupEvent {
  final String firstname;
  FirstNameSignUp({this.firstname});
  @override
  List<Object> get props => [firstname];
}

class LastNameSignUp extends SignupEvent {
  final String lastname;
  LastNameSignUp({this.lastname});
  @override
  List<Object> get props => [lastname];
}

class PasswordSignUp extends SignupEvent {
  final String password;
  PasswordSignUp({this.password});
  @override
  List<Object> get props => [password];
}

class AzaTagSignUp extends SignupEvent {
  final String azatag;
  AzaTagSignUp({this.azatag});
  @override
  List<Object> get props => [azatag];
}

class ClearSignUp extends SignupEvent {
  @override
  List<Object> get props => [];
}

class ResendOtpSignUp extends SignupEvent {
  @override
  List<Object> get props => [];
}


class SubmitSignUpForm extends SignupEvent {
  final int screen;
  SubmitSignUpForm({this.screen});
  @override
  List<Object> get props => [screen];
}

class ReturnToInitial extends SignupEvent {
  @override
  List<Object> get props => [];
}
