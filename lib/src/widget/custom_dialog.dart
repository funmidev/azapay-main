import 'package:azapay/app/app.dart';
import 'package:azapay/src/widget/button_arrow_ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:universal_platform/universal_platform.dart';

class CustomDialogUI extends StatefulWidget {
  final bool icontitle;
  final String titleheader;
  final String subtitle;
  final bool twobutton;
  final String discardtitle;
  final Color discardtitleColor;
  final Color discardColor;
  final Function disablebutton;
  final bool allowdisablepop;
  final Function acceptedbutton;
  final String acceptedtitle;
  final Color acceptedColor;
  final Color acceptedtitleColor;
  final Function centerbutton;
  final String centertitle;
  final Color centertitleColor;
  final Color centerColor;
  final bool loading;
  final bool input;
  final Function(String) onChanged;
  final String inputtitle;
  final String inputdetails;
  final String inputhint;
  final TextEditingController inputFieldController;

  const CustomDialogUI(
      {Key key,
      @required this.icontitle,
      @required this.titleheader,
      @required this.subtitle,
      @required this.twobutton,
      @required this.discardtitle,
      @required this.discardtitleColor,
      @required this.discardColor,
      this.disablebutton,
      this.allowdisablepop = true,
      @required this.acceptedbutton,
      @required this.acceptedtitle,
      @required this.acceptedtitleColor,
      @required this.acceptedColor,
      @required this.centerbutton,
      @required this.centertitle,
      @required this.centerColor,
      @required this.centertitleColor,
      this.inputFieldController,
      this.onChanged,
      this.inputdetails,
      this.inputhint,
      this.inputtitle,
      this.input = false,
      this.loading = false})
      : super(key: key);
  @override
  _CustomDialogUIState createState() => _CustomDialogUIState();
}

class _CustomDialogUIState extends State<CustomDialogUI> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        child: Container(
          height:
              UniversalPlatform.isWeb ? MediaQuery.of(context).size.width / 4 : MediaQuery.of(context).size.width / 1.8,
          width:
              UniversalPlatform.isWeb ? MediaQuery.of(context).size.width / 3 : MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            color: ColorSets.colorPrimaryWhite,
            borderRadius: widget.input
                ? BorderRadius.circular(UniversalPlatform.isWeb ? 0 : 40.0)
                : BorderRadius.circular(UniversalPlatform.isWeb ? 2 : 40.0),
          ),
          child: widget.input
              ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.inputtitle,
                        style: AppTextStyles.h2style,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        widget.inputdetails,
                        style: AppTextStyles.h3style,
                        textAlign: TextAlign.center,
                      ),
                      FormFieldUI(
                          currentnode: null,
                          borderradius: 10,
                          maxLength: 6,
                          contentpad: 13,
                          fieldController: widget.inputFieldController,
                          hint: widget.inputhint,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                          errorText: null,
                          onchanged: widget.onChanged),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 10),
                        child: ButtonArrow(
                          navigatorfunc: widget.centerbutton,
                          buttontitle: widget.centertitle,
                          arrow: false,
                          buttontitleColor: widget.centertitleColor,
                          buttonColor: widget.centerColor,
                        ),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.loading
                      ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: CircularProgressIndicator(
                                strokeWidth: 10,
                                backgroundColor: ColorSets.colorPrimaryWhite,
                                valueColor: AlwaysStoppedAnimation<Color>(Color(0XFFFFB300)),
                              ),
                            ),
                          ),
                        ])
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            widget.icontitle
                                ? Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(widget.titleheader),
                                    ),
                                  )
                                : Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.titleheader,
                                        style: AppTextStyles.h2style,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.subtitle,
                                  style: AppTextStyles.h3style.copyWith(fontSize: UniversalPlatform.isWeb ? 20 : 17),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            widget.twobutton
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ButtonArrow(
                                          navigatorfunc: widget.acceptedbutton,
                                          buttontitle: widget.acceptedtitle,
                                          arrow: false,
                                          buttontitleColor: widget.acceptedtitleColor,
                                          buttonColor: widget.acceptedColor,
                                        ),
                                      )),
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ButtonArrow(
                                          navigatorfunc: widget.allowdisablepop
                                              ? () {
                                                  Navigator.pop(context);
                                                }
                                              : widget.disablebutton,
                                          buttontitle: widget.discardtitle,
                                          arrow: false,
                                          buttontitleColor: widget.discardtitleColor,
                                          buttonColor: widget.discardColor,
                                        ),
                                      ))
                                    ],
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                    child: ButtonArrow(
                                      navigatorfunc: widget.centerbutton,
                                      buttontitle: widget.centertitle,
                                      arrow: false,
                                      buttontitleColor: widget.centertitleColor,
                                      buttonColor: widget.centerColor,
                                    ),
                                  )
                          ],
                        ),
                ),
        ),
      ),
    );
  }
}

// showGeneralDialog(
//   context: context,
//   pageBuilder: (context, _, __) {
//     return CustomDialogUI(
//         icontitle: true,
//         titleheader: AppVectors.greenMark,
//         subtitle: 'null',
//         twobutton: false,
//         discardbutton: () {},
//         discardtitle: 'null',
//         discardtitleColor: Colors.black,
//         discardColor: ColorSets.colorPrimaryLightGreen,
//         acceptedbutton: () {},
//         acceptedtitle: "null",
//         acceptedtitleColor: Colors.red,
//         acceptedColor: Colors.pink,
//         centerbutton: (){
//           Navigator.pop(context);
//         },
//         centertitle: 'null',
//         centerColor: Colors.black,
//         centertitleColor: Colors.black);
//   },
//   barrierDismissible: true,
//   barrierLabel: '',
//   barrierColor: Colors.black.withOpacity(0.8),
//   transitionDuration: Duration(milliseconds: 300),
//   transitionBuilder:
//       (context, animation, __, child) {
//     return SlideTransition(
//       position: Tween(
//               begin: Offset(0, 1),
//               end: Offset(0, 0))
//           .animate(animation),
//       child: child,
//     );
//   });
