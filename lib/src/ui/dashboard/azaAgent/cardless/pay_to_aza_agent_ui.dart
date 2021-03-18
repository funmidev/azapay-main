import 'package:azapay/Constants.dart';
import 'package:azapay/service/get_aza_agent_info.dart';
import 'package:azapay/src/rest/ApiManager.dart';
import 'package:azapay/utils/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'input_cardless_amount_ui.dart';

class PayToAzaAgent extends StatefulWidget {
  final AgentData azaAgentData;

  const PayToAzaAgent({Key key, this.azaAgentData}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PayToAzaAgentState();
  }
}

class PayToAzaAgentState extends State<PayToAzaAgent> {
  String mText = 'Press to hide';
  String mAgentPay;
  bool isTagConfirmed = false;
  bool isTagLoading = false;
  bool isTagVerified = false;
  bool isEnabled = true;
  AgentData azaAgentData;
  final GlobalKey<FormState> _formkey = GlobalKey();
  dynamic selectedValue;
  String validationState = 'Processing';

  Future<String> getAuthToken() async {
    var prefs;
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {} finally {
      return prefs.getString(Constants.authToken);
    }
  }

  @override
  void initState() {
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

  void getAzaTagValidation(String value) async {
    await getAzaAgent(value).then((value) {
      setState(() {
        if (value.status == 200) {
          azaAgentData = value.data;
          validationState = 'Verified';
          isTagLoading = true;
          isTagVerified = true;
          azaAgentData = value.data;
          Future.delayed(Duration(milliseconds: 1500), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      InputCardlessAmountUi(
                        AzaAgentName: azaAgentData,
                        // AzaAgentInfo: widget.azaAgentData.tag,
                      )),
            );
          });
        } else {}
      });

      //  setState(() {
      //    isTagConfirmed = true;
      //  });
      // } else {
      // setState(() {
      // isTagConfirmed = false;
      // });
      // }
    }).whenComplete(() {
      setState(() {
        isEnabled = true;
      });
    }).onError((error, stackTrace) {
      setState(() {
        isTagLoading = false;
      });
    });
  }

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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
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
                  Center(
                    child: Form(
                      key: _formkey,
                      child: RoundedInputField(
                        inputType: TextInputType.name,
                        isEnabled: isEnabled,
                        borderColor:
                            isTagVerified ? Colors.green : Colors.grey[500],
                        textColor: isTagVerified ? Colors.green : Colors.black,
                        validateForm: (val) =>
                            (val.isEmpty) ? 'Enter a valid AzaTag' : null,
                        // (value) {
                        //   value ? "Enter a valid email address" : null;
                        // },
                        //icon: Icons.monetization_on_outlined,
                        hintText: 'Enter Agent AzaTag',

                        onChanged: (value) async {
                          setState(() {
                            if (value.length >= 9) {
                              isEnabled = false;
                            } else {
                              isEnabled = true;
                            }
                            mAgentPay = value;
                          });
                          if (value.length >= 3) {
                            setState(() {
                              isTagVerified = false;
                              isTagLoading = true;
                            });
                            getAzaTagValidation(value);
                          }
                        },
                      ),
                    ),

                    // child: _serachField(),
                  ),
                  if (isTagLoading)
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          isTagVerified
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 17,
                                )
                              : Center(
                                  child: SpinKitFadingCircle(
                                    size: 20,
                                    itemBuilder:
                                        (BuildContext context, int index) {
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
                            isTagVerified ? 'Verified' : 'Processing',
                            style: TextStyle(
                                color: isTagVerified
                                    ? Colors.green
                                    : Colors.black),
                          )
                        ],
                      ),
                    )
                  else
                    isTagConfirmed
                        ? Container()
                        : Text(
                            'could not complete request, try again',
                            style: GoogleFonts.lato(
                              color: Colors.red,
                            ),
                          ),
                  if (azaAgentData != null)
                    AnimatedOpacity(
                      // If the widget is visible, animate to 0.0 (invisible).
                      // If the widget is hidden, animate to 1.0 (fully visible).
                      opacity: isTagVerified ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      // The green box must be a child of the AnimatedOpacity widget.
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ///the aza-Agent Image/picture
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/avatar.png'),
                                        width: 80,
                                        height: 80,
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
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Text('#${azaAgentData.tag}'),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Text(
                                            '${azaAgentData.firstName} ${azaAgentData.lastName}'),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(azaAgentData.role),
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
                                // child: FlatButton(
                                //     onPressed: () {
                                //       print(azaAgentData.tag);
                                //       // Navigator.pushNamed(
                                //       //     context, AppRouteName.inputmyAmount);
                                //
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 InputCardlessAmountUi(
                                //                   AzaAgentName: azaAgentData,
                                //                  // AzaAgentInfo: widget.azaAgentData.tag,
                                //                 )),
                                //       );
                                //     },
                                //     padding: EdgeInsets.symmetric(
                                //         horizontal: 60, vertical: 12),
                                //     color: Color(0xffFFC300),
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius:
                                //             BorderRadius.circular(16)),
                                //     child: Text(
                                //       'Confirm',
                                //       style: TextStyle(
                                //           color: Colors.white, fontSize: 14),
                                //     )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
//
//  _serachField(){
//   return Padding(
//     padding: EdgeInsets.all(8.0),
//     child: TextField(
//       decoration: InputDecoration(
//         hintText: 'search for azaAgent'
//       ),
//     ),
//   );
// }

}
