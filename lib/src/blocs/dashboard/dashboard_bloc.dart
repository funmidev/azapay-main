import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final Repository repository;
  final ProfileBloc profileBloc;
  final WalletBloc walletBloc;
  final NotificationBloc notificationBloc;
  final GlobalKey<NavigatorState> navigatorState;
  StreamSubscription profileSubscription, walletSubscription, notificationSubscription;

  final _logger = Logger();
  DashboardBloc({this.repository, this.profileBloc, this.walletBloc, this.notificationBloc, this.navigatorState})
      : super(DashboardState.initial()) {
    final profileDetails = repository.retrievePersonalData();
    // print(profileDetails);
    if (profileDetails == null) {
      profileBloc.add(UpdateProfile());
    } else {
      if (profileDetails.bvn) {
        profileBloc.add(FetchProfile());
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigatorState.currentState.pushNamed(AppRouteName.completeprofile);
        });
      }
    }
  }

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if (event is InputAmount) {
      yield state.copyWith(amount: state.amount += event.amount);
    } else if (event is DeleteAmount) {
      yield state.copyWith(
          amount: state.amount.isNotEmpty ? state.amount.substring(0, state.amount.length - 1) : state.amount);
    } else if (event is CurrentBottomNavigationPosition) {
      yield state.copyWith(position: event.position);
    } else if (event is CompleteProfileDash) {
      yield state.copyWith(completeprofile: event.completeprofile);
    } else if (event is Fetch) {
      if (repository.retrieveAzapayUser() != null) {
        Future.delayed(Duration(seconds: 2), () {
          walletBloc.add(WalletPage());
        });
        walletSubscription = walletBloc.listen(
          (state) async {
            if (state is WalletStateLoaded) {
              _logger.i(state.wallet.data.balance);
              await profileBloc.add(UpdateProfile());
            }
          },
        );
      }
    }
  }
}
