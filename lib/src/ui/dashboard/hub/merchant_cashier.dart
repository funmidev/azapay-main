import 'package:azapay/src/models/merchant_data.dart';
import 'package:azapay/src/models/review_payment.dart';
import 'package:azapay/src/ui/dashboard/hub/merchant_cash_till.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:azapay/utils/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_cash_till.dart';
import 'merchant_transaction_review.dart';

class MerchantCashier extends StatefulWidget {
  MerchantCashier({Key key, this.merchantData}) : super(key: key);

  final Datum merchantData;

  @override
  _MerchantCashierState createState() => _MerchantCashierState();
}

class _MerchantCashierState extends State<MerchantCashier> {
  String cashTillSelected;
  String cashTill;

  final _formKey = GlobalKey<FormState>();
  String enterAmount = '0';

  @override
  Widget build(BuildContext context) {
    String _chosenValue;
    var size = MediaQuery.of(context).size;

    print('Cash merchant ' + widget.merchantData.tag);
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
                      Navigator.of(context).pop;
                    },
                  ),
                  Text(
                    " " + widget.merchantData.tag + "\'s Shop",
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
          SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/splash-logo.png',
                      width: size.width * .6,
                      height: size.height * .28,
                    ),
                  ),
                  widget.merchantData.cashier.isNotEmpty
                      ? Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Cash Till position",
                                style: TextStyle(
                                    fontFamily: 'Lato-Black',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            CustomCashTill(
                              cashierList: widget.merchantData.cashier,
                              onChanged: (value) {
                                //
                                // setState(() {
                                //   cashTillSelected = "Cash Till "+value.cashTill;
                                // });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MerchantCashTillTagging(
                                            cashierData: value,
                                            merchantTag:
                                                widget.merchantData.tag,
                                            merchantEmail:
                                                widget.merchantData.email,
                                            merchantName: widget
                                                    .merchantData.firstName +
                                                ' ' +
                                                widget.merchantData.lastName,
                                            merchantPhone:
                                                widget.merchantData.phone,
                                          )),
                                );
                              },
                              itemSelected: cashTillSelected,
                            )
                          ],
                        )
                      : Form(
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
                                      ? "Enter a valid amount"
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
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color: Color(0xffFFB300))),
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
                                                        merchantTag: widget
                                                            .merchantData.tag,
                                                        merchantCashTill: "1",
                                                        merchantName: widget
                                                                .merchantData
                                                                .firstName +
                                                            " " +
                                                            widget.merchantData
                                                                .lastName,
                                                        amount: enterAmount,
                                                        merchantPhone: widget
                                                            .merchantData.phone,
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
            ),
          )
        ],
      ),
    );
  }
}
