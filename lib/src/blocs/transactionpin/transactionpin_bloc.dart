import 'dart:async';
import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

part 'transactionpin_event.dart';
part 'transactionpin_state.dart';
part 'transactionpin_bloc.freezed.dart';

class TransactionpinBloc extends Bloc<TransactionpinEvent, TransactionpinState> {
  final Repository repository;
  final _logger = Logger();

  TransactionpinBloc({this.repository}) : super(TransactionpinInitial());

  final _previousState = <TransactionpinState>[];
  @override
  void onTransition(Transition<TransactionpinEvent, TransactionpinState> transition) {
    //print(transition.toString());
    _previousState.add(transition.currentState);
    super.onTransition(transition);
  }

  @override
  Stream<TransactionpinState> mapEventToState(
    TransactionpinEvent event,
  ) async* {
    if (event is CheckTransactionPin) {
      yield TransactionpinLoading();
      final transactionPin = repository.retrievePin();
      if (event.pin == transactionPin.pin) {
        yield TransactionpinChecked(transactionPin: TransactionPin(pin: event.pin));
      } else {
        yield TransactionpinError(responsemessage: AppStrings.failedTransactPinSubTile);
        yield ConfirmTransactionPinInDB(pinconfirmation: 1);
      }
    } else if (event is SetTransactionPin) {
      // if(event.pin)
      // 08107926083
      yield TransactionpinLoading();
      final inputstatetTransisiton = _previousState.whereType<TransactionpinLoaded>().last;
      try {
        final response = await repository.setTransactionPinOnApi(
          transactionPin: TransactionPin(
            pin: inputstatetTransisiton.pin,
            verificationToken: inputstatetTransisiton.verificationToken,
          ),
        );

        if (response.status == 200) {
          //_logger.i(response.message);
          await repository.setTransactionPin(transactionPin: TransactionPin(pin: inputstatetTransisiton.pin));
          yield TransactionpinChecked(transactionPin: TransactionPin(pin: inputstatetTransisiton.pin));
          yield ConfirmTransactionPinInDB(pinconfirmation: 0);
        } else {
          yield TransactionpinError(responsemessage: response.message);
          yield ConfirmTransactionPinInDB(pinconfirmation: 0);
          //_logger.i(response.message);
        }
      } catch (e) {
        _logger.i(e);
      }
    } else if (event is ClearTransactionPin) {
      yield TransactionpinInitial();
    } else if (event is ConfirmTransactionPin) {
      switch (event.change) {
        case 0:
          yield ConfirmTransactionPinInDB(pinconfirmation: repository.retrievePin() == null ? 0 : 1);
          break;
        case 1:
          //setttings page
          yield ConfirmTransactionPinInDB(pinconfirmation: 0);
      }
    } else if (event is TransactionPinInput) {
      if (event.pinOrverificationToken == 0) {
        yield TransactionpinLoaded().copyWith(pin: event.pin);
        await repository.getTransactionPinToken();
        // //_logger.i(response.status);
      } else {
        yield (state as TransactionpinLoaded).copyWith(verificationToken: event.verificationToken);
      }
    }
  }
}
