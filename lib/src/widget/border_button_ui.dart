import 'package:azapay/app/app.dart';
import 'package:flutter/material.dart';

class BorderButtonUI extends StatelessWidget {
  final Function onPressed;
  final String title;
  final bool titlevalue;
  final Widget child;
  final double fontSize;
  final FontWeight fontWeight;
  final Color backgroundColor;

  BorderButtonUI(
      {this.onPressed,
      this.title,
      this.titlevalue = false,
      this.child,
      this.fontSize = 15,
      this.backgroundColor = Colors.transparent,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      hoverColor: ColorSets.colorPrimaryLightYellow,
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
      onPressed: onPressed,
      color: backgroundColor,
      child: titlevalue
          ? child
          : Text(
              title,
              style: AppTextStyles.h3style.copyWith(fontSize: fontSize, fontWeight: fontWeight),
            ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
          width: 2.0,
          color: ColorSets.colorPrimaryLightYellowDashBoard,
        ),
      ),
    );
  }
}
