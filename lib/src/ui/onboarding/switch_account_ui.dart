import 'dart:async';

import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SwitchAccountUI extends StatefulWidget {
  final String azatag;

  const SwitchAccountUI({this.azatag});

  @override
  _SwitchAccountUIState createState() => _SwitchAccountUIState();
}

class _SwitchAccountUIState extends State<SwitchAccountUI> {
  bool _passwordvisible;
  SigninBloc _bloc;
  final TextEditingController _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _passwordvisible = false;
    _bloc = BlocProvider.of<SigninBloc>(context);
  }

  @override
  void dispose() {
    _bloc.add(ClearSigninForm());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
      ),
      key: _scaffoldKey,
      body: SafeArea(
        child: Center(
          child: BlocListener<SigninBloc, SigninState>(
            listener: (context, state) async {
              if (state is InputDataSigninState) {
                if (state.basicResponse.status == 200) {
                  await Navigator.of(context, rootNavigator: true).pop();
                  _passwordController.clear();
                  await _bloc.add(ClearSigninForm());
                  await Navigator.pushReplacementNamed(
                    _scaffoldKey.currentContext,
                    AppRouteName.home,
                  );
                } else if (state.basicResponse.status >= 203) {
                  await Navigator.of(context, rootNavigator: true).pop();
                  showToast(
                      state.basicResponse.status == 400 ? 'An Error Occurred, Try again.' : state.basicResponse.message,
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
                  //               state.status == 400 ? 'An Error Occurred, Try again.' : state.message,
                  //               style: AppTextStyles.h3style,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   );
                  _bloc.add(ClearSigninForm());
                }
              } else if (state is LoadingSigninState) {
                await showGeneralDialog(
                    context: context,
                    pageBuilder: (context, _, __) {
                      return WillPopScope(
                          onWillPop: () async {
                            _passwordController.clear();
                          },
                          child: LoadingUI(function: (_) {}, showtext: true));
                    },
                    barrierDismissible: true,
                    useRootNavigator: true,
                    barrierLabel: '',
                    barrierColor: Colors.black.withOpacity(0.8),
                    transitionDuration: Duration(milliseconds: 300),
                    transitionBuilder: (context, animation, __, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                        child: child,
                      );
                    });
              }
            },
            child: BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) => Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Hero(
                                tag: 'onboard',
                                child: Image.asset(
                                  AppImages.onBoarding,
                                  width: 180,
                                  height: 180,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 25),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.switchaccount,
                            textAlign: TextAlign.left,
                            style: AppTextStyles.h1style.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.azatag,
                            textAlign: TextAlign.left,
                            style: AppTextStyles.h1style.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.azapaymotto,
                            textAlign: TextAlign.left,
                            style:
                                AppTextStyles.h3style.copyWith(fontWeight: FontWeight.w400, color: Color(0XFF818181)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                        child: FormFieldUI(
                          currentnode: null,
                          fieldController: _passwordController,
                          hint: AppStrings.signInthree,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                          suffixicon: InkWell(
                              child: Icon(_passwordvisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.grey[500]),
                              onTap: () {
                                setState(() {
                                  _passwordvisible = !_passwordvisible;
                                });
                              }),
                          maxLength: 6,
                          passwordvisible: _passwordvisible,
                          errorText: (state is InputDataSigninState)
                              ? state.password.isNotEmpty
                                  ? state.password.length >= 6
                                      ? null
                                      : AppStrings.passworderrorText
                                  : null
                              : null,
                          onchanged: (password) => _bloc.add(
                            SignInPasswordChanged(
                              password: password,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.pushNamed(context, AppRouteName.forgot_password);
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppStrings.signInfour,
                              style: AppTextStyles.h3style.copyWith(color: Colors.grey[500]),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                        child: ButtonArrow(
                            navigatorfunc: (state is InputDataSigninState)
                                ? state.password.length >= 6
                                    ? () async {
                                        await _bloc.add(SignInTagChanged(azatag: widget.azatag));
                                        await _bloc.add(FormSubmittedSignIn());
                                      }
                                    : null
                                : null,
                            buttontitle: AppStrings.signInfive,
                            arrow: false,
                            buttontitleColor: null),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                        child: InkWell(
                            onTap: () async {
                              await Navigator.pushNamed(context, AppRouteName.signin);
                            },
                            child: RichText(
                              text: TextSpan(
                                text: AppStrings.switchaccountbaseOne,
                                style: AppTextStyles.h3style.copyWith(color: ColorSets.colorGrey),
                                children: [
                                  TextSpan(
                                    text: AppStrings.switchaccountbaseTwo,
                                    style: AppTextStyles.h3style.copyWith(
                                      color: ColorSets.colorPrimaryLightYellow,
                                    ),
                                    // recognizer: TapGestureRecognizer()
                                    //   ..onTap = () async =>
                                    //       await Navigator.pushReplacementNamed(context, AppRouteName.signinWeb)
                                  ),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
