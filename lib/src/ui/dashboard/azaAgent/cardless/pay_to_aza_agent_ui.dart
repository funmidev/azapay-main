import 'package:azapay/app/app_colorsets.dart';
import 'package:azapay/app/app_route_name.dart';
import 'package:azapay/app/app_strings.dart';
import 'package:azapay/src/widget/custom_formfield_ui.dart';
import 'package:flutter/material.dart';

class PayToAzaAgent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PayToAzaAgentState();
  }
}

class PayToAzaAgentState extends State<PayToAzaAgent> {
  bool a = true;
  bool hi = false;
  String mText = 'Press to hide';
  final GlobalKey<FormState> _formkey = GlobalKey();
  dynamic selectedValue;
  @override
  Widget build(BuildContext context) {
    String _chosenValue;
    var size = MediaQuery.of(context).size;

    final textCashStill = Text(
      'Cash Till position',
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
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    'Pay to AzaAgent',
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
          // Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(25.0),
          //       child: Center(
          //         child: SvgPicture.asset(
          //           AppVectors.completewithdrawal,
          //           width: size.width * .3,
          //           height: size.height * .14,
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       height: 15.0,
          //     ),
          //     Center(
          //       child: Card(
          //         elevation: 0,
          //         color: Colors.transparent,
          //         child: InkWell(
          //           onTap: () {},
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(
          //                 vertical: 10, horizontal: 30),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Icon(
          //                   FontAwesomeIcons.exchangeAlt,
          //                   size: 40.0,
          //                   color: Color(0xffFFB300),
          //                 ),
          //                 Text(
          //                   'Withdraw',
          //                   style: TextStyle(
          //                       fontSize: 26.0, fontWeight: FontWeight.w400),
          //                 ),
          //                 Icon(
          //                   FontAwesomeIcons.chevronRight,
          //                   size: 30.0,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //
          //     ///
          //     ///
          //     ///
          //     Divider(
          //       thickness: 2,
          //       color: Colors.grey.shade400,
          //     ),
          //
          //     ///
          //     ///
          //     /// -----qrcode
          //     ///
          //     Center(
          //       child: Card(
          //         elevation: 0,
          //         color: Colors.transparent,
          //         child: InkWell(
          //           onTap: () {},
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(
          //                 vertical: 10, horizontal: 30),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Icon(
          //                   Icons.qr_code_scanner_outlined,
          //                   size: 40.0,
          //                   color: Color(0xff96CCD2),
          //                 ),
          //                 Text(
          //                   'QR Payment',
          //                   style: TextStyle(
          //                       fontSize: 26.0, fontWeight: FontWeight.w400),
          //                 ),
          //                 Icon(
          //                   FontAwesomeIcons.chevronRight,
          //                   size: 30.0,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // )

          ///
          ///
          ///
          ///
          /// --------- adding the beneficiary/Aza Tag

          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Beneficiary',
                    ),
                  ),
                ),
                Form(
                  key: _formkey,
                  child: FormFieldUI(
                      currentnode: null,
                      fieldController: null,
                      hint: AppStrings.hubThree,
                      suffixicon: InkWell(
                        hoverColor: Colors.orange,
                        child: Icon(
                          hi ? Icons.clear : Icons.search,
                          color: ColorSets.colorPrimaryLightYellow,
                        ),
                        onTap: () {
                          hi ? _formkey.currentState.reset() : null;
                        },
                      ),
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      errorText: null,
                      onchanged: null),
                ),
              ],
            ),
          ),

          Card(
            elevation: 0,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///the aza-Agent Image/picture
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/avatar.png'),
                            width: size.width * .3,
                            height: size.height * .14,
                          ),
                        ),
                        // Image.asset(
                        //   'assets/images/azapay-logo.png',
                        //   width: size.width * .2,
                        //   height: size.height * .12,
                        // ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('#AtoLabi'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Tobi Alobi'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('AzaAgent'),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, AppRouteName.inputmyAmount);
                        },
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                        color: Color(0xffFFC300),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                  ),
                ],
              ),
            ),
          ),

          // Center(
          //   child: FlatButton(
          //     onPressed: visibilityMethod,
          //     child: Text(mText),
          //   ),
          // ),
          // a == false
          //     ? Container(
          //         width: 300.0,
          //         height: 300.0,
          //         color: Colors.red,
          //       )
          //     : Container(),

          ///
          ///
        ],
      ),
    );
  }

  void visibilityMethod() {
    setState(() {
      if (a) {
        a = false;
        mText = 'Press to show';
      } else {
        a = true;
        mText = 'Press to hide';
      }
    });
  }
}
