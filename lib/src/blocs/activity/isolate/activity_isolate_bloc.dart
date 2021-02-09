import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:isolate_bloc/isolate_bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'activity_isolate_event.dart';
part 'activity_isolate_state.dart';
part 'activity_isolate_bloc.freezed.dart';

class ActivityIsolateBloc extends IsolateBloc<ActivityIsolateEvent, ActivityIsolateState> {
  final Repository repository;
  // final _logger = Logger();

  ActivityIsolateBloc({this.repository}) : super(ActivityInitialIsolate());

  @override
  void onEventReceived(ActivityIsolateEvent event) async {
    if (event is FetchTransactionHistoryIsolate) {
      try {
        final response = await repository.retrieveTransactionHistory(bound: 'ALL');
        if (response.status == 200) {
          emit(ActivityLoadedIsolate(basicResponse: response?.data ?? []));
        } else {
          emit(ActivityLoadedIsolate(basicResponse: []));
        }
      } catch (e) {
        emit(ActivityErrorIsolate());
      }
    } else if (event is SearchTransactionHistoryIsolate) {
      emit((state as ActivityLoadedIsolate).copyWith(searchtext: event.search));
    }
  }
}
