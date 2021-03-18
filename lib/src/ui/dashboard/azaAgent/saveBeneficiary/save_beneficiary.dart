import 'package:azapay/app/app_strings.dart';
import 'package:azapay/app/app_textstyles.dart';
import 'package:azapay/app/app_vectors.dart';
import 'package:azapay/src/rest/ApiManager.dart';
import 'package:azapay/src/ui/dashboard/azaAgent/locateAgent/azaAgent_profile.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../Constants.dart';
import 'model/save_beneficiary_model.dart';

class SaveBeneficiary extends StatefulWidget {
  final Datum azaAgentData;

  const SaveBeneficiary({Key key, this.azaAgentData}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SaveBeneficiaryState();
  }
}

class SaveBeneficiaryState extends State<SaveBeneficiary> {
  Datum azaAgentData;

  Future<String> getAuthToken() async {
    var prefs;
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {} finally {
      return prefs.getString(Constants.authToken);
    }
  }

  Future<SaveBeneficiaryModel> getAllSaveBeneficiary() async {
    var token = await getAuthToken();
    var agentInfo = await ApiManager.getAllSaveBeneficiary('000', token);
    if (agentInfo != null) {
      print('Saved Beneficiary List' + agentInfo.data.toString());
      return agentInfo;
    }
    return null;
  }

  Future<SaveBeneficiaryModel> saveBen;

  @override
  void initState() {
    saveBen = getAllSaveBeneficiary();
    print('init state is called');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                    'Saved Beneficiaries',
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
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FutureBuilder<SaveBeneficiaryModel>(
                    future: saveBen,
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
                                return ListTile(
                                  title: Text(
                                    agentInfo.tag,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${agentInfo.firstName} ${agentInfo.lastName}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  onTap: () {
                                    // Navigator.pushNamed(
                                    //     context, AppRouteName.azaAgentProfile);


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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: SvgPicture.asset(
                                        AppVectors.onBoardTwo,
                                      )),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          AppStrings.merchantComingSoonTitle,
                                          style: AppTextStyles.h3style.copyWith(
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
