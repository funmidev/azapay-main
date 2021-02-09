import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class SignInUIWeb extends StatefulWidget {
  @override
  _SignInUIWebState createState() => _SignInUIWebState();
}

class _SignInUIWebState extends State<SignInUIWeb> {
  final FocusNode _azapaytagnode = FocusNode();
  final FocusNode _passwordnode = FocusNode();
  final TextEditingController _azapaytagController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _passwordvisible;
  SigninBloc _bloc;

  @override
  void initState() {
    super.initState();
    _passwordvisible = false;
    _bloc = BlocProvider.of<SigninBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      child: BlocListener<SigninBloc, SigninState>(
        listener: (context, state) async {
          if (state is InputDataSigninState) {
            //print(state.status);
            if (state.basicResponse.status == 200) {
              await Navigator.of(context, rootNavigator: true).pop();
              if (state.basicResponse.accountType == 'TIER3') {
                await Navigator.pushReplacementNamed(
                  context,
                  AppRouteName.homeWeb,
                );
              } else {
                await showGeneralDialog(
                    context: context,
                    pageBuilder: (context, _, __) {
                      return CustomDialogUI(
                          icontitle: false,
                          titleheader: AppStrings.errorTitle,
                          subtitle: '😔Oops! You need to be a TIER 3 AzaPay user.',
                          twobutton: false,
                          discardtitle: AppStrings.empty,
                          discardtitleColor: ColorSets.colorPrimaryBlack,
                          discardColor: null,
                          acceptedbutton: null,
                          acceptedtitle: AppStrings.empty,
                          acceptedtitleColor: ColorSets.colorPrimaryBlack,
                          acceptedColor: ColorSets.colorPrimaryWhite,
                          centerbutton: () async {
                            await Navigator.of(context, rootNavigator: true).pop();
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
                        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                        child: child,
                      );
                    });
              }

              _passwordController.clear();
              await _bloc.add(ClearSigninForm());
              _formKey.currentState.reset();
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
                    position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
                    child: child,
                  );
                });
          }
        },
        child: BlocBuilder<SigninBloc, SigninState>(
            builder: (context, state) => Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRouteName.onboardingWeb);
                        },
                        hoverColor: Colors.transparent,
                        child: Image.asset(
                          AppImages.azaPayLogo,
                          scale: MediaQuery.of(context).size.aspectRatio.toDouble() * 8,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppStrings.onBoardingOneWeb,
                          style: AppTextStyles.h3style,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                          child: Text(
                            AppStrings.merchantSignIn,
                            textAlign: TextAlign.left,
                            style: AppTextStyles.h2style.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                              child: FormFieldUI(
                                currentnode: _azapaytagnode,
                                fieldController: _azapaytagController,
                                hint: AppStrings.signIntwo,
                                contentpad: 13,
                                borderradius: 10,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text,
                                maxLength: null,
                                errorText: (state is InputDataSigninState)
                                    ? state.azatag.isNotEmpty
                                        ? null
                                        : AppStrings.azatagerrorText
                                    : null,
                                onchanged: (tag) => _bloc.add(
                                  SignInTagChanged(azatag: tag),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                              child: FormFieldUI(
                                currentnode: _passwordnode,
                                fieldController: _passwordController,
                                hint: AppStrings.signInthree,
                                contentpad: 13,
                                borderradius: 10,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.number,
                                passwordvisible: _passwordvisible,
                                suffixicon: InkWell(
                                    child: Icon(_passwordvisible ? Icons.visibility_off : Icons.visibility,
                                        color: Colors.grey[500]),
                                    onTap: () {
                                      setState(() {
                                        _passwordvisible = !_passwordvisible;
                                      });
                                    }),
                                maxLength: 6,
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRouteName.forgotPasswordWeb);
                              },
                              child: Text(
                                AppStrings.signInfour,
                                style: AppTextStyles.h3style.copyWith(color: ColorSets.colorGrey),
                              )),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 5, top: 10),
                            child: BorderButtonUI(
                              onPressed: (state is InputDataSigninState)
                                  ? state.password.length >= 6 && state.azatag.length >= 4
                                      ? () async {
                                          await _bloc.add(FormSubmittedSignIn());
                                        }
                                      : null
                                  : null,
                              title: AppStrings.signInfive,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
