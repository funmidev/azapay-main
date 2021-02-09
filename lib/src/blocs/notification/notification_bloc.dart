import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final Repository repository;
  final TransactionpinBloc transactionpinBloc;
  final _logger = Logger();
  StreamSubscription transactionBlocStream;

  NotificationBloc({this.repository, this.transactionpinBloc}) : super(NotificationInitial());

  final _previousState = <NotificationState>[];
  @override
  void onTransition(Transition<NotificationEvent, NotificationState> transition) {
    _previousState.add(transition.currentState);
    //print(transition.currentState);
    super.onTransition(transition);
  }

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is FetchFundRequest) {
      if (!event.refresh) {
        yield NotificationLoading();
      }
      try {
        final response = await repository.listAllFundRequest();
        if (repository.retrieveFundRequest().isNotEmpty &&
            repository.retrieveFundRequest().length > response.data.length) {
          yield NotificationLoaded().copyWith(
              fundrequestlist: repository.retrieveFundRequest().reversed.toList(),
              refFund: repository.retrieveUpdatedRefActionPerformed().reversed.toList());
        } else {
          _logger.i(response.data);
          if (response.status == 200) {
            await repository.addfundRequest(funds: response.data);
            yield NotificationLoaded().copyWith(
                fundrequestlist: repository.retrieveFundRequest().reversed.toList(),
                refFund: repository.retrieveUpdatedRefActionPerformed().reversed.toList());
          } else {
            yield NotificationLoaded().copyWith(fundrequestlist: [], refFund: []);
          }
        }
      } catch (e) {
        if (repository.retrieveFundRequest().isNotEmpty) {
          yield NotificationLoaded().copyWith(
              fundrequestlist: repository.retrieveFundRequest().reversed.toList(),
              refFund: repository.retrieveUpdatedRefActionPerformed().reversed.toList());
        } else {
          yield NotificationError();
        }
        // else {
        //   yield NotificationLoaded().copyWith(
        //       responsemessage: BasicResponse(
        //         message: AppDioErrorHandling().handleError(e),
        //         status: 400,
        //       ).message,
        //       error: 400);
        // }
      }
    } else if (event is ApproveFundRequest) {
      yield NotificationLoading();
      final notification = _previousState.whereType<NotificationLoaded>().last;
      // transactionpinBloc.listen((state) async* {
      //print(transactionpinBloc.state);
      if (transactionpinBloc.state is TransactionpinChecked) {
        if (event.ref.isNotEmpty) {
          try {
            final response = await repository.approveRequest(
                approverequest: ApproveRequest(
              ref: event.ref,
              transactionPin: repository.retrievePin().pin,
            ));
            if (response.status == 200) {
              await transactionBlocStream.cancel();
              await repository.updateRefIfActionPerformed(ref: event.ref, actionperformed: true);
              yield notification.copyWith(
                  fundrequest: response.data, success: response.status, responsemessage: response.message);
            }
          } catch (e) {
            // await transactionBlocStream.cancel();
            yield notification.copyWith(
                fundrequest: Fund(
                  status: '400',
                ),
                responsemessage: BasicResponse(
                  message: AppDioErrorHandling().handleError(e),
                  status: 400,
                ).message,
                error: 400);
          }
        }
      }
      // });
    } else if (event is DeclineFundRequest) {
      yield NotificationLoading();
      final notification = _previousState.whereType<NotificationLoaded>().last;
      //print(transactionpinBloc.state);
      if (transactionpinBloc.state is TransactionpinChecked) {
        try {
          final response = await repository.declineRequest(
            ref: event.ref,
          );
          if (response.status == 200) {
            await repository.updateRefIfActionPerformed(ref: event.ref, actionperformed: true);
            yield notification.copyWith(
                fundrequest: response.data, success: response.status, responsemessage: response.message);
          }
        } catch (e) {
          yield notification.copyWith(
              fundrequest: Fund(
                status: '400',
              ),
              responsemessage: BasicResponse(
                message: AppDioErrorHandling().handleError(e),
                status: 400,
              ).message,
              error: 400);
        }
      }
    } else if (event is CancelFundRequest) {
      yield NotificationLoading();
      final notification = _previousState.whereType<NotificationLoaded>().last;
      //print(transactionpinBloc.state);
      if (transactionpinBloc.state is TransactionpinChecked) {
        try {
          final response = await repository.cancelFundRequest(
            ref: event.ref,
          );
          if (response.status == 200) {
            await repository.updateRefIfActionPerformed(ref: event.ref, actionperformed: true);
            yield notification.copyWith(
                fundrequest: response.data, success: response.status, responsemessage: response.message);
          }
        } catch (e) {
          yield notification.copyWith(
              fundrequest: Fund(
                status: '400',
              ),
              responsemessage: BasicResponse(
                message: AppDioErrorHandling().handleError(e),
                status: 400,
              ).message,
              error: 400);
        }
      }
    } else if (event is TickAsReadFundNotification) {
      await repository.updateRefIfActionPerformed(ref: event.ref, actionperformed: true);
    } else if (event is ClearNotificationResponse) {
      // final notification = _previousState.whereType<NotificationLoaded>().last;
      if (state is NotificationLoaded) {
        yield (state as NotificationLoaded)
            .copyWith(success: 100, error: 100, responsemessage: '', fundrequest: Fund());
      }
    }
  }
}
