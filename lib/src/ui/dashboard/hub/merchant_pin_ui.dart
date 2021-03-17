import 'package:azapay/Constants.dart';
import 'package:azapay/src/models/pay_merchant.dart';
import 'package:azapay/src/models/pay_merchant_resp.dart';
import 'package:azapay/src/rest/ApiManager.dart';
import 'package:azapay/src/widget/loading_overlay.dart';
import 'package:azapay/utils/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'merchant_transaction_review.dart';
import 'success_payment.dart';

class MerchantPinUi extends StatefulWidget {
  MerchantPinUi({Key key, this.payMerchantParams}) : super(key: key);

  final PayMerchantParams payMerchantParams;

  @override
  _MerchantPinUiState createState() => _MerchantPinUiState();
}

class _MerchantPinUiState extends State<MerchantPinUi> {
  var prefs;
  Data userDetails;
  bool isloading = false;
  var token;

  Future<String> getAuthToken() async {
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {} finally {
      return prefs.getString(Constants.authToken);
    }
  }

  Future getUserDetails() async {
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {} finally {
      setState(() {
        userDetails = Data.fromJson(prefs.getString(Constants.userInfo));
        print('UserData ' + userDetails.toString());
      });
    }
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  Future<PayMerchantResp> payMerchant(
      PayMerchantParams payMerchantParams) async {
    token = await getAuthToken();
    var payMerchantResp =
        await ApiManager.payMerchant(payMerchantParams, token);
    if (payMerchantResp != null) {
      print('MerchantList' + payMerchantResp.toString());
      return payMerchantResp;
    }
    return null;
  }

  void setLoading() {
    setState(() {
      isloading = false;
    });
  }

  bool _obscureText = true;
  String _pin;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoadingOverlay(
        isLoading: isloading,
        child: Container(
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
                      Navigator.of(context).pop();
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
                      child: RoundedPasswordField(
                        validatePass: (val) => val.length < 4
                            ? "Transaction Pin must be atleast 4 characters"
                            : null,
                        obscure: _obscureText,
                        onChanged: (value) {
                          setState(() {
                            _pin = value;
                          });
                        },
                        showPass: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            isloading = true;
                          });
                          var payMerchantParams = PayMerchantParams(
                              merchantKey: widget.payMerchantParams.merchantKey,
                              amount: widget.payMerchantParams.amount,
                              cashTillPosition:
                                  widget.payMerchantParams.cashTillPosition,
                              transactionPin: _pin);
                          var successInfo = 'to ';
                          payMerchant(payMerchantParams)
                              .then((value) => {
                                    if (value != null)
                                      {
                                        if (value.status == 200)
                                          {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SuccessPayment()))
                                          }
                                        else
                                          {
                                            print(
                                                'PayMerchant ' + value.message)
                                          }
                                      }
                                  })
                              .whenComplete(() => setLoading());
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
      ),
    );
  }
}
