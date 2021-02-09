import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';

class OnBoardingMainUIWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.azaPayLogo,
            scale: MediaQuery.of(context).size.aspectRatio.toDouble() * 6,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              AppStrings.onBoardingOneWeb,
              style: AppTextStyles.h3style.copyWith(
                fontSize: 35,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 80),
                child: BorderButtonUI(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouteName.signupEmailPhoneWeb);
                  },
                  title: AppStrings.signUponetitle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 80),
                child: BorderButtonUI(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouteName.signinWeb);
                  },
                  title: AppStrings.signInone,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
