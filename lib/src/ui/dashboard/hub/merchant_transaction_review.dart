import 'package:flutter/material.dart';

import 'merchant_cash_till.dart';
import 'merchant_pin_ui.dart';
import 'transaction_info_item.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MerchantCashTillTagging()),
                          );
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
                            color: Colors.grey.shade400),
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
                              color: Colors.grey,
                            ),
                            TransactionInfoItem(
                              rightDetail: '#DaveCha',
                              rightTitle: 'AzaTag',
                              leftTitle: 'Transaction Type',
                              leftDetail: 'AzaPag Transfer',
                              showRightItem: true,
                            ),
                            TransactionInfoItem(
                              rightDetail: 'Deep Luca',
                              rightTitle: 'Recipient Name',
                              leftTitle: 'Recipient',
                              leftDetail: 'Sub-agent',
                              showRightItem: true,
                            ),
                            TransactionInfoItem(
                              rightDetail: '#AyoMan',
                              rightTitle: 'AzaTag',
                              leftTitle: 'Sender',
                              leftDetail: 'Kamilu Ayo',
                              showRightItem: true,
                            ),
                            TransactionInfoItem(
                              leftTitle: 'Amount',
                              leftDetail: '#5000',
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
                                    builder: (context) => MerchantPinUi()),
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
