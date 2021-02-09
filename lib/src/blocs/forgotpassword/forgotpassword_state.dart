part of 'forgotpassword_bloc.dart';

@immutable
abstract class ForgotpasswordState {}

class LoadingForgotpasswordState extends ForgotpasswordState {}

@freezed
abstract class InputDataForgotpasswordState with _$InputDataForgotpasswordState implements ForgotpasswordState {
  factory InputDataForgotpasswordState({
    @Default('') String azatag,
    @Default(AcquireResetToken(status: 100)) AcquireResetToken acquireResetToken,
    @Default('') String message,
  }) = _InputDataForgotpasswordState;
}
