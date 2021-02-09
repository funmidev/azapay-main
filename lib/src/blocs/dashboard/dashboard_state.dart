part of 'dashboard_bloc.dart';

@immutable
class DashboardState {
  String amount;
  final int position;

  DashboardState({this.amount, this.position});

  factory DashboardState.initial() {
    return DashboardState(amount: '', position: 2);
  }

  DashboardState copyWith({String amount, int position, bool completeprofile}) {
    return DashboardState(
      amount: amount ?? this.amount,
      position: position ?? this.position,
    );
  }
}
