import 'package:azapay/src/models/pay_merchant.dart';
import 'package:azapay/src/widget/loading_overlay.dart';
import 'package:azapay/utils/rounded_password_field.dart';
import 'package:flutter/material.dart';

class AzaAgentPinUi extends StatefulWidget {
  AzaAgentPinUi({Key key, this.payMerchantParams}) : super(key: key);

  final PayMerchantParams payMerchantParams;

  @override
  AzaAgentPinUiState createState() => AzaAgentPinUiState();
}

class AzaAgentPinUiState extends State<AzaAgentPinUi> {
  bool isloading = false;
  var token;

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
                            //  isloading = true;
                          });
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
