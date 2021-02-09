part of 'notification_bloc.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationError extends NotificationState {}

@freezed
abstract class NotificationLoaded with _$NotificationLoaded implements NotificationState {
  factory NotificationLoaded({
    @Default(100) int success,
    @Default(100) int error,
    String responsemessage,
    @Default(Fund()) Fund fundrequest,
    List<RefFund> refFund,
    @Default([]) List<Fund> fundrequestlist,
  }) = _NotificationLoaded;
}
