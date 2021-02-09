import 'dart:async';

import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';
part 'wallet_bloc.freezed.dart';

class WalletBloc extends HydratedBloc<WalletEvent, WalletState> {
  final Repository repository;
  final _logger = Logger();
  WalletBloc({this.repository}) : super(WalletStateInitial());

  @override
  void onTransition(Transition<WalletEvent, WalletState> transition) {
    //print(transition);
    super.onTransition(transition);
  }

  @override
  WalletState fromJson(Map<String, dynamic> json) {
    try {
      final wallet = Wallet.fromJson(json);
      return WalletStateLoaded(wallet: wallet);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(WalletState state) {
    try {
      if (state is WalletStateLoaded) {
        return state.wallet.toJson();
      }
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<WalletState> mapEventToState(
    WalletEvent event,
  ) async* {
    if (event is WalletPage) {
      if (!repository.getnavigation()) {
        //   //_logger.i('Added home navigation ');
        //   try {
        //     final wallet = await repository.openWallet();
        //     final recentcontacts = await repository.retrieveRecentContacts();
        //     yield WalletStateLoaded(wallet: wallet, contacts: recentcontacts ?? []);
        //     //_logger.i(wallet.data.balance);
        //   } catch (e) {
        //     //_logger.e(e);
        //   }
        // } else {
        await repository.addnavigation();
      }
      try {
        // final no =
        //     Future.wait([repository.createWallet(), repository.openWallet()]);
        await repository.createWallet();
        final wallet = await repository.openWallet();
        final recentcontacts = await repository.retrieveRecentContacts();
        _logger.i(wallet.message);
        yield WalletStateLoaded(wallet: wallet, contacts: recentcontacts ?? []);
      } catch (e) {
        _logger.e(e);
      }
      // }
    } else if (event is ResetWalletPage) {
      yield WalletStateLoaded();
      yield WalletStateInitial();
    } else if (event is WebWalletTransferSwitchPage) {
      yield (state as WalletStateLoaded).copyWith(transferswitch: event.transferswitch);
    }
  }
}
