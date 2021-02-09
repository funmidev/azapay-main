import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter_freshchat/flutter_freshchat.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universal_platform/universal_platform.dart';

part 'signin_event.dart';
part 'signin_state.dart';
part 'signin_bloc.freezed.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final Repository repository;
  final _logger = Logger();
  SigninBloc({this.repository}) : super(InputDataSigninState());

  final _previousState = <SigninState>[];

  @override
  void onTransition(Transition<SigninEvent, SigninState> transition) {
    _previousState.add(transition.currentState);
    super.onTransition(transition);
  }

  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is SignInTagChanged) {
      yield (state as InputDataSigninState).copyWith(azatag: event.azatag);
    } else if (event is SignInPasswordChanged) {
      yield (state as InputDataSigninState).copyWith(password: event.password);
    } else if (event is FormSubmittedSignIn) {
      yield LoadingSigninState();
      final signin = _previousState.whereType<InputDataSigninState>().last;
      try {
        var deviceid = AppStrings.empty;
        if (UniversalPlatform.isAndroid) {
          deviceid = await repository.getDeviceId();
        }
        final response = await repository.signIn(
            signIn: SignIn(tag: '${signin.azatag}', password: signin.password, device: deviceid));
        //_logger.e(response.message);
        //todo: store inside hivedb user
        if (response.status == 200) {
          // _logger.e(response.token);
          await repository.addAzapayUser(
              signIn: SignIn(tag: '${signin.azatag}', password: signin.password, device: deviceid));
          await InMemoryTokenHiveStorage().write(response.token);
          // final user = await FreshchatUser.initial();
          // user.id = signin.azatag;
          // user.email = '${signin.azatag}@azapay.com.ng';
          // user.firstName = signin.azatag;
          // user.lastName = signin.azatag;
          // user.phoneCountryCode = '+234';
          // user.phone = '';

          // await FlutterFreshchat.updateUserInfo(user: user);
          // final newRestoreId = await FlutterFreshchat.identifyUser(externalID: user.id);
          // await repository.addfreshcharestoreId(restoreID: newRestoreId);
          yield signin.copyWith(basicResponse: response);
        } else {
          yield signin.copyWith(basicResponse: response);
        }
      } catch (e) {
        yield signin.copyWith(
          basicResponse: BasicResponse<String>(
            message: AppDioErrorHandling().handleError(e),
            status: 400,
          ),
        );
      }
    } else if (event is ClearSigninForm) {
      if (state is InputDataSigninState) {
        yield (state as InputDataSigninState).copyWith(basicResponse: BasicResponse<String>(status: 100, message: ''));
      } else {
        yield InputDataSigninState();
      }
    }
  }
}
