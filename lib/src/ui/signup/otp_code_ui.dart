import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class OtpCodeUI extends StatefulWidget {
  const OtpCodeUI({Key key}) : super(key: key);

  @override
  _OtpCodeUIState createState() => _OtpCodeUIState();
}

class _OtpCodeUIState extends State<OtpCodeUI> {
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
    return Scaffold(
      key: _scaffoldKey,
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocListener<SignupBloc, SignupState>(
              listener: (context, state) async {
                if (state is SignupLoaded) {
                  if (state.basicResponse.status == 200) {
                    await Navigator.of(context, rootNavigator: true).pop();
                    await Navigator.pushReplacementNamed(
                      _scaffoldKey.currentContext,
                      AppRouteName.password_creation,
                    ).then((value) => _bloc.add(ReturnToInitial()));
                  } else if (state.basicResponse.status == 400) {
                    await Navigator.of(context, rootNavigator: true).pop();
                    _bloc.add(ReturnToInitial());
                    showToast(state.basicResponse.message,
                        backgroundColor: ColorSets.colorPrimaryRed,
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
                    // Scaffold.of(context)
                    //   ..hideCurrentSnackBar()
                    //   ..showSnackBar(
                    //     SnackBar(
                    //       duration: Duration(milliseconds: 2000),
                    //       elevation: 0.0,
                    //       backgroundColor: ColorSets.colorPrimaryRed,
                    //       content: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Expanded(
                    //             child: Text(
                    //               '${state.basicResponse.message}',
                    //               style: AppTextStyles.h3style,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   );
                  }
                } else if (state is SignupLoading) {
                  await showGeneralDialog(
                      context: context,
                      pageBuilder: (context, _, __) {
                        return LoadingUI(function: (_) {}, showtext: true);
                      },
                      barrierDismissible: true,
                      barrierLabel: '',
                      useRootNavigator: true,
                      barrierColor: Colors.black.withOpacity(0.8),
                      transitionDuration: Duration(milliseconds: 300),
                      transitionBuilder: (context, animation, __, child) {
                        return SlideTransition(
                          position:
                              Tween(begin: Offset(0, 1), end: Offset(0, 0))
                                  .animate(animation),
                          child: child,
                        );
                      });
                }
              },
              child: BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) => Center(
                        child: SingleChildScrollView(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 35.0),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: SvgPicture.asset(
                                      AppVectors.azaPayLogo,
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      AppStrings.signUpone,
                                      style: AppTextStyles.h2style,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 25.0, top: 25, left: 30.0),
                                  child: Text(
                                    AppStrings.otpCodeone,
                                    textAlign: TextAlign.left,
                                    style: AppTextStyles.h3style.copyWith(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 40.0),
                                    child: SizedBox(
                                      height: 50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: PinCodeTextField(
                                              controller: _pincontroller,
                                              textStyle: TextStyle(
                                                  fontWeight:
                                                      FontWeight.normal),
                                              obscureText: true,
                                              keyboardType:
                                                  TextInputType.number,
                                              textInputAction:
                                                  TextInputAction.done,
                                              enableActiveFill: true,
                                              pinTheme: PinTheme(
                                                  shape: PinCodeFieldShape.box,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  fieldHeight: 50,
                                                  selectedFillColor: ColorSets
                                                      .colorPrimaryWhite,
                                                  disabledColor: ColorSets
                                                      .colorPrimaryWhite,
                                                  selectedColor: ColorSets
                                                      .colorPrimaryLightYellow,
                                                  fieldWidth: 40,
                                                  activeColor: ColorSets
                                                      .colorPrimaryLightYellow,
                                                  inactiveColor:
                                                      ColorSets.colorPin,
                                                  inactiveFillColor:
                                                      ColorSets.colorPin,
                                                  activeFillColor: ColorSets
                                                      .colorPrimaryWhite),
                                              // backgroundColor: ColorSets.colorPrimaryBlack.withOpacity(0.7),
                                              length: 6,
                                              onChanged: (otpcodepin) =>
                                                  _bloc.add(
                                                OtpCodeSignUp(
                                                  otpcode: otpcodepin,
                                                ),
                                              ), appContext: context,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Text(AppStrings.otpCodetwo,
                                      style: AppTextStyles.h3style.copyWith(
                                        fontSize: 12,
                                        color: Colors.grey[500],
                                      ),
                                      textAlign: TextAlign.start),
                                ),
                                InkWell(
                                  onTap: () {
                                    _bloc.add(ResendOtpSignUp());
                                    _countdownController.restart();
                                    showToast(AppStrings.reloadText,
                                        backgroundColor:
                                            ColorSets.colorPrimaryLightYellow,
                                        context: context,
                                        animation:
                                            StyledToastAnimation.slideFromTop,
                                        reverseAnimation:
                                            StyledToastAnimation.slideToTop,
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
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 20.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundColor:
                                              ColorSets.colorPrimaryRed,
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
                                                style: TextStyle(
                                                    color: ColorSets
                                                        .colorPrimaryRed));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 60, vertical: 10),
                                    child: ButtonArrow(
                                      buttontitleColor:
                                          ColorSets.colorPrimaryWhite,
                                      arrow: true,
                                      navigatorfunc: (state is SignupLoaded)
                                          ? state.isOtpcodeValid
                                              ? () async {
                                                  await _bloc.add(
                                                      SubmitSignUpForm(
                                                          screen: 1));
                                                }
                                              : null
                                          : null,
                                      buttontitle: AppStrings.otpCodefive,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
            )),
      ),
    );
  }
}
