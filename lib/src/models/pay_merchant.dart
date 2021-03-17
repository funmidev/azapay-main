import 'dart:convert';

PayMerchantParams payMerchantParamsFromJson(String str) =>
    PayMerchantParams.fromJson(json.decode(str));

String payMerchantParamsToJson(PayMerchantParams data) =>
    json.encode(data.toJson());

class PayMerchantParams {
  PayMerchantParams({
    this.merchantKey,
    this.amount,
    this.transactionPin,
    this.cashTillPosition,
  });

  String merchantKey;
  String amount;
  String transactionPin;
  String cashTillPosition;

  factory PayMerchantParams.fromJson(Map<String, dynamic> json) =>
      PayMerchantParams(
        merchantKey: json["merchantKey"],
        amount: json["amount"],
        transactionPin: json["transactionPin"],
        cashTillPosition: json["cashTillPosition"],
      );

  Map<String, dynamic> toJson() => {
        "merchantKey": merchantKey,
        "amount": amount,
        "transactionPin": transactionPin,
        "cashTillPosition": cashTillPosition,
      };
}
