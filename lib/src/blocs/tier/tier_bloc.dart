import 'dart:async';

import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tier_event.dart';
part 'tier_state.dart';

class TierBloc extends Bloc<TierEvent, TierState> {
  final Repository repository;

  TierBloc({this.repository}) : super(TierInitial());

  @override
  Stream<TierState> mapEventToState(
    TierEvent event,
  ) async* {
    if (event is CheckConfidentalItem) {
      try {
        final bvnresponse = await repository.checkBVNavalidationStatus();
        // print(bvnresponse.message);
        final docresponse = await repository.getdoc();
        yield TierLoaded(docstatus: docresponse.status, bvnstatus: bvnresponse.status);
      } catch (e) {
        yield TierError();
      }
    }
  }
}
