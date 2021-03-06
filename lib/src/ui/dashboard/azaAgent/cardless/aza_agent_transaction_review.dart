import 'package:azapay/Constants.dart';
import 'package:azapay/app/app_route_name.dart';
import 'package:azapay/src/models/pay_merchant.dart';
import 'package:azapay/src/models/review_payment.dart';
import 'package:azapay/src/rest/ApiManager.dart';
import 'package:azapay/src/ui/dashboard/hub/transaction_info_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AzaAgentTransactionReview extends StatefulWidget {
  const AzaAgentTransactionReview({Key key, this.reviewPayment}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AzaAgentTransactionReviewState();


  }
  final ReviewPayment reviewPayment;
}

final _formKey = GlobalKey<FormState>();

Future<String> getAuthToken() async {
  var prefs;
  try {
    prefs = await SharedPreferences.getInstance();
  } catch (e) {} finally {
    return prefs.getString(Constants.authToken);
  }
}


class AzaAgentTransactionReviewState extends State<AzaAgentTransactionReview> {
  bool isSwitched = true;

  void saveBeneficiary(
      String AZaAgentTag) async {
    final token = await getAuthToken();
    await ApiManager.saveBeneficiary(AZaAgentTag, token);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Container(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.navigate_before),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Transaction Review',
                    style: TextStyle(
                        fontFamily: 'Lato-Black',
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Icon(
                    Icons.navigate_before,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/dashboard-bg.png',
            width: double.infinity,
            fit: BoxFit.cover,
            height: size.height,
            scale: 0.8,
          ),
          Container(
            width: double.infinity,
            height: size.height,
            color: Colors.white.withOpacity(0.95),
          ),

          ///
          ///
          ///
          ///
          /// --------- adding the beneficiary/Aza Tag

          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                TransactionInfoItem(
                                  rightDetail: widget.reviewPayment.merchantTag,
                                  rightTitle: 'AzaTag',
                                  leftTitle: 'Transaction Type',
                                  leftDetail: 'AzaPay Withdraw',
                                  showRightItem: true,
                                ),
                                Divider(
                                  thickness: .5,
                                  color: Colors.grey.shade400,
                                ),
                                TransactionInfoItem(
                                  rightDetail: widget.reviewPayment.merchantName,
                                  rightTitle: 'Recipient Name',
                                  leftTitle: 'Recipient',
                                  leftDetail: 'Sub-agent',
                                  showRightItem: true,
                                ),
                                Divider(
                                  thickness: .5,
                                  color: Colors.grey.shade400,
                                ),
                                TransactionInfoItem(
                                  rightDetail: '# 50',
                                  rightTitle: 'Service fee',
                                  leftTitle: 'Amount',
                                  leftDetail: '# ${widget.reviewPayment.amount}',
                                  showRightItem: true,
                                ),
                                Divider(
                                  thickness: .5,
                                  color: Colors.grey.shade400,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 15),
                                        child: Text(
                                          'Save Beneficiary',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                      Switch(
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = value;
                                            print(isSwitched);
                                          });
                                        },
                                        activeTrackColor: Colors.yellow,
                                        activeColor: Colors.orangeAccent,
                                      ),
                                      Divider(
                                        thickness: .5,
                                        color: Colors.grey.shade400,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Hero(
                              tag: 'confirmTransfer',
                              transitionOnUserGestures: true,
                              child: FlatButton(
                                  onPressed: () {
                                    if(isSwitched){
                                  saveBeneficiary(widget.reviewPayment.merchantTag);
                                    }
                                    Navigator.pushNamed(
                                        context, AppRouteName.azaAgentPin);
                                  },
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 60, vertical: 12),
                                  color: Color(0xffFFC300),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          ///
          ///
        ],
      ),
    );
  }
}
