part of 'activity_bloc.dart';

@immutable
abstract class ActivityState {}

class ActivityInitial extends ActivityState {}

class ActivityLoading extends ActivityState {}

@freezed
abstract class ActivityLoaded with _$ActivityLoaded implements ActivityState {
  factory ActivityLoaded(
      {List<TransactionHistory> basicResponse,
      @Default(AppStrings.empty) String searchtext}) = _ActivityLoaded;
}

class ActivityError extends ActivityState {}
