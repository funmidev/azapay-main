import 'dart:async';
import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/resources/resources.dart';
// import 'package:barcode_scan/barcode_scan.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'qrscan_event.dart';
part 'qrscan_state.dart';
part 'qrscan_bloc.freezed.dart';

class QrscanBloc extends Bloc<QrscanEvent, QrscanState> {
  final Repository repository;
  final _logger = Logger();
  QrscanBloc({this.repository}) : super(QrScanInitial());

  final _previousState = <QrscanState>[];
  @override
  void onTransition(Transition<QrscanEvent, QrscanState> transition) {
    print(transition.toString());
    _previousState.add(transition.currentState);
    super.onTransition(transition);
  }

  @override
  Stream<QrscanState> mapEventToState(
    QrscanEvent event,
  ) async* {
    if (event is SendFundQrScan) {
      yield QrScanLoading();
      final qrscanstateTransisiton = _previousState.whereType<QrScanLoaded>().last;

      try {
        final response = await repository.transferToUser(
            fundTransfer: FundTransfer(
                amount: qrscanstateTransisiton.amount,
                userId: qrscanstateTransisiton.result,
                note: AppStrings.empty,
                transactionPin: repository.retrievePin().pin));
        // _logger.i(response);
        if (response.status == 200) {
          yield qrscanstateTransisiton.copyWith(success: response.status, responsemessage: response.message);
        } else {
          yield qrscanstateTransisiton.copyWith(error: response.status, responsemessage: response.message);
        }
      } catch (e) {
        yield qrscanstateTransisiton.copyWith(
            responsemessage: BasicResponse(
              message: AppDioErrorHandling().handleError(e),
              status: 400,
            ).message,
            error: 400);
      }
    } else if (event is QrScanAmount) {
      yield QrScanLoaded().copyWith(amount: event.amount, screen: event.screen);
      // try {
      //   var result = await BarcodeScanner.scan();
      //   // _logger.i(result);
      //   if (result.type == ResultType.Barcode) {
      //     // _logger.i(result.rawContent);
      //
      //   } else if (result.type == ResultType.Error) {
      //     // yield QrScanLoaded().copyWith(error: 400, responsemessage: result.rawContent);
      //   }
      // } on PlatformException catch (e) {
      //   var result = ScanResult(
      //     type: ResultType.Error,
      //     format: BarcodeFormat.unknown,
      //   );
      //   if (e.code == BarcodeScanner.cameraAccessDenied) {
      //     result.rawContent = 'The user did not grant the camera permission!';
      //     // yield QrScanLoaded().copyWith(error: 400, responsemessage: result.rawContent);
      //   } else {
      //     result.rawContent = 'Unknown error: $e';
      //     // yield QrScanLoaded().copyWith(error: 400, responsemessage: result.rawContent);
      //   }
      // }
    } else if (event is QrScanResult) {
      if (event.result is List<Barcode>) {
        for (Barcode barcode in event.result) {
          // final Rectangle<int> boundingBox = barcode.boundingBox;
          // final List<Point<int>> cornerPoints = barcode.cornerPoints;

          final rawValue = barcode.rawValue;
          _logger.i(rawValue);
          yield (state as QrScanLoaded).copyWith(result: rawValue);

          // final BarcodeValueType valueType = barcode.valueType;

          // // See API reference for complete list of supported types
          // switch (valueType) {
          //   case BarcodeValueType.wifi:
          //     final String ssid = barcode.wifi.ssid;
          //     final String password = barcode.wifi.password;
          //     final BarcodeWiFiEncryptionType type = barcode.wifi.encryptionType;
          //     break;
          //   case BarcodeValueType.url:
          //     final String title = barcode.url.title;
          //     final String url = barcode.url.url;
          //     break;
          // }
        }
      }
    } else if (event is QrClearScan) {
      yield QrScanLoaded(result: '');
      yield QrScanInitial();
    }
  }
}
