part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {}

class CurrentBottomNavigationPosition extends DashboardEvent {
  final int position;

  CurrentBottomNavigationPosition({this.position});

  @override
  List<Object> get props => [position];
}

class InputAmount extends DashboardEvent {
  String amount;

  InputAmount({this.amount});

  @override
  List<Object> get props => [amount];
}

class CompleteProfileDash extends DashboardEvent {
  final bool completeprofile;

  CompleteProfileDash({this.completeprofile});

  @override
  List<Object> get props => [completeprofile];
}

class DeleteAmount extends DashboardEvent {
  @override
  List<Object> get props => [];
}

class Fetch extends DashboardEvent {
  @override
  List<Object> get props => [];
}
