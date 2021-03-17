import 'package:azapay/src/models/merchant_data.dart';
import 'package:azapay/src/models/review_payment.dart';
import 'package:azapay/utils/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'merchant_transaction_review.dart';

class MerchantCashTillTagging extends StatefulWidget {
  MerchantCashTillTagging(
      {Key key,
      this.cashierData,
      this.merchantName,
      this.merchantEmail,
      this.merchantPhone,
      this.merchantTag})
      : super(key: key);
  final Cashier cashierData;
  final String merchantName, merchantTag, merchantEmail, merchantPhone;

  @override
  _MerchantCashTillState createState() => _MerchantCashTillState();
}

final _formKey = GlobalKey<FormState>();
String enterAmount;

class _MerchantCashTillState extends State<MerchantCashTillTagging> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print('CashTill' + widget.cashierData.toString());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
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
                      Navigator.of(context).pop;
                    },
                  ),
                  Text(
                    widget.merchantName + '\'s Shop',
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
            color: Colors.white.withOpacity(0.9),
          ),
          SingleChildScrollView(
            child: Expanded(
              flex: 5,
              child: Column(
                children: [
                  ListView(
                    padding: EdgeInsets.only(top: 20),
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/onboard-three.png',
                          width: size.width * .5,
                          height: size.height * .30,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.only(left: 60.0, right: 20.0),
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              FontAwesomeIcons.headset,
                              size: 20.0,
                              color: Color(0xffFFB300),
                            ),
                          ),
                          Text(
                              widget.cashierData.firstName +
                                  " " +
                                  widget.cashierData.lastName,
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.only(left: 60.0, right: 20.0),
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              FontAwesomeIcons.male,
                              size: 20.0,
                              color: Color(0xff0059CF),
                            ),
                          ),
                          Text(widget.cashierData.gender,
                              style: GoogleFonts.lato(
                                  fontSize: 14, color: Colors.black)),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.only(left: 60.0, right: 20.0),
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              FontAwesomeIcons.dumpster,
                              size: 20.0,
                              color: Color(0xff2D9DAE),
                            ),
                          ),
                          Text('Cash Till ' + widget.cashierData.cashTill,
                              style: GoogleFonts.lato(
                                  fontSize: 14, color: Colors.black)),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                'Amount',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              RoundedInputField(
                                inputType: TextInputType.number,
                                validateForm: (val) => (val.isEmpty)
                                    ? 'Enter a valid amount'
                                    : null,
                                // (value) {
                                //   value ? "Enter a valid email address" : null;
                                // },
                                icon: Icons.monetization_on_outlined,
                                hintText: "00.00",
                                onChanged: (value) {
                                  setState(() {
                                    enterAmount = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: size.height * .07,
                              ),
                              FlatButton(
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 50),
                                  splashColor: Colors.deepOrange,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          BorderSide(color: Color(0xffFFB300))),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      setState(() {
                                        // _showloader = true;
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReviewPaymentUI(
                                                  reviewPayment: ReviewPayment(
                                                      merchantTag:
                                                          widget.merchantTag,
                                                      merchantCashTill: widget
                                                          .cashierData.cashTill,
                                                      merchantName:
                                                          widget.merchantName,
                                                      amount: enterAmount,
                                                      merchantPhone:
                                                          widget.merchantPhone,
                                                      senderName: "Dale",
                                                      senderTag: '#dale'),
                                                )),
                                      );
                                    }
                                  },
                                  color: Color(0xffFFB300),
                                  child: Text('Continue',
                                      style: GoogleFonts.lato(fontSize: 16))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // AmountField(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
