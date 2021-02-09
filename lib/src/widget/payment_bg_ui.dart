import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';

class PaymentBackgroundUI extends StatelessWidget {
  final Widget titlebar, contentbody;
  final List<Widget> actionbar;

  const PaymentBackgroundUI({@required this.titlebar, this.actionbar, @required this.contentbody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSets.colorPrimaryWhite,
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorSets.colorPrimaryWhite,
        elevation: 0.0,
        centerTitle: true,
        title: titlebar,
        actions: actionbar,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: ColorSets.colorPrimaryWhite,
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.dstATop),
            image: AssetImage(
              AppImages.dashBoardAnkara,
            ),
          ),
        ),
        child: contentbody,
      ),
    );
  }
}
