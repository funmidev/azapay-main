import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_platform/universal_platform.dart';

part 'signup_bloc.freezed.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final Repository repository;

  final RegExp _emailRegexp = RegExp(r'^(\w|\W)+@(\w+[.]\w+)*$');
  final RegExp _phonenoRegexp = RegExp(r'^([0-9]+){11}$');
  final RegExp _nameRegexp = RegExp(r'^(\w|\W)+');
  final RegExp _otpRegexp = RegExp(r'^(\w|\W){6,}$');
  final RegExp _passwordRegexp = RegExp(r'^([0-9]+){6,}$');

  final _logger = Logger();

  SignupBloc({this.repository}) : super(SignupLoaded());
  final _previousState = <SignupState>[];
  @override
  void onTransition(Transition<SignupEvent, SignupState> transition) {
    _previousState.add(transition.currentState);
    super.onTransition(transition);
  }

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is ReturnToInitial) {
      yield (state as SignupLoaded).copyWith(
        basicResponse: BasicResponse(status: 100),
        signUp: SignUp(status: 100),
      );
    } else if (event is EmailSignUp) {
      yield (state as SignupLoaded).copyWith(
        email: event.email,
        isEmailValid: _emailRegexp.hasMatch(event.email),
      );
    } else if (event is PhonenoSignUp) {
      yield (state as SignupLoaded).copyWith(
        phoneno: event.phoneno,
        isPhonenoValid: _phonenoRegexp.hasMatch(event.phoneno),
      );
    } else if (event is OtpCodeSignUp) {
      yield (state as SignupLoaded).copyWith(
        otpcode: event.otpcode,
        isOtpcodeValid: _otpRegexp.hasMatch(event.otpcode),
      );
    } else if (event is FirstNameSignUp) {
      // print(event.firstname);
      yield (state as SignupLoaded).copyWith(
        firstname: event.firstname,
        isFirstnameValid: _nameRegexp.hasMatch(event.firstname),
      );
    } else if (event is LastNameSignUp) {
      // print(event.lastname);
      yield (state as SignupLoaded).copyWith(
        lastname: event.lastname,
        isLastnameValid: _nameRegexp.hasMatch(event.lastname),
      );
    } else if (event is PasswordSignUp) {
      yield (state as SignupLoaded).copyWith(
        password: event.password,
        isPasswordValid: _passwordRegexp.hasMatch(event.password),
      );
    } else if (event is AzaTagSignUp) {
      yield (state as SignupLoaded).copyWith(
        azatag: event.azatag,
      );
    } else if (event is ResendOtpSignUp) {
      final signup = _previousState.whereType<SignupLoaded>().last;
      await repository.resendOtp(phonenumber: signup.phoneno);
    } else if (event is SubmitSignUpForm) {
      yield SignupLoading();
      final signup = _previousState.whereType<SignupLoaded>().last;
      print(UniversalPlatform.isWeb ? 'MERCHANT' : 'CLIENT');
      if (state is SignupLoading) {
        switch (event.screen) {
          case 0:
            try {
              final response = await Repository().createSign(
                createSignUp: CreateSignUp(
                  email: signup.email,
                  phone: signup.phoneno,
                  role: UniversalPlatform.isWeb ? 'MERCHANT' : 'CLIENT',
                ),
              );
              if (response.status == 200) {
                yield signup.copyWith(signUp: SignUp(status: 200));
              } else {
                yield signup.copyWith(signUp: response);
              }
            } catch (e) {
              yield signup.copyWith(
                basicResponse: BasicResponse(
                    message: AppDioErrorHandling().handleError(e), status: 400),
              );
            }

            break;

          case 1:
            try {
              final response = await repository.verifyOtp(
                  otpVerify:
                      OtpVerify(token: signup.otpcode, phone: signup.phoneno));

              if (response.status == 200) {
                yield signup.copyWith(basicResponse: response);
              } else {
                yield signup.copyWith(
                    basicResponse: BasicResponse(status: 400));
              }
            } catch (e) {
              yield signup.copyWith(
                basicResponse: BasicResponse(
                    message: AppDioErrorHandling().handleError(e), status: 400),
              );
            }
            break;

          case 2:
            try {
              final response = await repository.createFullName(
                  createAccountFullName: CreateAccountFullName(
                      firstName: signup.firstname,
                      lastName: signup.lastname,
                      phone: signup.phoneno));

              if (response.status == 200) {
                yield signup.copyWith(basicResponse: response);
              } else {
                yield signup.copyWith(
                    basicResponse: BasicResponse(status: 400));
              }
            } catch (e) {
              yield signup.copyWith(
                basicResponse: BasicResponse(
                    message: AppDioErrorHandling().handleError(e), status: 400),
              );
            }
            break;

          case 3:
            try {
              final response = await repository.createAccountPassword(
                  createAccountPasword: CreateAccountPasword(
                password: signup.password,
                phone: signup.phoneno,
              ));
              if (response.status == 200) {
                yield signup.copyWith(basicResponse: response);
              } else {
                yield signup.copyWith(
                    basicResponse: BasicResponse(status: 400));
              }
            } catch (e) {
              yield signup.copyWith(
                basicResponse: BasicResponse(
                    message: AppDioErrorHandling().handleError(e), status: 400),
              );
            }
            break;

          case 4:
            try {
              final response = await repository.createTag(
                  createTag: CreateTag(
                      tag: '${signup.azatag}', phone: signup.phoneno));
              final deviceid = await repository.getDeviceId();

              // todo: store azatag , password, deviceid in hivedb sign in --- Done
              // _logger.i(response);
              if (response.status == 200) {
                await repository.addAzapayUser(
                    signIn: SignIn(
                        tag: '${signup.azatag}',
                        password: signup.password,
                        // device: deviceid
                        device: "190-system-08085303817"));

                print('MerchantToken13 ' + response.token);
                // await _dbprovider.addToken(basicResponse: response);
                var prefs = await SharedPreferences.getInstance();
                await prefs.setString('userToken', response.token);
                yield signup.copyWith(basicResponse: response);
                // _logger.e(response.message);
              } else {
                // _logger.e(response.message);
                yield signup.copyWith(
                    basicResponse:
                        BasicResponse(status: 400, message: response.message));
              }
            } catch (e) {
              _logger.e(e);
              yield signup.copyWith(
                basicResponse: BasicResponse(
                    message: AppDioErrorHandling().handleError(e), status: 400),
              );
            }
            break;
        }
      }
    }
  }
}
