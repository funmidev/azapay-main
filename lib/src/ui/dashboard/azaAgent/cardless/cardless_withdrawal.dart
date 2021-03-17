import 'package:azapay/app/app_route_name.dart';
import 'package:azapay/app/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardlessWithdrawal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CardlessWithdrawalState();
  }
}

class CardlessWithdrawalState extends State<CardlessWithdrawal> {
  dynamic selectedValue;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                    'Payment Method',
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
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: SvgPicture.asset(
                    AppVectors.completewithdrawal,
                    width: size.width * .3,
                    height: size.height * .14,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Center(
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouteName.paytoAzaAgent);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            FontAwesomeIcons.exchangeAlt,
                            size: 40.0,
                            color: Color(0xffFFB300),
                          ),
                          Text(
                            'Withdraw',
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            FontAwesomeIcons.chevronRight,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              ///
              ///
              ///
              Divider(
                thickness: 2,
                color: Colors.grey.shade400,
              ),

              ///
              ///
              /// -----qrcode
              ///
              Center(
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.qr_code_scanner_outlined,
                            size: 40.0,
                            color: Color(0xff96CCD2),
                          ),
                          Text(
                            'QR Payment',
                            style: TextStyle(
                                fontSize: 26.0, fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            FontAwesomeIcons.chevronRight,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
