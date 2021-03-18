import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AzaAgentUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DashBoardBackgroundUI(
      title: AppStrings.azaAgentOne,
      subtitle: AppStrings.azaAgentTwo,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              ///
              ///-----cardless withdrawal---------
              AzaItem(
                onTapped: () {
                  Navigator.pushNamed(context, AppRouteName.cardlessWithdrawal);
                },
                assetName: AppVectors.completewithdrawal,
                title: AppStrings.azaAgentI,
                textStyle:
                    AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: 30.0,
              ),

              ///
              ///
              ///--------Locate an AzaAgent-----------
              AzaItem(
                onTapped: () {
                  //Location();
                  Navigator.pushNamed(context, AppRouteName.locateAzaAgent);
                },
                assetName: AppVectors.linkbank,
                textStyle:
                    AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold),
                title: AppStrings.azaAgentII,
              ),

              SizedBox(
                height: 30.0,
              ),

              ///
              ///
              ///-------Saved Beneficiaries-----------
              AzaItem(
                  onTapped: () {
                    Navigator.pushNamed(context, AppRouteName.saveBeneficiary);
                  },
                  assetName: AppVectors.maketransfer,
                  textStyle: AppTextStyles.h3style
                      .copyWith(fontWeight: FontWeight.bold),
                  title: AppStrings.azaAgentIII),
            ],
          ),
        ),
      ),
    );
  }
}

class AzaItem extends StatelessWidget {
  final Function onTapped;
  final String assetName;
  final String title;
  final String subtitle;
  final bool visiblesubtitle;
  final TextStyle textStyle;

  const AzaItem(
      {Key key,
      @required this.onTapped,
      @required this.assetName,
      @required this.title,
      @required this.textStyle,
      this.subtitle = '',
      this.visiblesubtitle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTapped,
        child: Row(
          children: [
            SvgPicture.asset(
              assetName,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: textStyle),
                  visiblesubtitle
                      ? Text(
                          subtitle,
                          textAlign: TextAlign.left,
                          style: AppTextStyles.h3style.copyWith(
                              color: ColorSets.colorPrimaryLightYellow,
                              fontSize: 10),
                        )
                      : EmptyWidgetUI()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
