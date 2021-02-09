part of 'qrscan_bloc.dart';

@immutable
abstract class QrscanEvent extends Equatable {}

class QrScanAmount extends QrscanEvent {
  final double amount;
  final int screen;

  QrScanAmount({this.amount, this.screen});

  @override
  List<Object> get props => [amount];
}

class SendFundQrScan extends QrscanEvent {
  @override
  List<Object> get props => [];
}

class QrClearScan extends QrscanEvent {
  @override
  List<Object> get props => [];
}

class QrScanResult extends QrscanEvent {
  final dynamic result;
  QrScanResult({this.result});
  @override
  List<Object> get props => [];
}
