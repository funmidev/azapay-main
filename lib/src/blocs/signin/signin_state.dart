part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class LoadingSigninState extends SigninState {}

@freezed
abstract class InputDataSigninState with _$InputDataSigninState implements SigninState {
  factory InputDataSigninState(
      {@Default('') String azatag,
      @Default('') String password,
      @Default(BasicResponse<String>(status: 100,message:'')) BasicResponse<String> basicResponse,}) = _InputDataSigninState;
}
