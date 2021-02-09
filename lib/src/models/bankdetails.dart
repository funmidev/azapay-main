import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:azapay/src/models/models.dart';

part 'bankdetails.freezed.dart';

@freezed
abstract class BankDetails with _$BankDetails {
  factory BankDetails({
    final String id,
    final String acctnumber,
    final String acctname,
    final String amount,
    final String note,
    final List<BankList> banklist,
  }) = _BankDetails;
}
