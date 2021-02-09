part of 'activity_isolate_bloc.dart';

@immutable
abstract class ActivityIsolateEvent {}

class FetchTransactionHistoryIsolate extends ActivityIsolateEvent {}

class SearchTransactionHistoryIsolate extends ActivityIsolateEvent {
  final String search;
  SearchTransactionHistoryIsolate({this.search});
}
