import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FullNameUIWeb extends StatefulWidget {
  @override
  _FullNameUIWebState createState() => _FullNameUIWebState();
}

class _FullNameUIWebState extends State<FullNameUIWeb> {
  SignupBloc _bloc;
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  final FocusNode _firstnamenode = FocusNode();
  final FocusNode _lastnamenode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _bloc = context.bloc<SignupBloc>();
    super.initState();
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
                        loading: true,
                        icontitle: false,
                        titleheader: AppStrings.errorTitle,
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
          } else if (state is SignupLoading) {
            await showGeneralDialog(
                context: context,
                pageBuilder: (context, _, __) {
                  return CustomDialogUI(
                      loading: true,
                      icontitle: null,
                      titleheader: AppStrings.empty,
                      subtitle: AppStrings.empty,
                      twobutton: true,
                      discardtitle: AppStrings.empty,
                      discardtitleColor: ColorSets.colorPrimaryBlack,
                      discardColor: null,
                      acceptedbutton: null,
                      acceptedtitle: AppStrings.empty,
                      acceptedtitleColor: ColorSets.colorPrimaryBlack,
                      acceptedColor: ColorSets.colorPrimaryWhite,
                      centerbutton: null,
                      centertitle: null,
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
        builder: (context, state) {
          return Padding(
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      AppStrings.signUpseven,
                      style: AppTextStyles.h3style.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
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
                            borderradius: 10,
                            contentpad: 13,
                            currentnode: _firstnamenode,
                            fieldController: _firstnameController,
                            nextnode: _lastnamenode,
                            hint: AppStrings.signUptwo,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.text,
                            // maxLength: 100,
                            errorText: (state is SignupLoaded)
                                ? state.firstname.isNotEmpty
                                    ? state.isFirstnameValid
                                        ? null
                                        : AppStrings.simpleerrorText
                                    : null
                                : null,
                            onchanged: (firstname) => _bloc.add(
                                  FirstNameSignUp(
                                    firstname: firstname,
                                  ),
                                ),
                            passwordvisible: false),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                        child: FormFieldUI(
                          borderradius: 10,
                          contentpad: 13,
                          currentnode: _lastnamenode,
                          fieldController: _lastnameController,
                          // nextnode: _emailnode,
                          hint: AppStrings.signUpthree,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.text,
                          // maxLength: 100,
                          errorText: (state is SignupLoaded)
                              ? state.lastname.isNotEmpty
                                  ? state.isLastnameValid
                                      ? null
                                      : AppStrings.simpleerrorText
                                  : null
                              : null,
                          onchanged: (lastname) => _bloc.add(
                            LastNameSignUp(
                              lastname: lastname,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3.5, top: 10),
                  child: BorderButtonUI(
                    onPressed: (state is SignupLoaded)
                        ? state.isFirstnameValid && state.isLastnameValid
                            ? () async {
                                await _bloc.add(SubmitSignUpForm(screen: 2));
                              }
                            : null
                        : null,
                    title: AppStrings.signUpsix,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
