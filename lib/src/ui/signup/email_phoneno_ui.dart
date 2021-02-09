import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/models/models.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateEmailTelephoneUI extends StatefulWidget {
  const CreateEmailTelephoneUI({Key key}) : super(key: key);

  @override
  _CreateEmailTelephoneUIState createState() => _CreateEmailTelephoneUIState();
}

class _CreateEmailTelephoneUIState extends State<CreateEmailTelephoneUI> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();

  final FocusNode _emailnode = FocusNode();
  final FocusNode _phonenumbernode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey();

  SignupBloc _bloc;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<SignupBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation:0,
      ),
      key: _scaffoldKey,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocListener<SignupBloc, SignupState>(
          listener: (context, state) async {
            if (state is SignupLoaded) {
              if (state.signUp.status == 200) {
                await Navigator.of(context, rootNavigator: true).pop();
                await Navigator.pushReplacementNamed(
                  _scaffoldKey.currentContext,
                  AppRouteName.otp_code,
                ).then((value) => _bloc.add(ReturnToInitial()));
              } else if (state.signUp.status >= 400 || state.basicResponse.status >= 400) {
                await Navigator.of(context, rootNavigator: true).pop();
                _bloc.add(ReturnToInitial());
                showToast(
                    state.signUp.status == 400 || state.basicResponse.status == 400
                        ? 'An Error Occurred, Try again.'
                        : state.signUp.message,
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
                //               state.signUp.status == 400 || state.basicResponse.status == 400
                //                   ? 'An Error Occurred, Try again.'
                //                   : state.signUp.message,
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
                      position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation),
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
                        padding: const EdgeInsets.symmetric(vertical: 35.0),
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
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              AppStrings.signUpone,
                              style: AppTextStyles.h2style,
                            ),
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            AppStrings.signUpseven,
                            style: AppTextStyles.h3style.copyWith(fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FormFieldUI(
                              currentnode: _emailnode,
                              fieldController: _emailController,
                              nextnode: _phonenumbernode,
                              hint: AppStrings.signUpfour,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              maxLength: 100,
                              errorText: (state is SignupLoaded)
                                  ? state.email.isNotEmpty
                                      ? state.isEmailValid
                                          ? null
                                          : AppStrings.emailerrorText
                                      : null
                                  : null,
                              onchanged: (email) => _bloc.add(EmailSignUp(email: email)),
                            ),
                            FormFieldUI(
                              currentnode: _phonenumbernode,
                              fieldController: _phonenumberController,
                              // nextnode: _lastnamenode,
                              hint: AppStrings.signUpfive,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.phone,
                              maxLength: 11,
                              errorText: (state is SignupLoaded)
                                  ? state.phoneno.isNotEmpty
                                      ? state.isPhonenoValid
                                          ? null
                                          : AppStrings.phonenumbererrorText
                                      : null
                                  : null,
                              onchanged: (phoneno) => _bloc.add(PhonenoSignUp(phoneno: phoneno)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                        child: ButtonArrow(
                          buttontitleColor: ColorSets.colorPrimaryWhite,
                          arrow: true,
                          navigatorfunc: (state is SignupLoaded)
                              ? state.isEmailValid && state.isPhonenoValid
                                  ? () async {
                                      await _bloc.add(
                                        SubmitSignUpForm(
                                          screen: 0,
                                        ),
                                      );
                                    }
                                  : null
                              : null,
                          buttontitle: AppStrings.signUpsix,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
