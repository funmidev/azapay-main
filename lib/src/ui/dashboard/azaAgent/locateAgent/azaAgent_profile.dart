import 'package:azapay/Constants.dart';
import 'package:azapay/app/app_route_name.dart';
import 'package:azapay/service/get_aza_agent_info.dart';
import 'package:azapay/src/models/agent_info.dart';
import 'package:azapay/src/rest/ApiManager.dart';
import 'package:azapay/src/ui/dashboard/azaAgent/cardless/input_cardless_amount_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AzaAgentProfile extends StatefulWidget {
  final AgentData AzaAgentName;

  const AzaAgentProfile({this.AzaAgentName});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AzaAgentProfileState();
  }
}

class AzaAgentProfileState extends State<AzaAgentProfile> {


  @override
  void initState() {
    print('init state is called');

    super.initState();
  }


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
                    '#${widget.AzaAgentName.tag} Profile',
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
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 40.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/onboard-two.png'),
                        width: size.width * .5,
                        height: size.height * .20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.headset,
                          color: Color(0xffFFB300),
                        ),
                        title: Text(
                          '${widget.AzaAgentName.firstName} ${widget.AzaAgentName.lastName}',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),

                      ///
                      ///
                      ///---------second ----------list
                      ///
                      Divider(
                        thickness: .8,
                        color: Colors.grey.shade400,
                      ),

                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.male,
                          color: Color(0xff0059CF),
                        ),
                        title: Text(
                          '${widget.AzaAgentName.dpLink}',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                      ),

                      ///
                      ///
                      ///
                      ///
                      Divider(
                        thickness: .8,
                        color: Colors.grey.shade400,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.add_location,
                          color: Color(0xff529DFF),
                        ),
                        title: Text(
                          '${widget.AzaAgentName.address}',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text('5 Ado Shopping Complex, Ajah.'),
                      ),
                      Divider(
                        thickness: .8,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(
                        height: 70.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,  MaterialPageRoute(
                                  builder: (context) =>
                                      InputCardlessAmountUi(
                                        AzaAgentName: widget.AzaAgentName,
                                        // AzaAgentInfo: widget.azaAgentData.tag,
                                      )));
                            },
                            padding: EdgeInsets.symmetric(vertical: 24),
                            color: Color(0xffFFC300),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Make Payment',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )),
                      ),
                    ],
                  ),
                )
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
