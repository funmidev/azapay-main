import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'merchant_still.dart';
import 'merchant_transaction_review.dart';

class MerchantCashTillTagging extends StatefulWidget {
  MerchantCashTillTagging({Key key}) : super(key: key);

  @override
  _MerchantCashTillState createState() => _MerchantCashTillState();
}

class _MerchantCashTillState extends State<MerchantCashTillTagging> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return MerchantStill();
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
            color: Colors.white.withOpacity(0.9),
          ),
          Expanded(
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
                        Text('Anthony Lucas',
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
                        Text('Male',
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
                        Text('Cash Till 1',
                            style: GoogleFonts.lato(
                                fontSize: 14, color: Colors.black)),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        'Amount',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide.none,
                            //borderSide: const BorderSide(),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white, fontFamily: "Lato-Black"),
                          filled: true,
                          fillColor: Color(0xffF5F6F8),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Body()),
                            );
                          },
                          padding: EdgeInsets.symmetric(
                              horizontal: 60, vertical: 12),
                          color: Color(0xffFFC300),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            'Continue',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )),
                    )
                  ],
                ),

                // AmountField(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
