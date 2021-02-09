import 'package:flutter/material.dart';

import 'merchant_main_ui.dart';

class SuccessPayment extends StatefulWidget {
  SuccessPayment({Key key}) : super(key: key);

  @override
  _SuccessPaymentState createState() => _SuccessPaymentState();
}

class _SuccessPaymentState extends State<SuccessPayment> {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/splash-logo.png',
                    width: size.width * .6,
                    height: size.height * .28,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Payment Successfully Made',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato-Black',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 70),
                    child: Text(
                      "to Dre's Shop with Azatag #Andre via Sub-Agent Antony Lucas.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato-Black',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MerchantHubUI()),
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
