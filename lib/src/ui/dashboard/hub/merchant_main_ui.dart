import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';

import 'merchant_item.dart';

class MerchantHubUI extends StatefulWidget {
  @override
  _MerchantHubUIState createState() => _MerchantHubUIState();
}

class _MerchantHubUIState extends State<MerchantHubUI> {
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
            MerchantItem(
              merchantCashTag: '#Andre',
              merchantImgUrl: 'data',
              merchantName: "Dare's Shop",
            )

            // Center(
            //   child: Container(
            //     height: MediaQuery.of(context).size.width / 2,
            //     child: Center(
            //       child: Padding(
            //         padding: const EdgeInsets.all(30.0),
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Expanded(
            //                 child: SvgPicture.asset(
            //               AppVectors.onBoardTwo,
            //             )),
            //             Padding(
            //               padding: const EdgeInsets.all(8.0),
            //               child: Text(
            //                 AppStrings.merchantComingSoonTitle,
            //                 style: AppTextStyles.h3style.copyWith(
            //                   fontSize: 18,
            //                   color: Color(0XFF818181),
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //               ),
            //             ),
            //             // Text(
            //             //   AppStrings.notificationEmptySubTitle,
            //             //   style: AppTextStyles.h3style,
            //             // ),
            //           ],
            //         ),
            //       ),
            //     ),
            //     decoration:
            //         BoxDecoration(borderRadius: BorderRadius.circular(30)),
            //   ),
            // ),
            // Expanded(child: MerchantHubItem())
            // ListView.builder(
            //   itemCount: null,
            //   itemBuilder: (context,index){
            //     if (index is null){
            //       return Center(child: SvgPicture.asset(AppVectors.notfound));
            //     }
            //   })
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
                // ButtonArrow(
                //     navigatorfunc: () {},
                //     buttontitle: AppStrings.qrCodefour,
                //     arrow: false,
                //     buttontitleColor: ColorSets.colorPrimaryBlack)
                // FlatButton(
                //   color: ColorSets.colorPrimaryLightYellow,
                //   onPressed: () {},
                //   child: Text(''),
                //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // ),
                // FlatButton(
                //   color: ColorSets.colorPrimaryLightYellow,
                //   onPressed: () {},
                //   child: Text(''),
                //   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
