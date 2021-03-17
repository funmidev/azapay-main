import 'package:azapay/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget.dart';

class OnBoardMainUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: (MediaQuery.of(context).size.width >=480.0  || MediaQuery.of(context).size.width >= 853.0) ? MainAxisAlignment.center : null,
        children: [
          Expanded(child: Center(child: Image.asset(AppImages.onBoarding))
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: AspectRatio(
              //     aspectRatio: (AppBreakPoint.mediumscreen(context)
              //             ? MediaQuery.of(context).size.width / 4
              //             : MediaQuery.of(context).size.width / 3.5) /
              //         (AppBreakPoint.mediumscreen(context)
              //             ? MediaQuery.of(context).size.height / 8
              //             : MediaQuery.of(context).size.height / 5.8),
              //     child: SvgPicture.asset(
              //       AppVectors.onBoarding,
              //       width: 200,
              //       height: 150,
              //       alignment: Alignment.bottomLeft,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        AppStrings.onBoardingone,
                        style: AppTextStyles.h1style.copyWith(
                            fontSize:
                                AppBreakPoint.mediumscreen(context) ? 40 : 28),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonArrow(
                      buttontitleColor: ColorSets.colorPrimaryWhite,
                      arrow: true,
                      navigatorfunc: () async {
                        await Navigator.pushNamed(
                            context, AppRouteName.email_creation);
                      },
                      buttontitle: AppStrings.onBoardingthree,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppStrings.onBoardingfour,
                        style: AppTextStyles.h3style.copyWith(fontSize: 13),
                      ),
                      SizedBox(height: 2),
                      GestureDetector(
                        onTap: () async {
                          await Navigator.pushNamed(
                              context, AppRouteName.signin);

                          // await Navigator.pushNamed(
                          //     context, AppRouteName.merchant);
                        },
                        child: Text(
                          AppStrings.onBoardingfive,
                          style: AppTextStyles.h3style.copyWith(
                              fontSize: 13,
                              color: ColorSets.colorPrimaryLightGreen),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
