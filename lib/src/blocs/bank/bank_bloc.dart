import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_event.dart';
part 'bank_state.dart';
part 'bank_bloc.freezed.dart';

class BankBloc extends Bloc<BankEvent, BankState> {
  final Repository repository;
  final _logger = Logger();
  final CancelToken cancelToken;
  BankBloc({this.repository, this.cancelToken}) : super(BankInitial());

  final _previousState = <BankState>[];
  @override
  void onTransition(Transition<BankEvent, BankState> transition) {
    _previousState.add(transition.currentState);
    // print(transition.currentState);
    super.onTransition(transition);
  }

  @override
  Stream<BankState> mapEventToState(
    BankEvent event,
  ) async* {
    if (event is FetchListBank) {
      // if (state is BankLoaded) {
      if (repository.retrieveBanks().isNotEmpty) {
        yield BankLoaded().copyWith(banklist: repository.retrieveBanks());
      } else {
        try {
          final response = await repository.retrieveBankList();
          await repository.addBanks(bankList: response);
          if (response.isNotEmpty) {
            if (state is BankLoaded) {
              yield BankLoaded().copyWith(banklist: repository.retrieveBanks());
            } else {
              yield (state as BankLoaded).copyWith(banklist: repository.retrieveBanks());
            }
          }
        } catch (e) {
          _logger.i(e);
        }
      }
      // } else {
      //   try {
      //     final response = await repository.retrieveBankList();
      //     if (response.isNotEmpty) {
      //       yield BankLoaded().copyWith(banklist: response);
      //     }
      //   } catch (e) {
      //     final response = await repository.retrieveBankList();
      //     if (response.isNotEmpty) {
      //       yield BankLoaded().copyWith(banklist: response);
      //     }
      //   }
      // }
    } else if (event is FetchLinkBank) {
      try {
        final linkbanks = await repository.retrieveLinkBankToWalletList();
        if (state is BankLoaded) {
          yield (state as BankLoaded).copyWith(linkbank: linkbanks);
        } else {
          yield BankLoaded().copyWith(linkbank: linkbanks);
        }
      } catch (e) {
        _logger.i(e);
      }
    } else if (event is SubmitLinkBankAccount) {
      yield BankLoading();
      final banking = _previousState.whereType<BankLoaded>().last;

      if (event.option == 0) {
        //todo: api for link bank
        try {
          final linkbankResponse = await repository.createLinkBankToWallet(
              linkBankAccount: LinkBankAccount(
                  accountName: banking.acctname,
                  accountNo: banking.acctnumber,
                  accountType: banking.bankaccountType ?? '',
                  bankCode: banking.bankcode,
                  bankName: banking.bankname));
          if (linkbankResponse.status == 200) {
            yield banking.copyWith(responsemessage: linkbankResponse.message, success: linkbankResponse.status);
          } else {
            yield banking.copyWith(responsemessage: linkbankResponse.message, error: linkbankResponse.status);
          }
        } catch (e) {
          yield banking.copyWith(
              responsemessage: BasicResponse(
                message: AppDioErrorHandling().handleError(e),
                status: 400,
              ).message,
              error: 400);
          _logger.i(e);
        }
      } else {
        // print(repository.retrievePin().pin ?? event.pin.toString());
        print(repository.retrievePin()?.pin ?? event.pin);
        try {
          final makeBankTransferResponse = await repository.transferToAccount(
              fundTransfer: FundTransfer(
                account: banking.acctnumber,
                bankCode: banking.bankcode,
                bankName: banking.bankname,
                amount: double.parse(banking.amount),
                transactionPin: repository.retrievePin()?.pin ?? event.pin,
                note: banking.note ?? '',
              ),
              cancelToken: cancelToken);
          if (makeBankTransferResponse.status == 200) {
            _logger.i(makeBankTransferResponse.status);
            yield banking.copyWith(
                responsemessage: makeBankTransferResponse.message, success: makeBankTransferResponse.status);
          } else {
            _logger.i(makeBankTransferResponse.status);
            yield banking.copyWith(
                responsemessage: makeBankTransferResponse.message, error: makeBankTransferResponse.status);
          }
        } catch (e) {
          yield banking.copyWith(
              responsemessage: BasicResponse(
                message: AppDioErrorHandling().handleError(e),
                status: 400,
              ).message,
              error: 400);
          _logger.i(e);
        }
        //todo: api for make transfer
      }
    } else if (event is IsRadioSelectedBank) {
      yield (state as BankLoaded).copyWith(isRadioSelectedBank: event.selecteditem);
    } else if (event is IsRadioSelectedAccountType) {
      yield (state as BankLoaded).copyWith(isRadioSelectedAccountType: event.selecteditem);
    } else if (event is BankId) {
      yield (state as BankLoaded).copyWith(bankcode: event.bankcode);
    } else if (event is BankAccountType) {
      yield (state as BankLoaded).copyWith(bankaccountType: event.accountType);
    } else if (event is AccountNumber) {
      final response = await repository.retrieveAcquireEnquiry(bankcode: event.bankcode, account: event.number);
      if (response.status == 200) {
        yield (state as BankLoaded)
            .copyWith(acctnumber: event.number, acctname: response.data.name, bankaccountType: response.data.type);
      } else {
        yield (state as BankLoaded).copyWith(acctname: response.message);
      }
    } else if (event is AccountName) {
      yield (state as BankLoaded).copyWith(acctname: event.name);
    } else if (event is TransferNote) {
      yield (state as BankLoaded).copyWith(note: event.note);
    } else if (event is TransferAmount) {
      print(event.amount);
      yield (state as BankLoaded).copyWith(amount: event.amount);
    } else if (event is ClearBankForm) {
      // cancelToken.cancel('Transfer cancelled');
      if (state is BankLoaded) {
        yield (state as BankLoaded).copyWith(
            acctname: '',
            acctnumber: '',
            note: '',
            amount: '',
            responsemessage: AppStrings.empty,
            // banklist: [],
            success: 100,
            error: 100);
      }
    } else if (event is BankName) {
      yield (state as BankLoaded).copyWith(bankname: event.bankname);
    } else if (event is SearchBankList) {
      yield (state as BankLoaded).copyWith(searchtext: event.search);
    }
  }
}
