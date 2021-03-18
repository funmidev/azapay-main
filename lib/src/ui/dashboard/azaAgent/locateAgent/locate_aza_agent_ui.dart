import 'package:azapay/app/app_route_name.dart';
import 'package:azapay/app/app_strings.dart';
import 'package:azapay/app/app_textstyles.dart';
import 'package:azapay/app/app_vectors.dart';
import 'package:azapay/service/get_aza_agent_info.dart';
import 'package:azapay/service/location.dart';
import 'package:azapay/src/models/agent_info.dart';
import 'package:azapay/src/rest/ApiManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../Constants.dart';
import 'azaAgent_profile.dart';

class LocateAzaAgent extends StatefulWidget {
  final AgentInfoDatum azaAgentData;

  LocateAzaAgent({this.azaAgentData}) ;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LocateAzaAgentState();
  }
}

class LocateAzaAgentState extends State<LocateAzaAgent> {
  AgentInfoDatum azaAgentData;
  Future<String> getAuthToken() async {
    var prefs;
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {} finally {
      return prefs.getString(Constants.authToken);
    }
  }

  Future<AgentModelData> getAgents() async {
    var token = await getAuthToken();
    var agentInfo = await ApiManager.getAllAgent('000', token);
    if (agentInfo != null) {
      print('Agent List' + agentInfo.data.toString());
      return agentInfo;
    }
    return null;
  }

  Future<AgentModelData> agentList;

  @override
  void initState() {
    agentList = getAgents();
    print('init state is called');

    getLocation();
    super.initState();
  }

  //
  // Future<CustomAgentInfo> getAgentList() async {
  //   var token = await getAuthToken();
  //   var agentData = await ApiManager.getAllAgent('000', token);
  //   if (agentData != null) {
  //     print('agent list' + agentData.toString());
  //     return agentData;
  //   }
  //   return null;
  // }

  // Future<CustomAgentInfo> AgentList;

  bool isSwitched = true;

  void getLocation() async {
    var location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  ///
  ///
  ///
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
                    'List of AzaAgent',
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

          Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Thank you for your patience, Here are the list of Aza Agent around you',
                    textAlign: TextAlign.center,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 40),
                ),
                Expanded(
                  child: FutureBuilder<AgentModelData>(
                    future: agentList,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return ListView.separated(
                              separatorBuilder: (context, index) => Divider(
                                color: Colors.black,
                              ),
                              itemCount: snapshot.data.data.length,
                              itemBuilder: (context, index) {
                                var agentInfo = snapshot.data.data[index];
                                return  ListTile(
                                  title: Text(
                                  agentInfo.tag,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${agentInfo.firstName} ${agentInfo.lastName}' ,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  trailing: Text(
                                    '2km away',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  onTap: () {
                                    //
                                    //
                                    // Navigator.pushNamed(
                                    //     context, AppRouteName.azaAgentProfile);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AzaAgentProfile(
                                            AzaAgentName: agentInfo,
                                            // AzaAgentInfo: widget.azaAgentData.tag,
                                          )),
                                    );
                                  },
                                );
                              });
                        } else {
                          return Center(
                            child: Container(
                              height: MediaQuery.of(context).size.width / 2,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: SvgPicture.asset(
                                            AppVectors.onBoardTwo,
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          AppStrings.merchantComingSoonTitle,
                                          style:
                                          AppTextStyles.h3style.copyWith(
                                            fontSize: 18,
                                            color: Color(0XFF818181),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      // Text(
                                      //   AppStrings.notificationEmptySubTitle,
                                      //   style: AppTextStyles.h3style,
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                          );
                        }
                      }
                    },
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
