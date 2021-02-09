part of 'activity_bloc.dart';

@immutable
abstract class ActivityEvent {}

class FetchTransactionHistory extends ActivityEvent {}

class SearchTransactionHistory extends ActivityEvent {
  final String search;
  SearchTransactionHistory({this.search});
}
