part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupLoading extends SignupState {}

@freezed
abstract class SignupLoaded with _$SignupLoaded implements SignupState {
  factory SignupLoaded(
      {@Default('') String email,
      @Default('') String password,
      @Default(false) bool isPasswordValid,
      @Default(false) bool isEmailValid,
      @Default(false) bool isPhonenoValid,
      @Default('') String firstname,
      @Default(0) int screen,
      @Default(false) bool isFirstnameValid,
      @Default('') String lastname,
      @Default('') String otpcode,
      @Default('') String azatag,
      @Default(SignUp(status: 100)) SignUp signUp,
      @Default(BasicResponse<String>(status: 100)) BasicResponse<String> basicResponse,
      @Default(false) bool isOtpcodeValid,
      @Default(false) bool isLastnameValid,
      @Default('') String phoneno}) = _SignupLoaded;
}
