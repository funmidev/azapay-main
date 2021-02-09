import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ForgotPasswordUI extends StatefulWidget {
  @override
  _ForgotPasswordUIState createState() => _ForgotPasswordUIState();
}

class _ForgotPasswordUIState extends State<ForgotPasswordUI> {
  final TextEditingController _tagController = TextEditingController();

  ForgotpasswordBloc _bloc;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<ForgotpasswordBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: BlocListener<ForgotpasswordBloc, ForgotpasswordState>(
        listener: (context, state) async {
          if (state is InputDataForgotpasswordState) {
            if (state.acquireResetToken.status == 200) {
              await Navigator.of(context, rootNavigator: true).pop();
              await Navigator.pushNamed(
                _scaffoldKey.currentContext,
                AppRouteName.forgot_password_success,
                arguments: VerifiedSuccessResponse(
                    vector: AppVectors.checkEmail,
                    title: AppStrings.checkEmailone,
                    subtitle: AppStrings.checkEmailtwo,
                    titletextsyle: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.bold),
                    subtitlevisibility: true,
                    onPressedbutton: null,
                    buttonvisibility: false,
                    buttontitleColor: ColorSets.colorPrimaryBlack,
                    widgetbinding: (_) {
                      Future.delayed(Duration(seconds: 3), () async {
                        await Navigator.pushReplacementNamed(context, AppRouteName.forgot_password_verification);
                      });
                    }),
              );
            } else if (state.acquireResetToken.status == 400) {
              await Navigator.of(context, rootNavigator: true).pop();
              showToast('An Error Occurred, Try again.',
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
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(30),
              //           topRight: Radius.circular(30),
              //         ),
              //       ),
              //       elevation: 0.0,
              //       backgroundColor: ColorSets.colorPrimaryRed,
              //       content: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Expanded(
              //             child: Text(
              //               'An Error Occurred, Try again.',
              //               style: AppTextStyles.h3style,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   );
            }
          } else if (state is LoadingForgotpasswordState) {
            await showGeneralDialog(
                context: context,
                pageBuilder: (context, _, __) {
                  return LoadingUI(function: (_) {}, showtext: true);
                },
                barrierDismissible: true,
                barrierLabel: '',
                barrierColor: Colors.black.withOpacity(0.8),
                transitionDuration: Duration(milliseconds: 300),
                useRootNavigator: true,
                transitionBuilder: (context, animation, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                    child: child,
                  );
                });
          }
        },
        child: BlocBuilder<ForgotpasswordBloc, ForgotpasswordState>(
            builder: (context, state) => SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                AppStrings.forgotPasswordone,
                                style: AppTextStyles.h2style.copyWith(fontWeight: FontWeight.bold),
                              ),
                            )),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: FittedBox(
                              child: Text(
                                AppStrings.forgotPasswordtwo,
                                style: AppTextStyles.h3style,
                              ),
                            ),
                          ),
                        ),
                        FormFieldUI(
                          currentnode: null,
                          fieldController: _tagController,
                          hint: AppStrings.forgotPasswordthree,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          errorText: (state is InputDataForgotpasswordState)
                              ? state.azatag.isNotEmpty ? null : AppStrings.azatagerrorText
                              : null,
                          onchanged: (tag) => _bloc.add(ForgotAzaTagPasswordChanged(azatag: tag)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                          child: ButtonArrow(
                            buttontitleColor: ColorSets.colorPrimaryBlack,
                            navigatorfunc: () async {
                              await _bloc.add(FormSubmitForgotAzaTag());
                            },
                            buttontitle: AppStrings.forgotPasswordfour,
                            arrow: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
