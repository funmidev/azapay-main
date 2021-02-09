import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailPhoneUIWeb extends StatefulWidget {
  @override
  _EmailPhoneUIWebState createState() => _EmailPhoneUIWebState();
}

class _EmailPhoneUIWebState extends State<EmailPhoneUIWeb> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();

  final FocusNode _emailnode = FocusNode();
  final FocusNode _phonenumbernode = FocusNode();
  SignupBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<SignupBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      child: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) async {
          if (state is SignupLoading) {
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
          } else if (state is SignupLoaded) {
            if (state.signUp.status == 200) {
              await Navigator.of(context, rootNavigator: true).pop();
              await Navigator.pushReplacementNamed(
                context,
                AppRouteName.signupOtpcodeWeb,
              ).then((value) => _bloc.add(ReturnToInitial()));
            } else if (state.signUp.status >= 400 || state.basicResponse.status >= 400) {
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
                  scale: MediaQuery.of(context).size.aspectRatio.toDouble() * 8,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppStrings.onBoardingOneWeb,
                  style: AppTextStyles.h3style.copyWith(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      AppStrings.signUpseven,
                      style: AppTextStyles.h3style.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
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
                        currentnode: _emailnode,
                        borderradius: 10,
                        contentpad: 13,
                        fieldController: _emailController,
                        nextnode: _phonenumbernode,
                        hint: AppStrings.signUpfour,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        errorText: (state is SignupLoaded)
                            ? state.email.isNotEmpty
                                ? state.isEmailValid
                                    ? null
                                    : AppStrings.emailerrorText
                                : null
                            : null,
                        onchanged: (email) => _bloc.add(EmailSignUp(email: email)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                      child: FormFieldUI(
                        currentnode: _phonenumbernode,
                        borderradius: 10,
                        contentpad: 13,
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
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouteName.signinWeb);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: AppStrings.signInSignup,
                        style: AppTextStyles.h3style.copyWith(color: ColorSets.colorGrey),
                        children: [
                          TextSpan(
                              text: AppStrings.signInone,
                              style: AppTextStyles.h3style.copyWith(
                                color: ColorSets.colorPrimaryLightYellow,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async => await Navigator.pushNamed(context, AppRouteName.signinWeb)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3.5, top: 10),
                    child: BorderButtonUI(
                      onPressed: (state is SignupLoaded)
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
                      title: AppStrings.signUpsix,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
