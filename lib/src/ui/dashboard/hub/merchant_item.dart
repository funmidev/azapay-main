import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'merchant_still.dart';

class MerchantItem extends StatelessWidget {
  final String merchantImgUrl;
  final String merchantName;
  final String merchantCashTag;

  const MerchantItem(
      {Key key, this.merchantImgUrl, this.merchantName, this.merchantCashTag})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var buttonPayName = 'Pay ' + merchantCashTag;
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.4,
          color: Colors.orange,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/splash-logo.png',
            width: size.width * .4,
            height: size.height * .15,
          ),
          SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 5),
                Text(
                  merchantName,
                  style: TextStyle(
                      fontFamily: 'Lato-Black',
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color(0xffFFB300))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return MerchantStill();
                        }),
                      );
                    },
                    color: Color(0xffFFB300),
                    child: Text(buttonPayName,
                        style: GoogleFonts.lato(
                            fontSize: 14, color: Colors.black))),
                FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color(0xffFFB300))),
                    onPressed: () {},
                    color: Color(0xffFFB300),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.qr_code_scanner_outlined,
                            size: 14.0,
                            color: Colors.black,
                          ),
                        ),
                        Text('Scan Code',
                            style: GoogleFonts.lato(
                                fontSize: 14, color: Colors.black)),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
