import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpCodeUIWeb extends StatefulWidget {
  @override
  _OtpCodeUIWebState createState() => _OtpCodeUIWebState();
}

class _OtpCodeUIWebState extends State<OtpCodeUIWeb> {
  CountdownController _countdownController;

  TextEditingController _pincontroller;

  SignupBloc _bloc;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _bloc = context.bloc<SignupBloc>();
    _pincontroller = TextEditingController();

    super.initState();
    _countdownController = CountdownController();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      child: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) async {
          if (state is SignupLoaded) {
            if (state.basicResponse.status == 200) {
              await Navigator.of(context, rootNavigator: true).pop();
              await Navigator.pushReplacementNamed(
                context,
                AppRouteName.signupPasswordWeb,
              ).then((value) => _bloc.add(ReturnToInitial()));
            } else if (state.basicResponse.status == 400) {
              await Navigator.of(context, rootNavigator: true).pop();
              await showGeneralDialog(
                  context: context,
                  pageBuilder: (context, _, __) {
                    return CustomDialogUI(
                        icontitle: false,
                        titleheader: AppStrings.errorTitle,
                        subtitle: state.signUp.message,
                        twobutton: false,
                        discardtitle: AppStrings.empty,
                        discardtitleColor: ColorSets.colorPrimaryBlack,
                        discardColor: null,
                        acceptedbutton: null,
                        acceptedtitle: AppStrings.empty,
                        acceptedtitleColor: ColorSets.colorPrimaryBlack,
                        acceptedColor: ColorSets.colorPrimaryWhite,
                        centerbutton: () async {
                          await Navigator.of(context, rootNavigator: true)
                              .pop();
                        },
                        centertitle: AppStrings.cancel,
                        centerColor: ColorSets.colorPrimaryRed,
                        centertitleColor: ColorSets.colorPrimaryWhite);
                  },
                  barrierDismissible: true,
                  barrierLabel: '',
                  useRootNavigator: true,
                  barrierColor: Colors.black.withOpacity(0.8),
                  transitionDuration: Duration(milliseconds: 300),
                  transitionBuilder: (context, animation, __, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                          .animate(animation),
                      child: child,
                    );
                  });
            }
          } else if (state is SignupLoading) {
            await showGeneralDialog(
                context: context,
                pageBuilder: (context, _, __) {
                  return CustomDialogUI(
                      loading: true,
                      icontitle: false,
                      titleheader: null,
                      subtitle: AppStrings.empty,
                      twobutton: false,
                      discardtitle: AppStrings.empty,
                      discardtitleColor: Colors.transparent,
                      discardColor: Colors.transparent,
                      acceptedbutton: null,
                      acceptedtitle: AppStrings.empty,
                      acceptedtitleColor: Colors.transparent,
                      acceptedColor: Colors.transparent,
                      centerbutton: null,
                      centertitle: AppStrings.empty,
                      centerColor: null,
                      centertitleColor: null);
                },
                barrierDismissible: true,
                barrierLabel: '',
                useRootNavigator: true,
                barrierColor: Colors.black.withOpacity(0.8),
                transitionDuration: Duration(milliseconds: 300),
                transitionBuilder: (context, animation, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                        .animate(animation),
                    child: child,
                  );
                });
          }
        },
        builder: (context, state) => Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRouteName.onboardingWeb);
                },
                hoverColor: Colors.transparent,
                child: Image.asset(
                  AppImages.azaPayLogo,
                  scale: 18,
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
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    AppStrings.otpCodeone,
                    textAlign: TextAlign.left,
                    style: AppTextStyles.h3style
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 2, top: 10),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: PinInputTextField(
                        pinLength: 6,
                        decoration: BoxLooseDecoration(
                          strokeColorBuilder: PinListenColorBuilder(
                              ColorSets.colorPrimaryLightYellow,
                              ColorSets.colorPin),
                          bgColorBuilder: PinListenColorBuilder(
                              ColorSets.colorPin, ColorSets.colorPrimaryWhite),
                          obscureStyle: ObscureStyle(
                            isTextObscure: true,
                            obscureText: '*',
                          ),
                          hintText: '      ',
                        ),
                        controller: _pincontroller,
                        textInputAction: TextInputAction.go,
                        enabled: true,
                        inputFormatters: [LengthLimitingTextInputFormatter(6)],
                        keyboardType: TextInputType.number,
                        textCapitalization: TextCapitalization.characters,
                        // onSubmit: (pin) {
                        //   debugPrint('submit pin:$pin');
                        // },
                        onChanged: (otpcodepin) => _bloc.add(
                          OtpCodeSignUp(
                            otpcode: otpcodepin,
                          ),
                        ),
                        enableInteractiveSelection: false,
                      )
                          // PinCodeTextField(
                          //               controller: _pincontroller,
                          //               textStyle: TextStyle(fontWeight: FontWeight.normal),
                          //               obsecureText: true,
                          //               textInputType: TextInputType.number,
                          //               textInputAction: TextInputAction.done,
                          //               enableActiveFill: true,
                          //               pinTheme: PinTheme(
                          //                   shape: PinCodeFieldShape.box,
                          //                   borderRadius: BorderRadius.circular(5),
                          //                   fieldHeight: 50,
                          //                   selectedFillColor: ColorSets.colorPrimaryWhite,
                          //                   disabledColor: ColorSets.colorPrimaryWhite,
                          //                   selectedColor: ColorSets.colorPrimaryLightYellow,
                          //                   fieldWidth: 40,
                          //                   activeColor: ColorSets.colorPrimaryLightYellow,
                          //                   inactiveColor: ColorSets.colorPin,
                          //                   inactiveFillColor: ColorSets.colorPin,
                          //                   activeFillColor: ColorSets.colorPrimaryWhite),
                          //               // backgroundColor: ColorSets.colorPrimaryBlack.withOpacity(0.7),
                          //               length: 6,
                          //               onChanged: (otpcodepin) => _bloc.add(
                          //                 OtpCodeSignUp(
                          //                   otpcode: otpcodepin,
                          //                 ),
                          //               ),
                          //             ),
                          ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                AppStrings.otpCodetwo,
                style: AppTextStyles.h3style.copyWith(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
                // textAlign: TextAlign.start
              ),
              InkWell(
                onTap: () {
                  _bloc.add(ResendOtpSignUp());
                  _countdownController.restart();
                  showToast(AppStrings.reloadText,
                      backgroundColor: ColorSets.colorPrimaryLightYellow,
                      context: context,
                      animation: StyledToastAnimation.slideFromTop,
                      reverseAnimation: StyledToastAnimation.slideToTop,
                      position: StyledToastPosition.top,
                      startOffset: Offset(0.0, -3.0),
                      reverseEndOffset: Offset(0.0, -3.0),
                      duration: Duration(seconds: 4),
                      //Animation duration   animDuration * 2 <= duration
                      animDuration: Duration(seconds: 1),
                      curve: Curves.elasticOut,
                      reverseCurve: Curves.fastOutSlowIn);
                  // Scaffold.of(context).showSnackBar(
                  //   SnackBar(
                  //     backgroundColor: ColorSets.colorPrimaryLightYellow,
                  //     content: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Text(
                  //           AppStrings.reloadText,
                  //           style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryBlack),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: ColorSets.colorPrimaryRed,
                        child: Icon(
                          Icons.refresh,
                          size: 10,
                          color: ColorSets.colorPrimaryWhite,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        AppStrings.otpCodethree,
                        style: AppTextStyles.h3style.copyWith(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                      Countdown(
                        controller: _countdownController,
                        seconds: 60,
                        onFinished: () {
                          // retry by add a event to bloc to send a new otp code again
                        },
                        build: (context, remaining) {
                          return Text(
                              '${remaining.toInt()} secs ${AppStrings.otpCodefour}',
                              style:
                                  TextStyle(color: ColorSets.colorPrimaryRed));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 3.5, top: 20),
                child: BorderButtonUI(
                  onPressed: (state is SignupLoaded)
                      ? state.isOtpcodeValid
                          ? () async {
                              await _bloc.add(SubmitSignUpForm(screen: 1));
                            }
                          : null
                      : null,
                  title: AppStrings.otpCodefive,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
