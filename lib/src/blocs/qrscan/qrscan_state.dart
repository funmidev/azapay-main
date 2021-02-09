part of 'qrscan_bloc.dart';

@immutable
abstract class QrscanState {}

class QrScanInitial extends QrscanState {}

class QrScanLoading extends QrscanState {}

@freezed
abstract class QrScanLoaded with _$QrScanLoaded implements QrscanState {
  factory QrScanLoaded({
    String result,
    double amount,
    int screen,
    @Default(100) int success,
    @Default(100) int error,
    String responsemessage,
  }) = _QrScanLoaded;
}
