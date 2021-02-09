import 'package:flutter/material.dart';

import 'custom_cash_till.dart';
import 'merchant_main_ui.dart';

class MerchantStill extends StatefulWidget {
  MerchantStill({Key key}) : super(key: key);

  @override
  _MerchantStillState createState() => _MerchantStillState();
}

class _MerchantStillState extends State<MerchantStill> {
  dynamic selectedValue;
  @override
  Widget build(BuildContext context) {
    String _chosenValue;
    var size = MediaQuery.of(context).size;

    final textCashStill = Text(
      "Cash Till position",
      style: TextStyle(
          fontFamily: 'Lato-Black',
          fontSize: 14.0,
          fontWeight: FontWeight.w400),
    );
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return MerchantHubUI();
                        }),
                      );
                    },
                  ),
                  Text(
                    "Dre's Shop",
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
          Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/splash-logo.png',
                  width: size.width * .6,
                  height: size.height * .28,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.centerLeft,
                child: textCashStill,
              ),
              SizedBox(
                height: 15.0,
              ),
              CustomCashTill()
            ],
          )
        ],
      ),
    );
  }
}
