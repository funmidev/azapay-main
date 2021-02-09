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

part 'modifypassword_event.dart';
part 'modifypassword_state.dart';
part 'modifypassword_bloc.freezed.dart';

class ModifypasswordBloc extends Bloc<ModifypasswordEvent, ModifypasswordState> {
  final Repository repository;
  final RegExp _passwordRegexp = RegExp(r'^(\w|\W){6,}$');
  ModifypasswordBloc({this.repository}) : super(InputDataModifypasswordState());

  final _previousState = <ModifypasswordState>[];

  @override
  void onTransition(Transition<ModifypasswordEvent, ModifypasswordState> transition) {
    _previousState.add(transition.currentState);
    super.onTransition(transition);
  }

  final _logger = Logger();
  @override
  Stream<ModifypasswordState> mapEventToState(
    ModifypasswordEvent event,
  ) async* {
    if (event is ModifyPasswordChanged) {
      yield (state as InputDataModifypasswordState)
          .copyWith(password: event.password, isPasswordValid: _passwordRegexp.hasMatch(event.password));
    } else if (event is ModifyPasswordToken) {
      yield (state as InputDataModifypasswordState).copyWith(
          verificationToken: event.verificationToken, isTokenValid: _passwordRegexp.hasMatch(event.verificationToken));
    } else if (event is ClearModifyPassword) {
      yield InputDataModifypasswordState(password: '', verificationToken: '');
    } else if (event is FormSubmitModifyPassword) {
      yield LoadinglModifypasswordState();
      final modifypassword = _previousState.whereType<InputDataModifypasswordState>().last;
      try {
        _logger.i(
            '${modifypassword.isPasswordValid.toString() + modifypassword.password + modifypassword.isTokenValid.toString() + modifypassword.verificationToken}');
        final response = await repository.modifyPassword(
            modifyPassword:
                ModifyPassword(password: modifypassword.password, verificationToken: modifypassword.verificationToken));
        _logger.i(response);
        if (response.status == 200) {
          yield modifypassword.copyWith(
            message: response.status.toString(),
          );
        } else {
          yield modifypassword.copyWith(message: '400');
        }
      } catch (e) {
        yield modifypassword.copyWith(
            message: BasicResponse(message: AppDioErrorHandling().handleError(e), status: 400).message);
      }
    }
    //  else if (event is TriggerModifyPasswordTokenApi) {
    //   final user = await repository.retrieveAzapayUser();
    //   final response = await repository.acquireResetToken(azaTag: '${user.tag}');
    //   if (response.status == 200) {
    //     yield (state as InputDataModifypasswordState).copyWith(
    //         verificationToken: response.data.verificationToken,
    //         isTokenValid: _passwordRegexp.hasMatch(response.data.verificationToken));
    //   }
    // }
  }
}
