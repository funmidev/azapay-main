import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePasswordUIWeb extends StatefulWidget {
  @override
  _CreatePasswordUIWebState createState() => _CreatePasswordUIWebState();
}

class _CreatePasswordUIWebState extends State<CreatePasswordUIWeb> {
  final FocusNode _passwordnode = FocusNode();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool _passwordvisible;
  SignupBloc _bloc;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<SignupBloc>();
    _passwordvisible = false;
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
              AppRouteName.signupAzatagWeb,
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
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    AppStrings.createPinone,
                    style: AppTextStyles.h3style.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                )),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 2),
                    child: FormFieldUI(
                      currentnode: _passwordnode,
                      fieldController: _passwordcontroller,
                      hint: AppStrings.createPintwo,
                      borderradius: 10,
                      contentpad: 13,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                      passwordvisible: _passwordvisible,
                      suffixicon: InkWell(
                          child: Icon(
                            _passwordvisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey[500],
                          ),
                          onTap: () {
                            setState(() {
                              _passwordvisible = !_passwordvisible;
                            });
                          }),
                      maxLength: 6,
                      errorText: (state is SignupLoaded)
                          ? state.password.isNotEmpty
                              ? state.isPasswordValid
                                  ? null
                                  : AppStrings.passworderrorText
                              : null
                          : null,
                      onchanged: (password) => _bloc.add(
                        PasswordSignUp(
                          password: password,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 3.5, top: 30),
              child: BorderButtonUI(
                onPressed: (state is SignupLoaded)
                    ? state.isPasswordValid
                        ? () async {
                            await _bloc.add(SubmitSignUpForm(screen: 3));
                          }
                        : null
                    : null,
                title: AppStrings.createPinfour,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
