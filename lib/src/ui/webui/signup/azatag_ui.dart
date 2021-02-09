import 'package:azapay/app/app.dart';
import 'package:azapay/src/blocs/blocs.dart';
import 'package:azapay/src/ui/ui.dart';
import 'package:azapay/src/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class AzatagUIWeb extends StatefulWidget {
  @override
  _AzatagUIWebState createState() => _AzatagUIWebState();
}

class _AzatagUIWebState extends State<AzatagUIWeb> {
  SignupBloc _bloc;

  final GlobalKey<FormState> _formKey = GlobalKey();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc<SignupBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgroundUI(
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) async {
          if (state is SignupLoaded) {
            if (state.basicResponse.status == 200) {
              await Navigator.of(context, rootNavigator: true).pop();
              await Navigator.pushReplacementNamed(
                context,
                AppRouteName.homeWeb,
              );
              // await Navigator.pushReplacementNamed(
              //   _scaffoldKey.currentContext,
              //   AppRouteName.signup_success,
              //   arguments: VerifiedSuccessResponse(
              //       vector: AppVectors.registerSuccessfully,
              //       title: AppStrings.signUpsuccessone,
              //       subtitle: '',
              //       titletextsyle: AppTextStyles.h1style.copyWith(
              //         fontWeight: FontWeight.normal,
              //       ),
              //       subtitlevisibility: false,
              //       onPressedbutton: () async {
              //         await Navigator.pushReplacementNamed(context, AppRouteName.home).then((value) async {
              //           await _bloc.add(ClearSignUp());
              //           _formKey.currentState.reset();
              //         });
              //       },
              //       buttonvisibility: true,
              //       buttontitle: AppStrings.signUpsuccesstwo,
              //       widgetbinding: (_) {}),
              // ).then((value) => _bloc.add(ReturnToInitial()));
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
        child: BlocBuilder<SignupBloc, SignupState>(
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
                            AppStrings.azaTagtwo,
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
                                currentnode: null,
                                fieldController: null,
                                hint: null,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.text,
                                prefixicon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: ColorSets.colorPrimaryLightYellow,
                                    child: Text(
                                      AppStrings.azaTagthree,
                                      style: AppTextStyles.h3style.copyWith(color: ColorSets.colorPrimaryWhite),
                                    ),
                                  ),
                                ),
                                suffixicon: IconButton(
                                    icon: Icon(Icons.info, color: ColorSets.colorPrimaryBlack),
                                    onPressed: () {
                                      showToast(AppStrings.azatagInfo,
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
                                    }),
                                errorText: (state is SignupLoaded)
                                    ? state.azatag.isNotEmpty
                                        ? null
                                        : AppStrings.azatagerrorText
                                    : null,
                                onchanged: (azatag) => _bloc.add(
                                  AzaTagSignUp(azatag: azatag),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                              child: BorderButtonUI(
                                onPressed: (state is SignupLoaded)
                                    ? state.azatag.length >= 4
                                        ? () async {
                                            await _bloc.add(SubmitSignUpForm(screen: 4));
                                          }
                                        : null
                                    : null,
                                title: AppStrings.azaTagfour,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
