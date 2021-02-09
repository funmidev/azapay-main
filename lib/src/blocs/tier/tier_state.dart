part of 'tier_bloc.dart';

@immutable
abstract class TierState {}

class TierInitial extends TierState {}

class TierError extends TierState {}

class TierLoaded extends TierState {
  final int bvnstatus;
  final int docstatus;

  TierLoaded({this.bvnstatus, this.docstatus});

  TierLoaded copyWith({int bvnstatus, int docstatus}) {
    return TierLoaded(
      bvnstatus: bvnstatus ?? this.bvnstatus,
      docstatus: docstatus ?? this.docstatus,
    );
  }
}
