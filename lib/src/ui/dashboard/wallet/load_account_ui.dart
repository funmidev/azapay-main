import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadAccountUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaymentBackgroundUI(
      titlebar: Text(
        AppStrings.loadAcctTitle,
        style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      contentbody: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          LoadAccountItem(
              onTapped: () {
                Navigator.pushNamed(context, AppRouteName.walletloadbytransfer);
              },
              assetName: AppVectors.loadbytranfer,
              title: AppStrings.loadAcctTransfer,
              subtitle: AppStrings.loadAcctTransferSubTitle),
          SizedBox(
            height: 10,
          ),
          LoadAccountItem(
              onTapped: () {
                Navigator.pushNamed(context, AppRouteName.walletloadbyussd);
              },
              assetName: AppVectors.loadbyussd,
              title: AppStrings.loadAcctUSSD,
              subtitle: AppStrings.loadAcctUSSDSubTitle)
        ],
      ),
    );
  }
}

class LoadAccountItem extends StatelessWidget {
  final Function onTapped;
  final String assetName;
  final String title;
  final String subtitle;

  const LoadAccountItem(
      {Key key, @required this.onTapped, @required this.assetName, @required this.title, @required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Card(
        color: ColorSets.colorPin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(assetName),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                        style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                      child: Text(
                        subtitle,
                        maxLines: 2,
                        style: AppTextStyles.h3style.copyWith(fontSize: 12),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
