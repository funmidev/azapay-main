part of 'activity_isolate_bloc.dart';

@immutable
abstract class ActivityIsolateState {}

class ActivityInitialIsolate extends ActivityIsolateState {}

class ActivityLoadingIsolate extends ActivityIsolateState {}

@freezed
abstract class ActivityLoadedIsolate with _$ActivityLoadedIsolate implements ActivityIsolateState {
  factory ActivityLoadedIsolate(
      {List<TransactionHistory> basicResponse, @Default(AppStrings.empty) String searchtext}) = _ActivityLoadedIsolate;
}

class ActivityErrorIsolate extends ActivityIsolateState {}
