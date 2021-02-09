part of 'forgotpassword_bloc.dart';

@immutable
abstract class ForgotpasswordEvent extends Equatable {}

class ForgotAzaTagPasswordChanged extends ForgotpasswordEvent {
  final String azatag;

  ForgotAzaTagPasswordChanged({this.azatag});

  @override
  List<Object> get props => [azatag];
}

class ClearForgotAzaTag extends ForgotpasswordEvent {
  @override
  List<Object> get props => [];
}

class FormSubmitForgotAzaTag extends ForgotpasswordEvent {
  @override
  List<Object> get props => [];
}
