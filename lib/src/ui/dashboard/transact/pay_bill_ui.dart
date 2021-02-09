import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PayBillUI extends StatefulWidget {
  @override
  _PayBillUIState createState() => _PayBillUIState();
}

class _PayBillUIState extends State<PayBillUI> {
  final Map<String, String> payBillItem = {
    AppStrings.payBillElectric: AppVectors.electricity,
    AppStrings.payBillTVCable: AppVectors.tvcable,
    // AppStrings.payBillWaterBill: AppVectors.waterbill,
    // AppStrings.payBillNeworkBill: AppVectors.networkbill,
    // AppStrings.payBillTithes: AppVectors.tithes,
    // AppStrings.payBillTaxes: AppVectors.taxes
  };

  @override
  Widget build(BuildContext context) {
    return PaymentBackgroundUI(
      titlebar: Text(
        AppStrings.payBillTitle,
        style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
      ),
      contentbody: GridView.builder(
        itemCount: payBillItem.length,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return PayBillItem(
            assetName: payBillItem.entries.elementAt(index).value,
            onTapped: [2, 3, 4, 5, 7].contains(index)
                ? () {
                    Navigator.pushNamed(
                      context,
                      AppRouteName.paybillservices,
                      arguments: PayBillsName(
                        screen: index++,
                        hint: AppStrings.paybillsElectricityMeterNo,
                      ),
                    );
                  }
                : () {
                    showToast(AppStrings.paybillsFeatureComingSoon,
                        backgroundColor: ColorSets.colorPrimaryLightYellow,
                        context: context,
                        animation: StyledToastAnimation.slideFromTop,
                        reverseAnimation: StyledToastAnimation.slideToTop,
                        position: StyledToastPosition.top,
                        startOffset: Offset(0.0, -3.0),
                        reverseEndOffset: Offset(0.0, -3.0),
                        duration: Duration(seconds: 4),
                        //Animation duration   animDuration * 2 <= duration
                        animDuration: Duration(seconds: 1),
                        curve: Curves.elasticOut,
                        reverseCurve: Curves.fastOutSlowIn);
                  },
            title: payBillItem.entries.elementAt(index).key,
          );
        },
      ),
    );
  }
}

class PayBillItem extends StatelessWidget {
  final String assetName;
  final Function onTapped;
  final String title;

  const PayBillItem({
    Key key,
    @required this.assetName,
    @required this.onTapped,
    @required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTapped,
        child: Card(
          elevation: 0.0,
          color: Color(0XFFF3F3F3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(assetName),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(title,
                    style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold, fontSize: 15), maxLines: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  [
//           PayBillItem(
//             assetName: AppVectors.electricity,
//             onTapped: () {
//               // showToast(AppStrings.paybillsFeatureComingSoon,
//               //     backgroundColor: ColorSets.colorPrimaryLightYellow,
//               //     context: context,
//               //     animation: StyledToastAnimation.slideFromTop,
//               //     reverseAnimation: StyledToastAnimation.slideToTop,
//               //     position: StyledToastPosition.top,
//               //     startOffset: Offset(0.0, -3.0),
//               //     reverseEndOffset: Offset(0.0, -3.0),
//               //     duration: Duration(seconds: 4),
//               //     //Animation duration   animDuration * 2 <= duration
//               //     animDuration: Duration(seconds: 1),
//               //     curve: Curves.elasticOut,
//               //     reverseCurve: Curves.fastOutSlowIn);
//               // Scaffold.of(context).showSnackBar(
//               //   SnackBar(
//               //     backgroundColor: ColorSets.colorPrimaryLightYellow,
//               //     content: Row(
//               //       mainAxisSize: MainAxisSize.min,
//               //       children: [
//               //         Text(
//               //           AppStrings.paybillsFeatureComingSoon,
//               //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // );
//               Navigator.pushNamed(
//                 context,
//                 AppRouteName.paybillservices,
//                 arguments: PayBillsName(
//                   screen: 2,
//                   hint: AppStrings.paybillsElectricityMeterNo,
//                 ),
//               );
//             },
//             title: AppStrings.payBillElectric,
//           ),
//           PayBillItem(
//             assetName: AppVectors.waterbill,
//             onTapped: () {
//               showToast(AppStrings.paybillsFeatureComingSoon,
//                   backgroundColor: ColorSets.colorPrimaryLightYellow,
//                   context: context,
//                   animation: StyledToastAnimation.slideFromTop,
//                   reverseAnimation: StyledToastAnimation.slideToTop,
//                   position: StyledToastPosition.top,
//                   startOffset: Offset(0.0, -3.0),
//                   reverseEndOffset: Offset(0.0, -3.0),
//                   duration: Duration(seconds: 4),
//                   //Animation duration   animDuration * 2 <= duration
//                   animDuration: Duration(seconds: 1),
//                   curve: Curves.elasticOut,
//                   reverseCurve: Curves.fastOutSlowIn);
//               // Scaffold.of(context).showSnackBar(
//               //   SnackBar(
//               //     backgroundColor: ColorSets.colorPrimaryLightYellow,
//               //     content: Row(
//               //       mainAxisSize: MainAxisSize.min,
//               //       children: [
//               //         Text(
//               //           AppStrings.paybillsFeatureComingSoon,
//               //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // );
//               // Navigator.pushNamed(context, AppRouteName.paybillservices, arguments: PayBillsName(screen:3,),);
//             },
//             title: AppStrings.payBillWaterBill,
//           ),
//           PayBillItem(
//             assetName: AppVectors.networkbill,
//             onTapped: () {
//               // showToast(AppStrings.paybillsFeatureComingSoon,
//               //     backgroundColor: ColorSets.colorPrimaryLightYellow,
//               //     context: context,
//               //     animation: StyledToastAnimation.slideFromTop,
//               //     reverseAnimation: StyledToastAnimation.slideToTop,
//               //     position: StyledToastPosition.top,
//               //     startOffset: Offset(0.0, -3.0),
//               //     reverseEndOffset: Offset(0.0, -3.0),
//               //     duration: Duration(seconds: 4),
//               //     //Animation duration   animDuration * 2 <= duration
//               //     animDuration: Duration(seconds: 1),
//               //     curve: Curves.elasticOut,
//               //     reverseCurve: Curves.fastOutSlowIn);
//               // Scaffold.of(context).showSnackBar(
//               //   SnackBar(
//               //     backgroundColor: ColorSets.colorPrimaryLightYellow,
//               //     content: Row(
//               //       mainAxisSize: MainAxisSize.min,
//               //       children: [
//               //         Text(
//               //           AppStrings.paybillsFeatureComingSoon,
//               //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // );
//               // Navigator.pushNamed(context, AppRouteName.paybillservices, arguments: PayBillsName(screen:4));
//             },
//             title: AppStrings.payBillNeworkBill,
//           ),
//           PayBillItem(
//             assetName: AppVectors.tithes,
//             onTapped: () {
//               showToast(AppStrings.paybillsFeatureComingSoon,
//                   backgroundColor: ColorSets.colorPrimaryLightYellow,
//                   context: context,
//                   animation: StyledToastAnimation.slideFromTop,
//                   reverseAnimation: StyledToastAnimation.slideToTop,
//                   position: StyledToastPosition.top,
//                   startOffset: Offset(0.0, -3.0),
//                   reverseEndOffset: Offset(0.0, -3.0),
//                   duration: Duration(seconds: 4),
//                   //Animation duration   animDuration * 2 <= duration
//                   animDuration: Duration(seconds: 1),
//                   curve: Curves.elasticOut,
//                   reverseCurve: Curves.fastOutSlowIn);
//               // Scaffold.of(context).showSnackBar(
//               //   SnackBar(
//               //     backgroundColor: ColorSets.colorPrimaryLightYellow,
//               //     content: Row(
//               //       mainAxisSize: MainAxisSize.min,
//               //       children: [
//               //         Text(
//               //           AppStrings.paybillsFeatureComingSoon,
//               //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // );
//               // Navigator.pushNamed(context, AppRouteName.paybillservices, arguments: PayBillsName(screen:5,),);
//             },
//             title: AppStrings.payBillTithes,
//           ),
//           PayBillItem(
//             assetName: AppVectors.tvcable,
//             onTapped: () {
//               // showToast(AppStrings.paybillsFeatureComingSoon,
//               //     backgroundColor: ColorSets.colorPrimaryLightYellow,
//               //     context: context,
//               //     animation: StyledToastAnimation.slideFromTop,
//               //     reverseAnimation: StyledToastAnimation.slideToTop,
//               //     position: StyledToastPosition.top,
//               //     startOffset: Offset(0.0, -3.0),
//               //     reverseEndOffset: Offset(0.0, -3.0),
//               //     duration: Duration(seconds: 4),
//               //     //Animation duration   animDuration * 2 <= duration
//               //     animDuration: Duration(seconds: 1),
//               //     curve: Curves.elasticOut,
//               //     reverseCurve: Curves.fastOutSlowIn);
//               // Scaffold.of(context).showSnackBar(
//               //   SnackBar(
//               //     backgroundColor: ColorSets.colorPrimaryLightYellow,
//               //     content: Row(
//               //       mainAxisSize: MainAxisSize.min,
//               //       children: [
//               //         Text(
//               //           AppStrings.paybillsFeatureComingSoon,
//               //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // );
//               Navigator.pushNamed(context, AppRouteName.paybillservices,
//                   arguments: PayBillsName(screen: 6, hint: AppStrings.paybillsCableSmartCard));
//             },
//             title: AppStrings.payBillTVCable,
//           ),
//           PayBillItem(
//             assetName: AppVectors.taxes,
//             onTapped: () {
//               showToast(AppStrings.paybillsFeatureComingSoon,
//                   backgroundColor: ColorSets.colorPrimaryLightYellow,
//                   context: context,
//                   animation: StyledToastAnimation.slideFromTop,
//                   reverseAnimation: StyledToastAnimation.slideToTop,
//                   position: StyledToastPosition.top,
//                   startOffset: Offset(0.0, -3.0),
//                   reverseEndOffset: Offset(0.0, -3.0),
//                   duration: Duration(seconds: 4),
//                   //Animation duration   animDuration * 2 <= duration
//                   animDuration: Duration(seconds: 1),
//                   curve: Curves.elasticOut,
//                   reverseCurve: Curves.fastOutSlowIn);
//               // Scaffold.of(context).showSnackBar(
//               //   SnackBar(
//               //     backgroundColor: ColorSets.colorPrimaryLightYellow,
//               //     content: Row(
//               //       mainAxisSize: MainAxisSize.min,
//               //       children: [
//               //         Text(
//               //           AppStrings.paybillsFeatureComingSoon,
//               //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // );
//               // Navigator.pushNamed(context, AppRouteName.paybillservices, arguments: 7);
//             },
//             title: AppStrings.payBillTaxes,
//           ),
//         ],
