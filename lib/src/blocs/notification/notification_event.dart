part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent {}

class FetchFundRequest extends NotificationEvent {
  final bool refresh;
  FetchFundRequest({this.refresh=false});
}

class DeclineFundRequest extends NotificationEvent {
  final String ref;
  DeclineFundRequest({this.ref});
}

class ApproveFundRequest extends NotificationEvent {
  final String ref;
  ApproveFundRequest({this.ref});
}

class CancelFundRequest extends NotificationEvent {
  final String ref;
  CancelFundRequest({this.ref});
}

class TickAsReadFundNotification extends NotificationEvent {
  final String ref;
  TickAsReadFundNotification({this.ref});
}

class ClearNotificationResponse extends NotificationEvent {}
