import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';

class CompletedProcessWebUI extends StatelessWidget {
  final String title;
  final bool displaydetails;
  final String details;
  final String buttonTitle;

  CompletedProcessWebUI({this.title, this.buttonTitle, this.details, this.displaydetails});
  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      child: Padding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
              child: Image.asset(
                AppImages.azaPayLogo,
                scale: MediaQuery.of(context).size.aspectRatio.toDouble() * 8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppStrings.onBoardingOneWeb,
                style: AppTextStyles.h3style.copyWith(fontSize: 20),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  title,
                  style: AppTextStyles.h3style.copyWith(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            displaydetails
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        details,
                        style: AppTextStyles.h3style.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                : EmptyWidgetUI(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 6),
              child: OutlineButton(
                onPressed: null,
                child: Text(buttonTitle),
                borderSide: BorderSide(
                  color: Color(0XFFFFB300),
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
