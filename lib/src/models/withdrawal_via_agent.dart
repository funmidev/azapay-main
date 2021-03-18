// To parse this JSON data, do
//
//     final withdrawalVialAgent = withdrawalVialAgentFromJson(jsonString);

import 'dart:convert';

WithdrawalVialAgent withdrawalVialAgentFromJson(String str) => WithdrawalVialAgent.fromJson(json.decode(str));

String withdrawalVialAgentToJson(WithdrawalVialAgent data) => json.encode(data.toJson());

class WithdrawalVialAgent {
  WithdrawalVialAgent({
    this.agentTag,
    this.amount,
    this.transactionPin,
  });

  String agentTag;
  int amount;
  String transactionPin;

  factory WithdrawalVialAgent.fromJson(Map<String, dynamic> json) => WithdrawalVialAgent(
    agentTag: json["agentTag"],
    amount: json["amount"],
    transactionPin: json["transactionPin"],
  );

  Map<String, dynamic> toJson() => {
    "agentTag": agentTag,
    "amount": amount,
    "transactionPin": transactionPin,
  };
}
