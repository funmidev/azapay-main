part of 'homeauthnavigation_bloc.dart';

@immutable
abstract class HomeauthnavigationState {}

class HomeauthnavigationInitial extends HomeauthnavigationState {}

class HomeauthnavigationOnBoarding extends HomeauthnavigationState {}

class HomeauthnavigationSwitchAccount extends HomeauthnavigationState {
  final BasicResponse basicResponse;
  HomeauthnavigationSwitchAccount({this.basicResponse});
}

class HomeauthnavigationHome extends HomeauthnavigationState {}

class HomeauthnavigationError extends HomeauthnavigationState {}
