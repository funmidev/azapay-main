import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

import 'merchant_transaction_review.dart';
import 'success_payment.dart';

class MerchantPinUi extends StatefulWidget {
  MerchantPinUi({Key key}) : super(key: key);

  @override
  _MerchantPinUiState createState() => _MerchantPinUiState();
}

class _MerchantPinUiState extends State<MerchantPinUi> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/dashboard-bg.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: size.height,
                color: Colors.white.withOpacity(0.95),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 80.0),
                child: IconButton(
                  icon: Icon(Icons.navigate_before),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Body();
                      }),
                    );
                  },
                ),
              ),

              // Align(
              //   alignment: Alignment.topLeft,
              //   child: FlatButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     child: Icon(
              //       Icons.arrow_back_ios,
              //       size: 40.0,
              //     ),
              //   ),
              // ),

              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 100, bottom: 20, left: 20),
                    child: Text('Transaction Pin'),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: PasswordField(
                        hintText: 'Enter 4-Digit Pin',
                        inputStyle: TextStyle(fontSize: 16),
                        suffixIcon: Icon(
                          Icons.lock_outline,
                          color: Color(0XffFFC300),
                        ),
                        textPadding: EdgeInsets.symmetric(horizontal: 8),
                        backgroundColor: Color(0xffF5F6F8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(
                            width: 0.5,
                          ),
                        ),
                        backgroundBorderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessPayment()),
                        );
                      },
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                      color: Color(0xffFFC300),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      child: Text(
                        'Send',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
