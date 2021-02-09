import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universal_platform/universal_platform.dart';

part 'sendandrequest_event.dart';
part 'sendandrequest_state.dart';
part 'sendandrequest_bloc.freezed.dart';

class SendandrequestBloc extends Bloc<SendandrequestEvent, SendandrequestState> {
  final Repository repository;
  final _logger = Logger();
  final CancelToken cancelToken;
  SendandrequestBloc({this.repository, this.cancelToken}) : super(InputDataFundState());

  final _previousState = <SendandrequestState>[];
  @override
  void onTransition(Transition<SendandrequestEvent, SendandrequestState> transition) {
    // print(transition.toString());
    _previousState.add(transition.currentState);
    super.onTransition(transition);
  }

  @override
  Stream<SendandrequestState> mapEventToState(
    SendandrequestEvent event,
  ) async* {
    yield* event.map(addnote: (note) async* {
      if (state is InputDataFundState) {
        yield (state as InputDataFundState).copyWith(note: note.note);
      }
    }, clientid: (clientwithorimage) async* {
      if (state is InputDataFundState) {
        yield (state as InputDataFundState).copyWith(client: clientwithorimage.clientid);
      }
    }, contacts: (input) async* {
      if (UniversalPlatform.isWeb) {
        yield InputDataFundState().copyWith(amount: input.amount, screen: input.screen);
        // print('Hi');
      } else {
        if (await Permission.contacts.isGranted) {
          final contacts = await ContactsService.getContacts();
          // _logger.i(repository.retrieveDeviceContacts().length);
          if (contacts.length == repository.retrieveDeviceContacts().length) {
            yield InputDataFundState().copyWith(
                devicecontact: repository.retrieveDeviceContacts(),
                isContactFetched: true,
                contacts: repository.retrieveRecentContacts(),
                amount: input.amount,
                screen: input.screen);
            return;
          }
          await repository.addDeviceContacts(contacts: contacts.toList());
          yield InputDataFundState().copyWith(
              devicecontact: repository.retrieveDeviceContacts(),
              isContactFetched: true,
              contacts: repository.retrieveRecentContacts(),
              amount: input.amount,
              screen: input.screen);
        } else if (await Permission.contacts.isRestricted || await Permission.contacts.isPermanentlyDenied) {
          await openAppSettings();

          final contacts = await ContactsService.getContacts();
          if (contacts.length == repository.retrieveDeviceContacts().length) {
            yield InputDataFundState().copyWith(
                devicecontact: repository.retrieveDeviceContacts(),
                isContactFetched: true,
                contacts: repository.retrieveRecentContacts(),
                amount: input.amount,
                screen: input.screen);
            return;
          }
          await repository.addDeviceContacts(contacts: contacts.toList());
          yield InputDataFundState().copyWith(
              devicecontact: repository.retrieveDeviceContacts(),
              isContactFetched: true,
              contacts: repository.retrieveRecentContacts(),
              amount: input.amount,
              screen: input.screen);
        } else if (await Permission.contacts.isUndetermined) {
          final status = await Permission.contacts.request();
          if (status.isGranted) {
            final contacts = await ContactsService.getContacts();
            if (contacts.length == repository.retrieveDeviceContacts().length) {
              yield InputDataFundState().copyWith(
                  devicecontact: repository.retrieveDeviceContacts(),
                  isContactFetched: true,
                  contacts: repository.retrieveRecentContacts(),
                  amount: input.amount,
                  screen: input.screen);
              return;
            }
            await repository.addDeviceContacts(contacts: contacts.toList());
            yield InputDataFundState().copyWith(
                devicecontact: repository.retrieveDeviceContacts(),
                isContactFetched: true,
                contacts: repository.retrieveRecentContacts(),
                amount: input.amount,
                screen: input.screen);
          }
        } else if (await Permission.contacts.isDenied) {
          final status = await Permission.contacts.request();
          if (status.isGranted) {
            final contacts = await ContactsService.getContacts();
            if (contacts.length == repository.retrieveDeviceContacts().length) {
              yield InputDataFundState().copyWith(
                  devicecontact: repository.retrieveDeviceContacts(),
                  isContactFetched: true,
                  contacts: repository.retrieveRecentContacts(),
                  amount: input.amount,
                  screen: input.screen);
              return;
            }
            await repository.addDeviceContacts(contacts: contacts.toList());
            yield InputDataFundState().copyWith(
              devicecontact: repository.retrieveDeviceContacts(),
              isContactFetched: true,
              contacts: repository.retrieveRecentContacts(),
              amount: input.amount,
              screen: input.screen,
            );
          }
        }
      }
    }, isRadioSelectedPhoneNumber: (selecteditem) async* {
      yield (state as InputDataFundState).copyWith(isRadioSelectedPhoneNumber: selecteditem.selecteditem);
    }, isContactFetched: (fetched) async* {
      yield (state as InputDataFundState).copyWith(isContactFetched: fetched.fetched);
    }, submit: (submit) async* {
      yield LoadingFundState();
      //Two ways
      final inputstatetTransisiton = _previousState.whereType<InputDataFundState>().last;
      final inputState = (state as InputDataFundState);
      // print(inputState.client);
      // print(inputState.amount);
      // print(repository.retrievePin().pin);
      // print(inputState.note);
      if (inputState.screen) {
        try {
          final response = await repository.transferToUser(
              fundTransfer: FundTransfer(
                  amount: inputState.amount,
                  userId: inputState.client,
                  note: inputState.note ?? AppStrings.empty,
                  transactionPin: repository.retrievePin()?.pin ?? submit.pin),
              cancelToken: cancelToken);
          // _logger.i(response);
          if (response.status == 200) {
            await repository.addRecentContacts(contacts: Contacts(client: inputState.client));
            yield inputstatetTransisiton.copyWith(success: response.status, responsemessage: response.message);
          } else {
            await repository.addRecentContacts(contacts: Contacts(client: inputState.client));
            yield inputstatetTransisiton.copyWith(error: response.status, responsemessage: response.message);
          }
        } catch (e) {
          await repository.addRecentContacts(contacts: Contacts(client: inputState.client));
          yield inputstatetTransisiton.copyWith(
              responsemessage: BasicResponse(
                message: AppDioErrorHandling().handleError(e),
                status: 400,
              ).message,
              error: 400);
        }

        //todo:return sucesssstate or error stateerror with response
      } else {
        try {
          final response = await repository.makeFundRequest(
              fundRequest: FundRequest(
                amount: inputState.amount,
                to: inputState.client,
              ),
              cancelToken: cancelToken);
          if (response.status == 200) {
            await repository.addRecentContacts(contacts: Contacts(client: inputState.client));
            yield inputstatetTransisiton.copyWith(success: response.status, responsemessage: response.message);
          } else {
            await repository.addRecentContacts(contacts: Contacts(client: inputState.client));
            yield inputstatetTransisiton.copyWith(error: response.status, responsemessage: response.message);
          }
        } catch (e) {
          await repository.addRecentContacts(contacts: Contacts(client: inputState.client));
          yield inputstatetTransisiton.copyWith(
              responsemessage: BasicResponse(
                message: AppDioErrorHandling().handleError(e),
                status: 400,
              ).message,
              error: 400);
        }
        //todo:return sucesssstate or error stateerror with response
      }
    }, clear: (exit) async* {
      // cancelToken.cancel('Fund cancelled');
      if (exit.exit) {
        if (state is InputDataFundState) {
          yield (state as InputDataFundState)
              .copyWith(client: '', amount: 0.00, note: '', error: 100, responsemessage: '', success: 100);
        } else {
          yield InputDataFundState();
          yield LoadingFundState();
        }
      } else {
        if (state is InputDataFundState) {
          yield (state as InputDataFundState).copyWith(error: 100, responsemessage: '', success: 100);
        } else {
          yield InputDataFundState();
          yield LoadingFundState();
        }
      }

      // yield InitialFundState();
    });
  }
}
