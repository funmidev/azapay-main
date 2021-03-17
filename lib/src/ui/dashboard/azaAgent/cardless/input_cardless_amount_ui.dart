import 'package:azapay/app/app_route_name.dart';
import 'package:azapay/src/ui/dashboard/hub/merchant_cash_till.dart';
import 'package:azapay/utils/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputCardlessAmountUi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InputCardlessAmountUiState();
  }
}

final _formKey = GlobalKey<FormState>();

class InputCardlessAmountUiState extends State<InputCardlessAmountUi> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // TODO: implement build
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
                Center(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Amount',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          RoundedInputField(
                            inputType: TextInputType.number,
                            validateForm: (val) =>
                                (val.isEmpty) ? 'Enter a valid amount' : null,
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
                            height: size.height * 0.08,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Service fee',
                              ),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: Text('# 50'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.07,
                          ),
                          FlatButton(
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 50),
                              splashColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Color(0xffFFB300))),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    // _showloader = true;
                                  });

                                  Navigator.pushNamed(context,
                                      AppRouteName.azaAgentTransacReview);
                                }
                              },
                              color: Color(0xffFFB300),
                              child: Text('Continue',
                                  style: GoogleFonts.lato(fontSize: 16))),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///
          ///
        ],
      ),
    );
  }
}
