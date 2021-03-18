// To parse this JSON data, do
//
//     final payazaAgent = payazaAgentFromJson(jsonString);

import 'dart:convert';

PayazaAgent payazaAgentFromJson(String str) => PayazaAgent.fromJson(json.decode(str));

String payazaAgentToJson(PayazaAgent data) => json.encode(data.toJson());

class PayazaAgent {
  PayazaAgent({
    this.agentTag,
    this.amount,
    this.transactionPin,
  });

  String agentTag;
  int amount;
  String transactionPin;

  factory PayazaAgent.fromJson(Map<String, dynamic> json) => PayazaAgent(
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