import 'package:azapay/Constants.dart';
import 'package:azapay/app/app_route_name.dart';
import 'package:azapay/service/get_aza_agent_info.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/models/review_payment.dart';

import 'package:azapay/src/rest/ApiManager.dart';
import 'package:azapay/src/ui/dashboard/hub/merchant_cash_till.dart';
import 'package:azapay/utils/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'aza_agent_transaction_review.dart';

class InputCardlessAmountUi extends StatefulWidget {
  final AgentData AzaAgentName;

  const InputCardlessAmountUi({this.AzaAgentName});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InputCardlessAmountUiState();
  }
}

final _formKey = GlobalKey<FormState>();

class InputCardlessAmountUiState extends State<InputCardlessAmountUi> {
  //final Data azaAgentInfo;
  Wallet userWalletInfo;
  double userBal = 0;
  bool isTagConfirmed = false;
  bool isTagLoading = false;
  bool isAmountVerified = false;
  bool isEnabled = true;
  bool showErrorMessage = false;

  //Data azaAgent;

  @override
  void initState() {
    getUserWalletBal();
    super.initState();
  }

  Future<AgentModel> getAzaAgent(String azaTag) async {
    var token = await getAuthToken();
    var azAgentData = await ApiManager.getAgents(azaTag, token);
    if (azAgentData != null) {
      print('AzaAgent' + azAgentData.data.toString());
      return azAgentData;
    }
    return null;
  }

  Future<void> getUserWalletBal() async {
    var token = await getAuthToken();
    final response = await ApiManager.getWalletDetails(token);
    if (response != null) {
      userWalletInfo = response;
      userBal = userWalletInfo.data.balance;
      print('Bal ${userWalletInfo.data.balance}');
    }
  }

  void checkIfBalIsEnough(String amountTyped) {
    print(amountTyped);
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        if ((double.parse(amountTyped) + 50.0) <= userBal) {
          print(amountTyped);
          isTagLoading = true;
          isAmountVerified = true;
          showErrorMessage = false;
        } else {
          print('data $amountTyped');
          isTagLoading = false;
          isAmountVerified = false;
          showErrorMessage = true;
        }
      });
    });
  }

  Future<String> getAuthToken() async {
    var prefs;
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {} finally {
      return prefs.getString(Constants.authToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(showErrorMessage);
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
                    'Pay to ' + widget.AzaAgentName.tag,
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

          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
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
                            Center(
                              child: RoundedInputField(
                                // style: TextStyle(
                                //   fontSize: 24,
                                // ),
                                inputType: TextInputType.number,
                                isEnabled: isEnabled,
                                borderColor: isAmountVerified
                                    ? Colors.green
                                    : Colors.grey[500],
                                textColor: isAmountVerified
                                    ? Colors.green
                                    : Colors.black,

                                // (value) {
                                //   value ? "Enter a valid email address" : null;
                                // },
                                icon: Icons.monetization_on_outlined,
                                hintText: "00.00",

                                onChanged: (value) async {
                                  if (value.isEmpty) {
                                    setState(() {
                                      isAmountVerified = false;
                                      isTagLoading = false;
                                    });
                                  } else {
                                    setState(() {
                                      enterAmount = value;
                                      isAmountVerified = false;
                                      isTagLoading = true;
                                    });
                                  }

                                  checkIfBalIsEnough(value);
                                },
                              ),

                              // child: _serachField(),
                            ),
                            if (showErrorMessage)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'insufficient Balance',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              )
                            else
                              Visibility(
                                visible: isTagLoading,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (isAmountVerified)
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 17,
                                        )
                                      else
                                        Center(
                                          child: SpinKitFadingCircle(
                                            size: 20,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        isAmountVerified
                                            ? 'Verified'
                                            : 'Processing',
                                        style: TextStyle(
                                            color: isAmountVerified
                                                ? Colors.green
                                                : Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: size.height * 0.08,
                            ),
                            AnimatedOpacity(
                              // If the widget is visible, animate to 0.0 (invisible).
                              // If the widget is hidden, animate to 1.0 (fully visible).
                              opacity: isAmountVerified ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 500),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Service fee',
                                    style: GoogleFonts.lato(fontSize: 13),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.06,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 50),
                                    child: Text(
                                      '₦ 50',
                                      style: GoogleFonts.lato(fontSize: 13),
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.07,
                                  ),
                                  Hero(
                                    tag: 'confirmTransfer',
                                    transitionOnUserGestures: true,
                                    child: FlatButton(
                                        textColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 50),
                                        splashColor: Colors.deepOrange,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: Color(0xffFFB300))),
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            setState(() {
                                              // _showloader = true;
                                            });

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AzaAgentTransactionReview(
                                                        reviewPayment: ReviewPayment(
                                                            merchantTag: widget
                                                                .AzaAgentName
                                                                .tag,
                                                            merchantCashTill:
                                                                '',
                                                            merchantName:
                                                                '${widget.AzaAgentName.firstName} ${widget.AzaAgentName.lastName}',
                                                            amount: enterAmount,
                                                            merchantPhone: widget.AzaAgentName.phone,
                                                            senderName: "Dale",
                                                            senderTag: '#dale'),
                                                      )),
                                            );
                                          }
                                        },
                                        color: Color(0xffFFB300),
                                        child: Text('Continue',
                                            style: GoogleFonts.lato(
                                                fontSize: 16))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///
          ///
        ],
      ),
    );
  }
}
