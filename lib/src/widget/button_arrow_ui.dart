import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/empty_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class ButtonArrow extends StatelessWidget {
  final Function navigatorfunc;
  final String buttontitle;
  final bool arrow;
  final Color buttontitleColor;
  final Color buttonColor;

  const ButtonArrow(
      {Key key,
      @required this.navigatorfunc,
      @required this.buttontitle,
      @required this.arrow,
      @required this.buttontitleColor,
      this.buttonColor = ColorSets.colorPrimaryLightYellow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (UniversalPlatform.isAndroid || UniversalPlatform.isWeb) {
    return FlatButton(
      disabledColor: ColorSets.disableButtonColor,
      color: buttonColor,
      shape: UniversalPlatform.isWeb
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: navigatorfunc,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: UniversalPlatform.isWeb ? 20 : 9),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              buttontitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.h3style.copyWith(color: buttontitleColor, fontWeight: FontWeight.w500),
            ),
          ),
          // SizedBox(width: 30),
          arrow
              ? CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: ColorSets.colorPrimaryWhite,
                  ),
                )
              : EmptyWidgetUI()
        ],
      ),
    );
    // } else if (UniversalPlatform.isIOS) {
    //   return CupertinoButton(
    //     color: ColorSets.colorPrimaryLightGreen,
    //     borderRadius: BorderRadius.circular(30),
    //     onPressed: navigatorfunc,
    //     padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
    //     child: Row(
    //       mainAxisSize: MainAxisSize.min,
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text(
    //           buttontitle,
    //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryWhite),
    //         ),
    //         SizedBox(width: 35),
    //         SizedBox(width: 35),
    //         arrow
    //             ? CircleAvatar(
    //                 radius: 11,
    //                 backgroundColor: Colors.grey[600],
    //                 child: Icon(
    //                   Icons.arrow_forward,
    //                   size: 16,
    //                   color: ColorSets.colorPrimaryWhite,
    //                 ),
    //               )
    //             : Visibility(
    //                 child: Text(''),
    //                 visible: false,
    //               )
    //       ],
    //     ),
    //   );
    // }
    // return EmptyWidgetUI();
  }
}
