import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgotpassword_event.dart';
part 'forgotpassword_state.dart';
part 'forgotpassword_bloc.freezed.dart';

class ForgotpasswordBloc extends Bloc<ForgotpasswordEvent, ForgotpasswordState> {
  final Repository repository;
  final _logger = Logger();
  ForgotpasswordBloc({this.repository}) : super(InputDataForgotpasswordState());

  final _previousState = <ForgotpasswordState>[];

  @override
  void onTransition(Transition<ForgotpasswordEvent, ForgotpasswordState> transition) {
    _previousState.add(transition.currentState);
    super.onTransition(transition);
  }

  @override
  Stream<ForgotpasswordState> mapEventToState(
    ForgotpasswordEvent event,
  ) async* {
    if (event is ForgotAzaTagPasswordChanged) {
      yield (state as InputDataForgotpasswordState).copyWith(azatag: event.azatag);
    } else if (event is ClearForgotAzaTag) {
      yield InputDataForgotpasswordState(azatag: '');
    } else if (event is FormSubmitForgotAzaTag) {
      yield LoadingForgotpasswordState();
      final forgotpassword = _previousState.whereType<InputDataForgotpasswordState>().last;
      try {
        final response = await repository.acquireResetToken(azaTag: '${forgotpassword.azatag}');
        if (response.status == 200) {
          yield forgotpassword.copyWith(acquireResetToken: response);
        } else {
          yield forgotpassword.copyWith(acquireResetToken: AcquireResetToken(status: 400));
        }
      } catch (e) {
        yield forgotpassword.copyWith(
          message: AcquireResetToken(message: AppDioErrorHandling().handleError(e), status: 400).message,
        );
      }
    }
  }
}
