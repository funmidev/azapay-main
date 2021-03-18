import 'package:azapay/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part  'bank.freezed.dart';

@freezed
abstract class AllBank with _$AllBank {
  factory AllBank({
    String id,
    String acctnumber,
    String acctname,
    String amount,
    String note,
    List<BankList> banklist,
  }) = _AllBank;
}
