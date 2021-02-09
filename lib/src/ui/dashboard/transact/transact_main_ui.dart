import 'package:azapay/app/app.dart';
import 'package:azapay/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuyAndPayUI extends StatefulWidget {
  @override
  _BuyAndPayUIState createState() => _BuyAndPayUIState();
}

class _BuyAndPayUIState extends State<BuyAndPayUI> with SingleTickerProviderStateMixin {
  final Color _blackOpac = Colors.black.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _blackOpac,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BuyAndPayItem(
              assetName: AppVectors.buyairtime,
              title: AppStrings.businessCenterOne,
              right: 10,
              onTapped: () {
                Navigator.pushNamed(
                  context,
                  AppRouteName.paybillservices,
                  arguments: PayBillsName(
                    screen: 0,
                  ),
                );
              },
            ),
            BuyAndPayItem(
              assetName: AppVectors.buydata,
              title: AppStrings.businessCenterTwo,
              right: 30,
              onTapped: () {
                Navigator.pushNamed(
                  context,
                  AppRouteName.paybillservices,
                  arguments: PayBillsName(
                    screen: 1,
                  ),
                );
              },
            ),
            BuyAndPayItem(
              assetName: AppVectors.paybill,
              title: AppStrings.businessCenterThree,
              onTapped: () {
                // showToast(AppStrings.paybillsFeatureComingSoon,
                //     backgroundColor: ColorSets.colorPrimaryLightYellow,
                //     context: context,
                //     animation: StyledToastAnimation.slideFromTop,
                //     reverseAnimation: StyledToastAnimation.slideToTop,
                //     position: StyledToastPosition.top,
                //     startOffset: Offset(0.0, -3.0),
                //     reverseEndOffset: Offset(0.0, -3.0),
                //     duration: Duration(seconds: 4),
                //     //Animation duration   animDuration * 2 <= duration
                //     animDuration: Duration(seconds: 1),
                //     curve: Curves.elasticOut,
                //     reverseCurve: Curves.fastOutSlowIn);
                // Scaffold.of(context).showSnackBar(
                //   SnackBar(
                //     backgroundColor: ColorSets.colorPrimaryLightYellow,
                //     content: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text(
                //           AppStrings.paybillsFeatureComingSoon,
                //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
                //         ),
                //       ],
                //     ),
                //   ),
                // );
                Navigator.pushNamed(context, AppRouteName.paybills);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BuyAndPayItem extends StatelessWidget {
  final String assetName;
  final String title;
  final double right;
  final Function onTapped;

  const BuyAndPayItem(
      {Key key, @required this.assetName, @required this.title, @required this.onTapped, this.right = 40.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, right: right, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(assetName),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                title,
                style: AppTextStyles.h3style.copyWith(fontSize: 18, color: ColorSets.colorPrimaryWhite),
              ),
            )
          ],
        ),
      ),
    );
  }
}
