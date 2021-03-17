import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BankUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DashBoardBackgroundUI(
      title: AppStrings.bankOne,
      subtitle: AppStrings.bankTwo,
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BankItem(
              onTapped: () {
                Navigator.pushNamed(context, AppRouteName.linkbank);
              },
              assetName: AppVectors.linkbank,
              textStyle:
                  AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold),
              title: AppStrings.bankThreeI,
            ),
            BankItem(
                onTapped: () {
                  Navigator.pushNamed(context, AppRouteName.bankmaketransfer);
                },
                assetName: AppVectors.maketransfer,
                textStyle:
                    AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold),
                title: AppStrings.bankThreeII),
            BankItem(
              onTapped: () {
                Navigator.pushNamed(context, AppRouteName.cardlessWithdrawal);
              },
              assetName: AppVectors.completewithdrawal,
              title: AppStrings.bankThreeIII,
              textStyle:
                  AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class BankItem extends StatelessWidget {
  final Function onTapped;
  final String assetName;
  final String title;
  final String subtitle;
  final bool visiblesubtitle;
  final TextStyle textStyle;

  const BankItem(
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
              // width: MediaQuery.of(context).size.height >= 820 ? 15 : 50,
              // height: MediaQuery.of(context).size.height >= 820 ? 15 : 40,
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
