class ReviewPayment {
  ReviewPayment(
      {this.merchantTag,
      this.merchantCashTill,
      this.merchantName,
      this.amount,
      this.merchantPhone,
      this.senderName,
      this.senderTag});

  String merchantName;
  String merchantTag;
  String merchantPhone;
  String merchantCashTill;
  String amount;
  String senderName;
  String senderTag;
}
