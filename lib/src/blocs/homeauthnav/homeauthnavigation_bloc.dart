import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'homeauthnavigation_event.dart';
part 'homeauthnavigation_state.dart';

class HomeauthnavigationBloc
    extends Bloc<HomeauthnavigationEvent, HomeauthnavigationState> {
  final Repository repository;
  final GlobalKey<NavigatorState> navigatorState;
  final _logger = Logger();
  HomeauthnavigationBloc({this.repository, this.navigatorState})
      : super(HomeauthnavigationInitial()) {
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      // Got a new connectivity status!
      switch (result) {
        case ConnectivityResult.mobile:
          // I am connected to a mobile network, make sure there is actually a net connection.
          if (await DataConnectionChecker().hasConnection) {
            showToast(AppStrings.extractdeviceinfoRestoredContent,
                backgroundColor: ColorSets.colorPrimaryLightGreen,
                context: navigatorState.currentState.context,
                animation: StyledToastAnimation.slideFromRightFade,
                reverseAnimation: StyledToastAnimation.slideToRightFade,
                toastHorizontalMargin: 0.0,
                position: StyledToastPosition(
                    align: Alignment.topRight, offset: 20.0),
                startOffset: Offset(1.0, 0.0),
                reverseEndOffset: Offset(1.0, 0.0),
                animDuration: Duration(seconds: 1),
                duration: Duration(seconds: 10),
                curve: Curves.linearToEaseOut,
                reverseCurve: Curves.fastOutSlowIn);
            // Mobile data detected & internet connection confirmed.
            return true;
          } else {
            showToast(AppStrings.extractdeviceinfoContent,
                backgroundColor: ColorSets.colorPrimaryRed,
                context: navigatorState.currentState.context,
                animation: StyledToastAnimation.slideFromRightFade,
                reverseAnimation: StyledToastAnimation.slideToRightFade,
                toastHorizontalMargin: 0.0,
                position: StyledToastPosition(
                    align: Alignment.topRight, offset: 20.0),
                startOffset: Offset(1.0, 0.0),
                reverseEndOffset: Offset(1.0, 0.0),
                animDuration: Duration(seconds: 1),
                duration: Duration(seconds: 20),
                curve: Curves.linearToEaseOut,
                reverseCurve: Curves.fastOutSlowIn);
            // Mobile data detected but no internet connection found.
            return false;
          }
          break;
        case ConnectivityResult.wifi:
          // I am connected to a WIFI network, make sure there is actually a net connection.
          if (await DataConnectionChecker().hasConnection) {
            showToast(AppStrings.extractdeviceinfoRestoredContent,
                backgroundColor: ColorSets.colorPrimaryLightGreen,
                context: navigatorState.currentState.context,
                animation: StyledToastAnimation.slideFromRightFade,
                reverseAnimation: StyledToastAnimation.slideToRightFade,
                toastHorizontalMargin: 0.0,
                position: StyledToastPosition(
                    align: Alignment.topRight, offset: 20.0),
                startOffset: Offset(1.0, 0.0),
                reverseEndOffset: Offset(1.0, 0.0),
                animDuration: Duration(seconds: 1),
                duration: Duration(seconds: 10),
                curve: Curves.linearToEaseOut,
                reverseCurve: Curves.fastOutSlowIn);
            // Wifi detected & internet connection confirmed.
            return true;
          } else {
            showToast(AppStrings.extractdeviceinfoContent,
                backgroundColor: ColorSets.colorPrimaryRed,
                context: navigatorState.currentState.context,
                animation: StyledToastAnimation.slideFromRightFade,
                reverseAnimation: StyledToastAnimation.slideToRightFade,
                toastHorizontalMargin: 0.0,
                position: StyledToastPosition(
                    align: Alignment.topRight, offset: 20.0),
                startOffset: Offset(1.0, 0.0),
                reverseEndOffset: Offset(1.0, 0.0),
                animDuration: Duration(seconds: 1),
                duration: Duration(seconds: 20),
                curve: Curves.linearToEaseOut,
                reverseCurve: Curves.fastOutSlowIn);
            // Wifi detected but no internet connection found.
            return false;
          }

          break;
        default:
          showToast(AppStrings.extractdeviceinfoContent,
              backgroundColor: ColorSets.colorPrimaryRed,
              context: navigatorState.currentState.context,
              animation: StyledToastAnimation.slideFromRightFade,
              reverseAnimation: StyledToastAnimation.slideToRightFade,
              toastHorizontalMargin: 0.0,
              position:
                  StyledToastPosition(align: Alignment.topRight, offset: 20.0),
              startOffset: Offset(1.0, 0.0),
              reverseEndOffset: Offset(1.0, 0.0),
              animDuration: Duration(seconds: 1),
              duration: Duration(seconds: 20),
              curve: Curves.linearToEaseOut,
              reverseCurve: Curves.fastOutSlowIn);
          // Neither mobile data or WIFI detected, not internet connection found.
          return false;
      }
    });
  }

  @override
  Stream<HomeauthnavigationState> mapEventToState(
    HomeauthnavigationEvent event,
  ) async* {
    if (event is CheckNavigation) {
      try {
        // _logger.i(repository.getnavigation());
        if (repository.getnavigation()) {
          // yield HomeauthnavigationHome();
          final _signinorsignupaccountData =
              await repository.retrieveAzapayUser();
          final _switchaccountData =
              await repository.retrieveSwitchAzapayUser();

          if (_switchaccountData?.data != null) {
            yield HomeauthnavigationSwitchAccount(
                basicResponse: _switchaccountData);
          } else {
            yield HomeauthnavigationSwitchAccount(
                basicResponse: BasicResponse<String>(
                    data: _signinorsignupaccountData.tag));
          }
        } else {
          final deviceid = "190-system-09039300506";
          // final deviceid = await repository.getDeviceId();
          final response = await repository.extractDeviceInfo(device: deviceid);
          // _logger.i(response.status);
          if (response.status == 409) {
            yield HomeauthnavigationOnBoarding();
          } else {
            await repository.addSwitchAzapayUser(switchaccount: response);
            yield HomeauthnavigationSwitchAccount(basicResponse: response);
          }
        }
      } catch (e) {
        yield HomeauthnavigationError();
        _logger.e(e);
      }
    }
  }
}
