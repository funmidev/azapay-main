import 'package:azapay/src/models/pay_merchant.dart';
import 'package:azapay/src/models/review_payment.dart';
import 'package:flutter/material.dart';

import 'merchant_cash_till.dart';
import 'merchant_pin_ui.dart';
import 'transaction_info_item.dart';

class ReviewPaymentUI extends StatefulWidget {
  ReviewPaymentUI({Key key, this.reviewPayment}) : super(key: key);

  @override
  _ReviewPaymentUIState createState() => _ReviewPaymentUIState();

  final ReviewPayment reviewPayment;
}

class _ReviewPaymentUIState extends State<ReviewPaymentUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                  ),
                  Expanded(
                    flex: 100,
                    child: Center(
                      child: Text(
                        'Transaction review',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .9,
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        margin: EdgeInsets.fromLTRB(10, 25, 10, 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 15),
                              child: Text(
                                'Ref: 37327832',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Divider(
                              thickness: .5,
                              color: Colors.grey.shade400,
                            ),
                            TransactionInfoItem(
                              rightDetail: widget.reviewPayment.merchantTag,
                              rightTitle: 'AzaTag',
                              leftTitle: 'Transaction Type',
                              leftDetail: 'AzaPag Transfer',
                              showRightItem: true,
                            ),
                            TransactionInfoItem(
                              rightDetail: widget.reviewPayment.merchantName,
                              rightTitle: 'Recipient Name',
                              leftTitle: 'Recipient',
                              leftDetail: 'Sub-agent',
                              showRightItem: true,
                            ),
                            TransactionInfoItem(
                              rightDetail: widget.reviewPayment.senderTag,
                              rightTitle: 'AzaTag',
                              leftTitle: 'Sender',
                              leftDetail: widget.reviewPayment.senderName,
                              showRightItem: true,
                            ),
                            TransactionInfoItem(
                              leftTitle: 'Amount',
                              leftDetail: '#' + widget.reviewPayment.amount,
                              showRightItem: false,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MerchantPinUi(
                                          payMerchantParams: PayMerchantParams(
                                              merchantKey: widget
                                                  .reviewPayment.merchantTag,
                                              amount:
                                                  widget.reviewPayment.amount,
                                              cashTillPosition: widget
                                                  .reviewPayment
                                                  .merchantCashTill),
                                        )),
                              );
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 12),
                            color: Color(0xffFFC300),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Text(
                              'Confirm',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
