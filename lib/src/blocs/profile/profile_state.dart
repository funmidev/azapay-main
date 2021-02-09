part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

@freezed
abstract class ProfileLoaded with _$ProfileLoaded implements ProfileState {
  factory ProfileLoaded(
      {@Default(SignUp(data: Data(lastName: AppStrings.empty, firstName: AppStrings.empty, tag: AppStrings.empty)))
          SignUp signUp,
      @Default(AppStrings.empty)
          String gender,
      @Default(AppStrings.empty)
          String tag,
      @Default(AppStrings.empty)
          String email,
      DateTime dob,
      @Default(AppStrings.empty)
          String bvn,
      @Default(AppStrings.empty)
          String address,
      @Default(AppStrings.empty)
          String state,
      @Default(AppStrings.empty)
          String rc,
      @Default(AppStrings.empty)
          String businessaddress,
      @Default(AppStrings.empty)
          String businessname,
      @Default([])
          List<String> stateList,
      File validid,
      File cac,
      String helpandsupportRestoreId,
      @Default(100)
          int success,
      @Default(100)
          int error,
      String responsemessage,
      Uint8List profilepic}) = _ProfileLoaded;
}
