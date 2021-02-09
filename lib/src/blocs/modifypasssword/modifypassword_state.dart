part of 'modifypassword_bloc.dart';

@immutable
abstract class ModifypasswordState {}

class LoadinglModifypasswordState extends ModifypasswordState {}

@freezed
abstract class InputDataModifypasswordState with _$InputDataModifypasswordState implements ModifypasswordState {
  factory InputDataModifypasswordState(
      {@Default('') String password,
      @Default('') String verificationToken,
      @Default(false) bool isPasswordValid,
      @Default('') String message,
      @Default(false) bool isTokenValid}) = _InputDataModifypasswordState;
}
