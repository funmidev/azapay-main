import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'activity_event.dart';
part 'activity_state.dart';
part 'activity_bloc.freezed.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final Repository repository;
  // final _logger = Logger();

  ActivityBloc({this.repository}) : super(ActivityInitial());

  @override
  Stream<ActivityState> mapEventToState(
    ActivityEvent event,
  ) async* {
    if (event is FetchTransactionHistory) {
      try {
        final response = await repository.retrieveTransactionHistory(bound: 'ALL');
        if (response.status == 200) {
          yield ActivityLoaded(basicResponse: response?.data ?? []);
        } else {
          yield ActivityLoaded(basicResponse: []);
        }
      } catch (e) {
        yield ActivityError();
      }
    } else if (event is SearchTransactionHistory) {
      yield (state as ActivityLoaded).copyWith(searchtext: event.search);
    }
  }
}
