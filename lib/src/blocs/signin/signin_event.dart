part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent extends Equatable {}

class SignInTagChanged extends SigninEvent {
  final String azatag;

  SignInTagChanged({this.azatag});

  @override
  List<Object> get props => [azatag];
}

class SignInPasswordChanged extends SigninEvent {
  final String password;

  SignInPasswordChanged({this.password});

  @override
  List<Object> get props => [password];
}

class IsDeviceNew extends SigninEvent {
  final bool isDeviceNew;

  IsDeviceNew({this.isDeviceNew});

  @override
  List<Object> get props => [isDeviceNew];
}

class ClearSigninForm extends SigninEvent {
  @override
  List<Object> get props => [];
}

class FormSubmittedSignIn extends SigninEvent {
  @override
  List<Object> get props => [];
}
