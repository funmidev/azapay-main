import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/merchant_data.dart';
import 'package:azapay/src/rest/ApiManager.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Constants.dart';
import 'merchant_cashier.dart';
import 'merchant_item.dart';

class MerchantHubUI extends StatefulWidget {
  @override
  _MerchantHubUIState createState() => _MerchantHubUIState();
}

class _MerchantHubUIState extends State<MerchantHubUI> {
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
    merchantList = getMerchantList();
    super.initState();
  }

  Future<MerchantResponse> getMerchantList() async {
    var token = await getAuthToken();
    var merchantData = await ApiManager.getAllMerchant('000', token);
    if (merchantData != null) {
      print('MerchantList' + merchantData.data.toString());
      return merchantData;
    }
    return null;
  }

  Future<MerchantResponse> merchantList;

  final GlobalKey<FormState> _formkey = GlobalKey();
  bool hi = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashBoardBackgroundUI(
        title: AppStrings.hubOne,
        subtitle: AppStrings.hubTwo,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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

            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.hubFour,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Expanded(child: MerchantHubItem())
            Expanded(
              child: FutureBuilder<MerchantResponse>(
                future: merchantList,
                builder: (context, snapshot) {
                  return snapshot.connectionState != ConnectionState.done
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : snapshot.hasData
                          ? ListView.builder(
                              itemCount: snapshot.data.data.length,
                              itemBuilder: (context, index) {
                                var merchantData = snapshot.data.data[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: MerchantItem(
                                    onSelected: () {
                                      print(
                                          'CashTell ' + merchantData.firstName);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MerchantCashier(
                                                    merchantData:
                                                        merchantData)),
                                      );
                                      // Navigator.of(context).pushReplacementNamed(AppRouteName.merchantCashier,arguments: merchantData);
                                    },
                                    merchantCashTag: '#' + merchantData.tag,
                                    merchantImgUrl: 'data',
                                    merchantName: merchantData.businessName,
                                  ),
                                );
                              })
                          : Center(
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
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MerchantHubItem extends StatefulWidget {
  @override
  _MerchantHubItemState createState() => _MerchantHubItemState();
}

class _MerchantHubItemState extends State<MerchantHubItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: ColorSets.colorPin,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image.asset(
              AppImages.splashLogo,
              width: 200,
              height: 200,
              alignment: Alignment.center,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40))),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Dre Shop',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h3style
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: ColorSets.colorPrimaryRed,
                      ),
                      Text('130')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 11,
                    child: ButtonArrow(
                        navigatorfunc: () {},
                        buttontitle: '#TAG',
                        arrow: false,
                        buttontitleColor: ColorSets.colorPrimaryBlack),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 11,
                    child: ButtonArrow(
                        navigatorfunc: () {},
                        buttontitle: '#TAG',
                        arrow: false,
                        buttontitleColor: ColorSets.colorPrimaryBlack),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
