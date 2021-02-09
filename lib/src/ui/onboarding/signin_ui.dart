import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_freshchat/flutter_freshchat.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInUI extends StatefulWidget {
  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
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
                // print(state.status);
                if (state.basicResponse.status == 200) {
                  await Navigator.of(context, rootNavigator: true).pop();
                  _passwordController.clear();
                  _formKey.currentState.reset();
                  await _bloc.add(ClearSigninForm());

                  await Navigator.pushReplacementNamed(
                    context,
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
                  _bloc.add(ClearSigninForm());
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

                }
              } else if (state is LoadingSigninState) {
                await showGeneralDialog(
                    context: context,
                    pageBuilder: (context, _, __) {
                      return WillPopScope(
                          onWillPop: () async {
                            _passwordController.clear();
                            _azapaytagController.clear();
                          },
                          child: LoadingUI(function: (_) {}, showtext: true));
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
                builder: (context, state) => Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            // Padding(
                            //   padding: const EdgeInsets.only(top:15.0,bottom: 15),
                            //   child: SvgPicture.asset(AppVectors.azaPayLogo,alignment: Alignment.topCenter),
                            // ),
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                                child: Text(
                                  AppStrings.signInone,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.h2style.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FormFieldUI(
                                    currentnode: _azapaytagnode,
                                    fieldController: _azapaytagController,
                                    hint: AppStrings.signIntwo,
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
                                  FormFieldUI(
                                    currentnode: _passwordnode,
                                    fieldController: _passwordController,
                                    hint: AppStrings.signInthree,
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.pushNamed(context, AppRouteName.forgot_password);
                                },
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      AppStrings.signInfour,
                                      style: AppTextStyles.h3style.copyWith(fontSize: 13, color: Colors.grey[500]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ButtonArrow(
                                  buttontitleColor: ColorSets.colorPrimaryBlack,
                                  navigatorfunc: (state is InputDataSigninState)
                                      ? state.password.length >= 6 && state.azatag.length >= 4
                                          ? () async {
                                              await _bloc.add(FormSubmittedSignIn());
                                            }
                                          : null
                                      : null,
                                  buttontitle: AppStrings.signInfive,
                                  arrow: false),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppStrings.signInsix,
                                    style: AppTextStyles.h3style,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      await Navigator.pushNamed(context, AppRouteName.email_creation);
                                    },
                                    child: Text(
                                      AppStrings.signInseven,
                                      style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryLightYellow),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
